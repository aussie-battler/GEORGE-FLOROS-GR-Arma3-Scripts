


//________________  Author : [GR]GEORGE F ___________ 22.07.18 _____________ 


/*
________________ GF Crashsites Script ________________

https://forums.bohemia.net/forums/topic/212505-crashsites_gf-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


//	If you want the script to run only in the server use the code below
	if(!isServer) exitWith {};


diag_log "//________________ GF Crashsites Script _____________";
diag_log "//________________ GF_Crashsites_unsung_ravage.sqf _____________";


//________________ GF Crashsites Script _____________

//________________ Settings ________________
//________________ Set true or false  ________________

_1_Create_Box_container		= true;		//	Create a Box container at the Crashsites with random loot	
_2_Create_Loot				= true;		//	Create Create Loot at the Crashsites	
_3_Grass_Cutter				= true;		//	Cut the grass around the Crashsites 
_4_GF_Recon_Teams         	    = true;     //  Spawn a Recon Team to move to the Crashsite position
_5_Create_Markers			= true;		//	Create a Marker for the Crashsites	

	

systemchat "C r a s h s i t e s   I n i t i a l i z i n g";

private ["_marker","_x"];
_x = 0;

//________________ Number of the crashsites to spawn (on random) ________________
for "_x" from 0 to (2 + (random 6)) do {

//________________ For spawn one crashsite ________________
//for "_x" from  1 to (1) do {

//________________ The position of the crashsites will be random ________________
	_GF_random_pos = [] call BIS_fnc_randomPos; 	//    For random location
//	_GF_random_pos = getmarkerPos "MarkerName";    	//    Create a Marker if you want a certain location -

/*
//	or select a random marker
_Marker_array =selectRandom[    
            "Marker_1",        
            "Marker_2",
			"Marker_3"			
            ];
_GF_random_pos = getmarkerPos _Marker_array;
*/

//	_GF_random_pos = getPos player;    //    for test purpose

//________________ Wrecks at the crashsites ________________

//Wrecks at the crashsites
GF_Wrecks_array = [
			"uns_E2A_Wreck",
			"uns_a1j_Wreck",
			"uns_a3b_Wreck",
			"uns_A4_Wreck",
			"uns_A6_Wreck",
			"uns_A7_wreck",
			"uns_ah1g_Wreck",
			"uns_an2_wreck",
			"uns_c1a_wreck",			
			"uns_ch47_wreck",
			"uns_f100_Wreck",
			"UNS_F111_wreck",
			"uns_h21c_wreck",
			"uns_mi8_wreck",
			//"uns_mig21_canopy",
			//"uns_mig21_dragchute",
			"uns_mig21_wreck",
			"OH6_Wreck",			
			"uns_oh6_wreck",
			"uns_uh1c_wreck",
			"UH1_Wreck",
			"uns_uh1d_wreck",
			"uns_mi8_wreck",
			"uns_uh1_Wreck",
			"uns_uh1h_wreck"
			];
_Wrecks = selectRandom GF_Wrecks_array;

_crashsite = _Wrecks createVehicle _GF_random_pos;


//________________ Type of loot ________________
_weapons_Loot = selectRandom [
			//Unsung Rifles + AssaultRifles Blufor
			"uns_m1garand",
			"uns_m1garands",
			"uns_m1garandbayo",
			"uns_m1carbine",
			"uns_m2carbine",
			"uns_l1a1",
			"uns_l1a1gl",
			"uns_m14",
			"uns_m14sd",
			"uns_m14bayo",
			"uns_m21",
			"uns_m21sd",
			"uns_m21nv",
			"uns_m21nvsd",
			"uns_model70",			
			"uns_model70sd",
			"uns_model70nv",
			"uns_model70nvsd",
			"uns_XM177E1",
			"uns_xm177e1_dm",
			"uns_xm177e1s",
			"uns_xm177e1_NV",
			"uns_xm177e1_xm148",
			"uns_xm177e1_m203",
			"uns_XM177E2",
			"uns_XM177E2s",
			"uns_xm177e2_NV",
			"uns_xm177e2_short",
			"uns_xm177e2_grip",
			"uns_xm177_xm148",
			"uns_xm177_m203",
			"uns_M16",
			"uns_M16_bayo",
			"uns_M16_SD",
			"uns_M16_M203",
			//"uns_M16_XM148",
			"uns_M16s",
			"uns_M16_NV",
			"uns_M16_NVsd",
			"uns_M16s_sd",
			"uns_M16A1",
			"uns_M16A1_HBAR",
			"uns_M16A1_bayo",			
			"uns_M16a1_SD",
			"uns_M16A1_NV",
			"uns_M16A1_NVsd",
			"uns_m16a1_m203",
			"uns_M16A1s",
			"uns_M16s",
			"uns_M16A1s_sd",
			
			//Unsung Rifles + AssaultRifles Opfor
			"uns_AKS47",
			"uns_aks47_bayo",
			"uns_AK47",
			"uns_ak47_bayo",
			"uns_AK47_49",
			"uns_AK47_52",
			"uns_type56",
			"uns_Sa58P",
			"uns_Sa58V",
			"uns_sa58p_bayo",
			"uns_sa58v_bayo",
			"uns_AKM",
			"uns_akm_bayo",
			"uns_AKMS",
			"uns_AKMS_Drum",			
			"uns_AKMSF",
			"uns_AKMS_SD",
			"uns_AKMS_SD_drum",
			"uns_type56_bayo",
			"uns_SKS",
			"uns_sksbayo",
			"uns_mosin",
			"uns_mosins",
			"uns_mas36",
			"uns_mas36bayo",
			"uns_mas36short",
			"uns_mas4956",
			"uns_mas4956s",
			"uns_SVD",
			"uns_SVD_camo",
						
			//Unsung lmg Blufor
			"uns_M63a_AR",
			"uns_m63a_drum",
			"uns_M63a_LMG",
			"uns_M63asupport",
			"uns_bar",
			"uns_m60shorty",
			"uns_m60",
			"uns_m60support",
			"uns_rpdsog",
			
			//Unsung lmg Opfor
			"uns_rpk",
			"uns_RPK_40",
			"uns_RPK_drum",
			"uns_DP28",
			"uns_RPD_drum",
			"uns_RPDsupport",
			"uns_PK",
			"uns_PKsupport",
			"uns_MG42",
			"uns_MG42support",
			
			//Unsung 40 GL Blufor
			"uns_ex41",
			"uns_m79",
			"uns_m79p"
			/*				
			//Unsung Launchers Blufor
			"uns_M72",
			
			//Unsung Launchers Opfor
			"uns_rpg2",
			"uns_B40",
			"uns_rpg7",
			"uns_sa7"	
			*/	
			];
			

