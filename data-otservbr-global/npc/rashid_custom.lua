local toggleRashidStorage = false

local internalNpcName = "Rashid of Island"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = "Rashid"
npcConfig.description = "Rashid"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 3

npcConfig.outfit = {
	lookType = 146,
	lookHead = 100,
	lookBody = 100,
	lookLegs = 119,
	lookFeet = 115,
	lookAddons = 2,
}

npcConfig.flags = {
	floorchange = false,
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "mission") then
		if os.date("%A") == "Monday" then
			if player:getStorageValue(Storage.TravellingTrader.Mission01) < 1 then
				npcHandler:say("Well, you could attempt the mission to become a recognised trader, but it requires a lot of travelling. Are you willing to try?", npc, creature)
				npcHandler:setTopic(playerId, 1)
			elseif player:getStorageValue(Storage.TravellingTrader.Mission01) == 1 then
				npcHandler:say("Have you managed to obtain a rare deer trophy for my customer?", npc, creature)
				npcHandler:setTopic(playerId, 3)
			end
		elseif os.date("%A") == "Tuesday" then
			if player:getStorageValue(Storage.TravellingTrader.Mission01) == 2 and player:getStorageValue(Storage.TravellingTrader.Mission02) < 1 then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", npc, creature)
				npcHandler:setTopic(playerId, 4)
			elseif player:getStorageValue(Storage.TravellingTrader.Mission02) == 4 then
				npcHandler:say("Did you bring me the package?", npc, creature)
				npcHandler:setTopic(playerId, 6)
			end
		elseif os.date("%A") == "Wednesday" then
			if player:getStorageValue(Storage.TravellingTrader.Mission02) == 5 and player:getStorageValue(Storage.TravellingTrader.Mission03) < 1 then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", npc, creature)
				npcHandler:setTopic(playerId, 7)
			elseif player:getStorageValue(Storage.TravellingTrader.Mission03) == 2 then
				npcHandler:say("Have you brought the cheese?", npc, creature)
				npcHandler:setTopic(playerId, 9)
			end
		elseif os.date("%A") == "Thursday" then
			if player:getStorageValue(Storage.TravellingTrader.Mission03) == 3 and player:getStorageValue(Storage.TravellingTrader.Mission04) < 1 then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", npc, creature)
				npcHandler:setTopic(playerId, 10)
			elseif player:getStorageValue(Storage.TravellingTrader.Mission04) == 2 then
				npcHandler:say("Have you brought the vase?", npc, creature)
				npcHandler:setTopic(playerId, 12)
			end
		elseif os.date("%A") == "Friday" then
			if player:getStorageValue(Storage.TravellingTrader.Mission04) == 3 and player:getStorageValue(Storage.TravellingTrader.Mission05) < 1 then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", npc, creature)
				npcHandler:setTopic(playerId, 13)
			elseif player:getStorageValue(Storage.TravellingTrader.Mission05) == 2 then
				npcHandler:say("Have you brought a cheap but good crimson sword?", npc, creature)
				npcHandler:setTopic(playerId, 15)
			end
		elseif os.date("%A") == "Saturday" then
			if player:getStorageValue(Storage.TravellingTrader.Mission05) == 3 and player:getStorageValue(Storage.TravellingTrader.Mission06) < 1 then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", npc, creature)
				npcHandler:setTopic(playerId, 16)
			elseif player:getStorageValue(Storage.TravellingTrader.Mission06) == 1 then
				npcHandler:say("Have you brought me a gold fish??", npc, creature)
				npcHandler:setTopic(playerId, 18)
			end
		elseif os.date("%A") == "Sunday" then
			if player:getStorageValue(Storage.TravellingTrader.Mission06) == 2 and player:getStorageValue(Storage.TravellingTrader.Mission07) ~= 1 then
				npcHandler:say("Ah, right. <ahem> I hereby declare you - one of my recognised traders! Feel free to offer me your wares!", npc, creature)
				player:setStorageValue(Storage.TravellingTrader.Mission07, 1)
				player:addAchievement("Recognised Trader")
				npcHandler:setTopic(playerId, 0)
			end
		end
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say({
				"Very good! I need talented people who are able to handle my wares with care, find good offers and the like, so I'm going to test you. ...",
				"First, I'd like to see if you can dig up rare wares. Something like a ... mastermind shield! ...",
				"Haha, just kidding, fooled you there, didn't I? Always control your nerves, that's quite important during bargaining. ...",
				"Okay, all I want from you is one of these rare deer trophies. I have a customer here in Svargrond who ordered one, so I'd like you to deliver it tome while I'm in Svargrond. ...",
				"Everything clear and understood?",
			}, npc, creature)

			npcHandler:setTopic(playerId, 2)
		elseif npcHandler:getTopic(playerId) == 2 then
			npcHandler:say("Fine. Then get a hold of that deer trophy and bring it to me while I'm in Svargrond. Just ask me about your mission.", npc, creature)
			player:setStorageValue(Storage.TravellingTrader.Mission01, 1)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 3 then
			if player:removeItem(7397, 1) then
				npcHandler:say("Well done! I'll take that from you. <snags it> Come see me another day, I'll be busy for a while now. ", npc, creature)
				player:setStorageValue(Storage.TravellingTrader.Mission01, 2)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 4 then
			npcHandler:say({
				"Alright, that's good to hear. From you as my trader and deliveryman, I expect more than finding rare items. ...",
				"You also need to be able to transport heavy wares, weaklings won't get far here. I have ordered a special package from Edron. ...",
				"Pick it up from Willard and bring it back to me while I'm in Liberty Bay. Everything clear and understood?",
			}, npc, creature)
			npcHandler:setTopic(playerId, 5)
		elseif npcHandler:getTopic(playerId) == 5 then
			npcHandler:say("Fine. Then off you go, just ask Willard about the 'package for Rashid'.", npc, creature)
			player:setStorageValue(Storage.TravellingTrader.Mission02, 1)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 6 then
			if player:removeItem(145, 1) then
				npcHandler:say("Great. Just place it over there - yes, thanks, that's it. Come see me another day, I'll be busy for a while now. ", npc, creature)
				player:setStorageValue(Storage.TravellingTrader.Mission02, 5)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 7 then
			npcHandler:say({
				"Well, that's good to hear. From you as my trader and deliveryman, I expect more than carrying heavy packages. ...",
				"You also need to be fast and deliver wares in time. I have ordered a very special cheese wheel made from Darashian milk. ...",
				"Unfortunately, the high temperature in the desert makes it rot really fast, so it must not stay in the sun for too long. ...",
				"I'm also afraid that you might not be able to use ships because of the smell of the cheese. ...",
				"Please get the cheese from Miraia and bring it to me while I'm in Port Hope. Everything clear and understood?",
			}, npc, creature)
			npcHandler:setTopic(playerId, 8)
		elseif npcHandler:getTopic(playerId) == 8 then
			npcHandler:say("Okay, then please find Miraia in Darashia and ask her about the {'scarab cheese'}.", npc, creature)
			player:setStorageValue(Storage.TravellingTrader.Mission03, 1)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 9 then
			if player:removeItem(169, 1) then
				npcHandler:say("Mmmhh, the lovely odeur of scarab cheese! I really can't understand why most people can't stand it. Thanks, well done! ", npc, creature)
				player:setStorageValue(Storage.TravellingTrader.Mission03, 3)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 10 then
			npcHandler:say({
				"Well, that's good to hear. From you as my trader and deliveryman, I expect more than bringing stinky cheese. ...",
				"I wonder if you are able to deliver goods so fragile they almost break when looked at. ...",
				"I have ordered a special elven vase from Briasol in Ab'Dendriel. Get it from him and don't even touch it, just bring it to me while I'm in Ankrahmun. Everything clear and understood?",
			}, npc, creature)
			npcHandler:setTopic(playerId, 11)
		elseif npcHandler:getTopic(playerId) == 11 then
			npcHandler:say("Okay, then please find {Briasol} in {Ab'Dendriel} and ask for a {'fine vase'}.", npc, creature)
			player:setStorageValue(Storage.TravellingTrader.Mission04, 1)
			player:addMoney(1000)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 12 then
			if player:removeItem(227, 1) then
				npcHandler:say("I'm surprised that you managed to bring this vase without a single crack. That was what I needed to know, thank you. ", npc, creature)
				player:setStorageValue(Storage.TravellingTrader.Mission04, 3)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 13 then
			npcHandler:say({
				"Fine! There's one more skill that I need to test and which is cruicial for a successful trader. ...",
				"Of course you must be able to haggle, else you won't survive long in this business. To make things as hard as possible for you, I have the perfect trade partner for you. ...",
				"Dwarves are said to be the most stubborn of all traders. Travel to {Kazordoon} and try to get the smith {Uzgod} to sell a {crimson sword} to you. ...",
				"Of course, it has to be cheap. Don't come back with anything more expensive than 400 gold. ...",
				"And the quality must not suffer, of course! Everything clear and understood?",
				"Dwarves are said to be the most stubborn of all traders. Travel to Kazordoon and try to get the smith Uzgod to sell a crimson sword to you. ...",
			}, npc, creature)
			npcHandler:setTopic(playerId, 14)
		elseif npcHandler:getTopic(playerId) == 14 then
			npcHandler:say("Okay, I'm curious how you will do with {Uzgod}. Good luck!", npc, creature)
			player:setStorageValue(Storage.TravellingTrader.Mission05, 1)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 15 then
			if player:removeItem(7385, 1) then
				npcHandler:say("Ha! You are clever indeed, well done! I'll take this from you. Come see me tomorrow, I think we two might get into business after all.", npc, creature)
				player:setStorageValue(Storage.TravellingTrader.Mission05, 3)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 16 then
			npcHandler:say({
				"My friend, it seems you have already learnt a lot about the art of trading. I think you are more than worthy to become a recognised trader. ...",
				"There is just one little favour that I would ask from you... something personal, actually, forgive my boldness. ...",
				"I have always dreamed to have a small pet, one that I could take with me and which wouldn't cause problems. ...",
				"Could you - just maybe - bring me a small goldfish in a bowl? I know that you would be able to get one, wouldn't you?",
			}, npc, creature)
			npcHandler:setTopic(playerId, 17)
		elseif npcHandler:getTopic(playerId) == 17 then
			npcHandler:say("Thanks so much! I'll be waiting eagerly for your return then.", npc, creature)
			player:setStorageValue(Storage.TravellingTrader.Mission06, 1)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 18 then
			if player:removeItem(5929, 1) then
				npcHandler:say("Thank you!! Ah, this makes my day! I'll take the rest of the day off to get to know this little guy. Come see me tomorrow, if you like.", npc, creature)
				player:setStorageValue(Storage.TravellingTrader.Mission06, 2)
				npcHandler:setTopic(playerId, 0)
			end
		end
	end
	return true
