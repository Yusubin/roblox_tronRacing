local part = script.Parent -- 부딪히는 파트를 대체해야 합니다.
local valueName = "fish" -- 증가시킬 리더보드 값의 이름 대체해야 합니다.
local soundId = "rbxassetid://6724359489" 
local function playSound()
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Parent = workspace -- 사운드를 재생시킬 위치에 맞게 변경해주세요.
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
				iceBox.Value = iceBox.Value + 1 -- 리더보드 값을 증가시킵니다.
				part:Destroy() -- 파트를 사라지게 합니다.
			end
		end
	end
end)