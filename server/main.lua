ESX = nil

ESX = exports["es_extended"]:getSharedObject()

-- // [Wapenshop] \\ --
exports.ox_inventory:RegisterShop('gangshop', {
    name = 'Wapen Inkoop',
    inventory = {
        { name = 'WEAPON_AK47',  price = 745000 },
        { name = 'WEAPON_AK47U', price = 565000 },
        { name = 'WEAPON_UMP45', price = 452500 },
        { name = 'WEAPON_MAC11', price = 395000 },
        { name = 'WEAPON_UZI',   price = 415000 },
        { name = 'WEAPON_SKORP', price = 398000 },
        { name = 'WEAPON_SPAS12', price = 320000 },
        { name = 'WEAPON_REMINGTON680', price = 340000 },
        { name = 'WEAPON_M1911', price = 385000 },
        { name = 'WEAPON_MEOS45', price = 335000 },
        { name = 'WEAPON_SMITHWESSON', price = 315000 },
        { name = 'WEAPON_WIREBAT', price = 75000 },
        { name = 'WEAPON_FIREAXE', price = 70000 },
        { name = 'WEAPON_BAYONET', price = 95000 },
        { name = 'WEAPON_TRI-DAGGER', price = 90000 },
        { name = 'WEAPON_KATANA', price = 90000 },
    },
})

exports.ox_inventory:RegisterShop('gangshopammo', {
    name = 'Ammo Inkoop',
    inventory = {
        { name = 'ammo-9', price = 350 },
        { name = 'ammo-45', price = 300 },
        { name = 'ammo-shotgun', price = 400 },
        { name = 'ammo-rifle', price = 500 },
    },
})

exports.ox_inventory:RegisterShop('extracardealer', {
    name = 'Cardealer Inkoop',
    inventory = {
        { name = 'repairkit', price = 1150 },
    },
})

exports.ox_inventory:RegisterShop('extra', {
    name = 'Extra Inkoop',
    inventory = {
        { name = 'handcuffs', price = 1150 },
        { name = 'phone', price = 850 },
        { name = 'gps', price = 250 },
        { name = 'radio', price = 250 },
        { name = 'gasbrander', price = 15000 },
        { name = 'gasfles', price = 5000 },
    },
})


