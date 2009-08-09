--[[
	FellowSoldiers
]]
local addonPath = debugstack():match("(.+\\).-\.lua:")
local texturepath = addonPath.."textures/"
local blizzIcon = [[Interface\Worldmap\WorldMapPartyIcon]]

local dummy = function() end

local friends = {}
for i=1, GetNumFriends() do
	friends[GetFriendInfo(i)] = true
end
for i=1, GetNumGuildMembers(true) do
	friends[GetGuildRosterInfo(i)] = true
end
gFriends = friends
local _G = getfenv(0)
local setTex = WorldMapRaid1Icon.SetTexture

local addon = CreateFrame("Frame", nil, WorldMapButton)
addon:SetScript("OnUpdate", function()
	local colorServer = select(2, IsInInstance()) == "pvp"
	local i=1
	while(_G['WorldMapRaid'..i] and _G['WorldMapRaid'..i]:IsShown()) do
		local button = _G['WorldMapRaid'..i]
		local unit = button.unit
		if(unit) then
			local name, server = UnitName(unit)
			local icon = _G['WorldMapRaid'..i..'Icon']
			if(server == "") then server = nil end

			if(friends[name]) then
				setTex(icon, texturepath.."BlueDot")
				button:SetFrameLevel(5)
--			elseif(name and not server and colorServer) then
--				setTex(icon, texturepath.."GreenDot")
--				button:SetFrameLevel(4)
			else
				setTex(icon, blizzIcon)
				button:SetFrameLevel(3)
			end
			i = i+1
		end
	end
end)