local templeScroll = Action()

function templeScroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local inPz = player:getTile():hasFlag()
	local inFight = player:isPzLocked() or player:getCondition()
	if inPz or not inFight then
		
                fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendCancelMessage("You can't use this when you're in a fight.")
		fromPosition:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end

templeScroll:id(44782)
templeScroll:register()
