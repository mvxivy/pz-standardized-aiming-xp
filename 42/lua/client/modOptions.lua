local config = Config
local modOptions = {
	ComboBoxMultiplier = nil
}

local function modOptions.InitModOptions()
	local options = PZAPI.ModOptions:create(config.ModId, config.ModName)

	local ComboBoxMultiplier = options:addComboBox(
		"combobox1",
		getText("UI_options_STAIMING_B42_multiplier_label")
	)

	ComboBoxMultiplier:addItem("1x", true)
	ComboBoxMultiplier:addItem("1.5x", false)
	ComboBoxMultiplier:addItem("2x", false)
	ComboBoxMultiplier:addItem("3x", false)
	ComboBoxMultiplier:addItem("5x", false)
	ComboBoxMultiplier:addItem("10x", false)

	options:addDescription(getText("UI_options_STAIMING_B42_multiplier_description"))

	modOptions.ComboBoxMultiplier = ComboBoxMultiplier
end

ModOptions = modOptions
return modOptions