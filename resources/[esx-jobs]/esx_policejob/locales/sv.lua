Locales['sv'] = {
  -- Cloakroom
  ['cloakroom'] = 'Omklädningsrum',
  ['citizen_wear'] = 'Civila kläder',
  ['police_wear'] = 'Polisuniform',
  ['gilet_wear'] = 'Reflektiv väst',
  ['bullet_wear'] = 'Skottsäker väst',
  ['no_outfit'] = 'Det finns ingen uniform som passar dig!',
  ['open_cloackroom'] = 'Tryck ~INPUT_CONTEXT~ för att välja ~y~kläder~s~.',
  -- Armory
  ['remove_object'] = 'Ta ut objekt',
  ['deposit_object'] = 'Lägg in objekt',
  ['get_weapon'] = 'Ta ut vapen',
  ['put_weapon'] = 'Lägg in vapen',
  ['buy_weapons'] = 'Köp vapen',
  ['armory'] = 'Vapenförråd',
  ['open_armory'] = 'Tryck ~INPUT_CONTEXT~ för att komma åt ~y~vapenförrådet~s~.',
  ['armory_owned'] = 'Ägd',
  ['armory_free'] = 'Gratis',
  ['armory_item'] = '%s SEK',
  ['armory_weapontitle'] = 'Vapenförråd - Köp vapen',
  ['armory_componenttitle'] = 'Vapenförråd - Vapen tillbehör',
  ['armory_bought'] = 'Du köpte ~y~%s~s~ för ~r~%s SEK~s~',
  ['armory_money'] = 'Du har inte råd med det vapnet',
  ['armory_hascomponent'] = 'Du har redan det tillbehöret!',
  ['get_weapon_menu'] = 'Vapenförråd - Ta ut vapen',
  ['put_weapon_menu'] = 'Vapenförråd - Spara vapen',
  -- Vehicles
  ['vehicle_menu'] = 'Fordon',
  ['vehicle_blocked'] = 'Fordon står i vägen!',
  ['garage_prompt'] = 'Tryck ~INPUT_CONTEXT~ för att öppna garage',
  ['garage_title'] = 'Garage',
  ['garage_stored'] = 'Parkerad',
  ['garage_notstored'] = 'Ute',
  ['garage_storing'] = 'Försöker ta bort fordon, försäkra dig om att inga spelare är i närheten',
  ['garage_has_stored'] = 'Fordonet är parkerat i garaget',
  ['garage_has_notstored'] = 'Du äger inga fordon i närheten',
  ['garage_notavailable'] = 'Ditt fordon är inte parkerat.',
  ['garage_blocked'] = 'Det finns ingen ledig plats att ställa fordonet på',
  ['garage_empty'] = 'Du har inga fordon i garaget',
  ['garage_released'] = 'Ditt fordon är utkört',
  ['garage_store_nearby'] = 'Det finns inga fordon i närheten',
  ['garage_storeditem'] = 'Mina parkerade fordon',
  ['garage_storeitem'] = 'Parkera mitt fordon',
  ['garage_buyitem'] = 'Köp in fordon',
  ['helicopter_prompt'] = 'Tryck ~INPUT_CONTEXT~ för att öppna ~y~Helikopter Garage~s~.',
  ['helicopter_notauthorized'] = 'Du är inte behörig.',
  ['shop_item'] = ' SEK%s',
  ['vehicleshop_title'] = 'Fordon',
  ['vehicleshop_confirm'] = 'Vill du köpa detta fordon?',
  ['vehicleshop_bought'] = 'Du har köpt ~y~%s~s~ för ~r~%skr~s~',
  ['vehicleshop_money'] = 'Du har inte råd',
  ['vehicleshop_awaiting_model'] = 'Fordonet ~p~LADDAS IN~s~, vänligen vänta!',
  ['confirm_no'] = 'Nej',
  ['confirm_yes'] = 'Ja',
  -- Service
  ['service_max'] = 'Du kan inte gå tjänst, poliser i tjänst: %s/%s',
  ['service_not'] = 'Du är inte i tjänst! Byt om för att gå in i tjänst.',
  ['service_anonunce'] = 'Tjänsteinformation',
  ['service_in'] = 'Du deltog i tjänst, välkommen!',
  ['service_in_announce'] = 'Operatör ~y~%s~s~ har deltagit tjänst!',
  ['service_out'] = 'Du har lämnat tjänst.',
  ['service_out_announce'] = 'Operatör ~y~%s~s~ har lämnat deras tjänst.',
  -- Action Menu
  ['citizen_interaction'] = 'Handlingar mot civila',
  ['vehicle_interaction'] = 'Handlingar på bilar',
  ['object_spawner'] = 'Ta fram ett objekt',

  ['id_card'] = 'ID-Kort',
  ['search'] = 'Sök igenom',
  ['handcuff'] = 'Handbojor',
  ['drag'] = 'Dra',
  ['put_in_vehicle'] = 'Sätt in i fordon',
  ['out_the_vehicle'] = 'Dra ut ur fordon',
  ['fine'] = 'Ge böter',
  ['unpaid_bills'] = 'Se obetalda räkningar',
  ['license_check'] = 'Se körkort',
  ['license_revoke'] = 'Återkalla körkort',
  ['license_revoked'] = 'Ditt ~p~%s~s~ har blivit ~y~återkallat~s~!',
  ['licence_you_revoked'] = 'Du återkallade ett ~p~%s~s~ som tillhörde ~y~%s~s~',
  ['no_players_nearby'] = 'Det finns ingen i närheten',
  ['being_searched'] = 'Du blir ~y~visiterad~s~ av ~p~Polisen~s~',
  -- Vehicle interaction
  ['vehicle_info'] = 'Fordon',
  ['pick_lock'] = 'Bryt upp fordon',
  ['vehicle_unlocked'] = 'Fordonet har ~p~låsts upp~s~',
  ['no_vehicles_nearby'] = 'Inga fordon i närheten',
  ['impound'] = 'Bärga fordonet',
  ['impound_prompt'] = 'Tryck ~INPUT_CONTEXT~ för att avbryta ~y~bärgningen~s~',
  ['impound_canceled'] = 'Du avbröt bärgningen',
  ['impound_canceled_moved'] = 'Bärgningen avbröts på grund av att fordonet har rört sig',
  ['impound_successful'] = 'Du har bärgat fordonet',
  ['search_database'] = 'Fordonsuppgifter',
  ['search_database_title'] = 'Fordonsuppgifter - Sök med registreringsnummer',
  ['search_database_error_invalid'] = 'Det är ~r~inte~s~ ett ~y~giltigt~s~ registreringsnummer',
  ['search_database_error_not_found'] = 'Det ~y~registreringsnummeret~s~ är ~r~inte~s~ registrerat till något fordon!',
  ['search_database_found'] = 'Detta fordon är ~y~registrerat~s~ till ~p~%s~s~',
  -- Traffic interaction
  ['traffic_interaction'] = 'Trafiksåtgärder',
  ['cone'] = 'Kon',
  ['barrier'] = 'Barriär',
  ['spikestrips'] = 'Spikmatta',
  ['box'] = 'Låda',
  ['cash'] = 'Låda med pengar',
  -- ID Card Menu
  ['name'] = 'Namn: %s',
  ['job'] = 'Jobb: %s',
  ['sex'] = 'Kön: %s',
  ['dob'] = 'Födelsedatum: %s',
  ['height'] = 'Längd: %s',
  ['id'] = 'ID: %s',
  ['bac'] = 'Alkohol i blodet: %s',
  ['unknown'] = 'Okänt',
  ['male'] = 'Man',
  ['female'] = 'Kvinna',
  -- Body Search Menu
  ['guns_label'] = '--- Vapen ---',
  ['inventory_label'] = '--- Inventory ---',
  ['license_label'] = ' --- Licenser ---',
  ['confiscate'] = 'Beslagta %s',
  ['confiscate_weapon'] = 'beslagta %s med %s skott',
  ['confiscate_inv'] = 'beslagta %sx %s',
  ['confiscate_dirty'] = 'beslagta svarta pengar: <span style="color:red;">%s SEK</span>',
  ['you_confiscated'] = 'du beslagtog ~y~%sx~s~ ~p~%s~s~ från ~p~%s~s~',
  ['got_confiscated'] = '~y~%sx~s~ ~p~%s~s~ beslagtogs av ~y~%s~s~',
  ['you_confiscated_account'] = 'du beslagtog ~p~%s SEK~s~ (%s) från ~p~%s~s~',
  ['got_confiscated_account'] = '~p~%s SEK~s~ (%s) beslagtogs av ~y~%s~s~',
  ['you_confiscated_weapon'] = 'du beslagtog ~p~%s~s~ från ~p~%s~s~ med ~o~%s~s~ skott',
  ['got_confiscated_weapon'] = 'din ~p~%s~s~ med ~o~%s~s~ skott beslagtogs av ~y~%s~s~',
  ['traffic_offense'] = 'brott mot trafikregler',
  ['minor_offense'] = 'mindre lagbrott',
  ['average_offense'] = 'medel lagbrott',
  ['major_offense'] = 'grovt lagbrott',
  ['fine_total'] = 'böter: %s',
  -- Vehicle Info Menu
  ['plate'] = 'reg nummer: %s',
  ['owner_unknown'] = 'ägare: Okänt',
  ['owner'] = 'ägare: %s',
  -- Boss Menu
  ['open_bossmenu'] = 'tryck ~INPUT_CONTEXT~ för att öppna menyn',
  ['quantity_invalid'] = 'otillgängligt antal',
  ['have_withdrawn'] = 'du har tagit ut ~y~x%s~s~ ~p~%s~s~',
  ['have_deposited'] = 'du har lagrat ~y~x%s~s~ ~p~%s~s~',
  ['quantity'] = 'antal',
  ['inventory'] = 'förråd',
  ['police_stock'] = 'polisförråd',
  -- Misc
  ['remove_prop'] = 'tryck ~INPUT_CONTEXT~ för att ta bort obejektet',
  ['map_blip'] = 'polisstation',
  ['unrestrained_timer'] = 'dina handklovar har försvunnit',
  -- Notifications
  ['alert_police'] = 'meddela polisen',
  ['phone_police'] = 'polisen',
}
