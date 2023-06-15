game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Lab = Instance.new("IntValue")
	Lab.Name = "time"
	Lab.Value = 0
	Lab.Parent = leaderstats


end)