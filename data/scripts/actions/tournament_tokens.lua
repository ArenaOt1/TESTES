local tournamentToken = Action()

function tournamentToken.onUse(player, item, fromPosition, target, toPosition, isHotkey)
local tournamentCoins = 1
  db.query("UPDATE `accounts` SET `tournament_coins` = `tournament_coins` + '" .. tournamentCoins .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
  player:sendTextMessage(MESSAGE_INFO_DESCR, "You received "..tournamentCoins.." Tournament Coins.")
  item:remove(1)
  return true
end

tournamentToken:id(19082)
tournamentToken:register()