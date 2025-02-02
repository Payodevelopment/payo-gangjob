local Westkust = { Functions = {} }
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local ShopOpen = false
local PlayerData = {}
local JobName = nil
local Blipgang = nil

local function SetBlipForGang(jobName)
    local x, y, z = Config.Wapeninkoopgangs[JobName][1].coordswapeninkoop.x, Config.Wapeninkoopgangs[JobName][1].coordswapeninkoop.y, Config.Wapeninkoopgangs[JobName][1].coordswapeninkoop.z

    Blipgang = AddBlipForCoord(x, y, z)
    SetBlipSprite(Blipgang, 378)
    SetBlipColour(Blipgang, 0)
    SetBlipScale(Blipgang, 0.75)
    SetBlipAsShortRange(Blipgang, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(JobName)
    EndTextCommandSetBlipName(Blipgang)
end

local function UpdateJobName()
    local playerJob = PlayerData.job and PlayerData.job.name
    local playerJob2 = PlayerData.job2 and PlayerData.job2.name

    if playerJob2 and Config.Wapeninkoopgangs[playerJob2] then
        JobName = playerJob2
    elseif playerJob and Config.Wapeninkoopgangs[playerJob] then
        JobName = playerJob
    else
        JobName = nil
    end
end

AddEventHandler('esx:playerLoaded', function(playerData)
    PlayerData = playerData
    UpdateJobName()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    UpdateJobName()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(jobTwo)
    PlayerData.job2 = jobTwo
    UpdateJobName()
end)

local function isPlayerWhitelisted()
    local whitelisted = false
    
    if PlayerData.job then
        local playerJob = PlayerData.job.name
        if playerJob and Config.Wapeninkoopgangs[playerJob] then
            whitelisted = true
        end
    end
    
    if PlayerData.job2 then
        local playerJob2 = PlayerData.job2.name
        if playerJob2 and Config.Wapeninkoopgangs[playerJob2] then
            whitelisted = true
        end
    end
    
    return whitelisted
end

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
    UpdateJobName() 

    if PlayerData.job then
        SetBlipForGang(PlayerData.job.name)
    end
    
    if PlayerData.job2 then
        SetBlipForGang(PlayerData.job2.name)
    end    
end)

