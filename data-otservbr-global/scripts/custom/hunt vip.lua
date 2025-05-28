
-- --- tp soul war (entrada da sala para a hunt)
-- local config = {
--     minLevel = 8,
--     firstPosition = Position(32887, 30949, 8),
--     secondPosition = Position(33620, 31427, 10)
-- }

-- local treePass = Action();

-- function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
--     if player:getLevel() >= config.minLevel then
--         if player:getPosition().y == config.secondPosition.y then
--             player:teleportTo(config.firstPosition)
--             player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
--         else
--             player:teleportTo(config.secondPosition)
--             player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
--         end
--     else
--         player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be at least level " .. config.minLevel .. " to access this area.")
--     end
--     return true
-- end

-- treePass:aid(51000)
-- treePass:register()
