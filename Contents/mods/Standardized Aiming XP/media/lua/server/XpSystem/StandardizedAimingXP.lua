--****************************************************************************************************************
--**		Created By: 	Conqueror Koala																		**
--**		Mod:			Standardized Nimble XP																**
--**																											**		
--**		Information:																						**
--**					This code is totally free for you to edit, use, or copy however you want!				**
--**					Feel free to use any of the code in your own projects, don't worry about crediting. 	**
--****************************************************************************************************************


--*************************************************************************************************
--**  Would not recommend changing anything past this point, unless you know what you are doing! **
--*************************************************************************************************
local SETTINGS = StandardizedAimingXP_global.SETTINGS

local aimingMult = {1,1.5,2,3,5,10};
--					(1x,1.5x,2x,3x,5x,10x) -- The REAL xp multipliers that effect your game!


onGunHitXp = function(owner, weapon, hitObject, damage)
	-- add xp for ranged weapon
	
	if weapon:isRanged() then
		local origXP = owner:getLastHitCount();
		local xp = origXP;
		if owner:getPerkLevel(Perks.Aiming) >= 5 then
			xp = origXP * 2.7 * tonumber(aimingMult[SETTINGS.options.dropdown1]);
			xp = xp - origXP;
			owner:getXp():AddXP(Perks.Aiming, xp);
		end
		if (owner:getPerkLevel(Perks.Aiming) < 5) and (tonumber(aimingMult[SETTINGS.options.dropdown1]) ~= 1) then
			xp = origXP * 2.7 * tonumber(aimingMult[SETTINGS.options.dropdown1]);
			xp = xp - (origXP * 2.7);
			owner:getXp():AddXP(Perks.Aiming, xp);
		end
	end
end

Events.OnWeaponHitXp.Add(onGunHitXp);

Events.OnGameStart.Add(function()
  if not isClient() then -- only host may take these options
  end
end)