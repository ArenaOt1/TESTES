---entrada hunt bony sea vip

local config = {
    minLevel = 200,
    firstPosition = Position(32813, 30804, 6),
    secondPosition = Position(32932, 30764, 12)
}

local sanguine = MoveEvent();

function sanguine.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getLevel() >= config.minLevel then
        if player:getPosition().y == config.secondPosition.y then
            player:teleportTo(config.firstPosition)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        else
            player:teleportTo(config.secondPosition)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be at least level " .. config.minLevel .. " to access this area.")
    end
    return true
end

sanguine:aid(50100)
sanguine:register()

--sainda bony sea vip 

local config = {
    minLevel = 200,
    firstPosition = Position(32930, 30764, 12),
    secondPosition = Position(32813, 30806, 6)
}

local sanguine = MoveEvent();

function sanguine.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getLevel() >= config.minLevel then
        if player:getPosition().y == config.secondPosition.y then
            player:teleportTo(config.firstPosition)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        else
            player:teleportTo(config.secondPosition)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be at least level " .. config.minLevel .. " to access this area.")
    end
    return true
end

sanguine:aid(50101)
sanguine:register()





