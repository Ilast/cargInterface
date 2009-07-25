--[[
	cargOnlyChat
	- based on ImmersionRP - RPMode
]]

RPMode = {}

local enabled
local frames = {
	[GameTooltip] = 1,
	[ChatFrameEditBox] = 1,
	[ChatMenu] = 1,
}
RPMode.frames = frames

for i=1, 7 do
	frames[_G["ChatFrame"..i]] = 1
	frames[_G["ChatFrame"..i.."Tab"]] = 1
	frames[_G["ChatFrame"..i.."TabDockRegion"]] = 1
end

function RPMode:SetEnabled(flag)
	enabled = flag

	local uiscale = UIParent:GetScale()
	for frame, v in pairs(frames) do
		
	end
end