end

keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am a travelling trader. I don't buy everything, though. And not from everyone, for that matter." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I am Rashid, son of the desert." })
keywordHandler:addKeyword({ "offers" }, StdModule.say, { npcHandler = npcHandler, text = "Of course, old friend. You can also browse only armor, legs, shields, helmets, boots, weapons, enchanted weapons, jewelry or miscellaneous stuff." })
keywordHandler:addKeyword({ "ab'dendriel" }, StdModule.say, { npcHandler = npcHandler, text = "Elves... I don't really trust them. All this talk about nature and flowers and treehugging... I'm sure there's some wicked scheme behind all this." })
keywordHandler:addKeyword({ "desert" }, StdModule.say, { npcHandler = npcHandler, text = "My beloved hometown! Ah, the sweet scent of the desert sands, the perfect shape of the pyramids... stunningly beautiful." })
keywordHandler:addKeyword({ "carlin" }, StdModule.say, { npcHandler = npcHandler, text = "I have to go to Carlin once in a while, since the queen wishes to see my exclusive wares in regular intervals." })
keywordHandler:addKeyword({ "cormaya" }, StdModule.say, { npcHandler = npcHandler, text = "Cormaya? Not a good place to make business, it's way too far and small." })
keywordHandler:addKeyword({ "darashia" }, StdModule.say, { npcHandler = npcHandler, text = "It's not the real thing, but almost as good. The merchants there claim ridiculous prices, which is fine for my own business." })
keywordHandler:addKeyword({ "edron" }, StdModule.say, { npcHandler = npcHandler, text = "Ah yes, Edron! Such a lovely and quiet island! I usually make some nice business there." })
keywordHandler:addKeyword({ "fibula" }, StdModule.say, { npcHandler = npcHandler, text = "Too few customers there, it's not worth the trip." })
keywordHandler:addKeyword({ "greenshore" }, StdModule.say, { npcHandler = npcHandler, text = "Um... I don't think so." })
keywordHandler:addKeyword({ "kazordoon" }, StdModule.say, { npcHandler = npcHandler, text = "I don't like being underground much. I also tend to get lost in these labyrinthine dwarven tunnels, so I rather avoid them." })
keywordHandler:addKeyword({ "liberty bay" }, StdModule.say, { npcHandler = npcHandler, text = "When you avoid the slums, it's a really pretty city. Almost as pretty as the governor's daughter." })
keywordHandler:addKeyword({ "northport" }, StdModule.say, { npcHandler = npcHandler, text = "Um... I don't think so." })
keywordHandler:addKeyword({ "port hope" }, StdModule.say, { npcHandler = npcHandler, text = "I like the settlement itself, but I don't set my foot into the jungle. Have you seen the size of these centipedes??" })
keywordHandler:addKeyword({ "senja" }, StdModule.say, { npcHandler = npcHandler, text = "Um... I don't think so." })
keywordHandler:addKeyword({ "svargrond" }, StdModule.say, { npcHandler = npcHandler, text = "I wish it was a little bit warmer there, but with a good mug of barbarian mead in your tummy everything gets a lot cosier." })
keywordHandler:addKeyword({ "thais" }, StdModule.say, { npcHandler = npcHandler, text = "I feel uncomfortable and rather unsafe in Thais, so I don't really travel there." })
keywordHandler:addKeyword({ "vega" }, StdModule.say, { npcHandler = npcHandler, text = "Um... I don't think so." })
keywordHandler:addKeyword({ "venore" }, StdModule.say, { npcHandler = npcHandler, text = "Although it's the flourishing trade centre of Tibia, I don't like going there. Too much competition for my taste." })
keywordHandler:addKeyword({ "time" }, StdModule.say, { npcHandler = npcHandler, text = "It's almost time to journey on." })
keywordHandler:addKeyword({ "king" }, StdModule.say, { npcHandler = npcHandler, text = "Kings, queens, emperors and kaliphs... everyone claims to be different and unique, but actually it's the same thing everywhere." })

