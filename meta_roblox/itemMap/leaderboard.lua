game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Lab = Instance.new("IntValue")
	Lab.Name = "LabCount"
	Lab.Value = 0
	Lab.Parent = leaderstats
	
	local iceBox = Instance.new("IntValue")
	iceBox.Name = "iceBox"
	iceBox.Value = 0
	iceBox.Parent = leaderstats
	
	local fish = Instance.new("IntValue")
	fish.Name = "fish"
	fish.Value = 0
	fish.Parent = leaderstats
	
	
	local Score = Instance.new("IntValue")
	Score.Name = "score"
	Score.Value = 0
	Score.Parent = leaderstats

end)