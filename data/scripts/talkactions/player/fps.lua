local fps = TalkAction("!fps")

function fps.onSay(player, words, param)
	-- if player:isPzLocked() then
	-- 	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot use this command while in fight.")
	-- 	return false
	-- end

	-- if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
	-- 	player:sendCancelMessage("You cannot use this command while in fight.")
	-- 	return false
	-- end

	-- if player:getSkull() == SKULL_WHITE then
	-- 	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot use this command while having a white skull.")
	-- 	return false
	--end
	player:remove()
	return true
end

fps:groupType("normal")
fps:register()
