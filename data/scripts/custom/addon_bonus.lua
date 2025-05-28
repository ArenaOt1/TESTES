
local addonBonuses = {
    [128] = { -- Citizen
        [1] = { ml = 1, xp = 0.1, crit = 1 },
        [2] = { ml = 500, xp = 0.2, crit = 2 },
    },
    [131] = { -- Knight
        [1] = { ml = 0, xp = 0.3, crit = 1 },
        [2] = { ml = 0, xp = 0.5, crit = 2 },
    },
    [152] = { -- Assassin
        [1] = { ml = 0, xp = 0.2, crit = 2 },
        [2] = { ml = 1, xp = 0.2, crit = 4 },
    },
    [289] = { -- Demonhunter
        [1] = { ml = 2, xp = 0.3, crit = 3 },
        [2] = { ml = 2, xp = 0.3, crit = 3 },
    },
}

local function getTotalAddonBonus(player)
    local ml, xp, crit = 0, 0, 0

    for lookType, addonData in pairs(addonBonuses) do
        for addon, bonus in pairs(addonData) do
            if player:hasOutfit(lookType, addon) then
                ml = ml + (bonus.ml or 0)
                xp = xp + (bonus.xp or 0)
                crit = crit + (bonus.crit or 0)
            end
        end
    end

    return ml, xp, crit
end

local function applyAddonBonuses(player)
    local ml, xp, crit = getTotalAddonBonus(player)

    -- Reset antes de aplicar novamente
    player:setBaseXpGain(1.0 + xp)
    player:setMagicLevelGainBonus(ml)
    player:setCriticalChance(crit)
end

function onLogin(player)
    addEvent(applyAddonBonuses, 100, player)
    return true
end
