local teleportLocations  = {
    { name="Thais", position = Position(32369, 32241, 7) },
    { name="Edron", position = Position(33217, 31814, 8) },
    { name="Carlin", position = Position(32360, 31782, 7) },
    { name="Venore", position = Position(32957, 32076, 7) },
    { name="Ab'Dendriel", position = Position(32732, 31634, 7) },
    { name="Port Hope", position = Position(32594, 32745, 7) },
    { name="Yalahar", position = Position(32787, 31276, 7) },
    { name="Kazordoon", position = Position(32649, 31925, 11) },
    { name="Darashia", position = Position(33213, 32454, 1) },
    { name="Rathleton", position = Position(33594, 31899, 6) },
    { name="Svargrond", position = Position(32212, 31132, 7) },
    { name="Farmine", position = Position(33023, 31521, 11) },
    { name="Ankrahmun", position = Position(33194, 32853, 8) },
    { name="Liberty Bay", position = Position(32317, 32826, 7) },
    { name="Roshamuul", position = Position(33513, 32363, 6) },
    { name="Gray beach", position = Position(33447, 31323, 9) },
    { name="Issavi", position = Position(33921, 31477, 5) },
    { name="Krailos", position = Position(33655, 31666, 8) },
    { name="Forge", position = Position(32209, 32279, 7) },
}

local teleportItemID = 22771 -- Replace with the actual item ID

local teleportEvent = Action()

function teleportEvent.onUse(player, item, fromPosition, target, toPosition, isHotkey)
  
    player:registerEvent("TeleportModalWindowLocations")
   
    local teleportWindow = ModalWindow(1, "Selecione um Local")
    for i, location in ipairs(teleportLocations) do
        teleportWindow:addChoice(i, location.name)
    end
    teleportWindow:addButton(1, "Selecionar")
    teleportWindow:addButton(2, "Cancelar")
    teleportWindow:setDefaultEnterButton(1)
    teleportWindow:setDefaultEscapeButton(2)
    teleportWindow:sendToPlayer(player)
   
    return true
end

teleportEvent:id(teleportItemID)
teleportEvent:register()

local modalEvent = CreatureEvent("TeleportModalWindowLocations")

function modalEvent.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("TeleportModalWindowLocations")
   
    if buttonId == 1 then
        local selectedLocation = teleportLocations[choiceId]
        if selectedLocation then
            return player:ProcessTeleport(selectedLocation.position)
        end
    end
   
    return true
end

modalEvent:type("modalwindow")
modalEvent:register()

function Player.ProcessTeleport(self, position)
    if not self or not position then return false end
    if self:getCondition(CONDITION_INFIGHT) then
        self:sendTextMessage(MESSAGE_STATUS_SMALL, "Você não pode se teleportar enquanto está em combate.")
        return false
    end
    if self:isPzLocked() then
        self:sendTextMessage(MESSAGE_STATUS_SMALL, "Você não pode se teleportar enquanto está protegido por uma zona de paz.")
        return false
    end
   
    self:teleportTo(position)
    self:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
   
    return true
end










--local scrollOfAscension = Action()

--function scrollOfAscension.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	--if player:hasExhaustion("scroll-of-ascension") then
	--	return true
--	end
--
--	local playerTile = Tile(player:getPosition())
--	if playerTile and playerTile:getGround() and table.contains(swimmingTiles, playerTile:getGround():getId()) then
--		player:say("The scroll could get wet, step out of the water first.", TALKTYPE_MONSTER_SAY)
--		return true
--	end
--
--	player:setMonsterOutfit(math.random(10) > 1 and "Demon" or "Ferumbras", 5 * 60 * 1000)
--	player:say("Magical sparks whirl around the scroll as you read it and then your appearance is changing.", TALKTYPE_MONSTER_SAY)
--	player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
--	player:setExhaustion("scroll-of-ascension", 60 * 60)
--	return true
--end

--scrollOfAscension:id(22771)
--scrollOfAscension:register()*/