exports.ox_inventory:RegisterShop('gangshopattachments', {
    name = 'Wapen Inkoop',
    inventory = {
        -- Wapens
        { name = 'WEAPON_AK47',  price = 745000 },
        { name = 'WEAPON_AK47U', price = 565000 },
        { name = 'WEAPON_UMP45', price = 452500 },
        { name = 'WEAPON_MAC11', price = 395000 },
        { name = 'WEAPON_UZI',   price = 415000 },
        { name = 'WEAPON_SKORP', price = 398000 },
        { name = 'WEAPON_SPAS12', price = 320000 },
        { name = 'WEAPON_REMINGTON680', price = 340000 },
        { name = 'WEAPON_M1911', price = 385000 },
        { name = 'WEAPON_MEOS45', price = 335000 },
        { name = 'WEAPON_SMITHWESSON', price = 315000 },
        { name = 'WEAPON_WIREBAT', price = 75000 },
        { name = 'WEAPON_FIREAXE', price = 70000 },
        { name = 'WEAPON_BAYONET', price = 95000 },
        { name = 'WEAPON_TRI-DAGGER', price = 90000 },
        { name = 'WEAPON_KATANA', price = 90000 },

        -- Ammo
        { name = 'ammo-9', price = 350 },
        { name = 'ammo-45', price = 300 },
        { name = 'ammo-shotgun', price = 400 },
        { name = 'ammo-rifle', price = 500 },

        -- AK47
        { name = 'at_ak47_camo_gold', price = 15000 },
        { name = 'at_ak47_camo_redtiger', price = 15000 },
        { name = 'at_ak47_camo_silver', price = 15000 },
        { name = 'at_ak47_camo_roze', price = 15000 },
        { name = 'at_ak47_suppressor', price = 10000 },
        { name = 'at_ak47_flashlight', price = 7500 },
        { name = 'at_ak47_scope_1', price = 10000 },
        { name = 'at_ak47_clip_extended', price = 15000 },
        { name = 'at_ak47_clip_drummag', price = 20000 },
        { name = 'at_ak47_grip', price = 10000 },

        -- AK47U
        { name = 'at_ak47u_clip_extended', price = 15000 },
        { name = 'at_ak47u_clip_drummag', price = 20000 },

        -- M1911
        { name = 'at_m1911_clip_extended', price = 15000 },
        { name = 'at_m1911_suppressor', price = 10000 },
        { name = 'at_m1911_flashlight', price = 7500 },

        -- MEOS45
        { name = 'at_meos45_clip_extended', price = 15000 },
        { name = 'at_meos45_suppressor', price = 10000 },
        { name = 'at_meos45_flashlight', price = 7500 },

        -- SMITHWESSON
        { name = 'at_smithwesson_clip_extended', price = 15000 },
        { name = 'at_smithwesson_suppressor', price = 10000 },
        { name = 'at_smithwesson_flashlight', price = 7500 },
        { name = 'at_smithwesson_scope_1', price = 10000 },

        -- SKORPION
        { name = 'at_skorp_clip_extended', price = 15000 },

        -- UMP45
        { name = 'at_ump45_suppressor', price = 10000 },
        { name = 'at_ump45_flashlight', price = 7500 },
        { name = 'at_ump45_scope_1', price = 10000 },
        { name = 'at_ump45_clip_extended', price = 15000 },
        { name = 'at_ump45_grip', price = 10000 },
        { name = 'at_ump45_camo_redtiger', price = 15000 },

        -- MAC11
        { name = 'at_mac11_clip_extended', price = 15000 },
        { name = 'at_mac11_suppressor', price = 10000 },

        -- UZI
        { name = 'at_uzi_suppressor_1', price = 10000 },
        { name = 'at_uzi_suppressor_2', price = 10000 },
        { name = 'at_uzi_stock_1', price = 10000 },
        { name = 'at_uzi_stock_2', price = 10000 },
        { name = 'at_uzi_clip_extended_2', price = 15000 },
        { name = 'at_uzi_clip_extended_3', price = 15000 },
        { name = 'at_uzi_scope_3', price = 10000 },
        { name = 'at_uzi_scope_4', price = 10000 },
    }
})

local gangs = Config.Wapeninkoopgangs

local function RegisterGangStash(gangName, stashData)
    local stash = {
        id = gangName .. "_stash",
        label = "Gang Opslag - " .. gangName,
        slots = 50,
        weight = 1000000,
        owner = gangName
    }

    exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner)
end

RegisterNetEvent('ox:loadGangStashForPlayer')
AddEventHandler('ox:loadGangStashForPlayer', function(bool)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player) 

    if xPlayer then
        local playerJob = xPlayer.job.name
        local playerJob2 = xPlayer.job2.name

        if gangs[playerJob] or gangs[playerJob2] then
            local gangName = gangs[playerJob] and playerJob or playerJob2
            
            TriggerClientEvent('ox_inventory:openInventory', player, 'stash', { id = gangName .. "_stash", owner = gangName })
        else
            ESX.FlagPlayer(player, 'Heeft geprobeerd de gangstash te manipuleren d.m.v. een exploit of hack.')
        end
    end
end)



for gangName, stashData in pairs(gangs) do
    RegisterGangStash(gangName, stashData)
end

ESX.RegisterServerCallback("wsk:add:playertogang", function(source, callback, playerid, jobnamegang, jobIndex) 
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayer2 = ESX.GetPlayerFromId(playerid)

    local isBoss = xPlayer.job.grade_name == 'boss' or xPlayer.job.grade_name == 'underboss' or xPlayer.job2.grade_name == 'boss' or xPlayer.job2.grade_name == 'underboss'
    if not isBoss then 
        ESX.FlagPlayer(source, 'Heeft geprobeerd "wsk:add:playertogang" te manipuleren d.m.v. een exploit of hack.') 
        return 
    end

    if not xPlayer2 then
        TriggerClientEvent('wsk-notify', xPlayer.source, "error", "Deze speler is niet online")
        return
    end

    if jobIndex == 2 then
        jobnamegang = xPlayer.job2.name
        xPlayer2.setJob2(jobnamegang, 0, 'Persoon aangenomen bij een gang!')
    else
        jobnamegang = xPlayer.job.name
        xPlayer2.setJob(jobnamegang, 0, 'Persoon aangenomen bij een gang!')
    end
        
    callback(true)
    TriggerClientEvent('wsk-notify', xPlayer2.source, "success",  "Je bent aangenomen bij de gang: " .. jobnamegang)
    TriggerClientEvent('wsk-notify', xPlayer.source, "success",   "Je hebt " .. xPlayer2.getName() .. " ingehuurd voor je gang")
end)