_sideweapons_loot = [
			//Unsung Pistols Blufor
			"uns_mkvFlarePistol",
			"uns_MX991_m1911",
			"uns_MX991_g",
			"uns_MX991_w",
			"uns_MX991_r",
			"uns_MX991_m1911SD",
			"uns_38spec",
			"uns_357m",
			"uns_m1911",
			"uns_m1911SD",
			"uns_coltcmdr",
			"uns_bhp",
			"uns_Ruger",
			"uns_ppk",
			"uns_ppkSD",
			
			//Unsung Pistols Opfor
			"uns_p64",
			"uns_makarov",
			"uns_MakarovSD",
			"uns_Tt33",
			"uns_APS",
			"uns_APS_SD",
			"uns_p64",
			"uns_pm63p",
			"uns_pm63",
			"uns_pm63f",
			"uns_thompsonvc",
			"uns_mat49",
			"uns_mat49_f",
						
			//Unsung SubMachineGuns Blufor
			"uns_uzi",
			"uns_uzif",
			"uns_uzi_SD",
			"uns_mac10",
			"uns_mac10sd",
			"uns_m45",				
			"uns_sten",
			"uns_stensd",
			"uns_Sterling",
			"uns_SterlingSD",
			"uns_thompson",			
			"uns_m3a1",
			"uns_m3sd",
			
			//Unsung SubMachineGuns Opfor
			"uns_PPS43",
			"uns_PPS52",
			"uns_k50m",
			"uns_k50mdrum",
			"uns_ppsh41",
			"uns_STG_44",				
						
			//Unsung Shotgun Blufor
			"uns_ithaca37",
			"uns_m1897riot",
			"uns_m1897",
			"uns_model12",
			"uns_m870"
			]call BIS_fnc_selectRandom;


_items_loot1 = [
			//for RyanZombies
			//"RyanZombiesAntiVirusTemporary_Item",
			//"RyanZombiesAntiVirusCure_Item",
	
			//Vanilla			
			"ToolKit",
			"MediKit",
			"FirstAidKit",
			"FirstAidKit", 			

			//unsung items
			"UNS_TrapKit",
			"uns_binocular_navy",
			"uns_binocular_army"
			]call BIS_fnc_selectRandom;
	
	
_items_loot2 = [
			//Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			//"ItemGPS",
			"ItemMap",
			//x2
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			//"ItemGPS",
			"ItemMap",
			//Unsung items
			"uns_ANPVS2",
			"UNS_ItemRadio_T_884",
			"uns_ItemRadio_Transistor_2",
			"uns_ItemRadio_PRC25_TFAR",
			"UNS_ItemRadio_PRC_90_TFAR",
			"UNS_ItemRadio_T884_TFAR",
			"UNS_ItemRadio_PRC_25",
			"UNS_ItemRadio_PRC_90",
			"uns_ItemSiphon",
			"uns_ItemSil_rifle",
			"uns_ItemSil_hgun",
			"uns_b_m1917",
			"uns_b_m6",
			"uns_b_m7",
			"uns_b_spike",
			"uns_b_spike17",
			"uns_b_sks",
			"uns_b_6H3",
			
			//Unsung MuzzleAttachments
			"uns_s_M14",
			"uns_s_M16",
			"uns_s_Mac10",
			"uns_s_M3a1",
			"uns_s_UZI",
			"uns_s_sten",
			"uns_s_M1911",
			"uns_s_PPK",
									
			//Unsung OpticAttachments
			"uns_o_RedfieldART",
			"uns_o_Unertl8x",
			"uns_o_LeatherwoodART",
			"uns_o_colt4x",
			"uns_o_ANPVS2",
			"uns_o_APXSOM",
			"uns_o_M63",
			"uns_s_PBS1",
			"uns_s_APS",
			"uns_o_PSO1",
			"uns_o_PSO1_camo",
			"uns_o_PU",
						
			//Unsung BipodAttachments
			"uns_bp_M60",
			"uns_bp_M63",
			"uns_bp_DP28",
			"uns_bp_MG42",
			"uns_bp_M60",
			"uns_bp_PKM",
			"uns_bp_RPD",
			"uns_bp_RPK",
			"uns_bp_RPK40",
			//Gas Mask
			"UNS_M17"
			]call BIS_fnc_selectRandom;

