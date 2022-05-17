local Tunnel = module('vrp','lib/Tunnel')
local Proxy = module('vrp','lib/Proxy')
vRP = Proxy.getInterface('vRP')
vRPclient = Tunnel.getInterface('vRP','nmsh-mainmenu')
local cache = {}

RegisterServerEvent('nmsh-mainmenu:getPlayerInfo')
AddEventHandler('nmsh-mainmenu:getPlayerInfo', function()
	local source = {source}
	local playerID = vRP.getUserId(source)
	local player = vRP.getUserSource({playerID})

	local info = {
    	playername = vRP.getPlayerName({playerID}), -- اسم الاعب
		job = vRP.getUserGroupByType({playerID, 'job'}), -- وظيفة الاعب
		id = vRP.getUserId(source), -- ايدي الاعب
		money = vRP.getMoney({playerID}), -- رصيد الاعب
		bankMoney = vRP.getBankMoney({playerID}), -- رصيد البنك

	}
	if playerID ~= nil and player ~= nil and source ~= nil then 
	TriggerClientEvent('nmsh-mainmenu:setInfo', player, info) 
	end
end)

-- Trigger لفتح الحقيبة
RegisterServerEvent('nmsh-mainmenu:vRP:openInventory')
AddEventHandler('nmsh-mainmenu:vRP:openInventory', function()
  	local source = {source}
  	local playerID = vRP.getUserId(source)
  	if playerID ~= nil and player ~= nil and source ~= nil then 
    	vRP.openInventory({playerID})
  	end
end)

