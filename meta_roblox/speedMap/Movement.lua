while true do
	wait()
	if script.Parent.Throttle == 0 then
		script.Parent.Move.velocity = Vector3.new(0, 0, 0)
	elseif script.Parent.Throttle == 1 then
		script.Parent.Move.velocity = script.Parent.CFrame.lookVector * 70
	elseif script.Parent.Throttle == -1 then
		script.Parent.Move.velocity = script.Parent.CFrame.lookVector * -70
	end
	if script.Parent.Steer == 0 then
		script.Parent.Turn.angularvelocity = Vector3.new(0, 0, 0)
	elseif script.Parent.Steer == 1 then
		script.Parent.Turn.angularvelocity = Vector3.new(0, -1, 0)
	elseif script.Parent.Steer == -1 then
		script.Parent.Turn.angularvelocity = Vector3.new(0, 1, 0)
	end
end