_items_loot3 = [
			// Ravage_items
			//x1
			"rvg_plasticBottleEmpty",
			"rvg_canteenEmpty",
			"rvg_hose",
			"rvg_sleepingBag_Blue", 
			"rvg_foldedTent",
			"rvg_rustyCan",
			"rvg_Geiger",
			"rvg_canisterFuel_Empty",
			"rvg_toolkit",
			"rvg_tire",
			//x2 Vital			
			"rvg_money", 
			"rvg_notepad", 
			"rvg_docFolder",
			"rvg_canOpener",
			"rvg_guttingKnife", 
			"rvg_matches",
			"rvg_plasticBottle",
			"rvg_plasticBottlePurified", 
			"rvg_spirit", 
			"rvg_franta",
			"rvg_beans", 
			"rvg_bacon", 
			"rvg_milk", 
			"rvg_rice",
			"rvg_antiRad",
			"rvg_purificationTablets",						
			//x2 Vital
			"rvg_money", 
			"rvg_notepad", 
			"rvg_docFolder",
			"rvg_canOpener",
			"rvg_guttingKnife", 
			"rvg_matches",
			"rvg_plasticBottle",
			"rvg_plasticBottlePurified", 
			"rvg_spirit", 
			"rvg_franta",
			"rvg_beans", 
			"rvg_bacon", 
			"rvg_milk", 
			"rvg_rice",
			"rvg_antiRad",
			"rvg_purificationTablets",
			
			//addon Ravage
			"Mask_M40_OD",
			"Mask_M40",
			"Mask_M50"
			]call BIS_fnc_selectRandom;
			
_items_loot4 = selectRandom [
			//Flares
			"Chemlight_blue",
			"Chemlight_green",
			"Chemlight_red",
			//Smokes
			"SmokeShell",
			"SmokeShellBlue",
			"SmokeShellGreen",
			"SmokeShellOrange",
			"SmokeShellPurple",
			"SmokeShellRed",
			"SmokeShellYellow",
			"uns_ex41mag",
			"uns_1Rnd_AB_M397",
			"uns_1Rnd_BS_M576",
			"uns_40mm_green",
			"uns_40mm_mkv_Green",
			"uns_40mm_yellow",
			//"uns_40mm_mkv_Yellow",
			"uns_40mm_red",
			"uns_40mm_mkv_Red",
			"uns_40mm_white",
			"uns_40mm_mkv_White",
			"Uns_1Rnd_HE_M381",
			"Uns_1Rnd_HE_M406",
			"uns_1Rnd_HEDP_M433",
			"uns_1Rnd_SmokeBlue_40mm",
			"uns_1Rnd_SmokeGreen_40mm",
			"uns_1Rnd_SmokeGreen_MKV",
			"uns_1Rnd_SmokeOrange_40mm",
			"uns_1Rnd_SmokePurple_40mm",
			"uns_1Rnd_SmokeRed_40mm",
			"uns_1Rnd_SmokeRed_MKV",
			"uns_1Rnd_Smoke_40mm",
			"uns_1Rnd_Smoke_MKV",
			"uns_1Rnd_SmokeYellow_40mm",
			"uns_1Rnd_SmokeYellow_MKV",
			"uns_BA1568",
			"UNS_EAM2Braft",
			"uns_ItemM57clacker",
			"uns_1Rnd_M127_mag",
			"Uns_1Rnd_22mm_FRAG",
			"Uns_1Rnd_22mm_WP",
			"Uns_1Rnd_22mm_M1a2_FRAG",
			"Uns_1Rnd_22mm_smoke",
			"Uns_1Rnd_22mm_HEAT",
			"Uns_1Rnd_22mm_AT",
			"Uns_1Rnd_30mm_FRAG",
			//Explosives
			"HandGrenade",
			"MiniGrenade",
			//Unsung Smokes
			"uns_molotov_mag",
			"uns_f1gren",
			"uns_m14gren",
			"uns_m308gren",
			"uns_m34gren",
			"uns_m61gren",
			"uns_m67gren",
			"uns_m7gren",
			"uns_mk2gren",
			"uns_mk3a2gren",
			"uns_mk40gren",
			"uns_rdg2",
			"uns_rdg3",
			"uns_rg42gren",
			"uns_rgd33gren",
			"uns_rgd5gren",
			"uns_rkg3gren",
			"uns_m18Blue",
			"uns_m18Green",
			"uns_m18Orange",
			"uns_m18Purple",			
			"uns_m18red",
			"uns_m18white",
			"uns_m18Yellow",
			"uns_t67gren",
			"uns_v40gren",
			"uns_traps_nade_mag6",
			"uns_traps_nade_mag4",
			"uns_traps_nade_mag5",
			"uns_traps_punj5_mag",
			"uns_traps_punj4_mag",
			"uns_traps_punj1_mag",
			//"uns_traps_punj2_mag",
			"uns_traps_nade_mag",
			"uns_traps_m7_mag",
			"uns_traps_nade_mag3",
			"uns_traps_flare_mag",			
			"uns_traps_nade_mag7",
			"uns_traps_claymore_remote_mag",
			"uns_traps_claymore_mag",
			"uns_traps_arty_mag",
			"uns_traps_nade_mag2",			
			"uns_mine_IN_mag",
			"uns_mine_AT_mag",
			"Mine",
			"uns_mine_AV_mag",
			"MineE",
			"uns_mine_AP_mag",
			"uns_traps_mine_mag",
			"uns_mine_m14_mag",
			"uns_mine_TM_mag",
			"uns_M118_mag_remote",			
			"uns_mine_radio_mag",
			"uns_mine_guitar_mag",
			"uns_mine_fuel_mag",			
			//"uns_mine_fkit_mag",
			"uns_mine_cigs_mag",
			"uns_mine_beer_mag",
			"uns_mine_ammo_mag"
			];

			
