local effects = {
    {position = Position(32873, 30933, 8), text = 'FACIL', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32877, 30933, 8), text = 'MEDIO', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32881, 30933, 8), text = 'DIFICIL', effect = CONST_ME_GROUNDSHAKER},
     {position = Position(32834, 30898, 5), text = 'HUNTs', effect = CONST_ME_GROUNDSHAKER},    
    -- {position = Position(1116, 1092, 7), text = 'ENTER', effect = CONST_ME_GROUNDSHAKER},
    -- {position = Position(1114, 1096, 7), text = 'EXIT', effect = CONST_ME_GROUNDSHAKER},  
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4550)
animatedText:register()