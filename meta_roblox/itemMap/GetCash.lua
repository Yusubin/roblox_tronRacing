local lapCount = 0 -- 랩 횟수
local touchedConnection -- 터치 이벤트 연결을 저장하는 변수
local real_labC=0

local soundId = "rbxassetid://6370343522" 
local function playSound()
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Parent = workspace -- 사운드를 재생시킬 위치에 맞게 변경해주세요.
	sound:Play()
end
function getPlayer(humanoid)
	-- 휴머노이드를 소유한 플레이어 찾기
	local players = game.Players:GetPlayers()
	for i = 1, #players do
		local character = players[i].Character
		if character and character:FindFirstChild("Humanoid") == humanoid then
			return players[i]
		end
	end
	return nil
end

function addLap(humanoid)
	local player = getPlayer(humanoid)
	if player then
		local labcount = player.leaderstats.LabCount
		
		
		lapCount = lapCount + 1
		print("lapCount:",lapCount)
		if lapCount>9 then
			real_labC= real_labC+1
			labcount.Value = real_labC
			print("real Lab:",real_labC )
			lapCount=0
		end
	end
end

function onTouched(part)
	if part.Parent then
		local humanoid = part.Parent:FindFirstChild("Humanoid")
		if humanoid then
			addLap(humanoid)
			if real_labC >= 10 then
				local player = getPlayer(humanoid)
				if player then
					playSound()
					--game.Workspace.finishLIne["Mario Kart 7 Final Lap"]:Play()
					print("end")
					
					
					local message = Instance.new("Message")
					message.Text = "축하합니다!"
					message.Parent = player
					wait(4)
					message:Destroy()
					
					
					game:GetService("TeleportService"):Teleport(13408811161, player) -- 플레이어 객체를 명시적으로 전달
					
					-- 터치 이벤트 연결 해제
					touchedConnection:Disconnect()
				end
			end
		end
	end
end

touchedConnection = script.Parent.Touched:Connect(onTouched)