_Clothes_array = selectRandom [		
			//Unsung Uniforms
			"UNS_ARMY_BDU",
			"UNS_ARMY_BDU_F",
			"UNS_ARMY_BDU_65",
			"UNS_TIGER_BDU",
			"UNS_TIGER2_BDU",
			"UNS_TIGER3_BDU",
			"UNS_DUCK_BDU",
			"UNS_USMC_BDU_65",
			"UNS_USMC_BDU_65_2",
			"UNS_USMC_FLAK_65",
			"UNS_USMC_FLAK2_65",
			"UNS_USMC_BDU",
			"UNS_USMC_BDU_S",
			"UNS_USMC_Flak",
			"UNS_USMC_Flak_F",
			"UNS_USMC_Flak_S",
			"UNS_USMC_Flak_E",
			"UNS_USMC_Flak_ES",
			"UNS_USMC_LERDL",
			"UNS_JPilot_BDU",
			"UNS_Pilot_BDU",
			"UNS_VC_S",
			"UNS_VC_U",
			"UNS_NVA_G",
			"UNS_NVA_K",
			"UNS_NVA_KS",
			"UNS_DCCR_G",
			"UNS_DCCR_B",
			"UNS_DCCR_TGS",
			"UNS_DCCR_BBS",
			"UNS_DCCR_BTS",
			"UNS_DCCR_GTS",
			"UNS_CIV_U",
			
			//Vanilla		
			"U_B_FullGhillie_ard",
			"U_B_FullGhillie_lsh",
			"U_B_FullGhillie_sard",
			"U_B_GhillieSuit",		
			"U_O_FullGhillie_ard",
			"U_O_FullGhillie_lsh",
			"U_O_FullGhillie_sard",
			"U_O_GhillieSuit",			
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit",			
			//"U_B_survival_uniform",
						
			//UnsungHeadgear
			"UNS_Beret_MRF",
			"UNS_Beret_B",
			"UNS_Beret_5",
			"UNS_Beret_51LT",
			"UNS_Beret_52LT",
			"UNS_Beret_5CPT",
			"UNS_Beret_5MAJ",
			"UNS_Beret_5LTCOL",
			"UNS_Beret_5COL",
			"UNS_Beret_AVAB",
			"UNS_Beret_AVM",
			"UNS_Beret_AVR",
			"UNS_Boonie_TIG",
			"UNS_Boonie_TIG1",
			"UNS_Boonie_TIG2",
			"UNS_Boonie_TIGF",
			"UNS_Boonie_TIGF2",
			"UNS_Boonie_TIGF3",
			"UNS_Boonie_TIGF4",
			"UNS_Boonie_OD",
			"UNS_Boonie_OD2",
			"UNS_Boonie_ODF",
			"UNS_Boonie_ODP",
			"UNS_Boonie_DK",
			"UNS_Boonie_DKF",
			"UNS_Boonie_ERDL",
			"UNS_Bandana_OD",
			"UNS_Bandana_OD2",
			"UNS_USMC_Cover",
			"UNS_M1_9A",
			"UNS_M1_8A",
			"UNS_M1_7A",
			"UNS_M1_6A",
			"UNS_M1_5A",
			"UNS_M1_4A",
			"UNS_M1_3A",
			"UNS_M1_2A",
			"UNS_M1_1A",
			"UNS_M1_17",
			"UNS_M1_16",
			"UNS_M1_15",
			"UNS_M1_14",
			"UNS_M1_13",
			"UNS_M1_12",
			"UNS_M1_11",
			"UNS_M1_10",
			"UNS_M1_9",
			"UNS_M1_8",
			"UNS_M1_7",
			"UNS_M1_6",
			"UNS_M1_5",
			"UNS_M1_4",
			"UNS_M1_3",
			"UNS_M1_2",
			"UNS_M1_1",
			"UNS_M1_AFT",
			"UNS_M1_MP",
			"UNS_M1_SP",
			"UNS_M1_PBR",
			"UNS_M1_1V1",
			"UNS_M1_1V2",
			"UNS_M1_1V1N",
			"UNS_M1_1V3",
			"UNS_M1_1V4",
			"UNS_M1_1V5",
			"UNS_M1_1V6",
			"UNS_M1_1V7",
			"UNS_M1_1V8",
			"UNS_M1_1RM",
			"UNS_TC_1",
			"UNS_TC_2",
			"UNS_HP_Helmet",
			"UNS_JP_Helmet",
			"UNS_JP_Helmet2",
			"UNS_Headband_OD",
			"UNS_Headband_OD2",
			"UNS_Headband_ED",
			"UNS_Headband_BK",
			"UNS_Headband_VC",
			"UNS_Conehat_VC",
			"UNS_Boonie_VC",
			"UNS_NVA_HG",
			"UNS_NVA_HGG",
			"UNS_NVA_HK",
			"UNS_NVA_HKG",
			"UNS_PAVN_HN",
			"UNS_PAVN_HC",
			"UNS_PAVN_HG",
			"UNS_NVA_CH",
			"UNS_NVA_PL",
			"UNS_Beret_MAJ",			
			"UNS_M1_25",
			"UNS_Goggles_NVA",
			"UNS_Scarf_1stCav",
			"UNS_M1_1B",
			"UNS_Scarf_BK",
			"UNS_Boonie_ERDL2",
			"UNS_Field_Cap",
			"UNS_HP_Helmet_11AC",
			"UNS_HP_Helmet_17AC",
			"UNS_HP_Helmet_1AC",
			"UNS_HP_Helmet_1MD",
			"UNS_HP_Helmet_OG",
			"UNS_HP_Helmet_R33",
			"UNS_HP_Helmet_R8",
			"UNS_HP_Helmet_TIGER",
			"UNS_HP_Helmet_REBEL",
			"UNS_JP_Helmet_352TFS",
			"UNS_JP_Helmet_366TFW",
			"UNS_JP_Helmet_389TFS",
			"UNS_Boonie_ERDL3",
			"UNS_Beret_4",
			"UNS_Beret_3",
			"UNS_Bandana_OD3",
			"UNS_Boonie_4",
			"UNS_Boonie_6",
			"UNS_Boonie5_VC",
			"UNS_NVA_CHG",
			"UNS_NVA_CHB",
			"UNS_NVA_PLC",
			"UNS_NVA_SSH40",
			"UNS_NVA_SSH60",
			"UNS_NVA_CHBG",
			"UNS_M1_3_cal",
			"UNS_M1_7_lbj",
			"UNS_M1_6_nyg",
			"UNS_M1_18",
			"UNS_M1_19",
			"UNS_M1_20",
			"UNS_M1_21",
			"UNS_M1_22",
			"UNS_M1_23",
			"UNS_M1_24",
			"UNS_Boonie4_VC",
			"UNS_Boonie3_VC",
			"UNS_Boonie2_VC",
						
			//Glasses Vanilla
			"G_Spectacles",
			"G_Spectacles_Tinted",			
			"G_Squares",
			"G_Squares_Tinted",			
			"G_Aviator",			
			"G_Diving",
			"G_B_Diving",
			"G_O_Diving",
			"G_I_Diving",
						
			//Unsung Accessories
			"UNS_Towel",
			"UNS_Peace",
			"UNS_Bullets",
			"UNS_Finger",
			"UNS_Ear",
			"UNS_Scarf_OD",
			"UNS_Scarf_ARVN",
			"UNS_Band_H",
			"UNS_Band_L",
			"UNS_Bandana_A",
			"UNS_Scarf_Red",
			"UNS_Scarf_Blue",
			"UNS_Towel_Long",
			"UNS_Scarf_BK_W",
			"UNS_Scarf_GR",
			"UNS_Scarf_PL"
		/*				
			// lootItem_list Ravage
			"H_BandCap_rvg",
			"L_Shemagh_OD",
			"L_Shemagh_Tan",
			"L_Shemagh_Red",
			"L_Shemagh_Gry",
			"NeckTight_OD",
			"NeckTight_Gry",
			"NeckTight",
			"NeckTight_Red",
			"NeckTight_Tan",
			"PU_shemagh_OD",
			"PU_shemagh_Tan",
			"H_MilCap_gry",
			"V_O2Tank",
			"U_C_Poor_1",
			"U_C_Poor_2",
			"U_C_WorkerCoverallsBlack",
			"U_C_WorkerCoverallsBandit"
		*/
			];
			

