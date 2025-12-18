local options = require("STAIMB42_modOptions")

options.initModOptions()

local aimingMultiplier = {1,1.5,2,3,5,10};

local function onGunHitXp(owner, weapon, hitObject, damage)	
	if weapon:isRanged() then
		local multiplier = tonumber(aimingMultiplier[tonumber(options.ComboBoxMultiplier:getValue())])
		if not multiplier then multiplier = 1 end
		local origXP = owner:getLastHitCount();
		local xp = origXP;
		if owner:getPerkLevel(Perks.Aiming) >= 5 then
			xp = origXP * 2.7 * multiplier;
			xp = xp - origXP;
			owner:getXp():AddXP(Perks.Aiming, xp);
		end
		if (owner:getPerkLevel(Perks.Aiming) < 5) and (multiplier ~= 1) then
			xp = origXP * 2.7 * multiplier;
			xp = xp - (origXP * 2.7);
			owner:getXp():AddXP(Perks.Aiming, xp);
		end
	end
end

local function Debug ()
	print("[Standardized Aiming XP] selected mutliplier option number: " .. options.ComboBoxMultiplier:getValue())
	print("[Standardized Aiming XP] selected multiplier option value: " .. tonumber(aimingMultiplier[options.ComboBoxMultiplier:getValue()]))
end

Events.OnWeaponHitXp.Add(onGunHitXp)
-- Events.OnPlayerMove.Add(Debug)