local inMenu = false

RegisterNetEvent('nmsh-mainmenu:setInfo')
AddEventHandler('nmsh-mainmenu:setInfo', function(info)
    SendNUIMessage({action = 'playername', value = info['playername']})
    SendNUIMessage({action = 'phonenumber', value = info['id']})
    SendNUIMessage({action = 'jobname', value = info['job']})
    SendNUIMessage({action = 'walletamount', value = info['money']})
    SendNUIMessage({action = 'bankamount', value = info['bankMoney']})
end)

function SetDisplay(bool)
    SendNUIMessage({
        type = "show",
        status = bool,
    })
	SetNuiFocus(bool, bool)

    -- Administration Contact
    if GlobalState.AdminContact then
        SendNUIMessage({
            type = "showadmincontact",
            status = true,
        })

    else
        SendNUIMessage({
            type = "showadmincontact",
            status = false,
        })
    end

    -- Level System
    if GlobalState.LevelSystem then
        SendNUIMessage({
            type = "showlevel",
            status = true,
        })

        SendNUIMessage({action = 'whatlevel', value = TriggerEvent("nmsh-base:getLevel")})
    else
        SendNUIMessage({
            type = "showlevel",
            status = false,
        })
    end

    inMenu = true
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 244) and not inMenu then
            TriggerServerEvent('nmsh-mainmenu:getPlayerInfo')
			SetDisplay(true, true)
		end
	end
end)

RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)
    inMenu = false
end)

RegisterNUICallback("inventory", function(data)
    SetDisplay(false, false)
    TriggerServerEvent('OpenInv') -- فتح الحقيبة بالجوال
    inMenu = false
end)

RegisterNUICallback("billing", function(data)
    SetDisplay(false, false)
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    inMenu = false
end)

RegisterNUICallback("cardealership", function(data)
    SetDisplay(false, false)
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    inMenu = false
end)

RegisterNUICallback("shop", function(data)
    SetDisplay(false, false)
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    inMenu = false
end)

RegisterNUICallback("administratorcontact", function(data)
    SetDisplay(false, false)
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    inMenu = false
end)

RegisterNUICallback("jobcenter", function(data)
    SetDisplay(false, false)
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    inMenu = false
end)