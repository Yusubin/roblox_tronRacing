local part = script.Parent -- �ε����� ��Ʈ�� ��ü�ؾ� �մϴ�.
local valueName = "fish" -- ������ų �������� ���� �̸� ��ü�ؾ� �մϴ�.
local soundId = "rbxassetid://6724359489" 
local function playSound()
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Parent = workspace -- ���带 �����ų ��ġ�� �°� �������ּ���.
	sound:Play()
end
part.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	if humanoid then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		playSound()
		--game.Workspace.fish["Mario Kart Lap Sound"]:Play()
		if player then
			local leaderboard = player.leaderstats
			local iceBox = leaderboard:FindFirstChild(valueName)
			if iceBox and iceBox:IsA("IntValue") then
				iceBox.Value = iceBox.Value + 1 -- �������� ���� ������ŵ�ϴ�.
				part:Destroy() -- ��Ʈ�� ������� �մϴ�.
			end
		end
	end
end)