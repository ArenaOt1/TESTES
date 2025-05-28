local internalNpcName = "Addoner"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 141,
	lookHead = 41,
	lookBody = 72,
	lookLegs = 39,
	lookFeet = 96,
	lookAddons = 3,
	lookMount = 0,

--npcConfig.outfit = {
    --lookType = 1068,
    --lookHead = 0,
    --lookBody = 76,
    --lookLegs = 53,
    --lookFeet = 0,
    --lookAddons = 1,
    --lookMount = 0
}


npcConfig.flags = {
    floorchange = false
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

local outfits = {
    ["Hunter"] = {
        MaleOutfitId = 129,
        FemaleOutfitId = 137,
        addons = {
            { name = "first citizen addon", items = { {5878, 50} }, storageAddon = 10042 },
            { name = "second citizen addon", items = { {5890, 50}, {5902, 25}, {2480, 1} }, storageAddon = 10043 },
            { name = "first hunter addon", items = { {5876, 50}, {5948, 50}, {5891, 5}, {5887, 1}, {5889, 1}, {5888, 1} }, storageAddon = 10044 },
            { name = "second hunter addon", items = { {5875, 1} }, storageAddon = 10045 }
        }
    },
    ["Knight"] = {
        MaleOutfitId = 131,
        FemaleOutfitId = 139,
        addons = {
            { name = "first knight addon", items = { {5880, 50}, {5892, 1} }, storageAddon = 10046 },
            { name = "second knight addon", items = { {5893, 50}, {11422, 1}, {5885, 1}, {5887, 1} }, storageAddon = 10047 }
        }
    },
    ["Mage"] = {
        MaleOutfitId = 130,
        FemaleOutfitId = 138,
        addons = {
            { name = "first mage addon", items = { {2182, 1}, {2186, 1}, {2185, 1}, {8911, 1}, {2181, 1}, {2183, 1}, {2190, 1}, {2191, 1}, {2188, 1}, {8921, 1}, {2189, 1}, {2187, 1}, {2392, 30}, {5809, 1}, {2193, 20} }, storageAddon = 10048 },
            { name = "second mage addon", items = { {5903, 1} }, storageAddon = 10049 }
        }
    },
    ["Summoner"] = {
        MaleOutfitId = 133,
        FemaleOutfitId = 141,
        addons = {
            { name = "first summoner addon", items = { {5878, 20} }, storageAddon = 10050 },
            { name = "second summoner addon", items = { {5894, 35}, {5911, 20}, {5883, 40}, {5922, 35}, {5879, 10}, {5881, 30}, {5882, 40}, {2392, 3}, {5905, 30} }, storageAddon = 10051 }
        }
    },
    ["Barbarian"] = {
        MaleOutfitId = 143,
        FemaleOutfitId = 147,
        addons = {
            { name = "first barbarian addon", items = { {5884, 1}, {5885, 1}, {5910, 25}, {5911, 25}, {5886, 10} }, storageAddon = 10011 },
            { name = "second barbarian addon", items = { {5880, 25}, {5892, 1}, {5893, 25}, {5876, 25} }, storageAddon = 10012 }
        }
    },
    ["Druid"] = {
        MaleOutfitId = 144,
        FemaleOutfitId = 148,
        addons = {
            { name = "first druid addon", items = { {5896, 20}, {5897, 20} }, storageAddon = 10013 },
            { name = "second druid addon", items = { {5906, 100} }, storageAddon = 10014 }
        }
    },
    ["Nobleman"] = {
        MaleOutfitId = 132,
        FemaleOutfitId = 140,
        addons = {
            { name = "first nobleman addon", items = {}, storageAddon = 10015 },
            { name = "second nobleman addon", items = {}, storageAddon = 10016 }
        }
    },
    ["Oriental"] = {
        MaleOutfitId = 146,
        FemaleOutfitId = 150,
        addons = {
            { name = "first oriental addon", items = { {5945, 1} }, storageAddon = 10017 },
            { name = "second oriental addon", items = { {5883, 30}, {5895, 30}, {5891, 2}, {5912, 30} }, storageAddon = 10018 }
        }
    },
    ["Warrior"] = {
        MaleOutfitId = 134,
        FemaleOutfitId = 142,
        addons = {
            { name = "first warrior addon", items = { {5925, 40}, {5899, 40}, {5884, 1}, {5919, 1} }, storageAddon = 10019 },
            { name = "second warrior addon", items = { {5880, 40}, {5887, 1} }, storageAddon = 10020 }
        }
    },
    ["Wizard"] = {
        MaleOutfitId = 145,
        FemaleOutfitId = 149,
        addons = {
            { name = "first wizard addon", items = { {2536, 1}, {2492, 1}, {2488, 1}, {2123, 1} }, storageAddon = 10021 },
            { name = "second wizard addon", items = { {5922, 40}, {2472, 10} }, storageAddon = 10022 }
        }
    },
    ["Assassin"] = {
        MaleOutfitId = 152,
        FemaleOutfitId = 156,
        addons = {
            { name = "first assassin addon", items = { {5912, 20}, {5910, 20}, {5911, 20}, {5913, 20}, {5914, 20}, {5909, 20}, {5886, 10} }, storageAddon = 10023 },
            { name = "second assassin addon", items = { {5804, 1}, {5930, 10} }, storageAddon = 10024 }
        }
    },
    ["Beggar"] = {
        MaleOutfitId = 153,
        FemaleOutfitId = 157,
        addons = {
            { name = "first beggar addon", items = { {5878, 30}, {5921, 20}, {5913, 10}, {5894, 10} }, storageAddon = 10025 },
            { name = "second beggar addon", items = { {5883, 30}, {2160, 2} }, storageAddon = 10026 }
        }
    },
    ["Pirate"] = {
        MaleOutfitId = 151,
        FemaleOutfitId = 155,
        addons = {
            { name = "first pirate addon", items = { {6098, 30}, {6126, 30}, {6097, 30} }, storageAddon = 10027 },
            { name = "second pirate addon", items = { {6101, 1}, {6102, 1}, {6100, 1}, {6099, 1} }, storageAddon = 10028 }
        }
    },
    ["Shaman"] = {
        MaleOutfitId = 154,
        FemaleOutfitId = 158,
        addons = {
            { name = "first shaman addon", items = { {5810, 5}, {3955, 5}, {5015, 1} }, storageAddon = 10029 },
            { name = "second shaman addon", items = { {3966, 5}, {3967, 5} }, storageAddon = 10030 }
        }
    },
    ["Norseman"] = {
        MaleOutfitId = 251,
        FemaleOutfitId = 252,
        addons = {
            { name = "first norseman addon", items = { {7290, 5} }, storageAddon = 10031 },
            { name = "second norseman addon", items = { {7290, 10} }, storageAddon = 10032 }
        }
    }
}

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    local playerId = player:getId()

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    local playerTopic = npcHandler:getTopic(playerId)

    if playerTopic == 0 then
        for outfitName, outfitData in pairs(outfits) do
            if MsgContains(message, "first " .. outfitName .. " addon") then
                local addonData = outfitData.addons[1] -- first addon
                local addonItems = addonData.items
                local addonText = ""

                for i, item in ipairs(addonItems) do
                    local itemID, itemCount = item[1], item[2]
                    if i > 1 then
                        addonText = addonText .. ", "
                        if i == #addonItems then
                            addonText = addonText .. "and "
                        end
                    end
                    addonText = addonText .. itemCount .. " " .. ItemType(itemID):getName()
                end

                npcHandler:setTopic(playerId, outfitName .. "1")
                npcHandler:say("To obtain the " .. outfitName .. " first addon, you will need " .. addonText .. ". Would you like to proceed?", npc, creature)
                return true
            elseif MsgContains(message, "second " .. outfitName .. " addon") then
                local addonData = outfitData.addons[2] -- second addon
                local addonItems = addonData.items
                local addonText = ""

                for i, item in ipairs(addonItems) do
                    local itemID, itemCount = item[1], item[2]
                    if i > 1 then
                        addonText = addonText .. ", "
                        if i == #addonItems then
                            addonText = addonText .. "and "
                        end
                    end
                    addonText = addonText .. itemCount .. " " .. ItemType(itemID):getName()
                end

                npcHandler:setTopic(playerId, outfitName .. "2")
                npcHandler:say("To obtain the " .. outfitName .. " second addon, you will need " .. addonText .. ". Would you like to proceed?", npc, creature)
                return true
            end
        end
    elseif playerTopic ~= 0 then
        if MsgContains(message, "yes") then
            local outfitName = string.match(playerTopic, "([^%d]+)")
            local addonIndex = tonumber(string.match(playerTopic, "%d+"))
            local outfitData = outfits[outfitName]
            local addonData = outfitData.addons[addonIndex]
            local addonItems = addonData.items

            if player:getStorageValue(addonData.storageAddon) == 1 then
                npcHandler:say("You already have this addon for the " .. outfitName .. ".", npc, creature)
            else
                local hasRequiredItems = true

                for _, item in ipairs(addonItems) do
                    local itemID, itemCount = item[1], item[2]
                    if player:getItemCount(itemID) < itemCount then
                        hasRequiredItems = false
                        break
                    end
                end

                if hasRequiredItems then
                    player:setStorageValue(addonData.storageAddon, 1)
                    for _, item in ipairs(addonItems) do
                        local itemID, itemCount = item[1], item[2]
                        player:removeItem(itemID, itemCount)
                    end
                    npcHandler:say("You have obtained the " .. addonData.name .. " for the " .. outfitName .. ".", npc, creature)
                    player:addOutfitAddon(outfitData.MaleOutfitId, addonIndex)
                    player:addOutfitAddon(outfitData.FemaleOutfitId, addonIndex)
                else
                    npcHandler:say("You don't have the required items for the " .. addonData.name .. ".", npc, creature)
                end
            end

            npcHandler:setTopic(playerId, 0)
        else
            npcHandler:say("Goodbye.", npc, creature)
            npcHandler:setTopic(playerId, 0)
        end
    end
end

npcHandler:setMessage(MESSAGE_GREET, "To buy the first addon say {first NAME addon}, for the second addon say {second NAME addon}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye, |PLAYERNAME|.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true) --npcHandler:addModule(FocusModule:new(), npcConfig.Addoner, true, true, true)


-- npcType registering the npcConfig table
npcType:register(npcConfig)

--npcHandler:addModule(FocusModule:new())