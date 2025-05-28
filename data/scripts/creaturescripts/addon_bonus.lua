local addonBonus = CreatureEvent("AddonBonus")

function addonBonus.onLogin(player)
    -- Define conditions
    local conditions = {
        mage = Condition(CONDITION_ATTRIBUTES),
        noble = Condition(CONDITION_ATTRIBUTES),
        Citizen = Condition(CONDITION_ATTRIBUTES),
        Hunter = Condition(CONDITION_ATTRIBUTES),
        Knight = Condition(CONDITION_ATTRIBUTES),
        Summoner = Condition(CONDITION_ATTRIBUTES),
        Warrior = Condition(CONDITION_ATTRIBUTES),
        Barbarian = Condition(CONDITION_ATTRIBUTES),
        Druid = Condition(CONDITION_ATTRIBUTES),
        Wizard = Condition(CONDITION_ATTRIBUTES),
        Oriental = Condition(CONDITION_ATTRIBUTES),
        Custom = Condition(CONDITION_ATTRIBUTES)
    }

    -- Function to set common parameters for a condition
    local function setCommonParams(condition)
        condition:setParameter(CONDITION_PARAM_TICKS, -1)
        condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 50)
        condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, 50)
        condition:setParameter(CONDITION_PARAM_SKILL_MELEE, 50)
        condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 50)
        condition:setParameter(CONDITION_PARAM_SKILL_FIST, 50)
    end

    -- Set parameters for each condition
    setCommonParams(conditions.noble)
    conditions.noble:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 50) -- Extra parameter for noble

    setCommonParams(conditions.mage)
    conditions.mage:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3) -- Different magic level for mage

    for _, condition in pairs(conditions) do
        if condition ~= conditions.noble and condition ~= conditions.mage then
            setCommonParams(condition)
        end
    end

    -- Getting the player's outfit directly
    local outfit = player:getOutfit()
    local lookType = outfit.lookType
    local lookAddons = outfit.lookAddons

        local outfitConditions = {
            [140] = conditions.noble, [132] = conditions.noble, -- Noblewoman or Nobleman outfit
            [138] = conditions.mage, [130] = conditions.mage,   -- Mage outfit
            [136] = conditions.Citizen, [128] = conditions.Citizen, -- Citizen outfit
            [137] = conditions.Hunter, [129] = conditions.Hunter,   -- Hunter outfit
            [139] = conditions.Knight, [131] = conditions.Knight,   -- Knight outfit
            [141] = conditions.Summoner, [133] = conditions.Summoner, -- Summoner outfit
            [142] = conditions.Warrior, [134] = conditions.Warrior, -- Warrior outfit
            [147] = conditions.Barbarian, [143] = conditions.Barbarian, -- Barbarian outfit
            [148] = conditions.Druid, [144] = conditions.Druid, -- Druid outfit
            [149] = conditions.Wizard, [145] = conditions.Wizard, -- Wizard outfit
            [150] = conditions.Oriental, [146] = conditions.Oriental, -- Oriental outfit
            [264] = conditions.Custom  -- Custom outfit
        }

        local condition = outfitConditions[lookType]
        if condition then
            if lookAddons == 3 or lookType == 264 then -- Check for addons or custom outfit
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are eligible for a bonus addon..\n[Magic Level] +50\n[Shield] 50 \n[Sword] 50 \n[Club] 50 \n[Fist] 50 \n[Distance] 50 \n[Axe] 50 ")
                player:addCondition(condition)
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not eligible for a bonus addon")
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not eligible for a bonus addon")
        end

    return true
end

addonBonus:register()