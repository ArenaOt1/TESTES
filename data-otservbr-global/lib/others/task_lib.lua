taskOptions = {
	bonusReward = 65001, -- storage bonus reward
	bonusRate = 2, -- rate bonus reward
	taskBoardPositions = {
        {x = 32358, y = 32239, z = 7},
        {x = 32362, y = 32239, z = 7},
    },
	selectLanguage = 1, -- options: 1 = pt_br or 2 = english
	uniqueTask = true, -- do one task at a time
	uniqueTaskStorage = 65002
}

task_pt_br = {
	exitButton = "Fechar",
	confirmButton = "Validar",
	cancelButton = "Anular",
	returnButton = "Voltar",
	title = "Quadro De Miss�es",
	missionError = "Miss�o esta em andamento ou ela j� foi concluida.",
	uniqueMissionError = "Voc� s� pode fazer uma miss�o por vez.",
	missionErrorTwo = "Voc� concluiu a miss�o",
	missionErrorTwoo = "\nAqui est�o suas recompensas:",
	choiceText = "- Experi�ncia: ",
	messageAcceptedText = "Voc� aceitou essa miss�o!",
	messageDetailsText = "Detalhes da miss�o:",
	choiceMonsterName = "Nome: ",
	choiceMonsterKill = "Abates: ",
	choiceEveryDay = "Repeti��o: Todos os dias",
	choiceRepeatable = "Repeti��o: Sempre",
	choiceOnce = "Repeti��o: Apenas uma vez",
	choiceReward = "Recompensas:",
	messageAlreadyCompleteTask = "Voc� j� concluiu essa miss�o.",
	choiceCancelTask = "Voc� cancelou essa miss�o",
	choiceCancelTaskError = "Voc� n�o pode cancelar essa miss�o, porque ela j� foi conclu�da ou n�o foi iniciada.",
	choiceBoardText = "Escolha uma miss�o e use os bot�es abaixo:",
	choiceRewardOnHold = "Resgatar Pr�mio",
	choiceDailyConclued = "Di�ria Conclu�da",
	choiceConclued = "Conclu�da",
	messageTaskBoardError = "O quadro de miss�es esta muito longe ou esse n�o � o quadro de miss�es correto.",
	messageCompleteTask = "Voc� terminou essa miss�o! \nRetorne para o quadro de miss�es e pegue sua recompensa.",
}

