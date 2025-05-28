local AutoBroadCast = GlobalEvent("texto")
local interval = 1 -- Minutes 

-- Contador global para controlar qual mensagem será enviada
local currentMessageIndex = 1

function AutoBroadCast.onThink(interval, lastExecution)
    local players = Game.getPlayers()
    if not players then
        return true
    end
    
    function Player:sendColoredMessage(message)
        local grey = 3003
        local blue = 3043
        local green = 3415
        local purple = 36792
        local yellow = 34021
    
        local msg = message:gsub("{grey|", "{" .. grey .. "|"):gsub("{blue|", "{" .. blue .. "|"):gsub("{green|", "{" .. green .. "|"):gsub("{purple|", "{" .. purple .. "|"):gsub("{yellow|", "{" .. yellow .. "|")
        return self:sendTextMessage(MESSAGE_LOOT, msg)
    end

    local messages = {
        string.format("se voce e novo, digite !reward para receber seu varinha de treino"),
        string.format("Atenção: Bots e MCs são proibidos! Jogue limpo!"),
        --string.format("{green|[SEGURANCA]}: Nunca Utilize o mesmo e email e senha de outros OTS"),
        string.format("torne-se vip e receba bonus adicionais"),
        string.format("digite !commands para ver a lista de comandos"),
        string.format("faca donates entrando em contato com os adms")
    }
    
    -- Envia a mensagem atual para todos os jogadores
    for _, player in ipairs(players) do
        player:sendColoredMessage(messages[currentMessageIndex], MESSAGE_EVENT_ADVANCE)
    end
    
    -- Avança para a próxima mensagem
    currentMessageIndex = currentMessageIndex + 1
    -- Se chegou ao fim da lista, volta para o início
    if currentMessageIndex > #messages then
        currentMessageIndex = 1
    end
    
    return true
end

AutoBroadCast:interval(interval * 60 * 1000)
AutoBroadCast:register()