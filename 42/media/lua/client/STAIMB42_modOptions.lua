local config = require("STAIMB42_config")

local modOptions = {}

function modOptions.initModOptions()
	local options = PZAPI.ModOptions:create(config.modId, config.modName)

	local ComboBoxMultiplier = options:addComboBox(
		"STAIMING_B42_combobox1",
		getText("UI_options_STAIMING_B42_multiplier_label")
	)
	modOptions.ComboBoxMultiplier = ComboBoxMultiplier

	ComboBoxMultiplier:addItem("1x", true)
	ComboBoxMultiplier:addItem("1.5x", false)
	ComboBoxMultiplier:addItem("2x", false)
	ComboBoxMultiplier:addItem("3x", false)
	ComboBoxMultiplier:addItem("5x", false)
	ComboBoxMultiplier:addItem("10x", false)
	ComboBoxMultiplier:addItem("1000x", false)

	options:addDescription(getText("UI_options_STAIMING_B42_multiplier_description"))
end

return modOptions