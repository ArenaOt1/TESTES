local internalNpcName = "Chieff"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 472,
	lookHead = 19,
	lookBody = 50,
	lookLegs = 10,
	lookFeet = 3,
	lookAddons = 0,
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
	{ itemName = "banana chocolate shake", clientId = 9083, buy = 1000000 },
	{ itemName = "blessed steak", clientId = 9086, buy = 1000000 },
	{ itemName = "carrot cake", clientId = 9087, buy = 500000 },
	{ itemName = "coconut shrimp bake", clientId = 11584, buy = 500000 },
	{ itemName = "demonic candy ball", clientId = 11587, buy = 500000 },
	{ itemName = "filled jalapeno peppers", clientId = 9085, buy = 1000000 },
	{ itemName = "northern fishburger", clientId = 9088, buy = 500000 },
	{ itemName = "pot of black", clientId = 11586, buy = 500000 },
	{ itemName = "roasted dragon wings", clientId = 9081, buy = 500000 },
	{ itemName = "rotworm stew", clientId = 9079, buy = 1000000 },
	{ itemName = "sweet mangonaise elixir", clientId = 11588, buy = 500000 },
	{ itemName = "tropical fried terrorbird", clientId = 9082, buy = 500000 },
	{ itemName = "veggie casserole", clientId = 9084, buy = 500000 },
	{ itemName = "veggie casserole", clientId = 9084, buy = 500000 },
	
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
