local bp = TalkAction("!bp") -- false evita que o comando apareça no chat

-- Lista de backpacks possíveis (adicione mais se quiser)
local randomBackpacks = {
    2854, 3253, 5949, 2869, 8860, 14249, 20347, 2872, 9605, 16100, 14248, 9601, 10326, 10324, 7342, 21295, 2871, 2865, 2870, 10202, 5801
}

function bp.onSay(player, words, param)
    local allTalkActions = Game.getTalkActions()
	local playerGroupId = player:getGroup():getId()
    local totalCost = 10 -- valor fixo ou pode usar configManager se preferir
    local bpId = randomBackpacks[math.random(#randomBackpacks)]

    if player:removeMoneyBank(totalCost) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(bpId, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have bought a backpack for %i gold!", totalCost))
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage(string.format("You do not have enough money. You need %i gold to buy a backpack!", totalCost))
    end
    return true -- não mostra o comando no chat
end

bp:groupType("normal")
bp:register()
