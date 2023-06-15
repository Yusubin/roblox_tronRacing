local startLine = Workspace.startLine.Yellow
local finishLine = Workspace.finishLIne.Yellow
local startTime = 0
local endTime = 0
local raceActive = false

print("script")

local soundId = "rbxassetid://5105488525"


local function playSound()
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Parent = workspace -- 사운드를 재생시킬 위치에 맞게 변경해주세요.
	sound:Play()
end

local function startRace()
	startTime = tick()
	raceActive = true
	print("Race started!")
end

local function finishRace()
	if raceActive then
		endTime = tick()
		raceActive = false
		local raceTime = endTime - startTime
		print("Race finished! Time: " .. raceTime .. " seconds")
		
		playSound()
		-- 리더보드에 시간을 저장합니다.
		local player = game.Players.LocalPlayer -- 현재 플레이어
		--local leaderstats = player:FindFirstChild("leaderstats")
		local leaderstats = player.leaderstats
		if leaderstats then
			local raceTimeValue = leaderstats:FindFirstChild("time")
			if raceTimeValue then
				raceTimeValue.Value = raceTime -- 리더보드에 시간 값을 업데이트합니다.
			end
		end
	end
end

startLine.Touched:Connect(startRace)
finishLine.Touched:Connect(finishRace)

while true do
	wait(1)
	if raceActive then
		local elapsedTime = tick() - startTime
		print("Elapsed Time: " .. elapsedTime .. " seconds")
	end
end



