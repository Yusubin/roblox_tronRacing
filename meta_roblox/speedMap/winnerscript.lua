debounce = true
local part = script.Parent -- 부딪히는 파트를 대체해야 합니다.
local valueName = "win" -- 증가시킬 리더보드 값의 이름 대체해야 합니다.

function onTouched(hit)
	if not debounce then return end


	if(hit.Parent:findFirstChild("Humanoid") == nil) then return end
	debounce = false


	msg = Instance.new("Message")


	msg.Text = hit.Parent.Name .. " has won the race!"


	msg.Parent = game.Workspace


	wait(7)


	msg:remove()


	wait(10)


	debounce = true


        winnerscript:remove()


end





script.Parent.Touched:connect(onTouched)