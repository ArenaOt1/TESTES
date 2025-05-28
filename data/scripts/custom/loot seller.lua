local SELL_ITEM_ID = 32226 -- Substitua pelo ID do item que será usado (ex: Plaque of Trade)
local LOOT_POUCH_ID = 23721 -- ID real do loot pouch no seu servidor

local itemAction = Action()

function itemAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local lootPouch = player:getLootPouch()
    if not lootPouch then
        player:sendCancelMessage("You don't have a loot pouch.")
        return true
    end

    local npc = Npc()
    npc:onPlayerSellAllLoot(player:getId(), LOOT_POUCH_ID, false, 0)
    player:say("Selling all loot from your pouch...", TALKTYPE_MONSTER_SAY)
    return true
end

itemAction:id(SELL_ITEM_ID)
itemAction:register()