taskConfiguration = {
{name = "Rotworm", color = 40, total = 750, type = "once", storage = 190006, storagecount = 190007, 
rewards = {
{3043, 10},
{3374, 1}, -- Legion Helmet
{"exp", 100000},
	},
},

{name = "Minotaur", color = 40, total = 5000, type = "once", storage = 190000, storagecount = 190001, 
rewards = {
{5804, 1}, -- Nose Ring
{"exp", 1000000},
	},
},

{name = "Dragon", color = 40, total = 1000, type = "daily", storage = 190002, storagecount = 190003, 
rewards = {
{3043, 100},
{5908, 1}, -- Obsidian Knife
{"exp", 1500000},
	},
},

{name = "Dragon Lord", color = 40, total = 7000, type = "once", storage = 190004, storagecount = 190005, 
rewards = {
{5919, 1}, -- Dragon Claw
{"exp", 500000},
	},
},

{name = "Amazon", color = 40, total = 500, type = "repeatable", storage = 190008, storagecount = 190009, 
rewards = { 
{"exp", 20000},
	},
},

{name = "Valkyrie", color = 40, total = 8000, type = "once", storage = 190010, storagecount = 190011, 
rewards = { 
{3437, 1}, -- Amazon Shield
	},
},

{name = "Weakened Frazzlemaw", color = 40, total = 1000, type = "daily", storage = 190012, storagecount = 190013, 
rewards = { 
{22516, 1}, -- Silver Token
	},
},

{name = "Enfeebled Silencer", color = 40, total = 1000, type = "daily", storage = 190014, storagecount = 190015, 
rewards = { 
{22721, 1}, -- Gold Token
	},
},

{name = "Deepling Guard", color = 40, total = 1000, type = "daily", storage = 190016, storagecount = 190017, 
rewards = { 
{14142, 1}, -- Foxtail
	},
},

{name = "Guzzlemaw", color = 40, total = 5000, type = "once", storage = 190022, storagecount = 190023, 
rewards = { 
{20270, 1}, -- Golden Prison Key
	},
},

{name = "Frazzlemaw", color = 40, total = 5000, type = "once", storage = 190022, storagecount = 190023, 
rewards = { 
{20272, 1}, -- Silver Prison Key
	},
},

{name = "Silencer", color = 40, total = 5000, type = "once", storage = 190024, storagecount = 190025, 
rewards = { 
{20271, 1}, -- Cooper Prison Key
	},
},

{name = "Medusa", color = 40, total = 10000, type = "once", storage = 190026, storagecount = 190027, 
rewards = { 
{3393, 1}, -- Amazon Helmet
	},
},

{name = "Demon", color = 40, total = 26000, type = "once", storage = 190028, storagecount = 190029, 
rewards = { 
{3365, 1}, -- Golden Helmet
	},
},

{name = "Hero", color = 40, total = 10000, type = "once", storage = 190030, storagecount = 190031, 
rewards = { 
{3394, 1}, -- Amazon Armor
	},
},

{name = "Juggernaut", color = 40, total = 25000, type = "once", storage = 190032, storagecount = 190033, 
rewards = { 
{3422, 1},
	},
},

{name = "Dawnfire Asura", color = 40, total = 1000, type = "daily", storage = 190034, storagecount = 190035, 
rewards = { 
{"exp", 10000000},
	},
},

{name = "Midnight Asura", color = 40, total = 1000, type = "daily", storage = 190036, storagecount = 190037, 
rewards = { 
{"exp", 10000000},
	},
},

{name = "Warlock", color = 40, total = 2000, type = "once", storage = 190038, storagecount = 190039, 
rewards = { 
{2849, 1},
},
},

{name = "Dwarf", color = 40, total = 2000, type = "once", storage = 190040, storagecount = 190041, 
},

{name = "Dwarf Soldier", color = 40, total = 2000, type = "once", storage = 190040, storagecount = 190041, 
},

{name = "Dwarf Guard", color = 40, total = 2000, type = "once", storage = 190040, storagecount = 190041, 
rewards = { 
{3398, 1}, -- Moon Mirror
},
},

{name = "Wyrm", color = 40, total = 3000, type = "once", storage = 190042, storagecount = 190043, 
rewards = { 
{1961, 1}, -- Sun Catcher
},
},

{name = "Toad", color = 40, total = 600, type = "once", storage = 190044, storagecount = 190045, 
rewards = { 
{10294, 1}, -- Staff Toad
},
},

{name = "Bog Raider", color = 40, total = 1200, type = "once", storage = 190046, storagecount = 190047, 
rewards = { 
{19371, 1}, -- Glass of Gooul
},
},

{name = "Dark Torturer", color = 40, total = 1000, type = "once", storage = 190048, storagecount = 190049, 
rewards = { 
{7435, 1}, -- The Impaler
},
},

{name = "Grim Reaper", color = 40, total = 2000, type = "once", storage = 190050, storagecount = 190051, 
rewards = { 
{2851, 1}, -- Grey Tome
},
},

{name = "Instable Sparkion", color = 40, total = 950, type = "once", storage = 190052, storagecount = 190053, 
rewards = { 
{23538, 1}, -- Vibrant Egg
},
},

{name = "Cyclops", color = 40, total = 4000, type = "once", storage = 190054, storagecount = 190055, 
rewards = { 
{3325, 1}, -- Light Mace
},
},

{name = "Ice Witch", color = 40, total = 3000, type = "once", storage = 190056, storagecount = 190057, 
rewards = { 
{19365, 1}, -- Trapped Lightling
},
},

{name = "Poacher", color = 40, total = 500, type = "once", storage = 190058, storagecount = 190059, 
rewards = { 
{21217, 1}, -- Green Light
},
},

{name = "Wild Warrior", color = 40, total = 1000, type = "once", storage = 190060, storagecount = 190061, 
rewards = { 
{3417, 1}, -- Shield of Honor
},
},

{name = "Boar", color = 40, total = 750, type = "once", storage = 190062, storagecount = 190063, 
rewards = { 
{12260, 1}, -- Hunting Horn
},
},

{name = "Dromedary", color = 40, total = 750, type = "once", storage = 190064, storagecount = 190065, 
rewards = { 
{12546, 1}, -- Fist on a Stick
},
},

{name = "Gravedigger", color = 40, total = 750, type = "once", storage = 190066, storagecount = 190067, 
rewards = { 
{19136, 1}, -- Nail Case
},
},


{name = "Lava Golem", color = 40, total = 500, type = "once", storage = 190068, storagecount = 190069, 
rewards = { 
{16129, 10}, -- Major Crystalline Token
},
},

{name = "Cliff Strider", color = 40, total = 500, type = "once", storage = 190070, storagecount = 190071, 
rewards = { 
{16129, 10}, -- Nail Case
},
},

-- SOUL WAR 

{name = "Cloak Of Terror", color = 40, total = 1500, type = "once", storage = 190072, storagecount = 190073, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Vibrant Phantom", color = 40, total = 1500, type = "donce", storage = 190074, storagecount = 190075, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Courage Leech", color = 40, total = 1500, type = "once", storage = 190076, storagecount = 190077, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Brachiodemon", color = 40, total = 1500, type = "once", storage = 190078, storagecount = 190079, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Infernal Demon", color = 40, total = 1500, type = "once", storage = 190080, storagecount = 190081, 
rewards = { 
{34109, 2},
	},
},

{name = "Infernal Phantom", color = 40, total = 1500, type = "once", storage = 190082, storagecount = 190083, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Bony Sea Devil", color = 40, total = 1500, type = "once", storage = 190084, storagecount = 190085, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Turbulent Elemental", color = 40, total = 1500, type = "once", storage = 190086, storagecount = 190087, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Capricious Phantom", color = 40, total = 1500, type = "once", storage = 190088, storagecount = 190089, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Rotten Golem", color = 40, total = 1500, type = "once", storage = 190090, storagecount = 190091, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Branchy Crawler", color = 40, total = 1500, type = "once", storage = 190092, storagecount = 190093, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Mould Phantom", color = 40, total = 1500, type = "once", storage = 190094, storagecount = 190095, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Druid's Apparition", color = 40, total = 1500, type = "once", storage = 190096, storagecount = 190097, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Sorcerer's Apparition", color = 40, total = 1500, type = "once", storage = 190098, storagecount = 190099, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Knight's Apparition", color = 40, total = 1500, type = "once", storage = 191042, storagecount = 191043, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Paladin's Apparition", color = 40, total = 1500, type = "once", storage = 191044, storagecount = 191045, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Many Faces", color = 40, total = 1500, type = "once", storage = 191046, storagecount = 191047, 
rewards = { 
{"exp", 30000000},
	},
},

{name = "Distorted Phantom", color = 40, total = 1500, type = "once", storage = 191048, storagecount = 191049, 
rewards = { 
{"exp", 30000000},
	},
},

-- OTHERS


{name = "Pirat Scoundrel", color = 40, total = 2000, type = "once", storage = 191050, storagecount = 191051, 
rewards = { 
{35595, 1},
	},
},

{name = "Pirate Cutthroat", color = 40, total = 2000, type = "once", storage = 191052, storagecount = 191053, 
rewards = { 
{35695, 1},
	},
},

-- VERIFICAR ITEM PIRATE OUTFIT
--{name = "Pirate Cutthroat", color = 40, total = 2000, type = "once", storage = 190044, storagecount = 190045, 
--rewards = { 
--{35695, 1},
--	},
--},

-- VERIFICAR ITEM CITIZEN OF ISSAVI OUTFIT
--{name = "Citizen of issavi", color = 40, total = 2000, type = "once", storage = 190044, storagecount = 190045, 
--rewards = { 
--{35695, 1},
--	},
--},

{name = "Cursed Book", color = 40, total = 1500, type = "once", storage = 191054, storagecount = 191055, 
rewards = { 
{28792, 2},
	},
},


{name = "Energetic Book", color = 40, total = 1500, type = "once", storage = 191056, storagecount = 191057, 
rewards = { 
{28792, 2},
	},
},

{name = "Burning Book", color = 40, total = 1500, type = "once", storage = 191058, storagecount = 191059, 
rewards = { 
{28793, 10},
	},
},

{name = "Icecold Book", color = 40, total = 1500, type = "once", storage = 191060, storagecount = 191061, 
rewards = { 
{28793, 10},
	},
},
}

