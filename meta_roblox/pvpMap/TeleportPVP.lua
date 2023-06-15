local maxPlayer = 4
local waitTime = 30
local players = game.Players

local model = script.Parent
local enter = model.Entrance
local exit = model.Exit
local gui = enter.BillboardGui
local players = game.Players

local lobbyPlayerList = {}
local lastPlayerList = {}

local timeDelay = 10
local currTime = timeDelay

local PVPgameManager = require(game.Workspace.Map1.GameManager.PVPgameManager)
local gamePlaying = PVPgameManager.checkIsGamePlaying()

maxPlayer = PVPgameManager.maxPlayer

local function updatePlayersGUI()
	gui.playerCnt.Text = #lobbyPlayerList .. " / " .. maxPlayer
end

local function updateTimeLeftGUI()
	exit.BillboardGui.timeLeft.Text = math.round(currTime) .. "s" 
end

updatePlayersGUI()
updateTimeLeftGUI()


local function findPlayerByName(name)
	for i, player in ipairs(lobbyPlayerList) do
		if player.Name == name then
			return true
		end
	end
	return false
end

local function deletePlayerByName(name)
	for i, player in ipairs(lobbyPlayerList) do
		if player.Name == name then
			table.remove(lobbyPlayerList, i)
			return
		end
	end
end

local function deletePlayer(player)
	if findPlayerByName(player.name) then
		deletePlayerByName(player.name)
		updatePlayersGUI()
		player.Character:PivotTo(enter.floor.CFrame * CFrame.new(13,4,0))
		--print("player removed")
		--print(#lobbyPlayerList)
	end
end

local function insertPlayer(player)
	if not findPlayerByName(player.name) then
		table.insert(lobbyPlayerList, player)
		updatePlayersGUI()
		player.Character:PivotTo(exit.floor.CFrame * CFrame.new(13,4,0))
		--print("player moved")
		--print(#lobbyPlayerList)
	end
end

----------------------------------

local tpEnable = true

enter.floor.Touched:Connect(function(obj)
	local p = obj.Parent
	local player = game.Players:FindFirstChild(p.Name)
	
	if p:FindFirstChild("Humanoid") and tpEnable == true and gamePlaying == false then
		--print("player touch")
		tpEnable = false
		
		if not findPlayerByName(player.Name) and #lobbyPlayerList < maxPlayer then
			insertPlayer(player)
			p.Humanoid.Died:connect(function(p)
				deletePlayer(player)
			end)
		end
		
		tpEnable = true
	end
end)

exit.floor.Touched:Connect(function(obj)
	local p = obj.Parent
	local player = game.Players:FindFirstChild(p.Name)

	if p:FindFirstChild("Humanoid") and tpEnable == true then
		--print("player touch")
		tpEnable = false

		if findPlayerByName(player.Name) then
			deletePlayer(player)
		end

		tpEnable = true
	end
end)

local lastState = false

while true do
	local step = task.wait()
	gamePlaying = PVPgameManager.checkIsGamePlaying()
	
	if gamePlaying == false and lastState == true then
		print("이동스크립트")
		PVPgameManager.deleteAllBikes()
		print(lastPlayerList)
		--for i, p in pairs(lastPlayerList) do
		--	p.Character:PivotTo(enter.floor.CFrame * CFrame.new(13,4,0))
		--	p.Character.Humanoid.Health = 0
		--end
		--lastPlayerList = {}
	end
	
	if gamePlaying == false then
		updatePlayersGUI()
		if #lobbyPlayerList == maxPlayer then
			exit.BillboardGui.timeLeft.Visible = true
			currTime -= step
		else
			exit.BillboardGui.timeLeft.Visible = false
			currTime = timeDelay
		end
		
		if currTime <= 0 then
			currTime = timeDelay
			lastPlayerList = table.clone(lobbyPlayerList)
			PVPgameManager.newPlayerList(lobbyPlayerList)
			lobbyPlayerList = {}
		end
	else
		currTime = timeDelay
		exit.BillboardGui.timeLeft.Visible = false
	end
	
	updateTimeLeftGUI()
	lastState = gamePlaying
end