npcHandler:setMessage(MESSAGE_GREET, "Ah, a customer! Be greeted, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|, may the winds guide your way.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Take all the time you need to decide what you want!")

local function onTradeRequest(npc, creature)
	if toggleRashidStorage and Player(creature):getStorageValue(Storage.TravellingTrader.Mission07) ~= 1 then
		npcHandler:say("Sorry, but you do not belong to my exclusive customers. I have to make sure that I can trust in the quality of your wares.", npc, creature)
		return false
	end

	return true
end

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "abyss hammer", clientId = 7414, sell = 20000 },
	{ itemName = "albino plate", clientId = 19358, sell = 1500 },
	{ itemName = "amber staff", clientId = 7426, sell = 8000 },
	{ itemName = "ancient amulet", clientId = 3025, sell = 200 },
	{ itemName = "assassin dagger", clientId = 7404, sell = 20000 },
	{ itemName = "bandana", clientId = 5917, sell = 150 },
	{ itemName = "beastslayer axe", clientId = 3344, sell = 1500 },
	{ itemName = "beetle necklace", clientId = 10457, sell = 1500 },
	{ itemName = "berserker", clientId = 7403, sell = 40000 },
	{ itemName = "blacksteel sword", clientId = 7406, sell = 6000 },
	{ itemName = "blessed sceptre", clientId = 7429, sell = 40000 },
	{ itemName = "bone shield", clientId = 3441, sell = 80 },
	{ itemName = "bonelord helmet", clientId = 3408, sell = 7500 },
	{ itemName = "brutetamer's staff", clientId = 7379, sell = 1500 },
	{ itemName = "buckle", clientId = 17829, sell = 7000 },
	{ itemName = "castle shield", clientId = 3435, sell = 5000 },
	{ itemName = "chain bolter", clientId = 8022, sell = 40000 },
	{ itemName = "chaos mace", clientId = 7427, sell = 9000 },
	{ itemName = "cobra crown", clientId = 11674, sell = 50000 },
	{ itemName = "coconut shoes", clientId = 9017, sell = 500 },
	{ itemName = "composite hornbow", clientId = 8027, sell = 25000 },
	{ itemName = "cranial basher", clientId = 7415, sell = 30000 },
	{ itemName = "crocodile boots", clientId = 3556, sell = 1000 },
	{ itemName = "crystal crossbow", clientId = 16163, sell = 35000 },
	{ itemName = "crystal mace", clientId = 3333, sell = 12000 },
	{ itemName = "crystal necklace", clientId = 3008, sell = 400 },
	{ itemName = "crystal ring", clientId = 3007, sell = 250 },
	{ itemName = "crystal sword", clientId = 7449, sell = 600 },
	{ itemName = "crystalline armor", clientId = 8050, sell = 16000 },
	{ itemName = "daramian mace", clientId = 3327, sell = 110 },
	{ itemName = "daramian waraxe", clientId = 3328, sell = 1000 },
	{ itemName = "dark shield", clientId = 3421, sell = 400 },
	{ itemName = "death ring", clientId = 6299, sell = 1000 },
	{ itemName = "demon shield", clientId = 3420, sell = 30000 },
	{ itemName = "demonbone amulet", clientId = 3019, sell = 32000 },
	{ itemName = "demonrage sword", clientId = 7382, sell = 36000 },
	{ itemName = "devil helmet", clientId = 3356, sell = 1000 },
	{ itemName = "diamond sceptre", clientId = 7387, sell = 3000 },
	{ itemName = "divine plate", clientId = 8057, sell = 55000 },
	{ itemName = "djinn blade", clientId = 3339, sell = 15000 },
	{ itemName = "doll", clientId = 2991, sell = 200 },
	{ itemName = "dragon scale mail", clientId = 3386, sell = 40000 },
	{ itemName = "dragon slayer", clientId = 7402, sell = 15000 },
	{ itemName = "dragonbone staff", clientId = 7430, sell = 3000 },
	{ itemName = "dreaded cleaver", clientId = 7419, sell = 10000 },
	{ itemName = "dwarven armor", clientId = 3397, sell = 30000 },
	{ itemName = "elvish bow", clientId = 7438, sell = 2000 },
	{ itemName = "emerald bangle", clientId = 3010, sell = 800 },
	{ itemName = "epee", clientId = 3326, sell = 8000 },
	{ itemName = "flower dress", clientId = 9015, sell = 1000 },
	{ itemName = "flower wreath", clientId = 9013, sell = 500 },
	{ itemName = "fur boots", clientId = 7457, sell = 2000 },
	{ itemName = "furry club", clientId = 7432, sell = 1000 },
	{ itemName = "glacier amulet", clientId = 815, sell = 1500 },
	{ itemName = "glacier kilt", clientId = 823, sell = 11000 },
	{ itemName = "glacier mask", clientId = 829, sell = 2500 },
	{ itemName = "glacier robe", clientId = 824, sell = 11000 },
	{ itemName = "glacier shoes", clientId = 819, sell = 2500 },
	{ itemName = "gold ring", clientId = 3063, sell = 8000 },
	{ itemName = "golden armor", clientId = 3360, sell = 20000 },
	{ itemName = "golden legs", clientId = 3364, sell = 30000 },
	{ itemName = "goo shell", clientId = 19372, sell = 4000 },
	{ itemName = "griffin shield", clientId = 3433, sell = 3000 },
	{ itemName = "guardian halberd", clientId = 3315, sell = 11000 },
	{ itemName = "hammer of wrath", clientId = 3332, sell = 30000 },
	{ itemName = "headchopper", clientId = 7380, sell = 6000 },
	{ itemName = "heavy mace", clientId = 3340, sell = 50000 },
	{ itemName = "heavy machete", clientId = 3330, sell = 90 },
	{ itemName = "heavy trident", clientId = 12683, sell = 2000 },
	{ itemName = "helmet of the lost", clientId = 17852, sell = 2000 },
	{ itemName = "heroic axe", clientId = 7389, sell = 30000 },
	{ itemName = "hibiscus dress", clientId = 8045, sell = 3000 },
	{ itemName = "hieroglyph banner", clientId = 12482, sell = 500 },
	{ itemName = "horn", clientId = 19359, sell = 300 },
	{ itemName = "jade hammer", clientId = 7422, sell = 25000 },
	{ itemName = "krimhorn helmet", clientId = 7461, sell = 200 },
	{ itemName = "lavos armor", clientId = 8049, sell = 16000 },
	{ itemName = "leaf legs", clientId = 9014, sell = 500 },
	{ itemName = "leopard armor", clientId = 3404, sell = 1000 },
	{ itemName = "leviathan's amulet", clientId = 9303, sell = 3000 },
	--{ itemName = "light shovel", clientId = 5710, sell = 300 },
	{ itemName = "lightning boots", clientId = 820, sell = 2500 },
	{ itemName = "lightning headband", clientId = 828, sell = 2500 },
	{ itemName = "lightning legs", clientId = 822, sell = 11000 },
	{ itemName = "lightning pendant", clientId = 816, sell = 1500 },
	{ itemName = "lightning robe", clientId = 825, sell = 11000 },
	{ itemName = "lunar staff", clientId = 7424, sell = 5000 },
	{ itemName = "magic plate armor", clientId = 3366, sell = 90000 },
	{ itemName = "magma amulet", clientId = 817, sell = 1500 },
	{ itemName = "magma boots", clientId = 818, sell = 2500 },
	{ itemName = "magma coat", clientId = 826, sell = 11000 },
	{ itemName = "magma legs", clientId = 821, sell = 11000 },
	{ itemName = "magma monocle", clientId = 827, sell = 2500 },
	{ itemName = "mammoth fur cape", clientId = 7463, sell = 6000 },
	{ itemName = "mammoth fur shorts", clientId = 7464, sell = 850 },
	{ itemName = "mammoth whopper", clientId = 7381, sell = 300 },
	{ itemName = "mastermind shield", clientId = 3414, sell = 50000 },
	{ itemName = "medusa shield", clientId = 3436, sell = 9000 },
	{ itemName = "mercenary sword", clientId = 7386, sell = 12000 },
	{ itemName = "model ship", clientId = 2994, sell = 1000 },
	{ itemName = "mycological bow", clientId = 16164, sell = 35000 },
	{ itemName = "mystic blade", clientId = 7384, sell = 30000 },
	{ itemName = "naginata", clientId = 3314, sell = 2000 },
	{ itemName = "nightmare blade", clientId = 7418, sell = 35000 },
	{ itemName = "noble axe", clientId = 7456, sell = 10000 },
	{ itemName = "norse shield", clientId = 7460, sell = 1500 },
	{ itemName = "onyx pendant", clientId = 22195, sell = 3500 },
	{ itemName = "orcish maul", clientId = 7392, sell = 6000 },
	{ itemName = "oriental shoes", clientId = 21981, sell = 15000 },
	{ itemName = "pair of iron fists", clientId = 17828, sell = 4000 },
	{ itemName = "paladin armor", clientId = 8063, sell = 15000 },
	{ itemName = "patched boots", clientId = 3550, sell = 2000 },
	{ itemName = "pharaoh banner", clientId = 12483, sell = 1000 },
	{ itemName = "pharaoh sword", clientId = 3334, sell = 23000 },
	{ itemName = "pirate boots", clientId = 5461, sell = 3000 },
	{ itemName = "pirate hat", clientId = 6096, sell = 1000 },
	{ itemName = "pirate knee breeches", clientId = 5918, sell = 200 },
	{ itemName = "pirate shirt", clientId = 6095, sell = 500 },
	{ itemName = "pirate voodoo doll", clientId = 5810, sell = 500 },
	{ itemName = "platinum amulet", clientId = 3055, sell = 2500 },
	{ itemName = "ragnir helmet", clientId = 7462, sell = 400 },
	{ itemName = "relic sword", clientId = 7383, sell = 25000 },
	{ itemName = "rift bow", clientId = 22866, sell = 45000 },
	{ itemName = "rift crossbow", clientId = 22867, sell = 45000 },
	{ itemName = "rift lance", clientId = 22727, sell = 30000 },
	{ itemName = "rift shield", clientId = 22726, sell = 50000 },
	{ itemName = "ring of the sky", clientId = 3006, sell = 30000 },
	{ itemName = "royal axe", clientId = 7434, sell = 40000 },
	{ itemName = "ruby necklace", clientId = 3016, sell = 2000 },
	{ itemName = "ruthless axe", clientId = 6553, sell = 45000 },
	{ itemName = "sacred tree amulet", clientId = 9302, sell = 3000 },
	{ itemName = "sapphire hammer", clientId = 7437, sell = 7000 },
	{ itemName = "scarab amulet", clientId = 3018, sell = 200 },
	{ itemName = "scarab shield", clientId = 3440, sell = 2000 },
	{ itemName = "shockwave amulet", clientId = 9304, sell = 3000 },
	{ itemName = "silver brooch", clientId = 3017, sell = 150 },
	{ itemName = "silver dagger", clientId = 3290, sell = 500 },
	{ itemName = "skull helmet", clientId = 5741, sell = 40000 },
	{ itemName = "skullcracker armor", clientId = 8061, sell = 18000 },
	{ itemName = "spiked squelcher", clientId = 7452, sell = 5000 },
	{ itemName = "steel boots", clientId = 3554, sell = 30000 },
	{ itemName = "swamplair armor", clientId = 8052, sell = 16000 },
	{ itemName = "taurus mace", clientId = 7425, sell = 500 },
	{ itemName = "tempest shield", clientId = 3442, sell = 35000 },
	{ itemName = "terra amulet", clientId = 814, sell = 1500 },
	{ itemName = "terra boots", clientId = 813, sell = 2500 },
	{ itemName = "terra hood", clientId = 830, sell = 2500 },
	{ itemName = "terra legs", clientId = 812, sell = 11000 },
	{ itemName = "terra mantle", clientId = 811, sell = 11000 },
	{ itemName = "the justice seeker", clientId = 7390, sell = 40000 },
	{ itemName = "tortoise shield", clientId = 6131, sell = 150 },
	{ itemName = "vile axe", clientId = 7388, sell = 30000 },
	{ itemName = "voodoo doll", clientId = 3002, sell = 400 },
	{ itemName = "war axe", clientId = 3342, sell = 12000 },
	{ itemName = "war horn", clientId = 2958, sell = 8000 },
	{ itemName = "witch hat", clientId = 9653, sell = 5000 },
	{ itemName = "wyvern fang", clientId = 7408, sell = 1500 },
	{ itemName = "angelic axe", clientId = 7436, sell = 5000 },
	{ itemName = "blue robe", clientId = 3567, sell = 10000 },
	{ itemName = "boots of haste", clientId = 3079, sell = 30000 },
	{ itemName = "broadsword", clientId = 3301, sell = 500 },
	{ itemName = "butcher's axe", clientId = 7412, sell = 18000 },
	{ itemName = "crown armor", clientId = 3381, sell = 12000 },
	{ itemName = "crown helmet", clientId = 3385, sell = 2500 },
	{ itemName = "crown legs", clientId = 3382, sell = 12000 },
	{ itemName = "crown shield", clientId = 3419, sell = 8000 },
	{ itemName = "crusader helmet", clientId = 3391, sell = 6000 },
	{ itemName = "dragon lance", clientId = 3302, sell = 9000 },
	{ itemName = "dragon shield", clientId = 3416, sell = 4000 },
	{ itemName = "fire axe", clientId = 3320, sell = 8000 },
	{ itemName = "fire sword", clientId = 3280, sell = 4000 },
	{ itemName = "glorious axe", clientId = 7454, sell = 3000 },
	{ itemName = "guardian shield", clientId = 3415, sell = 2000 },
	{ itemName = "ice rapier", clientId = 3284, sell = 1000 },
	{ itemName = "phoenix shield", clientId = 3439, sell = 16000 },
	{ itemName = "queen's sceptre", clientId = 7410, sell = 20000 },
	{ itemName = "royal helmet", clientId = 3392, sell = 30000 },
	{ itemName = "shadow sceptre", clientId = 7451, sell = 10000 },
	{ itemName = "thaian sword", clientId = 7391, sell = 16000 },
	{ itemName = "ankh", clientId = 3077, sell = 100 },
	{ itemName = "glacial rod", clientId = 16118, sell = 6500 },
	{ itemName = "hailstorm rod", clientId = 3067, sell = 3000 },
	{ itemName = "moonlight rod", clientId = 3070, sell = 200 },
	{ itemName = "muck rod", clientId = 16117, sell = 6000 },
	{ itemName = "mysterious fetish", clientId = 3078, sell = 50 },
	{ itemName = "necrotic rod", clientId = 3069, sell = 1000 },
	{ itemName = "northwind rod", clientId = 8083, sell = 1500 },
	{ itemName = "snakebite rod", clientId = 3066, sell = 100 },
	{ itemName = "springsprout rod", clientId = 8084, sell = 3600 },
	{ itemName = "terra rod", clientId = 3065, sell = 2000 },
	{ itemName = "underworld rod", clientId = 8082, sell = 4400 },
	{ itemName = "bone club", clientId = 3337, sell = 5 },
	{ itemName = "small axe", clientId = 3462, sell = 5 },
	{ itemName = "studded club", clientId = 3336, sell = 10 },
	{ itemName = "legion helmet", clientId = 3374, sell = 22 },
	{ itemName = "hatchet", clientId = 3276, sell = 25 },
	{ itemName = "katana", clientId = 3300, sell = 35 },
	{ itemName = "swampling club", clientId = 17824, sell = 40 },
	{ itemName = "copper shield", clientId = 3430, sell = 50 },
	{ itemName = "battle shield", clientId = 3413, sell = 95 },
	{ itemName = "plate legs", clientId = 3557, sell = 115 },
	{ itemName = "red lantern", clientId = 10289, sell = 250 },
	{ itemName = "double axe", clientId = 3275, sell = 260 },
	{ itemName = "orcish axe", clientId = 3316, sell = 350 },
	{ itemName = "halberd", clientId = 3269, sell = 400 },
	{ itemName = "fire sword", clientId = 3280, sell = 1000 },
	-- 9 tomes
	{ itemName = "broken halberd", clientId = 10418, sell = 100, storageKey = tomes, storageValue = 9 },
	{ itemName = "spiked iron ball", clientId = 10408, sell = 100, storageKey = tomes, storageValue = 9 },
	{ itemName = "Broken Slicer", clientId = 11661, sell = 120, storageKey = tomes, storageValue = 9 },
	{ itemName = "high guard's shoulderplates", clientId = 10416, sell = 130, storageKey = tomes, storageValue = 9 },
	{ itemName = "bone shoulderplate", clientId = 10404, sell = 150, storageKey = tomes, storageValue = 9 },
	{ itemName = "zaogun's shoulderplates", clientId = 10414, sell = 150, storageKey = tomes, storageValue = 9 },
	{ itemName = "warmaster's wristguards", clientId = 10405, sell = 200, storageKey = tomes, storageValue = 9 },
	{ itemName = "cursed shoulder spikes", clientId = 10410, sell = 320, storageKey = tomes, storageValue = 9 },
	{ itemName = "broken draken mail", clientId = 11660, sell = 340, storageKey = tomes, storageValue = 9 },
	{ itemName = "draken wristbands", clientId = 11659, sell = 430, storageKey = tomes, storageValue = 9 },
	{ itemName = "twin hooks", clientId = 10392, sell = 500, storageKey = tomes, storageValue = 9 },
	{ itemName = "zaoan halberd", clientId = 10406, sell = 500, storageKey = tomes, storageValue = 9 },
	{ itemName = "wailing widow's necklace", clientId = 10412, sell = 3000, storageKey = tomes, storageValue = 9 },
	{ itemName = "zaoan shoes", clientId = 10386, sell = 5000, storageKey = tomes, storageValue = 9 },
	{ itemName = "drachaku", clientId = 10391, sell = 10000, storageKey = tomes, storageValue = 9 },
	{ itemName = "drakinata", clientId = 10388, sell = 10000, storageKey = tomes, storageValue = 9 },
	{ itemName = "zaoan armor", clientId = 10384, sell = 14000, storageKey = tomes, storageValue = 9 },
	{ itemName = "zaoan legs", clientId = 10387, sell = 14000, storageKey = tomes, storageValue = 9 },
	{ itemName = "sai", clientId = 10389, sell = 16500, storageKey = tomes, storageValue = 9 },
	{ itemName = "twiceslicer", clientId = 11657, sell = 28000, storageKey = tomes, storageValue = 9 },
	{ itemName = "zaoan sword", clientId = 10390, sell = 30000, storageKey = tomes, storageValue = 9 },
	{ itemName = "guardian boots", clientId = 10323, sell = 35000, storageKey = tomes, storageValue = 9 },
	{ itemName = "draken boots", clientId = 4033, sell = 40000, storageKey = tomes, storageValue = 9 },
	{ itemName = "zaoan helmet", clientId = 10385, sell = 45000, storageKey = tomes, storageValue = 9 },
	{ itemName = "Elite Draken Mail", clientId = 11651, sell = 50000, storageKey = tomes, storageValue = 9 },
	{ itemName = "black shield", clientId = 3429, sell = 800 },
	{ itemName = "bonebreaker", clientId = 7428, sell = 10000 },
	{ itemName = "dragon hammer", clientId = 3322, sell = 2000 },
	{ itemName = "dreaded cleaver", clientId = 7419, sell = 15000 },
	{ itemName = "giant sword", clientId = 3281, sell = 17000 },
	{ itemName = "haunted blade", clientId = 7407, sell = 8000 },
	{ itemName = "knight armor", clientId = 3370, sell = 5000 },
	{ itemName = "knight axe", clientId = 3318, sell = 2000 },
	{ itemName = "knight legs", clientId = 3371, sell = 5000 },
	{ itemName = "mystic turban", clientId = 3574, sell = 150 },
	{ itemName = "onyx flail", clientId = 7421, sell = 22000 },
	{ itemName = "ornamented axe", clientId = 7411, sell = 20000 },
	{ itemName = "poison dagger", clientId = 3299, sell = 50 },
	{ itemName = "scimitar", clientId = 3307, sell = 150 },
	{ itemName = "spellbook of mind control", clientId = 8074, sell = 13000 },
	{ itemName = "skull staff", clientId = 3324, sell = 6000 },
	{ itemName = "strange helmet", clientId = 3373, sell = 500 },
	{ itemName = "titan axe", clientId = 7413, sell = 4000 },
	{ itemName = "tower shield", clientId = 3428, sell = 8000 },
	{ itemName = "vampire shield", clientId = 3434, sell = 15000 },
	{ itemName = "warrior helmet", clientId = 3369, sell = 5000 },
	{ itemName = "life crystal", clientId = 4840, sell = 50 },
	{ itemName = "mind stone", clientId = 3062, sell = 100 },
	{ itemName = "orb", clientId = 3060, sell = 750 },
	{ itemName = "wand of cosmic energy", clientId = 3073, sell = 2000 },
	{ itemName = "wand of decay", clientId = 3072, sell = 1000 },
	{ itemName = "wand of defiance", clientId = 16096, sell = 6500 },
	{ itemName = "wand of draconia", clientId = 8093, sell = 1500 },
	{ itemName = "wand of dragonbreath", clientId = 3075, sell = 200 },
	{ itemName = "wand of everblazing", clientId = 16115, sell = 6000 },
	{ itemName = "wand of inferno", clientId = 3071, sell = 3000 },
	{ itemName = "wand of starstorm", clientId = 8092, sell = 3600 },
	{ itemName = "wand of voodoo", clientId = 8094, sell = 4400 },
	{ itemName = "wand of vortex", clientId = 3074, sell = 100 },
	{ itemName = "batwing hat", clientId = 9103, sell = 8000 },
	{ itemName = "focus cape", clientId = 8043, sell = 6000 },
	{ itemName = "jade hat", clientId = 10451, sell = 9000 },
	{ itemName = "spellweavers rob", clientId = 10438, sell = 12000 },
	{ itemName = "zaoan robe", clientId = 10439, sell = 12000 },
	{ itemName = "empty potion flask", clientId = 283, sell = 5 },
	{ itemName = "empty potion flask", clientId = 284, sell = 5 },
	{ itemName = "empty potion flask", clientId = 285, sell = 5 },
	{ itemName = "fire sword", clientId = 3280, sell = 1000 },
	{ itemName = "vial", clientId = 2874, sell = 5 },
	{ itemName = "calopteryx cape", clientId = 14086, sell = 15000 },
	{ itemName = "carapace shield", clientId = 14088, sell = 32000 },
	{ itemName = "deepling axe", clientId = 13991, sell = 40000 },
	{ itemName = "deepling squelcher", clientId = 14250, sell = 7000 },
	{ itemName = "deepling staff", clientId = 13987, sell = 4000 },
	{ itemName = "depth calcei", clientId = 13997, sell = 25000 },
	{ itemName = "depth galea", clientId = 13995, sell = 35000 },
	{ itemName = "depth lorica", clientId = 13994, sell = 30000 },
	{ itemName = "depth ocrea", clientId = 13996, sell = 16000 },
	{ itemName = "depth scutum", clientId = 13998, sell = 36000 },
	{ itemName = "grasshopper legs", clientId = 14087, sell = 15000 },
	{ itemName = "guardian axe", clientId = 14043, sell = 9000 },
	{ itemName = "hive bow", clientId = 14246, sell = 28000 },
	{ itemName = "hive scythe", clientId = 14089, sell = 17000 },
	{ itemName = "necklace of the deep", clientId = 13990, sell = 3000 },
	{ itemName = "ornate chestplate", clientId = 13993, sell = 60000 },
	{ itemName = "ornate crossbow", clientId = 14247, sell = 12000 },
	{ itemName = "ornate legs", clientId = 13999, sell = 40000 },
	{ itemName = "ornate mace", clientId = 14001, sell = 42000 },
	{ itemName = "ornate shield", clientId = 14000, sell = 42000 },
	{ itemName = "warrior's axe", clientId = 14040, sell = 11000 },
	{ itemName = "warrior's shield", clientId = 14042, sell = 9000 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	{ itemName = "bone club", clientId = 3337, sell = 5 },
	{ itemName = "double axe", clientId = 3275, sell = 260 },
	{ itemName = "fire sword", clientId = 3280, sell = 1000 },
	{ itemName = "halberd", clientId = 3269, sell = 400 },
	{ itemName = "hatchet", clientId = 3276, sell = 25 },
	{ itemName = "katana", clientId = 3300, sell = 35 },
	{ itemName = "orcish axe", clientId = 3316, sell = 350 },
	{ itemName = "small axe", clientId = 3462, sell = 5 },
	{ itemName = "studded club", clientId = 3336, sell = 10 },
	{ itemName = "battle shield", clientId = 3413, sell = 95 },
	{ itemName = "copper shield", clientId = 3430, sell = 50 },
	{ itemName = "legion helmet", clientId = 3374, sell = 22 },
	{ itemName = "plate legs", clientId = 3557, sell = 115 },
	{ itemName = "swampling club", clientId = 17824, sell = 40 },
	{ itemName = "compound eye", clientId = 14083, sell = 150 },
	{ itemName = "crawler head plating", clientId = 14079, sell = 210 },
	{ itemName = "deepling breaktime snack", clientId = 14011, sell = 90 },
	{ itemName = "deepling claw", clientId = 14044, sell = 430 },
	{ itemName = "deepling guard belt buckle", clientId = 14010, sell = 230 },
	{ itemName = "deepling ridge", clientId = 14041, sell = 360 },
	{ itemName = "deepling scales", clientId = 14017, sell = 80 },
	{ itemName = "deepling warts", clientId = 14012, sell = 180 },
	{ itemName = "deeptags", clientId = 14013, sell = 290 },
	{ itemName = "dung ball", clientId = 14225, sell = 130 },
	{ itemName = "eye of a deepling", clientId = 12730, sell = 150 },
	{ itemName = "key to the drowned library", clientId = 14009, sell = 330 },
	{ itemName = "kollos shell", clientId = 14077, sell = 420 },
	{ itemName = "spellsinger's seal", clientId = 14008, sell = 280 },
	{ itemName = "spidris mandible", clientId = 14082, sell = 450 },
	{ itemName = "spitter nose", clientId = 14078, sell = 340 },
	{ itemName = "swarmer antenna", clientId = 14076, sell = 130 },
	{ itemName = "waspoid claw", clientId = 14080, sell = 320 },
	{ itemName = "waspoid wing", clientId = 14081, sell = 190 },
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
