function endTaskModalWindow(player, storage)
local data = getTaskByStorage(storage)
local newmessage
local completion = false
	if player:getTaskKills(data.storagecount) < data.total then
		newmessage = "Voce completou a task ou esta em andamento."
	else
		player:endTask(storage, false)
		completion = true
		newmessage = "Voce completou a task" .. (data.rewards and "\nAqui esta sua recompensa:" or "")
	end
local window = ModalWindow{
	title = "Sistema de Task",
	message = newmessage
	}
	if completion and data.rewards then
	for _, info in pairs (data.rewards) do
		if info[1] == "exp" then
			player:addExperience(info[2])
			window:addChoice("- Experiencia: "..info[2])
		elseif tonumber(info[1]) then
			window:addChoice("- ".. info[2] .." "..ItemType(info[1]):getName())
			player:addItem(info[1], info[2])
		end
	end
end
	window:addButton("Sair", function() sendTaskModalWindow(player) end)
	window:sendToPlayer(player)
end
function acceptedTaskModalWindow(player)
local window = ModalWindow{
	title = "Sistema de Task",
	message = "Voce aceitou essa task!"
	}
	window:addButton("Sair", function() sendTaskModalWindow(player) end)
	window:sendToPlayer(player)
end

function confirmTaskModalWindow(player, storage)
local window = ModalWindow{
	title = "Sistema de Task",
	message = "Detalhes da sua task:"
	}
local data = getTaskByStorage(storage)
	window:addChoice("Monstro: "..data.name)
	window:addChoice("Kills necessarias: "..data.total)
	if data.type == "daily" then
		window:addChoice("Repetir: No proximo dia!")
	elseif data.type[1] == "repeatable" then
		window:addChoice("Repetir?: ".. (data.type[2] == -1 and "Sempre." or data.type[2] .." horas."))
	elseif data.type[1] == "once" then
		window:addChoice("Repetir?: Unica!")
	end
	if data.rewards then
		window:addChoice("Recompensa:")
	for _, info in pairs(data.rewards) do
		if info[1] == "exp" then
			window:addChoice("- Experiencia: "..info[2])
		elseif tonumber(info[1]) then
			window:addChoice("- " .. info[2] .. " ".. ItemType(info[1]):getName())
		end
	end
end
local function confirmCallback(player, button, choice)
	if player:hasStartedTask(storage) or not player:canStartCustomTask(storage) then
		errorModalWindow(player)
	else
		acceptedTaskModalWindow(player)
		player:startTask(storage)
	end
end
	window:addButton("Escolher", confirmCallback)
	window:addButton("Sair", function() sendTaskModalWindow(player) end)
	window:sendToPlayer(player)
end

function errorModalWindow(player)
local window = ModalWindow{
	title = "Sistema de Task",
	message = "Voce completou essa task."
	}
	window:addButton("Sair", function() sendTaskModalWindow(player) end)
	window:sendToPlayer(player)
end

function cancelTaskModalWindow(player, managed)
local newmessage
	if managed then
		newmessage = "Voce cancelou essa task."
	else
		newmessage = "Voce nao pode cancelar essa task, ela ja foi concluida ou nao iniciada."
	end
local window = ModalWindow{
	title = "Sistema de Task",
	message = newmessage
	}
	window:addButton("Sair", function() sendTaskModalWindow(player) end)
	window:sendToPlayer(player)
end

function sendTaskModalWindow(player)
local window = ModalWindow{
	title = "Sistema de Task",
	message = "Selecione uma task e clique em escolher:"
	}
local temptasks = {}
	for _, data in pairs (taskConfiguration) do
		temptasks[#temptasks+1] = data.storage
	if player:hasStartedTask(data.storage) then
		window:addChoice(data.name .. " ["..(player:getTaskKills(data.storagecount) >= data.total and "Recompensa Pendente]" or player:getTaskKills(data.storagecount).."/"..data.total.." - Pendente]"))
	elseif player:canStartCustomTask(data.storage) == false then
	if data.type == "daily" then
		window:addChoice(data.name .. ", [Concluida - Diaria]")
	else
		window:addChoice(data.name ..", [Concluida]")
	end
	else
		window:addChoice(data.name ..", "..data.total)
	end
end
local function confirmCallback(player, button, choice)
local id = choice.id
	if player:hasStartedTask(temptasks[id]) then
		endTaskModalWindow(player, temptasks[id])
	elseif not player:canStartCustomTask(temptasks[id]) then
		errorModalWindow(player)
	else
		confirmTaskModalWindow(player, temptasks[id])
	end
end
local function cancelCallback(player, button, choice)
local id = choice.id
	if player:hasStartedTask(temptasks[id]) then
	cancelTaskModalWindow(player, true)
	player:endTask(temptasks[id], true)
	else
	cancelTaskModalWindow(player, false)
	end
end
	window:addButton("Escolher", confirmCallback)
	window:addButton("Cancelar", cancelCallback)
	window:addButton("Sair")
	window:sendToPlayer(player)
end

local task = TalkAction("!task")

function task.onSay(player, words, param)
	sendTaskModalWindow(player)
	return false
end

task:groupType("normal")
task:register()
