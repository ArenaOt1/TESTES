local condition = Condition(CONDITION_OUTFIT)
condition:setOutfit({ lookType = 1594 }) -- Avatar of Light lookType

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	if not creature or not creature:isPlayer() then
		return false
	end

	local grade = creature:revelationStageWOD("Avatar of Light")
	if grade == 0 then
		creature:sendCancelMessage("You cannot cast this spell")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local cooldown = 0
	if grade >= 3 then
		cooldown = 60
	elseif grade >= 2 then
		cooldown = 90
	elseif grade >= 1 then
		cooldown = 120
	end
	local duration = 15000
	condition:setTicks(duration)
	local conditionCooldown = Condition(CONDITION_SPELLCOOLDOWN, CONDITIONID_DEFAULT, 265)
	-- CHECK SANGUINE GREAVES
	local legs = creature:getSlotItem(CONST_SLOT_LEGS)
	if legs and legs:getId() == 43881 then
	conditionCooldown:setTicks(((cooldown * 1000 * 60) - 1800000) / configManager.getFloat(configKeys.RATE_SPELL_COOLDOWN))
		else
	conditionCooldown:setTicks((cooldown * 1000 * 60) / configManager.getFloat(configKeys.RATE_SPELL_COOLDOWN))
		end
	-- creature:getPosition():sendMagicEffect(CONST_ME_AVATAR_APPEAR)
	creature:addCondition(conditionCooldown)
	creature:addCondition(condition)
	creature:avatarTimer((os.time() * 1000) + duration)
	creature:reloadData()
	addEvent(ReloadDataEvent, duration, creature:getId())
	return true
end

spell:group("support")
spell:id(265)
spell:name("Avatar of Light")
spell:words("uteta res sac")
spell:level(1)
spell:mana(800)
spell:isPremium(true)
spell:cooldown(1000) -- Cooldown is calculated on the casting
spell:groupCooldown(2 * 1000)
spell:vocation("paladin;true", "royal paladin;true")
spell:hasParams(true)
spell:isAggressive(false)
spell:needLearn(true)
spell:register()
