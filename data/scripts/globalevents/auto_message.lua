local messages = {
    "Atenção: Bots e MCs são proibidos! Jogue limpo!",
    "Não esqueça de visitar nossa loja exclusiva no site!",
    "Respeite as regras e divirta-se!",
    "Siga nosso Discord para eventos e notícias!"
}

local delay = 60 * 1000 -- 60 segundos (1 minuto)

local function sendAutoMessage()
    local message = messages[math.random(#messages)]
    for _, player in ipairs(Game.getPlayers()) do
        player:sendTextMessage(MESSAGE_INFO_DESCR, message)
    end
    addEvent(sendAutoMessage, delay)
end

function onStartup()
    sendAutoMessage()
end
