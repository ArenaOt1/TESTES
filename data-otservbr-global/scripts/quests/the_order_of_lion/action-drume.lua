local boss = Position(32447, 32514, 7) -- Inserir localização onde o boss deverá nascer

local config = {

	boss = {
		name = "Drume", -- --Inserir nome do Boss " " 
		createFunction = function()
			local bossBoss = Game.createMonster("Drume", boss, true, true) --Inserir nome do Boss " "
			return bossBoss
		end,
	},

	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(32457, 32508, 6), teleport = Position(32454, 32510, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(32458, 32508, 6), teleport = Position(32454, 32510, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(32459, 32508, 6), teleport = Position(32454, 32510, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(32460, 32508, 6), teleport = Position(32454, 32510, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(32461, 32508, 6), teleport = Position(32454, 32510, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33416, 31463, 13),
		to = Position(33432, 31481, 13),
	},
	exit = Position(32443, 32504, 7),
}

local lever = BossLever(config)
lever:position({ x = 32456, y = 32508, z = 6 })
lever:register()


