local PVPgameManager = {}

PVPgameManager.playerList = {}
PVPgameManager.isGamePlaying = false
PVPgameManager.maxPlayer = 4
PVPgameManager.bikeList = {}
PVPgameManager.spawnPoints = {script.Spawnpoints.sp1, script.Spawnpoints.sp2, script.Spawnpoints.sp3, script.Spawnpoints.sp4}

PVPgameManager.serverStorage = game:GetService("ServerStorage")

function PVPgameManager.checkIsGamePlaying()
	return PVPgameManager.isGamePlaying
end

function PVPgameManager.newPlayerList(list)
	if PVPgameManager.checkIsGamePlaying() == false and #PVPgameManager.playerList == 0 then
		PVPgameManager.playerList = list
		PVPgameManager.isGamePlaying = true
	end
end

function PVPgameManager.resetPlayerList()
	if PVPgameManager.checkIsGamePlaying() then
		PVPgameManager.bikeList[PVPgameManager.playerList[1].name]:Destroy()
		PVPgameManager.playerList = {}
		PVPgameManager.isGamePlaying = false
		PVPgameManager.bikeList = {}
	end
end

function PVPgameManager.createNewBike(bikePos)
	local bike = PVPgameManager.serverStorage.VoltBike:Clone()
	bike.Parent = script.Bikes
	bike:MoveTo(bikePos)
	return bike
end

function PVPgameManager.getPosByIndex(index)
	if PVPgameManager.checkIsGamePlaying() == true then
		if index > 0 and index <= PVPgameManager.maxPlayer then
			local part = PVPgameManager.spawnPoints[index]
			return part.Position
		end
	end
end

function PVPgameManager.getCFrByIndex(index)
	if PVPgameManager.checkIsGamePlaying() == true then
		if index > 0 and index <= PVPgameManager.maxPlayer then
			local part = PVPgameManager.spawnPoints[index]
			return part.CFrame
		end
	end
end

function PVPgameManager.getOrientationByIndex(index)
	if index == 1 then
		return 135
	elseif index == 2 then
		return -135
	elseif index == 3 then
		return 45
	elseif index == 4 then
		return -45
	else
		return 0
	end
end

function PVPgameManager.spawnPlayersAndBike()
	if PVPgameManager.isGamePlaying == true then
		for i, p in pairs(PVPgameManager.playerList) do
			PVPgameManager.bikeList[p.name] = PVPgameManager.createNewBike(PVPgameManager.getPosByIndex(i))
			--table.insert(PVPgameManager.bikeList, i, PVPgameManager.createNewBike(PVPgameManager.getPosByIndex(i)))
			PVPgameManager.bikeList[p.name]:SetAttribute("pName", p.name)
			--PVPgameManager.bikeList[p.name]:PivotTo(PVPgameManager.bikeList[p.name]:GetPivot() * CFrame.Angles(0, PVPgameManager.getOrientationByIndex(i), 0))
			p.Character:PivotTo(PVPgameManager.getCFrByIndex(i) * CFrame.new(3, 2, 3))
		end
		print(#PVPgameManager.bikeList)
	end
end

function PVPgameManager.deletePlayerAndBikeByName(pName)
	if PVPgameManager.isGamePlaying == true then
		for i, p in pairs(PVPgameManager.playerList) do
			if p.name == pName then
				print(pName .. " 이동 스크립트")
				p.Character:PivotTo(game.Workspace.Lobby.SpawnLocation.CFrame * CFrame.new(0,4,0))
				p.Character.Humanoid.Health = 0
				table.remove(PVPgameManager.playerList, i)
				PVPgameManager.bikeList[pName] = nil
				print(#PVPgameManager.playerList)
				print(PVPgameManager.bikeList[pName])
			end
		end
	end
end

function PVPgameManager.checkIsOnePlayerLeft()
	if #PVPgameManager.playerList == 1 then
		return true
	else
		return false
	end
end

function PVPgameManager.getLastPlayer()
	if PVPgameManager.checkIsOnePlayerLeft() then
		return PVPgameManager.playerList[1].name
	end
end

function PVPgameManager.returnLastPlayerToSpawn()
	if PVPgameManager.checkIsOnePlayerLeft() == true then
		print(PVPgameManager.playerList[1].name .. " is Last Player")
		local pl = game.Players:GetPlayerFromCharacter(PVPgameManager.playerList[1].Character)
		local v = pl.leaderstats.Wins
		v.Value += 1
		local lastPlayer = PVPgameManager.playerList[1]
		PVPgameManager.resetPlayerList()
		print(lastPlayer.name)
		lastPlayer.Character:PivotTo(game.Workspace.Lobby.SpawnLocation.CFrame * CFrame.new(0,4,0))
		lastPlayer.Character.Humanoid.Health = 0
		print(lastPlayer.name)
		return lastPlayer
		--PVPgameManager.playerList[1].Character:PivotTo(game.Workspace.Lobby.SpawnLocation.CFrame * CFrame.new(0,4,0))
	end
end

function PVPgameManager.deleteAllBikes()
	local bikes = script.Bikes
	if #bikes:GetChildren() > 0 then
		for i = 1, #bikes do
			bikes[i]:Destroy()
		end
	end
	print("바이크 전부 삭제")
end

-------------------------

function PVPgameManager.debugLog()
	print()
end

-------------------------

return PVPgameManager
