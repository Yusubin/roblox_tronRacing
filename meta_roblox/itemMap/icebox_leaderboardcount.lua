local part = script.Parent -- �ε����� ��Ʈ�� ��ü�ؾ� �մϴ�.
local valueName = "iceBox" -- ������ų �������� ���� �̸� ��ü�ؾ� �մϴ�.
local valueName2 = "LabCount"
local valueName3 = "score"
local soundId = "rbxassetid://9125644905" 
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
		--game.Workspace.itembox["Magic Twirling Small High Pitch Spinning Chi (SFX)"]:Play()
		if player then
			local leaderboard = player.leaderstats
			local iceBox = leaderboard:FindFirstChild(valueName)
			local lab = leaderboard:FindFirstChild(valueName2)
			local score = leaderboard:FindFirstChild(valueName3)
			
			if iceBox and iceBox:IsA("IntValue") then
				iceBox.Value = iceBox.Value + 1 -- �������� ���� ������ŵ�ϴ�.
				lab.Value = lab.Value + 1 -- �������� ���� ������ŵ�ϴ�.
				score.Value = score.Value + 100 -- �������� ���� ������ŵ�ϴ�.
				part:Destroy() -- ��Ʈ�� ������� �մϴ�.
			end
		end
	end
end)