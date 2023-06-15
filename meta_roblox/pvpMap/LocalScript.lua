local PVPgameManager = require(game.Workspace.Map1.GameManager.PVPgameManager)

while true do
	local step = task.wait()
	if PVPgameManager.checkIsGamePlaying() == true and PVPgameManager.checkIsOnePlayerLeft() == true then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[System] " .. PVPgameManager.getLastPlayer() .. " is Winner!",
			Color = Color3.fromRGB(255, 255, 255),
			TextSize = 25
		})
	end
end