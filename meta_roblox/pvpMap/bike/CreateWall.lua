local BikeTrail = script.Parent
local GyroBall = BikeTrail.Parent.Parent.PrimaryPart
local SegmentVerts = {}
local Resolution = 6
local TrailLifeTime = BikeTrail.Lifetime
local InvisibleWalls = require(BikeTrail.Parent.Parent.InvisibleWalls)
local index = 1
local ScriptEnable = true

function createPart(i)
	local newPart = Instance.new("Part")
	newPart.Name = "_wall" .. i
	newPart.CanCollide = false
	newPart.CanQuery = false
	newPart.Parent = game.Workspace.Walls
	newPart.Position = BikeTrail.Parent.Position
	newPart.Transparency = 1
	newPart.CanCollide = false
	newPart.CanQuery = false
	newPart.Anchored = true
	newPart.Massless = true
	return newPart
end

for i = 1, Resolution do
	--print("create Part in Workspace")
	local part = createPart(i)
	--Parts[i] = part
	InvisibleWalls.addElementByIndex(i, part)
	--print(part.Position)
	table.insert(SegmentVerts, GyroBall.Position)
end

function JoinVerts(part, pos1, pos2)
	if(pos1 == pos2) then -- return NaN
		--print("Error : CFrame.new()")
	else
		--print("part replace", pos1, pos2)
		local length = (pos2 - pos1).Magnitude
		part.Size = Vector3.new(0.2, 4, length)
		--print(CFrame.new(pos1, pos2))
		part.CFrame = CFrame.new(pos1, pos2)
	end
end

local index = #SegmentVerts


GyroBall.Parent.VehicleSeat:GetPropertyChangedSignal("Occupant"):Connect(function()
	--print(GyroBall.Parent.VehicleSeat.Occupant.Parent) 탑승한 플레이어 이름
	if GyroBall.Parent.VehicleSeat.Occupant ~= nil then
		local playerName = GyroBall.Parent.VehicleSeat.Occupant.Parent
		ScriptEnable = true
		--coroutine.resume(coroutine.create(function()
		--	for i = 1, InvisibleWalls.getListLength() do
		--		Parts[i].Name = playerName .. "_wall"
		--	end
		--end))
	end
end)

while ScriptEnable do
	--print("move part script enable")
	coroutine.resume(coroutine.create(function()
		--print(SegmentVerts)
		if(index > Resolution) then
			table.remove(SegmentVerts, 1)
			table.insert(SegmentVerts, GyroBall.Position)
		elseif(index <= Resolution) then
			index += 1
			table.insert(SegmentVerts, GyroBall.Position)
		end
	end))
	
	coroutine.resume(coroutine.create(function()
		for i = 1, InvisibleWalls.getListLength() do
			JoinVerts(InvisibleWalls.getElementByIndex(i), SegmentVerts[i], SegmentVerts[i + 1])
		end
	end))
	wait(TrailLifeTime / Resolution)
end
