ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_joblisting:getJobsList', function(source, cb)
	MySQL.Async.fetchAll(
		'SELECT * FROM jobs WHERE whitelisted = false',
		{},
		function(result)
			local data = {}
			for i=1, #result, 1 do
				table.insert(data, {
					value   = result[i].name,
					label   = result[i].label
				})
			end
			cb(data)
		end
	)
end)

RegisterServerEvent('esx_joblisting:setJob')
AddEventHandler('esx_joblisting:setJob', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob(job, 0)
end)

--
RegisterServerEvent('esx_joblisting:postApplication')
AddEventHandler('esx_joblisting:postApplication', function(dataTemp)
	
	local data = dataTemp
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	MySQL.Async.fetchAll(
	'SELECT * FROM users WHERE identifier = @identifier', 
	{
      ['@identifier'] = xPlayer.identifier
    }, 
	function(rows)
				
		for i = 1, #rows, 1 do
			_name = rows[i].firstname .. ' ' .. rows[i].lastname
		end

		if data.type == "police" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.police)
		elseif data.type == "ambulance" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.ambulance)
		elseif data.type == "bennys" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.bennys)
		elseif data.type == "cardealer" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.cardealer)
		elseif data.type == "mechanic" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.mechanic)
		elseif data.type == "realestate" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.realestate)
		elseif data.type == "taxi" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.taxi)
		elseif data.type == "delivery" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.delivery)
		elseif data.type == "galaxy" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.galaxy)
		elseif data.type == "journalist" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.journalist)
		elseif data.type == "securitas" then
			postApp(_name, data.phone, data.mail, data.exp, data.licenses, Config.Webhook.securitas)
		end
	end)

end)

function postApp(name, phone, mail, exp, licenses, webhook)
	local embeds = {
	{
		["type"] = "rich",
		["title"] = "Ny Jobbansökan:" ,
		["fields"] =  {
						{
							["name"]= "Namn:",
							["value"]= _name,
						},
						{
							["name"]= "Telefon:",
							["value"]= phone,
						},
						{
							["name"]= "E-Post:",
							["value"]= mail,
						},
						{
							["name"]= "Om mig:",
							["value"]= exp,
						},
						{
							["name"]= "Körkort:",
							["value"]= licenses,
						},
					  },
		["color"] = 6807172,
		["footer"] =  {
					["text"]= os.date("%A %x"),
					},
	}}
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embeds}), { ['Content-Type'] = 'application/json' })
end		