_Vests_array = selectRandom [	
			//Unsung Vests
			"UNS_JP_Vest",
			"UNS_FLAK",
			"UNS_M1956_P1",
			"UNS_M1956_T1",
			"UNS_M1956_A1",
			"UNS_M1956_A2",
			"UNS_M1956_A3",
			"UNS_M1956_A4",
			"UNS_M1956_A5",
			"UNS_M1956_A6",
			"UNS_M1956_A7",
			"UNS_M1956_A8",
			"UNS_M1956_A9",
			"UNS_M1956_A10",
			"UNS_M1956_A11",
			"UNS_M1956_A12",
			"UNS_M1956_M1",
			"UNS_M1956_M2",
			"UNS_M1956_M3",
			"UNS_M1956_M4",
			"UNS_M1956_M5",
			"UNS_M1956_M6",
			"UNS_M1956_M7",
			"UNS_M1956_M8",
			"UNS_M1956_M9",
			"UNS_M1956_M10",
			"UNS_M1956_M11",
			"UNS_M1956_M12",
			"UNS_M1956_M13",
			"UNS_M1956_M14",
			"UNS_M1956_M15",
			"UNS_M1956_M16",
			"UNS_M1956_M17",
			"UNS_M1956_M18",
			"UNS_M1956_M19",
			"UNS_M1956_S1",
			"UNS_M1956_S2",
			"UNS_M1956_S3",
			"UNS_M1956_S4",
			"UNS_VC_A1",
			"UNS_VC_A2",
			"UNS_VC_A3",
			"UNS_VC_S1",
			"UNS_VC_S2",
			"UNS_VC_MG",
			"UNS_VC_SP",
			"UNS_VC_B1",
			"UNS_NVA_A1",
			"UNS_NVA_A2",
			"UNS_NVA_A3",
			"UNS_NVA_S1",
			"UNS_NVA_S2",
			"UNS_NVA_GR",
			"UNS_NVA_MG",
			"UNS_NVA_SP",
			"UNS_NVA_B1",
			"UNS_ANZAC_VEST",
			"UNS_ANZAC_VEST_C",
			"UNS_M1956_LRRP1",
			"UNS_NVA_G1",
			"UNS_M1956_N1",
			"UNS_M1956_N2",
			"UNS_M1956_N3",
			"UNS_M1956_N4",
			"UNS_M1956_M20",
			"UNS_M1956_M21",
			"UNS_M1956_M22",
			"UNS_M1956_M23",
			"UNS_M1956_M24",
			"UNS_M1956_M25",
			"UNS_M1956_M26",
			"UNS_M1956_M27",
			"UNS_M1956_M28",
			"UNS_M1956_M29",
			"UNS_M1956_M30",
			"UNS_M1956_M31",
			"UNS_M1956_M32",
			"UNS_M1956_M33",
			"UNS_M1956_M34",
			"UNS_M1956_M35",
			"UNS_M1956_M36"
			];

				
