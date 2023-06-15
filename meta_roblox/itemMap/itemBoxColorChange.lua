local part = script.Parent -- 파트를 찾는다. 적절하게 수정하여 사용하세요

local rainbowColors = {
	Color3.fromRGB(255, 0, 0),       -- 빨강
	Color3.fromRGB(255, 165, 0),     -- 주황
	Color3.fromRGB(255, 255, 0),     -- 노랑
	Color3.fromRGB(0, 255, 0),       -- 초록
	Color3.fromRGB(0, 0, 255),       -- 파랑
	Color3.fromRGB(75, 0, 130),      -- 남색
	Color3.fromRGB(238, 130, 238),   -- 보라
}

local transitionTime = 2 -- 색 변화 간격 (초)
local currentIndex = 1 -- 현재 색상 인덱스
local nextIndex = 2 -- 다음 색상 인덱스

while true do
	local currentColor = rainbowColors[currentIndex]
	local nextColor = rainbowColors[nextIndex]

	for t = 0, 1, 0.01 do
		part.BrickColor = BrickColor.new(currentColor:Lerp(nextColor, t))
		wait(transitionTime / 100)
	end

	currentIndex = nextIndex
	nextIndex = nextIndex + 1

	if nextIndex > #rainbowColors then
		nextIndex = 1
	end
end