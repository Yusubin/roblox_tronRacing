debounce = true
local part = script.Parent -- �ε����� ��Ʈ�� ��ü�ؾ� �մϴ�.
local valueName = "win" -- ������ų �������� ���� �̸� ��ü�ؾ� �մϴ�.

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