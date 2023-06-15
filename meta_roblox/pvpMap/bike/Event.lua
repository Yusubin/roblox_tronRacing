local touchPart = script.Parent
local isActive = false
local motorcycle = script.Parent.Parent
local InvisibleWalls = require(script.Parent.Parent.InvisibleWalls)
local PVPgameManager = require(game.Workspace.Map1.GameManager.PVPgameManager)

motorcycle.VehicleSeat:GetPropertyChangedSignal("Occupant"):Connect(function()
	wait(3)
	isActive = true
end)

touchPart.Touched:Connect(function(otherPart)
	if otherPart.Name:match("_wall") and isActive then
		print("You Die")
		local pName = script.Parent.Parent:GetAttribute("pName")
		InvisibleWalls.deleteAllElements()
		PVPgameManager.deletePlayerAndBikeByName(pName)
		motorcycle:Destroy()
	end
end)