ESX.RegisterServerCallback("wsk:check:gangmembers", function(source, callback, jobnaam) 
    local insertaapje = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- Query for job1 members
    MySQL.Async.fetchAll("SELECT * FROM users WHERE job = @job", {
        ["@job"] = jobnaam
    }, function(result)
        if result[1] then
            for k,v in pairs(result) do
                local gangmembersvoornaam = v.firstname
                local gangmemberslastname = v.lastname
                table.insert(insertaapje, {
                    identifier = v.identifier,
                    voornaam = v.firstname,
                    achternaam = v.lastname
                })
            end
        end

        -- Query for job2 members
        MySQL.Async.fetchAll("SELECT * FROM users WHERE job2 = @job", {
            ["@job"] = jobnaam
        }, function(result2)
            if result2[1] then
                for k,v in pairs(result2) do
                    local gangmembersvoornaam = v.firstname
                    local gangmemberslastname = v.lastname
                    table.insert(insertaapje, {
                        identifier = v.identifier,
                        voornaam = v.firstname,
                        achternaam = v.lastname
                    })
                end
            end

            if #insertaapje > 0 then
                callback(insertaapje)
            else
                TriggerClientEvent('wsk-notify', xPlayer.source, "error", "Je gang heeft nog geen members")
            end
        end)
    end)
end)


RegisterServerEvent("wsk:deletemember:serversided")
AddEventHandler("wsk:deletemember:serversided", function(identifierplayer, voornaamplayer, jobIndex)
    local sourcePlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromIdentifier(identifierplayer)

    local isBoss = sourcePlayer.job.grade_name == 'boss' or sourcePlayer.job.grade_name == 'underboss' or sourcePlayer.job2.grade_name == 'boss' or sourcePlayer.job2.grade_name == 'underboss'
    if not isBoss then 
        ESX.FlagPlayer(source, 'Heeft geprobeerd "wsk:deletemember:serversided" te manipuleren d.m.v. een exploit of hack.') 
        return 
    end

    if targetPlayer then
        if jobIndex == 2 then
            targetPlayer.setJob2("unemployed", 0, 'Ontslagen bij een gang')
        else
            targetPlayer.setJob("unemployed", 0, 'Ontslagen bij een gang')
        end
        local src = source
        TriggerClientEvent('wsk-notify', src, 'success', "Je hebt " .. voornaamplayer .. " succesvol ontslagen")
        Citizen.Wait(2500)
        TriggerClientEvent('wsk-notify', src, 'warning', voornaamplayer .. " zal nog in je bossmenu staan tot persoon de stad is verlaten", 10000)
    else
        TriggerClientEvent('wsk-notify', src, 'error', "We hebben " .. identifierplayer .. " niet kunnen vinden")
    end
end)

