-- �÷��̾ �ε��� ��ü
local teleportPart = script.Parent -- �ε��� ��ü�� ����

-- �̵��� �÷��̽��� ID
local destinationPlaceId = 13688411907

-- �÷��̾ �̵��� �÷��̽��� �̵���Ű�� �Լ�
local function TeleportPlayer(player)
	game:GetService("TeleportService"):Teleport(destinationPlaceId, player)
end

-- �÷��̾ ��ü�� �ε����� �� �̵� �Լ� ȣ��
teleportPart.Touched:Connect(function(otherPart)
	local character = otherPart.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	if player then
		TeleportPlayer(player)
	end
end)