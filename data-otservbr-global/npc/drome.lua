local internalNpcName = "Drome"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 133,
	lookHead = 59,
	lookBody = 94,
	lookLegs = 52,
	lookFeet = 130,
	lookAddons = 2,
	lookMount = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Selling foods, with your best skills!" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

keywordHandler:addKeyword({ "offers" }, StdModule.say, { npcHandler = npcHandler, text = "I'm selling various herbs, mushrooms, and flowers. If you'd like to see my offers, ask me for a {trade}." })

npcHandler:setMessage(MESSAGE_GREET, "Greetings, traveller. Maybe you'd like to take a look at my {offers}...")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye, traveller.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Goodbye, traveller.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "death amplification", clientId = 36741, buy = 8000000 },
	{ itemName = "death resilience", clientId = 36734, buy = 8000000 },
	{ itemName = "earth amplification", clientId = 36738, buy = 8000000 },
	{ itemName = "earth resilience", clientId = 36731, buy = 8000000 },
	{ itemName = "energy amplification", clientId = 36739, buy = 8000000 },
	{ itemName = "energy resilience", clientId = 36732, buy = 8000000 },
	{ itemName = "fire amplification", clientId = 36736, buy = 8000000 },
	{ itemName = "fire resilience", clientId = 36729, buy = 8000000 },
	{ itemName = "holy amplification", clientId = 36740, buy = 8000000 },
	{ itemName = "holy resilience", clientId = 36733, buy = 8000000 },
	{ itemName = "ice amplification", clientId = 36737, buy = 8000000 },
	{ itemName = "ice resilience", clientId = 36730, buy = 8000000 },
	{ itemName = "kooldown-aid", clientId = 36723, buy = 8000000 },
	{ itemName = "physical amplification", clientId = 36742, buy = 8000000 },
	{ itemName = "physical resilience", clientId = 36735, buy = 8000000 },
	
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
