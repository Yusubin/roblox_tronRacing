local lapCount = 0 -- �� Ƚ��
local touchedConnection -- ��ġ �̺�Ʈ ������ �����ϴ� ����
local real_labC=0

local soundId = "rbxassetid://6370343522" 
local function playSound()
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Parent = workspace -- ���带 �����ų ��ġ�� �°� �������ּ���.
	sound:Play()
end
function getPlayer(humanoid)
	-- �޸ӳ��̵带 ������ �÷��̾� ã��
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
					message.Text = "�����մϴ�!"
					message.Parent = player
					wait(4)
					message:Destroy()
					
					
					game:GetService("TeleportService"):Teleport(13408811161, player) -- �÷��̾� ��ü�� ��������� ����
					
					-- ��ġ �̺�Ʈ ���� ����
					touchedConnection:Disconnect()
				end
			end
		end
	end
end

touchedConnection = script.Parent.Touched:Connect(onTouched)