-- VERIFICAR ITEM WARMASTER ADDON 1
--{name = "WARMASTER", color = 40, total = 2000, type = "once", storage = 190044, storagecount = 190045, 
--rewards = { 
--{35695, 1},
--	},
--},

-- VERIFICAR ITEM WARMASTER ADDON 2
--{name = "WARMASTER", color = 40, total = 2000, type = "once", storage = 190044, storagecount = 190045, 
--rewards = { 
--{35695, 1},
--	},
--},

--{name = "Foxmouse", color = 40, total = 3000, type = "once", storage = 190044, storagecount = 190045, 
--rewards = { 
--{28793, 10},
--	},
--},

squareWaitTime = 5000
taskQuestLog = 65000 -- A storage so you get the quest log
dailyTaskWaitTime = 20 * 60 * 60 

function Player.getCustomActiveTasksName(self)
local player = self
	if not player then
		return false
	end
local tasks = {}
	for i, data in pairs(taskConfiguration) do
		if player:getStorageValue(data.storagecount) ~= -1 then
		tasks[#tasks + 1] = data.name
		end
	end
	return #tasks > 0 and tasks or false
end


function getTaskByStorage(storage)
	for i, data in pairs(taskConfiguration) do
		if data.storage == tonumber(storage) then
			return data
		end
	end
	return false
end

function getTaskByMonsterName(name)
	for i, data in pairs(taskConfiguration) do
		if data.name:lower() == name:lower() then
			return data
		end
	end
	return false
end

function Player.startTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if player:getStorageValue(taskQuestLog) == -1 then
		player:setStorageValue(taskQuestLog, 1)
	end
	player:setStorageValue(storage, player:getStorageValue(storage) + 1)
	player:setStorageValue(data.storagecount, 0)
	return true
end

function Player.canStartCustomTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if data.type == "daily" then
		return os.time() >= player:getStorageValue(storage)
	elseif data.type == "once" then
		return player:getStorageValue(storage) == -1
	elseif data.type[1] == "repeatable" and data.type[2] ~= -1 then
		return player:getStorageValue(storage) < (data.type[2] - 1)
	else
		return true
	end
end

function Player.endTask(self, storage, prematurely)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
end
	if prematurely then
		if data.type == "daily" then
			player:setStorageValue(storage, -1)
		else
			player:setStorageValue(storage, player:getStorageValue(storage) - 1)
	end
	else
		if data.type == "daily" then
			player:setStorageValue(storage, os.time() + dailyTaskWaitTime)
		end
	end
	player:setStorageValue(data.storagecount, -1)
	return true
end

function Player.hasStartedTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	return player:getStorageValue(data.storagecount) ~= -1
end


function Player.getTaskKills(self, storage)
local player = self
	if not player then
		return false
	end
	return player:getStorageValue(storage)
end

function Player.addTaskKill(self, storage, count)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	local kills = player:getTaskKills(data.storagecount)
	if kills >= data.total then
		return false
	end
	if kills + count >= data.total then
		if taskOptions.selectLanguage == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, task_pt_br.messageCompleteTask)
		else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Task System] You have finished this task! To claim your rewards, return to the quest board and claim your reward.")
		end
		return player:setStorageValue(data.storagecount, data.total)
	end
		player:say('Task: '..data.name ..' - ['.. kills + count .. '/'.. data.total ..']', TALKTYPE_MONSTER_SAY)
		return player:setStorageValue(data.storagecount, kills + count)
end