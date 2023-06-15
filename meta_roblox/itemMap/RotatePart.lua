local rotatePart=script.Parent

rotatePart.Anchored=true

while true do 
	rotatePart.CFrame=rotatePart.CFrame*CFrame.fromEulerAnglesXYZ(0.1,0.1,0.1)
	wait()
end