_Backpacks_array = selectRandom [
			//Unsung Backpacks
			"UNS_Alice_F1",
			"UNS_Alice_F2",
			"UNS_Alice_F3",
			"UNS_Alice_F4",
			"UNS_Alice_F5",
			"UNS_Alice_F6",
			"UNS_Alice_F7",
			"UNS_Alice_F8",
			"UNS_Alice_F9",
			"UNS_Alice_FR",
			"UNS_Alice_1",
			"UNS_Alice_2",
			"UNS_Alice_3",
			"UNS_Alice_4",
			"UNS_Alice_5",
			"UNS_Alice_6",
			"UNS_ARMY_RTO",
			"UNS_SF_RTO",
			"UNS_ARMY_MED",
			"UNS_USMC_E1",
			"UNS_USMC_E2",
			"UNS_USMC_R1",
			"UNS_USMC_R2",
			"UNS_USMC_R3",
			"UNS_USMC_MED",
			"UNS_USMC_RTO",
			"UNS_TROP_R1",
			"UNS_TROP_R2",
			"UNS_TROP_R3",			
			"UNS_NVA_RTO",
			"UNS_NVA_RPG",
			"UNS_NVA_MED",
			"UNS_NVA_R1",
			"UNS_NVA_RC",
			"UNS_Alice_DEM",
			"UNS_ARMY_RTO2",
			"UNS_Alice_MED",
			"UNS_ANZAC_RUCK",
			"UNS_Alice_F10",
			"UNS_Alice_F11",
			"UNS_CIV_R1",
			"UNS_CIV_R2",
			"UNS_CIV_R3",
			"UNS_Alice_LRP1",
			"UNS_Alice_LRP2",
			"UNS_NVA_R3",
			"UNS_Alice_SOG",
			"UNS_USMC_E5",
			"UNS_USMC_E3",
			"UNS_USMC_E4",
			"UNS_USMC_RTO2",
			"UNS_VC_R1",
			"UNS_VC_R1_RPG",
			"uns_STABO_US_Bag",
			"UNS_Ammopack",
			
			//Unsung Static
			"uns_M60_high_US_Bag",
			"uns_Weapon_Bag_Base",
			"uns_Tripod_Bag",
			"uns_M1919_low_US_Bag",
			"uns_M60_low_US_Bag",
			"uns_m2_high_US_Bag",
			"uns_M2_low_US_Bag",
			"uns_MK18_low_US_Bag",
			"uns_M1_81mm_mortar_US_Bag",
			"uns_M2_60mm_mortar_US_Bag",
			"uns_M30_107mm_mortar_US_Bag",
			"Uns_US_searchlight_Bag",			
			"Uns_PK_High_VC_Bag",
			"uns_pk_low_VC_Bag",
			"uns_MG42_VC_Bag",
			"Uns_Dshk_High_VC_Bag",
			"Uns_Dshk_Low_VC_Bag",
			"uns_SPG9_VC_Bag",
			"uns_Type36_VC_Bag",
			"Uns_M1941_82mm_Mortar_VC_Bag",		
			"Uns_PK_High_NVA_Bag",
			"uns_pk_low_NVA_Bag",
			"uns_MG42_NVA_Bag",
			"Uns_Dshk_High_NVA_Bag",
			"Uns_Dshk_Low_NVA_Bag",
			"uns_SPG9_NVA_Bag",
			"uns_Type36_NVA_Bag",
			"Uns_M1941_82mm_Mortar_NVA_Bag",
			"Uns_NVA_searchlight_Bag"
			];
			
			
_Ravage_items = selectRandom [		
			// Ravage_items
			//x1
			"rvg_plasticBottleEmpty",
			"rvg_canteenEmpty",
			"rvg_hose",
			"rvg_sleepingBag_Blue", 
			"rvg_foldedTent",
			"rvg_rustyCan",
			"rvg_Geiger",
			"rvg_canisterFuel_Empty",
			"rvg_toolkit",
			"rvg_tire",
			//x2 Vital			
			"rvg_money", 
			"rvg_notepad", 
			"rvg_docFolder",
			"rvg_canOpener",
			"rvg_guttingKnife", 
			"rvg_matches",
			"rvg_plasticBottle",
			"rvg_plasticBottlePurified", 
			"rvg_spirit", 
			"rvg_franta",
			"rvg_beans", 
			"rvg_bacon", 
			"rvg_milk", 
			"rvg_rice",
			"rvg_antiRad",
			"rvg_purificationTablets",						
			//x2 Vital
			"rvg_money", 
			"rvg_notepad", 
			"rvg_docFolder",
			"rvg_canOpener",
			"rvg_guttingKnife", 
			"rvg_matches",
			"rvg_plasticBottle",
			"rvg_plasticBottlePurified", 
			"rvg_spirit", 
			"rvg_franta",
			"rvg_beans", 
			"rvg_bacon", 
			"rvg_milk", 
			"rvg_rice",
			"rvg_antiRad",
			"rvg_purificationTablets",
			
			//addon Ravage
			"Mask_M40_OD",
			"Mask_M40",
			"Mask_M50"
			];
			
			
