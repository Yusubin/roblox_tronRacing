local part = script.Parent -- ��Ʈ�� ã�´�. �����ϰ� �����Ͽ� ����ϼ���

local rainbowColors = {
	Color3.fromRGB(255, 0, 0),       -- ����
	Color3.fromRGB(255, 165, 0),     -- ��Ȳ
	Color3.fromRGB(255, 255, 0),     -- ���
	Color3.fromRGB(0, 255, 0),       -- �ʷ�
	Color3.fromRGB(0, 0, 255),       -- �Ķ�
	Color3.fromRGB(75, 0, 130),      -- ����
	Color3.fromRGB(238, 130, 238),   -- ����
}

local transitionTime = 2 -- �� ��ȭ ���� (��)
local currentIndex = 1 -- ���� ���� �ε���
local nextIndex = 2 -- ���� ���� �ε���

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