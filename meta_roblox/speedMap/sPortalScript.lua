-- 플레이어가 부딪힐 물체
local teleportPart = script.Parent -- 부딪힐 물체로 가정

-- 이동할 플레이스의 ID
local destinationPlaceId = 13688411907

-- 플레이어를 이동할 플레이스로 이동시키는 함수
local function TeleportPlayer(player)
	game:GetService("TeleportService"):Teleport(destinationPlaceId, player)
end

-- 플레이어가 물체에 부딪혔을 때 이동 함수 호출
teleportPart.Touched:Connect(function(otherPart)
	local character = otherPart.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	if player then
		TeleportPlayer(player)
	end
end)