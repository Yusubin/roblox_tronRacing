local PVPgameManager = require(game.Workspace.Map1.GameManager.PVPgameManager)

local gameState = 0 

while true do
	local step = task.wait()
	
	--print(PVPgameManager.checkIsGamePlaying())
	
	if gameState == 0 then
		if PVPgameManager.checkIsGamePlaying() then
			gameState = 1
		end
	elseif gameState == 1  then
		-- 플레이어 소환 및 바이크 소환
		PVPgameManager.spawnPlayersAndBike()
		gameState = 2
	elseif gameState == 2 then
		-- 게임 플레이
		if PVPgameManager.checkIsOnePlayerLeft() == true then
			--wait(3)
			gameState = 0
			local lastPlayer = PVPgameManager.returnLastPlayerToSpawn()
			lastPlayer.Character:PivotTo(game.Workspace.Lobby.SpawnLocation.CFrame * CFrame.new(0, 4, 0))
			for i, obj in pairs(game.Workspace.Walls:GetChildren()) do
				obj:Destroy()
			end
		end
	else
		gameState = 0
	end
end