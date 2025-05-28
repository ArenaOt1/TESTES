local magicEffect = TalkAction("/check1")

function magicEffect.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)
	
	local position = player:getPosition()
		position.x = position.x + 1
		position:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		position:sendMagicEffect(CONST_ME_TUTORIALARROW)
	local position = player:getPosition()
		position.x = position.x - 1
		position:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		position:sendMagicEffect(CONST_ME_TUTORIALARROW)
	local position = player:getPosition()
		position.y = position.y + 1
		position:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		position:sendMagicEffect(CONST_ME_TUTORIALARROW)
	local position = player:getPosition()
		position.y = position.y - 1
		position:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		position:sendMagicEffect(CONST_ME_TUTORIALARROW)
		
		return true
	end

magicEffect:separator(" ")
magicEffect:groupType("gamemaster")
magicEffect:register()


local magicEffect = TalkAction("/check")

function magicEffect.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)
	
	local position = player:getPosition()
		position:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		position:sendMagicEffect(CONST_ME_TUTORIALARROW)

		
		return true
	end
	
magicEffect:separator(" ")
magicEffect:groupType("gamemaster")
magicEffect:register()