local portalReward = MoveEvent()

function portalReward.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end
    
    -- Definir os storages das tarefas
    local taskStorages = {
        190072, 190074, 190076, 190078, 190080,
        190082, 190084, 190086, 190088, 190090,
        190092, 190094, 190096, 190098, 191042,
        191044, 191046, 191048
    }

    -- Contar quantas tarefas foram concluídas
    local completedTasks = 0
    for _, storage in ipairs(taskStorages) do
        if player:getStorageValue(storage) == 1 then
            completedTasks = completedTasks + 1
        end
    end

    -- Verificar se o jogador completou pelo menos 9 tarefas
    if completedTasks < 9 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa completar 9 tasks de criaturas da Soulwars para acessar a area de recompensa.")
        player:teleportTo(fromPosition, true)
        return false
    end

    -- Verificar se o jogador derrotou Goshnar's Megalomania
    if player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomaniaKilled) < 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa derrotar o Goshnar's Megalomania para acessar a area de recompensa.")
        player:teleportTo(fromPosition, true)
        return false
    end

    -- Teleportar o jogador para a área de recompensa
    player:teleportTo(Position(33621, 31411, 10))
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

portalReward:type("stepin")
portalReward:position({ x = 33621, y = 31416, z = 10 })
portalReward:register()


--local portalReward = MoveEvent()
--function portalReward.onStepIn(creature, item, position, fromPosition)
--	local player = creature:getPlayer()
--	if not player then
--		return false
--	end
--	if player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomaniaKilled) < 1 then
--		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce pode acessar essa area somente apos derrotar Goshnar's Megalomania.")
--		player:teleportTo(fromPosition, true)
--		return false
--	end
--
--	player:teleportTo(Position(33621, 31411, 10))
--	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
--	return true
--end
--
--portalReward:type("stepin")
--portalReward:position({ x = 33621, y = 31416, z = 10 })
--portalReward:register()
