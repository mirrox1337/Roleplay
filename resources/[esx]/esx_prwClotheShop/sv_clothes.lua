ESX                    = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('parow:DeleteTenue')
AddEventHandler('parow:DeleteTenue', function(id,label)

  MySQL.Async.execute(
    'DELETE FROM user_tenue WHERE id = @id',
    {
      ['@id'] =  id
    }
  )
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Outfit Borttagen'})

end)

RegisterServerEvent('parow:RenameTenue')
AddEventHandler('parow:RenameTenue', function(id,label)

  MySQL.Async.execute(
    'UPDATE user_tenue SET label = @label WHERE id=@id',
    {
      ['@id'] = id,
      ['@label'] = label

    }
  )
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du har bytt namn på din outfit till '..label})

end)
RegisterServerEvent('parow:SaveTenueS')
AddEventHandler('parow:SaveTenueS', function(label,skin)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.execute(
    'INSERT INTO user_tenue (identifier,label,tenue) VALUES(@identifier,@label,@skin)',
    {
      ['@label'] = label, 
      ['@skin'] = json.encode(skin),

    ['@identifier'] =  xPlayer.identifier
    }
  )

end)
RegisterServerEvent('parow:setEars')
AddEventHandler('parow:setEars', function(hat)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll(
		'SELECT * FROM user_accessories WHERE identifier = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
    function(result)
      if result[1] ~= nil then
      MySQL.Async.execute(
        'UPDATE user_accessories SET ears = @glasses WHERE identifier = @identifier',
        {
          ['@identifier']   = xPlayer.identifier,
          ['@glasses'] = json.encode(hat)
    
        }
      )
    else
      MySQL.Async.execute(
        'INSERT INTO user_accessories (identifier,ears) VALUES(@identifier,@glasses)',
        {
          
          ['@glasses'] = json.encode(hat),
    
        ['@identifier'] =  xPlayer.identifier
        }
      )
    end
		end
	)
  TriggerClientEvent("parow:SyncAccess",source)

end)
RegisterServerEvent('parow:setHat')
AddEventHandler('parow:setHat', function(hat)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll(
		'SELECT * FROM user_accessories WHERE identifier = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
    function(result)
      if result[1] ~= nil then
      MySQL.Async.execute(
        'UPDATE user_accessories SET hat = @glasses WHERE identifier = @identifier',
        {
          ['@identifier']   = xPlayer.identifier,
          ['@glasses'] = json.encode(hat)
    
        }
      )
    else
      MySQL.Async.execute(
        'INSERT INTO user_accessories (identifier,hat) VALUES(@identifier,@glasses)',
        {
          
          ['@glasses'] = json.encode(hat),
    
        ['@identifier'] =  xPlayer.identifier
        }
      )
    end
		end
  )
  TriggerClientEvent("parow:SyncAccess",source)


end)
RegisterServerEvent('parow:setGlasses')
AddEventHandler('parow:setGlasses', function(glasses)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll(
		'SELECT * FROM user_accessories WHERE identifier = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
    function(result)
      if result[1] ~= nil then
      MySQL.Async.execute(
        'UPDATE user_accessories SET glasses = @glasses WHERE identifier = @identifier',
        {
          ['@identifier']   = xPlayer.identifier,
          ['@glasses'] = json.encode(glasses)
    
        }
      )
    else
      MySQL.Async.execute(
        'INSERT INTO user_accessories (identifier,glasses) VALUES(@identifier,@glasses)',
        {
          
          ['@glasses'] = json.encode(glasses),
    
        ['@identifier'] =  xPlayer.identifier
        }
      )
    end
		end
	)
  TriggerClientEvent("parow:SyncAccess",source)

end)


RegisterServerEvent("parow:SetNewAcces")
AddEventHandler("parow:SetNewAcces", function(data,_source)

  local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.execute(
    'INSERT INTO user_accessories (identifier,mask,type,label) VALUES(@identifier,@mask,@type,@label)',
    {
      
      ['@mask'] = data.mask,
      ['@type'] = data.type,
      ['@label'] = data.label,
    ['@identifier'] =  xPlayer.identifier
    }
  )
  TriggerClientEvent("parow:SyncAccess",_source)
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du har köpt en ny ' .. data.type})
end)
RegisterServerEvent("parow:SetNewMasque")
AddEventHandler("parow:SetNewMasque", function(mask,variation,type,label)
  maskx = {mask_1=mask,mask_2=variation}
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

 -- if label == nil then
  --label = type
  --end
  if xPlayer.get('money') >= 50 then
    xPlayer.removeMoney(50)
  MySQL.Async.execute(
    'INSERT INTO user_accessories (identifier,mask,type,label) VALUES(@identifier,@mask,@type,@label)',
    {
      
      ['@mask'] = json.encode(maskx),
      ['@type'] = type,
      ['@label'] = label,
    ['@identifier'] =  xPlayer.identifier
    }
  )
  TriggerClientEvent("parow:SyncAccess",source)
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du har köpt en ny ' .. type})
else
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har inte tillräckligt med pengar'})
end
end)
ESX.RegisterServerCallback('parow:GetTenues', function(source, cb, _)
	--("ss")
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll(
		'SELECT * FROM user_tenue WHERE identifier = @identifier',
		{
      ['@identifier'] = xPlayer.identifier
		},
    function(result)
			cb(result)
		end
	)
end)
ESX.RegisterServerCallback('parow:GetMoneyVet', function(source, cb, _)
	--("ss")
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
  if xPlayer.get('money') >= 50 then
    xPlayer.removeMoney(50)
    cb(true)
    TriggerClientEvent("parow:isxkaaa9921",source)
  else
    
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har inte tillräckligt med pengar'})
    cb(false)
  end
end)



RegisterServerEvent('prw:GiveAccessories')
AddEventHandler('prw:GiveAccessories', function(target,id,label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayer2 = ESX.GetPlayerFromId(target)
	MySQL.Async.execute(
		'UPDATE user_accessories SET identifier = @identifier WHERE id = @id',
		{
			['@identifier']   = xPlayer2.identifier,
			['@id'] = id

		}
	)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = '-1 '.. label})
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = '+1 '.. label})
		
			TriggerClientEvent("parow:SyncAccess",source)
			TriggerClientEvent("parow:SyncAccess",target)

end)
ESX.RegisterServerCallback('parow:getMask', function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    
  
    MySQL.Async.fetchAll(
      'SELECT * FROM user_accessories WHERE identifier = @identifier',
      {
          ['@identifier'] = xPlayer.identifier
      },
      function(result)
  
        cb(result)
      --  --(json.encode(result))
  
    end )
  
  end)
RegisterServerEvent('prw:Delclo')
AddEventHandler('prw:Delclo', function(id,label,data)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

			

			
			MySQL.Async.execute(
				'DELETE FROM user_accessories where id = @id',
				{
					['@id']   = id,

		
				}
			)
			ESX.CreatePickup('accessories', data, 1, data.type , _source)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = '-1 '.. label})
			


end)

RegisterServerEvent("parow:RenameMasque")
AddEventHandler("parow:RenameMasque", function(id,txt,type)
  MySQL.Async.execute(
    'UPDATE user_accessories SET label = @label WHERE id=@id',
    {
      ['@id'] = id,
      ['@label'] = txt

    }
  )
  TriggerClientEvent("esx:showNotification",source,"Vous avez bien renommé votre "..type.." en "..txt)
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du har bytt namn på '.. type .. ' till' ..txt})

end)