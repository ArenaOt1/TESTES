
--- tp sanguine lado (norte esquerda--saida)
local config = {
    minLevel = 200,
    firstPosition = Position(3842, 31650, 13),
    secondPosition = Position(34092, 31979, 14)
}

local treePass = Action();

function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

treePass:aid(50090)
treePass:register()

--tp (norte esqueda entrada)

local config = {
    minLevel = 200,
    firstPosition = Position(34092, 31978, 14),
    secondPosition = Position(33842, 31653, 13)
}

local treePass = Action();

function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

treePass:aid(50091)
treePass:register()

--tp (norte direita entrada)

local config = {
    minLevel = 200,
    firstPosition = Position(34120, 31978, 14),
    secondPosition = Position(34101, 31679, 13)
}

local treePass = Action();

function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

treePass:aid(50092)
treePass:register()

--tp norte direita sainda

local config = {
    minLevel = 200,
    firstPosition = Position(34101, 31677, 13),
    secondPosition = Position(34120, 31979, 14)
}

local treePass = Action();

function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

treePass:aid(50093)
treePass:register()

--tp entrada sul direita entrada

local config = {
    minLevel = 200,
    firstPosition = Position(34118, 32010, 14),
    secondPosition = Position(34119, 31877, 14)
}

local treePass = Action();

function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

treePass:aid(50094)
treePass:register()

--tp sul direita saida

local config = {
    minLevel = 200,
    firstPosition = Position(34119, 31875, 14),
    secondPosition = Position(34118, 32008, 14)
}

local treePass = Action();

function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

treePass:aid(50095)
treePass:register()

--tp sul esquerda entrada

local config = {
    minLevel = 200,
    firstPosition = Position(34093, 32009, 14),
    secondPosition = Position(33809, 31816, 13)
}

local treePass = Action();

function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

treePass:aid(50096)
treePass:register()

--tp sul esquerda saida

local config = {
    minLevel = 200,
    firstPosition = Position(33809, 31814, 13),
    secondPosition = Position(34093, 32007, 14)
}

local treePass = Action();

function treePass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

treePass:aid(50097)
treePass:register()


local config = {
    minLevel = 200,
    firstPosition = Position(32953, 32398, 9),
    secondPosition = Position(34070, 31977, 14)
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

sanguine:aid(50098)
sanguine:register()

local config = {
    minLevel = 200,
    firstPosition = Position(34070, 31974, 14),
    secondPosition = Position(32958, 32398, 9)
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

sanguine:aid(50099)
sanguine:register()





