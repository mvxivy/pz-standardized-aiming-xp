--****************************************************************************************************************
--**		Created By: 	Conqueror Koala																		**
--**		Updated By:		Mortazar																					**
--** 		Last update at: 	23-01-2025																		**
--****************************************************************************************************************
--**		Mod:			Standardized Aiming XP																**
--**																											**		
--**		Information:																						**
--**					This code is totally free for you to edit, use, or copy however you want!				**
--**					Feel free to use any of the code in your own projects, don't worry about crediting. 	**
--****************************************************************************************************************

--************************************************************************************************
--**  Would not recommend changing anything past this point unless you know what you are doing. **
--************************************************************************************************
local options = ModOptions

local aimingMultiplier = {1,1.5,2,3,5,10};

function onGunHitXp(owner, weapon, hitObject, damage)	
	if weapon:isRanged() then
		local multiplier = tonumber(aimingMultiplier[options.ComboBoxMultiplier:getValue()])
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

Events.OnWeaponHitXp.Add(onGunHitXp)