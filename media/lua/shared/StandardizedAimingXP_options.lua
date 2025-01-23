--Default options.
local SETTINGS = { 
	options = {
		dropdown1 = 1,
	},
	names= {
		dropdown1 = "Xp Multiplier",
	},
	mod_id = "STAIMING",
	mod_shortname = "Standardized Aiming XP"
}

-- Connecting the options to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
	local settings = ModOptions:getInstance(SETTINGS)
	
	-- If you are in this file to change the XP you get from the menu,
	-- this is purely the decorational one that you see from the dropdown menu.
	-- The *real* number multipliers is in the other lua file. (StandardizedAimingXP.lua)
	
	local drop1 = settings:getData("dropdown1")
	drop1[1] = "1x"
	drop1[2] = "+50% extra XP"
	drop1[3] = "2x extra XP"
	drop1[4] = "3x extra XP"
	drop1[5] = "5x extra XP"
	drop1[6] = "10x extra XP"
	drop1.tooltip = "Xp Multiplier for Aiming Skill, all choices have removed the xp reduction post lvl-5."
end

StandardizedAimingXP_global = {}
StandardizedAimingXP_global.SETTINGS = SETTINGS