RegisterServerEvent("wsk:promotemember:serversided")
AddEventHandler("wsk:promotemember:serversided", function(identifierplayer, voornaamplayer, jobIndex)
    local sourcePlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromIdentifier(identifierplayer)

    local isBoss = sourcePlayer.job.grade_name == 'boss' or sourcePlayer.job.grade_name == 'underboss' or sourcePlayer.job2.grade_name == 'boss' or sourcePlayer.job2.grade_name == 'underboss'
    if not isBoss then 
        ESX.FlagPlayer(source, 'Heeft geprobeerd "wsk:promotemember:serversided" te manipuleren d.m.v. een exploit of hack.') 
        return 
    end

    if sourcePlayer and targetPlayer then
        local currentJob = nil
        local currentGrade = 0

        if jobIndex == 1 then
            currentJob = targetPlayer.job.name
            currentGrade = targetPlayer.job.grade
        elseif jobIndex == 2 then
            currentJob = targetPlayer.job2.name
            currentGrade = targetPlayer.job2.grade
        else
            TriggerClientEvent('wsk-notify', sourcePlayer.source, "error", "Ongeldige baanindex.")
            return
        end

        MySQL.Async.fetchAll("SELECT * FROM job_grades WHERE job_name = @job_name", {
            ["@job_name"] = currentJob
        }, function(jobGrades)
            local maxGrade = 0
            for _, gradeData in ipairs(jobGrades) do
                if gradeData.grade > maxGrade then
                    maxGrade = gradeData.grade
                end
            end

            if currentGrade < maxGrade then
                local nextGrade = currentGrade + 1
                local gradeLabel = ""

                for _, gradeData in ipairs(jobGrades) do
                    if gradeData.grade == nextGrade then
                        gradeLabel = gradeData.label
                        break
                    end
                end

                if jobIndex == 2 then
                    targetPlayer.setJob2(currentJob, nextGrade, voornaamplayer .. " gepromoveerd naar " .. gradeLabel)
                else
                    targetPlayer.setJob(currentJob, nextGrade, voornaamplayer .. " gepromoveerd naar " .. gradeLabel)
                end

                TriggerClientEvent('wsk-notify', targetPlayer.source, "success", "Je bent gepromoveerd naar " .. gradeLabel)
                TriggerClientEvent('wsk-notify', sourcePlayer.source, "success", "Je hebt " .. voornaamplayer .. " gepromoveerd naar " .. gradeLabel)
            else
                TriggerClientEvent('wsk-notify', sourcePlayer.source, "error", "De gewenste promotie is niet beschikbaar.")
            end
        end)
    else
        TriggerClientEvent('wsk-notify', sourcePlayer.source, "error", "De gewenste speler is niet beschikbaar.")
    end
end)


RegisterServerEvent("wsk:demote:serversided")
AddEventHandler("wsk:demote:serversided", function(identifierplayer, voornaamplayer, jobIndex)
    local sourcePlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromIdentifier(identifierplayer)

    local isBoss = sourcePlayer.job.grade_name == 'boss' or sourcePlayer.job.grade_name == 'underboss'
    if not isBoss then 
        ESX.FlagPlayer(source, 'Heeft geprobeerd "wsk:demote:serversided" te manipuleren d.m.v. een exploit of hack.') 
        return 
    end

    if sourcePlayer and targetPlayer then
        local currentJob = nil
        local currentGrade = 0

        if jobIndex == 1 then
            currentJob = targetPlayer.job.name
            currentGrade = targetPlayer.job.grade
        elseif jobIndex == 2 then
            currentJob = targetPlayer.job2.name
            currentGrade = targetPlayer.job2.grade
        else
            TriggerClientEvent('wsk-notify', sourcePlayer.source, "error", "Ongeldige baanindex.")
            return
        end

        MySQL.Async.fetchAll("SELECT * FROM job_grades WHERE job_name = @job_name", {
            ["@job_name"] = currentJob
        }, function(jobGrades)
            local maxGrade = 0
            for _, gradeData in ipairs(jobGrades) do
                if gradeData.grade > maxGrade then
                    maxGrade = gradeData.grade
                end
            end

            if currentGrade > 0 then
                local nextGrade = currentGrade - 1
                local gradeLabel = ""

                for _, gradeData in ipairs(jobGrades) do
                    if gradeData.grade == nextGrade then
                        gradeLabel = gradeData.label
                        break
                    end
                end

                if jobIndex == 2 then
                    targetPlayer.setJob2(currentJob, nextGrade, voornaamplayer .. " gedegradeerd naar " .. gradeLabel)
                else
                    targetPlayer.setJob(currentJob, nextGrade, voornaamplayer .. " gedegradeerd naar " .. gradeLabel)
                end

                TriggerClientEvent('wsk-notify', targetPlayer.source, "success", "Je bent gedegradeerd naar " .. gradeLabel)
                TriggerClientEvent('wsk-notify', sourcePlayer.source, "success", "Je hebt " .. voornaamplayer .. " gedegradeerd naar " .. gradeLabel)
            else
                TriggerClientEvent('wsk-notify', sourcePlayer.source, "error", "De gewenste degradatie is niet beschikbaar omdat de huidige rang al de laagste is.")
            end
        end)
    else
        TriggerClientEvent('wsk-notify', sourcePlayer.source, "error", "De gewenste speler is niet beschikbaar.")
    end
end)



function getIdentity(owner)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = owner})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
		}
	else
		return nil
	end
end