local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)

local weapon = creature:getSlotItem(CONST_SLOT_LEFT)
	-- CHECK SANGUINE COIL
if weapon and weapon:getId() == 43882 then
	function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 17)
	local max = (level / 5) + (maglevel * 22)
	return -min, -max
	end
-- CHECK GRAND SANGUINE COIL
elseif weapon and weapon:getId() == 43883 then
	function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 20)
	local max = (level / 5) + (maglevel * 25)
	return -min, -max
	end
else 
	function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 13)
	local max = (level / 5) + (maglevel * 20)
	return -min, -max
	end
end
	combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
	-- CHECK SANGUINE BOOTS
	local boots = creature:getSlotItem(CONST_SLOT_FEET)
	if boots and boots:getId() == 43884 then
		creature:setSkillLevel(8, creature:getSkillLevel(8) + 1000)
		combat:execute(creature, variant)
		creature:setSkillLevel(8, creature:getSkillLevel(8) - 1000)
		else
			combat:execute(creature, variant)
		end
	return true
end

spell:group("attack", "focus")
spell:id(24)
spell:name("Hell's Core")
spell:words("exevo gran mas flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HELL_SCORE)
spell:level(60)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(12 * 1000)
spell:groupCooldown(4 * 1000, 12 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