//________________	Position of the loot at the crashsite	________________			
_lootPos1  = _crashsite getRelPos [8, 1];
_lootPos2  = _crashsite getRelPos [8, 2];
_lootPos3  = _crashsite getRelPos [8, 3];
_lootPos4  = _crashsite getRelPos [8, 4];
_lootPos5  = _crashsite getRelPos [8, 5];
_lootPos6  = _crashsite getRelPos [8, 6];
_lootPos7  = _crashsite getRelPos [8, 7];
_lootPos8  = _crashsite getRelPos [8, 8];
_lootPos9  = _crashsite getRelPos [8, 9];
_lootPos10 = _crashsite getRelPos [8, 10];


_Object1_Pos = _crashsite getRelPos [4, 3];
//you can spawn an item next to the wreck , like an ammobox	 _Object1_Pos

_Box_container_Item_Pos = _crashsite getRelPos [4, 9];
//you can spawn an item next to the wreck , like an ammobox	 _lootPos8


//________________	you can spawn an item next to the wreck , like an ammobox	________________
_Object_array1 = [
/*
			"Box_IND_Ammo_F",
			"Box_IND_Wps_F",
			"Box_IND_AmmoOrd_F",
			"Box_IND_Grenades_F",
			"Box_IND_WpsLaunch_F",
			"Box_IND_WpsSpecial_F",
			"Box_IND_Support_F"
*/
			//Respawn
			"B_Respawn_Sleeping_bag_blue_F",
			"B_Respawn_Sleeping_bag_brown_F",
			"B_Respawn_TentDome_F",
			"B_Respawn_Sleeping_bag_F",
			"B_Respawn_TentA_F"
			];
_Object1 = selectRandom _Object_array1;
_Create_Object1 = _Object1 createVehicle _Object1_Pos;


//________________	Create a Box container at the Crashsites with random loot	 ________________ 
if (_1_Create_Box_container) then {

//	systemchat "_1_Create_Box_container";

_Box_container_array = [
			"Box_IND_Ammo_F",
			"Box_IND_Wps_F",
			"Box_IND_AmmoOrd_F",
			"Box_IND_Grenades_F",
			"Box_IND_WpsLaunch_F",
			"Box_IND_WpsSpecial_F",
			"Box_IND_Support_F",
			"Land_PlasticCase_01_large_F",
			"Land_MetalCase_01_large_F"
			];
_Box = selectRandom _Box_container_array;
_Box_container_Item = _Box createVehicle _Box_container_Item_Pos;

//________________ Clear Box container's items ________________
clearWeaponCargoGlobal _Box_container_Item;
clearMagazineCargoGlobal _Box_container_Item;
clearItemCargoGlobal _Box_container_Item;
clearBackpackCargoGlobal _Box_container_Item;


sleep 1;

//addweaponcargo	addItemCargo	addMagazineCargo

//	spawn weapons
_Box_container_Item addweaponcargo [_weapons_Loot, 2];	//	2 is the amount 

//	spawn sideweapons
_Box_container_Item addweaponcargo [_sideweapons_loot, 2];

//	spawn only mags
_Box_container_Item addweaponcargo [_weapons_Loot, 0];

//	spawn items 1
_Box_container_Item addweaponcargo [_items_loot1, 5];

//	spawn items 2 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_Box_container_Item addItemCargo [_items_loot2, 5];

//	spawn items 3 Here ONLY :Flares , Smokes , Explosives
_Box_container_Item addMagazineCargo [_items_loot3, 5];

//	spawn Clothes
_Box_container_Item addItemCargoGlobal [_Clothes_array,1];

//	spawn Vests
_Box_container_Item addItemCargoGlobal [_Vests_array,1]; 

//	spawn Backpacks
_Box_container_Item addBackpackCargoGlobal [_Backpacks_array,1]; 

//	spawn Ravage items  
_Box_container_Item addItemCargo [_Ravage_items, 2];



///////////////

// Spawn weapon's mag
_magazines_Box_container = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass_Box_container = _magazines_Box_container call bis_fnc_selectRandom; 
_Box_container_Item addMagazineCargoGlobal [_magazineClass_Box_container, 2];	//2 mags

// Spawn sideweapon's mag
_magazines_Box_container = getArray (configFile / "CfgWeapons" / _sideweapons_loot / "magazines");
_magazineClass_Box_container = _magazines_Box_container call bis_fnc_selectRandom; 
_Box_container_Item addMagazineCargoGlobal [_magazineClass_Box_container, 2];	//2 mags
	
// Spawn only magazines
_magazines_Box_container = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass_Box_container = _magazines_Box_container call bis_fnc_selectRandom; 
_Box_container_Item addMagazineCargoGlobal [_magazineClass_Box_container, 3];	//3 mags

sleep 1;

};



