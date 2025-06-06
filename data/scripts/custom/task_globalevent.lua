local taskLog = GlobalEvent("TaskLog")

function taskLog.onStartup()
local newmissions = {}
	for i, data in pairs(taskConfiguration) do
newmissions[#newmissions + 1] = {name = "Task: "..data.name, storageId = data.storage, missionId = #newmissions + 1, startValue = 0, endValue = os.time()*10, description = function(player) return (player:getTaskKills(data.storagecount) == -1 and "Voce completou essa task." or (player:getTaskKills(data.storagecount) == data.total and "Voce completou essa task, voce precisa celetar sua recompensa, use !task." or "Voce Matou ["..player:getTaskKills(data.storagecount).."/"..data.total.." - Pendente]"..data.name)) end,}
	end
Quests[#Quests + 1] = {name = "Tasks", startStorageId = taskQuestLog, startStorageValue = 1,
                       missions = newmissions}
   return true
end

taskLog:register()

local taskEvents = CreatureEvent("TaskEvents")
function taskEvents.onLogin(player)
	local events = {
      -- Custom Events
      "TaskCreature"
	}

	for i = 1, #events do
		player:registerEvent(events[i])
	end
	return true
end

taskEvents:register()