Locales['fr'] = {
  -- Inventory
  ['cash'] = 'espèces',
  ['inventory'] = 'inventaire %s / %s',
  ['use'] = 'utiliser',
  ['give'] = 'donner',
  ['remove'] = 'jeter',
  ['return'] = 'retour',
  ['give_to'] = 'donner à',
  ['amount'] = 'quantité',
  ['giveammo'] = 'donner munitions',
  ['amountammo'] = 'nombre de munitions',
  ['noammo'] = 'tu n\'as pas toutes ces munitions!',
  ['gave_item'] = 'vous avez donné ~y~%sx~s~ ~p~%s~s~ à ~y~%s~s~',
  ['received_item'] = 'vous avez reçu ~y~%sx~s~ ~p~%s~s~ par ~p~%s~s~',
  ['gave_weapon'] = 'vous avez donné ~y~1x~s~ ~p~%s~s~ à ~y~%s~s~',
  ['gave_weapon_ammo'] = 'vous avez donné ~o~%sx~s~ balles pour ~p~%s~s~ à ~y~%s~s~',
  ['gave_weapon_withammo'] = 'vous avez donné ~y~1x~s~ ~p~%s~s~ avec ~o~%sx~s~ balles à ~y~%s~s~',
  ['gave_weapon_hasalready'] = '~y~%s~s~ a déjà ~y~%s~s~',
  ['gave_weapon_noweapon'] = '~y~%s~s~ n\'a pas cette arme',
  ['received_weapon'] = 'vous recevez ~y~1x~s~ ~p~%s~s~ de ~p~%s~s~',
  ['received_weapon_ammo'] = 'vous avez reçu ~o~%sx~s~ balles pour votre ~p~%s~s~ de ~p~%s~s~',
  ['received_weapon_withammo'] = 'vous avez reçu ~y~1x~s~ ~p~%s~s~ avec ~o~%sx~s~ balles de ~p~%s~s~',
  ['received_weapon_hasalready'] = '~p~%s~s~ a tenté de vous donner ~y~%s~s~, mais vous en aviez déjà un exemplaire',
  ['received_weapon_noweapon'] = '~p~%s~s~ tente de vous donner des munitions pour ~y~%s~s~, mais vous n\'en avez pas',
  ['gave_money'] = 'vous avez donné ~p~$%s~s~ à ~y~%s~s~',
  ['received_money'] = 'vous avez reçu ~p~$%s~s~ par ~p~%s~s~',
  ['gave_account_money'] = 'vous avez donné ~p~$%s~s~ (%s) à ~y~%s~s~',
  ['received_account_money'] = 'vous avez reçu ~p~$%s~s~ (%s) par ~p~%s~s~',
  ['amount_invalid'] = 'montant invalide',
  ['players_nearby'] = 'aucun joueur à proximité',
  ['ex_inv_lim'] = 'action impossible, depassement de la limite d\'inventaire pour ~y~%s~s~',
  ['imp_invalid_quantity'] = 'action impossible, ~r~quantité invalide',
  ['imp_invalid_amount'] = 'action impossible, ~r~montant invalide',
  ['threw_standard'] = 'vous avez jeté ~y~%sx~s~ ~p~%s~s~',
  ['threw_money'] = 'vous avez jeté ~r~$%s~s~ ~p~cash~s~',
  ['threw_account'] = 'vous avez jeté ~r~$%s~s~ ~p~%s~s~',
  ['threw_weapon'] = 'vous avez jeté ~y~1x~s~ ~p~%s~s~',
  ['threw_weapon_ammo'] = 'vous avez jeté ~y~1x~s~ ~p~%s~s~ avec ~o~%sx~s~ balles',
  -- Salary related
  ['received_salary'] = 'vous avez reçu votre salaire: ~p~$%s~s~',
  ['received_help'] = 'vous avez reçu une aide de l\'état: ~p~$%s~s~',
  ['company_nomoney'] = 'votre entreprise n\'a plus d\'argent pour vous payer!',
  ['received_paycheck'] = 'paiement reçu',
  ['bank'] = 'banque',
  ['black_money'] = 'argent sale',

  ['act_imp'] = 'action impossible',
  ['in_vehicle'] = 'Vous ne pouvez rien donner à quelqu\'un dans un véhicule',

  -- Commands
  ['setjob'] = 'assigner job',
  ['id_param'] = 'identification du joueur',
  ['setjob_param2'] = 'le travail que vous souhaitez assigner',
  ['setjob_param3'] = 'le niveau d\'emploi',
  ['load_ipl'] = 'charger IPL',
  ['unload_ipl'] = 'décharger IPL',
  ['play_anim'] = 'jouer animation',
  ['play_emote'] = 'jouer emote',
  ['spawn_car'] = 'spawn un véhicule',
  ['spawn_car_param'] = 'nom de la voiture',
  ['delete_vehicle'] = 'supprimer le véhicule',
  ['spawn_object'] = 'engendre un objet',
  ['spawn_ped'] = 'spawn ped',
  ['spawn_ped_param'] = 'example a_m_m_hillbilly_01',
  ['givemoney'] = 'donner de l\'argent',
  ['setmoney'] = 'définir l\'argent pour un joueur',
  ['money_type'] = 'types de monnaies valides: cash, bank, black',
  ['money_set'] = 'quelqu\'un de ~y~haut placé~s~ vous a attribué ~p~$%s~s~ (%s) !',
  ['money_amount'] = 'somme d\'argent',
  ['invalid_account'] = 'compte invalide',
  ['account'] = 'compte',
  ['giveaccountmoney'] = 'donner de l\'argent au compte',
  ['invalid_item'] = 'item invalide',
  ['item'] = 'article',
  ['giveitem'] = 'donner un article',
  ['weapon'] = 'arme',
  ['giveweapon'] = 'donner l\'arme',
  ['disconnect'] = 'déconnecter du serveur',
  ['chat_clear'] = 'vider le chat',
  ['chat_clear_all'] = 'vider le chat pour tous le monde',
  ['command_clearinventory'] = 'effacer tout les items de l\'inventaire',
  ['command_clearloadout'] = 'retirer toutes les armes de l\'équipement',
  ['command_playerid_param'] = 'spécifiez un playerid ou laissez vide pour vous-même',
  -- Locale settings
  ['locale_digit_grouping_symbol'] = ' ',
  ['locale_currency'] = '$%s',

  -- Weapons
  ['weapon_knife'] = 'couteau',
  ['weapon_nightstick'] = 'matraque',
  ['weapon_hammer'] = 'marteau',
  ['weapon_bat'] = 'batte',
  ['weapon_golfclub'] = 'club de golf',
  ['weapon_crowbar'] = 'pied de biche',
  ['weapon_pistol'] = 'pistolet',
  ['weapon_combatpistol'] = 'pistolet de combat',
  ['weapon_appistol'] = 'pistolet automatique',
  ['weapon_pistol50'] = 'pistolet calibre 50',
  ['weapon_microsmg'] = 'micro smg',
  ['weapon_smg'] = 'smg',
  ['weapon_assaultsmg'] = 'smg d\'assaut',
  ['weapon_assaultrifle'] = 'fusil d\'assaut',
  ['weapon_carbinerifle'] = 'carabine d\'assaut',
  ['weapon_advancedrifle'] = 'fusil avancé',
  ['weapon_mg'] = 'mitrailleuse',
  ['weapon_combatmg'] = 'mitrailleuse de combat',
  ['weapon_pumpshotgun'] = 'fusil à pompe',
  ['weapon_sawnoffshotgun'] = 'carabine à canon scié',
  ['weapon_assaultshotgun'] = 'carabine d\'assaut',
  ['weapon_bullpupshotgun'] = 'carabine bullpup',
  ['weapon_stungun'] = 'tazer',
  ['weapon_sniperrifle'] = 'fusil de sniper',
  ['weapon_heavysniper'] = 'fusil de sniper lourd',
  ['weapon_grenadelauncher'] = 'lance-grenade',
  ['weapon_rpg'] = 'lance-rocket',
  ['weapon_stinger'] = 'lance-missile stinger',
  ['weapon_minigun'] = 'minigun',
  ['weapon_grenade'] = 'grenade',
  ['weapon_stickybomb'] = 'bombe collante',
  ['weapon_smokegrenade'] = 'grenade fumigène',
  ['weapon_bzgas'] = 'grenade à gaz bz',
  ['weapon_molotov'] = 'cocktail molotov',
  ['weapon_fireextinguisher'] = 'extincteur',
  ['weapon_petrolcan'] = 'jerrican d\'essence',
  ['weapon_digiscanner'] = 'digiscanner',
  ['weapon_ball'] = 'balle',
  ['weapon_snspistol'] = 'pistolet sns',
  ['weapon_bottle'] = 'bouteille',
  ['weapon_gusenberg'] = 'balayeuse gusenberg',
  ['weapon_specialcarbine'] = 'carabine spéciale',
  ['weapon_heavypistol'] = 'pistolet lourd',
  ['weapon_bullpuprifle'] = 'fusil bullpup',
  ['weapon_dagger'] = 'poignard',
  ['weapon_vintagepistol'] = 'pistolet vintage',
  ['weapon_firework'] = 'feu d\'artifice',
  ['weapon_musket'] = 'mousquet',
  ['weapon_heavyshotgun'] = 'fusil à pompe lourd',
  ['weapon_marksmanrifle'] = 'fusil marksman',
  ['weapon_hominglauncher'] = 'lance tête-chercheuse',
  ['weapon_proxmine'] = 'mine de proximité',
  ['weapon_snowball'] = 'boule de neige',
  ['weapon_flaregun'] = 'lance fusée de détresse',
  ['weapon_garbagebag'] = 'sac poubelle',
  ['weapon_handcuffs'] = 'menottes',
  ['weapon_combatpdw'] = 'arme de défense personnelle',
  ['weapon_marksmanpistol'] = 'pistolet marksman',
  ['weapon_knuckle'] = 'poing américain',
  ['weapon_hatchet'] = 'hachette',
  ['weapon_railgun'] = 'canon éléctrique',
  ['weapon_machete'] = 'machette',
  ['weapon_machinepistol'] = 'pistolet mitrailleur',
  ['weapon_switchblade'] = 'couteau à cran d\'arrêt',
  ['weapon_revolver'] = 'revolver',
  ['weapon_dbshotgun'] = 'fusil à pompe double canon',
  ['weapon_compactrifle'] = 'fusil compact',
  ['weapon_autoshotgun'] = 'fusil à pompe automatique',
  ['weapon_battleaxe'] = 'hache de combat',
  ['weapon_compactlauncher'] = 'lanceur compact',
  ['weapon_minismg'] = 'mini smg',
  ['weapon_pipebomb'] = 'bombe tuyau',
  ['weapon_poolcue'] = 'queue de billard',
  ['weapon_wrench'] = 'clé',
  ['weapon_flashlight'] = 'lampe torche',
  ['gadget_nightvision'] = 'vision nocturne',
  ['gadget_parachute'] = 'parachute',
  ['weapon_flare'] = 'fusée Détresse',
  ['weapon_doubleaction'] = 'double-Action Revolver',

  -- Weapon Components
  ['component_clip_default'] = 'chargeur par défaut',
  ['component_clip_extended'] = 'chargeur grande capacité',
  ['component_clip_drum'] = 'chargeur tambour',
  ['component_clip_box'] = 'chargeur très grande capacité',
  ['component_flashlight'] = 'torche',
  ['component_scope'] = 'viseur',
  ['component_scope_advanced'] = 'lunette',
  ['component_suppressor'] = 'réducteur de son',
  ['component_grip'] = 'poignée',
  ['component_luxary_finish'] = 'finission de luxe',
}