//________________	Create Create Loot at the Crashsites	________________ 
if (_2_Create_Loot) then {

//	systemchat "_2_Create_Loot";

sleep 1;

//addweaponcargo	addItemCargo	addMagazineCargo

//	spawn weapons
_lootitems1 = "groundweaponHolder" createVehicle _lootPos1; _lootitems1 addweaponcargo [_weapons_Loot, 1];

//	spawn sideweapons
_lootitems2 = "groundweaponHolder" createVehicle _lootPos2; _lootitems2 addweaponcargo [_sideweapons_loot, 2];

//	spawn only mags
_lootitems3 = "groundweaponHolder" createVehicle _lootPos3; _lootitems3 addweaponcargo [_weapons_Loot, 0];

//	spawn items 1
_lootitems4 = "groundweaponHolder" createVehicle _lootPos4; _lootitems4 addweaponcargo [_items_loot1, 2];

//	spawn items 2 items 2 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_lootitems5 = "groundweaponHolder" createVehicle _lootPos5; _lootitems5 addItemCargo [_items_loot2, 2];

//	spawn items 3 items 4 Here ONLY :Flares , Smokes , Explosives
_lootitems6 = "groundweaponHolder" createVehicle _lootPos6; _lootitems6 addMagazineCargo [_items_loot3, 2];

//	spawn Clothes
_lootitems7 = "groundweaponHolder" createVehicle _lootPos7; _lootitems7 addItemCargoGlobal [_Clothes_array,1];

//	spawn Vests
_lootitems8 = "groundweaponHolder" createVehicle _lootPos8; _lootitems8 addItemCargoGlobal [_Vests_array,1]; 

//	spawn Backpacks
_lootitems9 = "groundweaponHolder" createVehicle _lootPos9; _lootitems9 addBackpackCargoGlobal [_Backpacks_array,1]; 

//	spawn Ravage items  
_lootitems10 = "groundweaponHolder" createVehicle _lootPos10; _lootitems10 addItemCargo [_Ravage_items, 2];


// Spawn weapon's mag
_magazines = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass = _magazines call bis_fnc_selectRandom; 
_lootitems1 addMagazineCargoGlobal [_magazineClass, 2];	//2 mags

// Spawn sideweapon's mag
_magazines = getArray (configFile / "CfgWeapons" / _sideweapons_loot / "magazines");
_magazineClass = _magazines call bis_fnc_selectRandom; 
_lootitems2 addMagazineCargoGlobal [_magazineClass, 2];	//2 mags
	
// Spawn only magazines
_magazines = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass = _magazines call bis_fnc_selectRandom; 
_lootitems3 addMagazineCargoGlobal [_magazineClass, 3];	//3 mags

sleep 1;
};


//________________ Particles - Smoke ________________
//https://community.bistudio.com/wiki/setParticleClass
_particle1 = "#particlesource" createVehicleLocal getpos _crashsite;
_particle1 setParticleClass "MediumSmoke";
_particle1 attachTo [_crashsite,[0,0,0]];


//https://community.bistudio.com/wiki/setParticleFire
//source setParticleFire [coreIntensity, coreDistance, damageTime] 
_particle2 = "#particlesource" createVehicleLocal (getPos _crashsite);
_particle2 setParticleClass "BigDestructionSmoke";
_particle2 setParticleFire [0.3,1.0,0.1];

//MediumSmoke	ObjectDestructionSmoke	ObjectDestructionFire1Smallx
//SmallDestructionSmoke	SmallDestructionFire MediumDestructionFire MediumDestructionSmoke BigDestructionFire BigDestructionSmoke

sleep 1;

//________________ Create a Crater	(Crater , CraterLong , CraterLong_small) ________________
createVehicle ["CraterLong", getPos _crashsite, [], 0, "CAN_COLLIDE"];


//________________ Cut the grass around the Crashsites ________________ 
if (_3_Grass_Cutter) then {

//	systemchat "_3_Grass_Cutter";

_Grass_Cutter_pos = _crashsite getRelPos [12, 6];
createVehicle ["Land_ClutterCutter_large_F", _Grass_Cutter_pos, [], 0, "CAN_COLLIDE"]; 
createVehicle ["Land_ClutterCutter_large_F", _crashsite, [], 0, "CAN_COLLIDE"]; 
};



//________________ Spawn a Recon Team to move at the Crashsite position ________________
if (_4_GF_Recon_Teams) then {

//    systemchat "_4_GF_Recon_Teams";

GF_MOVE_TO_Crashsite_position = _crashsite getRelPos [0, 12];
//	define your Group 
#define GF_Recon_Group "I_Soldier_SL_F", "I_Soldier_TL_F", "I_soldier_UAV_F", "I_Soldier_M_F","I_medic_F","I_Soldier_AR_F"
        
GF_Recon_Teams = createGroup independent;
//	Spawn the group 2000 meters from the drop
GF_Recon_Teams_randomPos = [[[GF_MOVE_TO_Crashsite_position, (2000)],[]],["water","out"]] call BIS_fnc_randomPos;
GF_Recon_Teams = [GF_Recon_Teams_randomPos, independent,[GF_Recon_Group]] call BIS_fnc_spawnGroup;
GF_Recon_Teams setCombatMode "RED";    
 
 
[]spawn{    
while {true} do {
//    systemchat "Waypoint updated";
{
    deleteWaypoint [_x, 0];    
    _waypoint1 = _x addWaypoint [(GF_MOVE_TO_Crashsite_position),0];    
    _waypoint1 setWaypointType "SAD";	//	SAD 	MOVE
    _x setCombatMode "YELLOW";			//	YELLOW	RED
    _x setSpeedMode "NORMAL";			//	NORMAL	FULL
    _x allowFleeing 0;    
        }foreach [GF_Recon_Teams];
     sleep 100;
    };
};
};



};

//________________ Create a Marker for the Crashsites ________________
if (_5_Create_Markers) then {

//	systemchat "_5_Create_Markers";

//	Select your marker here:	
//	https://community.bistudio.com/wiki/cfgMarkers
{
	if (typeOf _x in GF_Wrecks_array) then 
	{
		_marker = createMarker ["Crashsite" + str(_forEachIndex), getPos _x];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_marker";	
		_marker setMarkerColor "ColorYellow";
		_marker setMarkerSize [1,1];
		_marker setMarkerText "Crashsite"; 
	}; 
} 
forEach allMissionObjects "All";
};

systemchat "C r a s h s i t e s   S p a w n e d";