RegisterNetEvent('wsk-gangjob:OpenShopMenu')
AddEventHandler('wsk-gangjob:OpenShopMenu', function()
    OpenShopMenu()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CooldownEnabled then
            Citizen.Wait(15000)
            CooldownEnabled = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if isPlayerWhitelisted() then
            UpdateJobName()
            
            if JobName then
                local coords = GetEntityCoords(cache.ped)
                
                -- Iterate over all jobs the player has
                for k, v in ipairs({PlayerData.job, PlayerData.job2}) do
                    local jobName = v and v.name
                    if jobName and Config.Wapeninkoopgangs[jobName] then
                        local dist = GetDistanceBetweenCoords(coords, Config.Wapeninkoopgangs[jobName][1].coordswapeninkoop, true)

                        if dist <= Config.Markerdistance then
                            ESX.Game.Utils.DrawMarker(Config.Wapeninkoopgangs[jobName][1].coordswapeninkoop, 50, 50, 204)

                            if dist <= 1.5 then
                                exports['wsk-interaction']:Interaction({r = 0, g = 74, b = 154}, '[E] - Open Opslag', Config.Wapeninkoopgangs[jobName][1].coordswapeninkoop, 2.5, GetCurrentResourceName() .. '-action-' .. tostring(k))

                                if IsControlJustReleased(1, 38) then
                                    Citizen.Wait(100)
                                    if jobName == 'cardealer_redline' then
                                        lib.showContext('opslagredline')
                                    elseif jobName == 'cardealer_otto' then
                                        lib.showContext('opslagotto')
                                    elseif jobName == 'cardealer_rus' then
                                        lib.showContext('opslagotto')
                                    elseif jobName == 'cardealer_borz' then
                                        lib.showContext('opslagborz')
                                    elseif jobName == 'cardealer_carspot' then
                                        lib.showContext('opslagotto')
                                    elseif jobName == 'cardealer_bruvaz' then
                                        lib.showContext('opslagotto')
                                    elseif jobName == 'cardealer_cfc' then
                                        lib.showContext('opslagotto')
                                    elseif jobName == 'cardealer_trueblue' then
                                        lib.showContext('opslagotto')
                                    elseif jobName == 'cardealer_lsmotors' then
                                        lib.showContext('opslagotto')
                                    else 
                                        lib.showContext('opslag')
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            Citizen.Wait(6000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        
        if isPlayerWhitelisted() then
            UpdateJobName()
            
            if JobName then
                local coords = GetEntityCoords(cache.ped)
                local underbosslocal = Config.Wapeninkoopgangs[JobName][1].bossrang or PlayerData.job.grade_name == Config.Wapeninkoopgangs[JobName][1].underbossrang
                
                -- Iterate over all jobs the player has
                for k, v in ipairs({PlayerData.job, PlayerData.job2}) do
                    local jobName = v and v.name
                    if jobName and Config.Wapeninkoopgangs[jobName] then
                        local distance = GetDistanceBetweenCoords(coords, Config.Wapeninkoopgangs[jobName][1].coordsbossmenu) < Config.Markerdistance
                        local distance2 = GetDistanceBetweenCoords(coords, Config.Wapeninkoopgangs[jobName][1].coordsbossmenu) < 1.5
                        
                        if v.grade_name == underbosslocal then
                            if distance then
                                ESX.Game.Utils.DrawMarker(Config.Wapeninkoopgangs[jobName][1].coordsbossmenu, 50, 50, 204)
                                if distance2 then 
                                    exports['wsk-interaction']:Interaction({r = '0', g = '74', b = '154'}, '[E] - Open Bossmenu', Config.Wapeninkoopgangs[jobName][1].coordsbossmenu, 2.5, GetCurrentResourceName() .. '-action-' .. tostring(k))
                                    if IsControlJustReleased(1, 38) then  
                                        Citizen.Wait(100) 
                                        lib.showContext('bossmenu')
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            Wait(6000)
        end
    end
end)



---------------------

lib.registerContext({
    id = 'bossmenu',
    title = 'Boss Menu',
    options = {
      {
        title = 'Invite Members',
        description = 'Neem een persoon aan in uw groepering',
        icon = 'box',
        onSelect = function()
            neempersonenaan()
        end,
      },
      {
        title = 'Beheer Members',
        description = 'Beheer spelers in uw groepering!',
        icon = 'gun',
        onSelect = function()
            checkpersons()
        end,
      },
    }
})

checkpersons = function()
    local check = {}
    local speler = cache.ped
    local jobname1 = PlayerData.job.name
    local jobname2 = PlayerData.job2.name

    local jobnames = {}
    if jobname1 then table.insert(jobnames, jobname1) end
    if jobname2 then table.insert(jobnames, jobname2) end

    for _, jobname in ipairs(jobnames) do
        ESX.TriggerServerCallback("wsk:check:gangmembers", function(datagang)
            for k, v in pairs(datagang) do
                table.insert(check, {
                    title = v.voornaam .. "  " .. v.achternaam,
                    description = '',
                    icon = 'user',
                    onSelect = function()
                        OpenMenumembersboss(v)
                    end
                })
            end

            if #check > 0 then
                lib.registerContext({
                    id = 'bossmenu-members',
                    title = "Boss Menu Members",
                    options = check
                })
                lib.showContext('bossmenu-members')
            end
        end, jobname)
    end
end

OpenMenumembersboss = function(value)
    ESX.UI.Menu.CloseAll()

    local options = {
        {
            title = value.voornaam .. " Degraderen",
            description = '',
            icon = 'fas fa-minus',
            onSelect = function()
                local input = lib.inputDialog('Weet je zeker dat je ' .. value.voornaam .. ' ' .. value.achternaam .. ' wilt degraderen?', {
                    {type = 'checkbox', label = 'Ja, ik weet het zeker!', required = true},
                    {type = 'number', label = 'Baanindex', value = 1, min = 1, max = 2} -- Accepts numeric input
                })
            
                if not input[1] then 
                    TriggerEvent('wsk-notify', 'error', 'Je bent niet akkoord gegaan met deze medewerker te degraderen.')
                    return 
                end
            
                demotemembers(value.identifier, value.voornaam, tonumber(input[2])) -- Correct index here
            end
        },
        {
            title = value.voornaam .. " Promoveren",
            description = '',
            icon = 'fas fa-plus',
            onSelect = function()
                local input = lib.inputDialog('Weet je zeker dat je ' .. value.voornaam .. ' ' .. value.achternaam .. ' wilt promoveren? Voer 1 of 2 in voor de baanindex:', {
                    {type = 'checkbox', label = 'Ja, ik weet het zeker!', required = true},
                    {type = 'number', label = 'Baanindex', value = 1, min = 1, max = 2} -- Accepts numeric input
                })
            
                if not input[1] or (tonumber(input[2]) ~= 1 and tonumber(input[2]) ~= 2) then 
                    TriggerEvent('wsk-notify', 'error', 'Ongeldige invoer. Voer 1 of 2 in voor de baanindex.')
                    return 
                end
            
                promotemembers(value.identifier, value.voornaam, tonumber(input[2])) -- Correct index here
            end
                       
        },
        {
            title = value.voornaam .. " Ontslaan",
            description = '',
            icon = 'fas fa-fire',
            
            onSelect = function()
                local input = lib.inputDialog('Weet je zeker dat je ' .. value.voornaam .. ' ' .. value.achternaam .. ' wilt ontslaan? Voer 1 of 2 in voor de baanindex:', {
                    {type = 'checkbox', label = 'Ja, ik weet het zeker!', required = true},
                    {type = 'number', label = 'Baanindex', value = 1, min = 1, max = 2} 
                })
            
                if not input[1] or (tonumber(input[2]) ~= 1 and tonumber(input[2]) ~= 2) then 
                    TriggerEvent('wsk-notify', 'error', 'Ongeldige invoer. Voer 1 of 2 in voor de baanindex.')
                    return 
                end
            
                deletemembersboss(value.identifier, value.voornaam, tonumber(input[2])) 
            end            
        },
        {
            title = 'Ga terug',
            onSelect = function()
                checkpersons()
            end,
            icon = 'fas fa-arrow-left'
        }
    }

    lib.registerContext({
        id = 'bossmenu-members-boss',
        title = "Bossmenu",
        options = options
    })
    lib.showContext('bossmenu-members-boss')
end


promotemembers = function(identifier, name, jobIndex)
    TriggerServerEvent("wsk:promotemember:serversided", identifier, name, jobIndex)
end

demotemembers = function(identifier, name, jobIndex)
    TriggerServerEvent("wsk:demote:serversided", identifier, name, jobIndex)
end

deletemembersboss = function(x, y, jobIndex)
    TriggerServerEvent("wsk:deletemember:serversided", x, y, jobIndex)
end

neempersonenaan = function()
    local jobnamegang = PlayerData.job.name
    local input = lib.inputDialog('Invite Members', {'Voer een speler id in', 'Welke baan wil je toewijzen? (1 voor eerste baan, 2 voor tweede baan)'})
    if not input then 
        return 
    end

    local playerid = tonumber(input[1])
    local jobIndex = tonumber(input[2])

    if playerid and (jobIndex == 1 or jobIndex == 2) then
        ESX.TriggerServerCallback('wsk:add:playertogang', function(done)
            if done then
            end
        end, playerid, jobnamegang, jobIndex)
    else
    end
end




lib.registerContext(
    {
        id = "opslagredline",
        title = "Cardealer: Opslag",
        options = {
            {
                title = "Cardealer Inkoop",
                description = "Bekijk alle mogelijkheden om in te kopen",
                menu = "cardealerinkoop",
                icon = "wrench"
            },
            {
                title = "Cardealer Stash",
                description = "Open je stash van je Cardealer",
                onSelect = function()
                    TriggerServerEvent('ox:loadGangStashForPlayer')
                end,
                icon = "box"
            }
        }
    }
)

lib.registerContext(
    {
        id = "opslagborz",
        title = "Cardealer: Opslag",
        options = {
            {
                title = "Cardealer Inkoop",
                description = "Bekijk alle mogelijkheden om in te kopen",
                menu = "cardealerinkoop",
                icon = "wrench"
            },
            -- {
            --     title = "Gang Inkoop",
            --     description = "Bekijk alle mogelijkheden om in te kopen",
            --     menu = "wapeninkoop",
            --     icon = "gun"
            -- },
            {
                title = "Cardealer Stash",
                description = "Open je stash van je Cardealer",
                onSelect = function()
                    TriggerServerEvent('ox:loadGangStashForPlayer')
                end,
                icon = "box"
            }
        }
    }
)


lib.registerContext(
    {
        id = "opslagotto",
        title = "Cardealer: Opslag",
        options = {
            {
                title = "Cardealer Inkoop",
                description = "Bekijk alle mogelijkheden om in te kopen",
                menu = "cardealerinkoop",
                icon = "wrench"
            },
            {
                title = "Cardealer Stash",
                description = "Open je stash van je Cardealer",
                onSelect = function()
                    TriggerServerEvent('ox:loadGangStashForPlayer')
                end,
                icon = "box"
            }
        }
    }
)


lib.registerContext(
    {
        id = "opslag",
        title = "Gang: Opslag",
        options = {
            {
                title = "Gang Inkoop",
                description = "Bekijk alle mogelijkheden om in te kopen",
                menu = "wapeninkoop",
                icon = "gun"
            },
            {
                title = "Gang Stash",
                description = "Open de stash van je gang",
                onSelect = function()
                    TriggerServerEvent('ox:loadGangStashForPlayer')
                end,
                icon = "box"
            }
        }
    }
)



lib.registerContext(
    {
        id = "cardealerinkoop",
        title = "Cardealer: Winkels",
        options = {
            {
                title = "Cardealer Winkel",
                description = "Bekijk alle mogelijke spullen die we hebben in de kluis",
                icon = "shop",
                onSelect = function()
                    exports.ox_inventory:openInventory("shop", {type = "extracardealer"})
                end
            },
            {
                title = 'Ga terug',
                onSelect = function()
                    lib.showContext('opslagotto')
                end,
                icon = 'fas fa-arrow-left'
            }
        }
    }
)

lib.registerContext(
    {
        id = "wapeninkoop",
        title = "Gang: Winkels",
        options = {
            -- {
            --     title = "Wapen Winkel",
            --     description = "Bekijk alle mogelijke wapensoorten die we hebben in de kluis",
            --     icon = "gun",
            --     onSelect = function()
            --         exports.ox_inventory:openInventory("shop", {type = "gangshop"})
            --     end
            -- },
            -- {
            --     title = "Ammo Winkel",
            --     description = "Bekijk alle mogelijke ammosoorten die we hebben in de kluis",
            --     icon = "gun",
            --     onSelect = function()
            --         exports.ox_inventory:openInventory("shop", {type = "gangshopammo"})
            --     end
            -- },
            {
                title = "Wapen Winkel",
                description = "Bekijk alle mogelijke attachmentsoorten die we hebben in de kluis",
                icon = "gun",
                onSelect = function()
                    exports.ox_inventory:openInventory("shop", {type = "gangshopattachments"})
                end
            },
            {
                title = "Extra Winkel",
                description = "Bekijk alle mogelijke handcuffs die we hebben in de kluis",
                icon = "shop",
                onSelect = function()
                    exports.ox_inventory:openInventory("shop", {type = "extra"})
                end
            },
            {
                title = 'Ga terug',
                onSelect = function()
                    lib.showContext('opslag')
                end,
                icon = 'fas fa-arrow-left'
            }
        }
    }
)


RegisterNetEvent('wsk:notifyalert')
AddEventHandler('wsk:notifyalert', function(message)
    exports['wsk-notifications']:Notify('info', message, 5000)
end)

local cachedData = {}
-- Function to handle the camera
Westkust.Functions.HandleCamera = function(vehicleposition, heading)
    cachedData['cam'] = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

    SetCamCoord(cachedData['cam'], vehicleposition.x, vehicleposition.y, vehicleposition.z + 0.5)
    SetCamNearDof(cachedData['cam'], 0)
    SetCamActive(cachedData['cam'], true)
    RenderScriptCams(1, 1, 1, 1, 1)

    Citizen.SetTimeout(50, function()
        RenderScriptCams(0, 1, 1500, 1, 1)
        Citizen.SetTimeout(1500, function()
            DestroyCam(cachedData['cam'])
            cachedData['cam'] = nil
            isInInteraction = false  -- Assuming isInInteraction is defined somewhere in your code
        end)
    end)
end

Westkust.Functions.LoadModel = function(model)
	if not IsModelValid(model) then return end

	RequestModel(joaat(model))
	while not HasModelLoaded(joaat(model)) do
		Wait(5)
	end
end

Westkust.Functions.GetVehicleType = function(model)
    if model == `submersible` or model == `submersible2` then
		return 'submarine'
	end

	local class = GetVehicleClassFromName(model)
	local types = {
		[8] = "bike",
		[11] = "trailer",
		[13] = "bike",
		[14] = "boat",
		[15] = "heli",
		[16] = "plane",
		[21] = "train",
	}

	return types[class] or "automobile"
end