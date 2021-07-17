


//________________  Author : GEORGE FLOROS [GR] ___________ 15.12.18 _____________

/*
________________ GF Set Custom Loadout Script ________________

https://forums.bohemia.net/forums/topic/219669-gf-set-custom-loadout-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


//________________	***	Every sqf has different variables	***	________________
//________________	You can add in the init of a unit to exclude 	________________	
//	this setVariable ["Var_GF_SCL_Unsung_civilian", true];
	
		
diag_log "//________________	GF Set Custom Loadout Script Initializing	_____________";
diag_log "//________________	GF_SCL_Unsung_civilian.sqf	_____________";

systemchat "GF Set Custom Loadout Script Initializing";


//________________ GF_SCL_Unsung_civilian.sqf _____________


GF_SCL_Unsung_civilian_primaryWeapon_array = [
//	Unsung Rifles + AssaultRifles Blufor
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
//	"uns_M16_XM148",
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

//	Unsung Rifles + AssaultRifles Opfor
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
			
//	Unsung lmg Blufor
"uns_M63a_AR",
"uns_m63a_drum",
"uns_M63a_LMG",
"uns_M63asupport",
"uns_bar",
"uns_m60shorty",
"uns_m60",
"uns_m60support",
"uns_rpdsog",

//	Unsung lmg Opfor
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

//	Unsung 40 GL Blufor
"uns_ex41",
"uns_m79",
"uns_m79p"
];
	

GF_SCL_Unsung_civilian_secondaryWeapon_array = [
// Launchers
"uns_B40",
"uns_m72",
"uns_m127a1_flare",
"uns_m20_bazooka",
"uns_rpg2",
"uns_rpg7",	
"uns_sa7",
"uns_sa7b"	
];
			
GF_SCL_Unsung_civilian_handgunWeapon_array = [
//	Unsung Pistols Blufor
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

//	Unsung Pistols Opfor
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
			
//	Unsung SubMachineGuns Blufor
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

//	Unsung SubMachineGuns Opfor
"uns_PPS43",
"uns_PPS52",
"uns_k50m",
"uns_k50mdrum",
"uns_ppsh41",
"uns_STG_44",				
			
//	Unsung Shotgun Blufor
"uns_ithaca37",
"uns_m1897riot",
"uns_m1897",
"uns_model12",
"uns_m870"
];
			
			
GF_SCL_Unsung_civilian_Civilian_Uniform_Custom_array = [
"U_OG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1",
"U_BG_leader","U_I_G_resistanceLeader_F","U_Competitor","U_C_HunterBody_grn","U_OrestesBody",
"U_C_Journalist","U_Marshal","U_Rangemaster","U_I_G_Story_Protagonist_F"
];


GF_SCL_Unsung_civilian_Uniform_array = [
//	Unsung Uniforms
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

//	Vanilla		
"U_B_FullGhillie_ard",
"U_B_FullGhillie_lsh",
"U_B_FullGhillie_sard",
"U_B_GhillieSuit",		
"U_O_FullGhillie_ard",
"U_O_FullGhillie_lsh",
"U_O_FullGhillie_sard",
//	"U_O_GhillieSuit",			
"U_I_Wetsuit",
"U_O_Wetsuit",
"U_B_Wetsuit"
];

			
GF_SCL_Unsung_civilian_Vests_array =  [
//	Unsung Vests
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


GF_SCL_Unsung_civilian_Backpacks_array = [
//	Unsung Backpacks
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

//	Unsung Static weapon
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

			
GF_SCL_Unsung_civilian_Headgear_array = [
//	UnsungHeadgear
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
"UNS_Boonie2_VC"
];


GF_SCL_Unsung_civilian_Goggles_array = [
//	Glasses Vanilla
"G_Spectacles",
"G_Spectacles_Tinted",			
"G_Squares",
"G_Squares_Tinted",			
"G_Aviator",			
"G_Diving",
"G_B_Diving",
"G_O_Diving",
"G_I_Diving",
			
//	Unsung Accessories
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
];
			
			
GF_SCL_Unsung_civilian_items_array_1 = [
//	Vanilla			
"ToolKit",
"MediKit",
"FirstAidKit",
"FirstAidKit", 			

//	unsung items
"UNS_TrapKit",
"uns_binocular_navy",
"uns_binocular_army"
];
	
	
GF_SCL_Unsung_civilian_items_array_2 = [
//	Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
"ItemCompass",
"ItemWatch",
"ItemRadio",
//	"ItemGPS",
"ItemMap",

//	x2
"ItemCompass",
"ItemWatch",
"ItemRadio",
//	"ItemGPS",
"ItemMap",

//	Unsung items
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

//	Unsung MuzzleAttachments
"uns_s_M14",
"uns_s_M16",
"uns_s_Mac10",
"uns_s_M3a1",
"uns_s_UZI",
"uns_s_sten",
"uns_s_M1911",
"uns_s_PPK",
						
//	Unsung OpticAttachments
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
			
//	Unsung BipodAttachments
"uns_bp_M60",
"uns_bp_M63",
"uns_bp_DP28",
"uns_bp_MG42",
"uns_bp_M60",
"uns_bp_PKM",
"uns_bp_RPD",
"uns_bp_RPK",
"uns_bp_RPK40",

//	Gas Mask
"UNS_M17"
];

	
GF_SCL_Unsung_civilian_items_array_3 = [
//	Flares
"Chemlight_blue",
"Chemlight_green",
"Chemlight_red",

"uns_v40gren",
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
"uns_mine_ammo_mag",
"uns_mine_beer_mag",
"uns_mine_cigs_mag",
"uns_mine_fkit_mag",
"uns_mine_fuel_mag",
"uns_mine_guitar_mag",
"uns_mine_radio_mag",
"uns_M118_mag_remote",
"uns_mine_TM_mag",
"PipeBomb",
"uns_mine_m14_mag",
"uns_traps_mine_mag",
"uns_mine_AP_mag",
"uns_mine_AV_mag",
"UNS_TrapKit",
"MineE",
"Mine",
"uns_mine_AT_mag",
"uns_mine_IN_mag",
"uns_traps_nade_mag2",
"uns_traps_arty_mag",
"uns_traps_claymore_mag",
"uns_traps_claymore_remote_mag",
"uns_traps_nade_mag7",
"uns_traps_flare_mag",
"uns_traps_nade_mag3",
"uns_traps_m7_mag",
"uns_traps_nade_mag",
"uns_traps_punj2_mag",
"uns_traps_punj1_mag",
"uns_traps_punj4_mag",
"uns_traps_punj5_mag",
"uns_traps_nade_mag5",
"uns_traps_nade_mag4",
"uns_traps_nade_mag6",
"uns_ex41mag",
"uns_1Rnd_AB_M397",
"uns_1Rnd_BS_M576",
"uns_40mm_green",
"uns_40mm_mkv_Green",
"uns_40mm_yellow",
"uns_40mm_mkv_Yellow",
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
"uns_ItemFuelcan",
"uns_ItemFuelcanEmpty",
"uns_ItemSiphon",
"uns_Type36_HEmag",
"uns_OG9_HEmag",
"uns_Type36_HEATmag",
"uns_PG9_ATmag",
"uns_M40_HEATmag",
"uns_M40_HEmag",
"uns_leaflet8",
"uns_item_ashtray",
"uns_item_bugjuice",
"uns_item_bugspray",
"uns_item_camera",
"uns_item_P38",
"uns_item_dong",
"uns_leaflet2",
"uns_item_condoms",
"uns_item_messtin",
"uns_item_pin",
"uns_leaflet15",
"uns_leaflet11",
"uns_item_LRRPstew",
"uns_item_messpass",
"uns_leaflet10",
"uns_leaflet9",
"uns_item_map1",
"uns_item_map2",
"uns_leaflet1",
"uns_leaflet13",
"uns_leaflet6",
"uns_leaflet12",
"uns_leaflet5",
"uns_leaflet3",
"uns_item_MPC",
"uns_item_smokes",
"uns_leaflet4",
"uns_leaflet7",
"uns_leaflet16",
"uns_leaflet14",
"uns_item_zippo",
"uns_knife",
"uns_kabar",
"uns_ItemM57clacker",
"uns_1Rnd_M127_mag",
"Uns_1Rnd_22mm_FRAG",
"Uns_1Rnd_22mm_WP",
"Uns_1Rnd_22mm_M1a2_FRAG",
"Uns_1Rnd_22mm_smoke",
"Uns_1Rnd_22mm_HEAT",
"Uns_1Rnd_22mm_AT",
"uns_B40grenade",
"uns_m72rocket",
"uns_M28A2_mag",
"uns_M30_smoke_mag",
"uns_rpg2grenade",
"uns_rpg7grenade",
"uns_sa7mag",
"uns_sa7bmag",
"UNS_sharkchaser",
"uns_ItemSil_hgun",
"uns_ItemSil_rifle",
"Uns_1Rnd_30mm_FRAG",
"uns_Type36_WPmag",
"uns_M40_WPmag"
];
			

GF_SCL_Unsung_civilian_Ravage_items_array = [		
//	Ravage_items
//	x1
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

//	Vital			
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

//	Mask
"Mask_M40_OD",
"Mask_M40",
"Mask_M50"
];
			
//	ACE3 Class Names
//	https://ace3mod.com/wiki/class-names.html
GF_SCL_Unsung_civilian_ACE3_mod_Medical_array = [
"ACE_atropine",
"ACE_fieldDressing",
"ACE_elasticBandage",
"ACE_quikclot",
"ACE_bloodIV",
"ACE_bloodIV_500",
"ACE_bloodIV_250",
"ACE_bodyBag",
"ACE_bodyBagObject",
"ACE_epinephrine",
"ACE_morphine",
"ACE_packingBandage",
"ACE_personalAidKit",
"ACE_plasmaIV",
"ACE_plasmaIV_500",
"ACE_plasmaIV_250",
"ACE_salineIV",
"ACE_salineIV_500",
"ACE_salineIV_250",
"ACE_surgicalKit",
"ACE_tourniquet"
]; 


GF_SCL_Unsung_civilian_ACE3_mod_items_array = [
//	AtragMX
"ACE_ATragMX",

//	Captive
"ACE_CableTie",

//	Chemlights
"ACE_Chemlight_HiOrange",
"ACE_Chemlight_HiRed",
"ACE_Chemlight_HiYellow",
"ACE_Chemlight_HiWhite",
"ACE_Chemlight_Orange",
"ACE_Chemlight_White",
"ACE_Chemlight_IR",

//	Common
"ACE_Banana",

//	Concertina Wire
"ACE_ConcertinaWireCoil",
"ACE_ConcertinaWire",

//	DAGR
"ACE_DAGR",

//	Explosives
"ACE_Cellphone",
"ACE_Clacker",
"ACE_M26_Clacker",
"ACE_DefusalKit",
"ACE_DeadManSwitch",

//	Flashlights
"ACE_Flashlight_MX991",
"ACE_Flashlight_KSF1",
"ACE_Flashlight_XL50",

//	Grenades
"ACE_HandFlare_White",
"ACE_HandFlare_Red",
"ACE_HandFlare_Green",
"ACE_HandFlare_Yellow",
"ACE_M14",
"ACE_M84",

//	Gun Bag
"ACE_gunbag",
"ACE_gunbag_Tan",

//	Hearing
"ACE_EarPlugs",

//	HuntIR
"ACE_HuntIR_monitor",
"ACE_HuntIR_M203",
"ACE_HuntIR_Box",

//	Kestrel
"ACE_Kestrel4500",

//	Laser Pointers
"acc_pointer_IR",
"ACE_acc_pointer_red",
"ACE_acc_pointer_green_IR",
"ACE_acc_pointer_green",

//	ACE_acc_pointer_green
"ACE_UAVBattery",
"ACE_wirecutter",			

//	Map Tools
"ACE_MapTools",

//	MicroDAGR
"ACE_microDAGR",

//	Mine Detector
"ACE_VMH3",
"ACE_VMM3",

//	MX2A	Binocular
"ACE_MX2A",

//	Nightvision
"ACE_NVG_Gen1",
"ACE_NVG_Gen2",
"ACE_NVG_Gen4",
"ACE_NVG_Wide",

//	Optics
"ACE_optic_Arco_2D",
"ACE_optic_Arco_PIP",
"ACE_optic_LRPS_2D",
"ACE_optic_LRPS_PIP",
"ACE_optic_SOS_2D",
"ACE_optic_SOS_PIP",
"ACE_optic_MRCO_2D",
"ACE_optic_MRCO_PIP",
"ACE_optic_Hamr_2D",
"ACE_optic_Hamr_PIP",

//	Rangecard
"ACE_RangeCard",

//	ACE_Track
"ACE_Track",
"ACE_Wheel",

//	Sandbag
"ACE_Sandbag_empty",
"ACE_SandbagObject",

//	Spotting Scope
"ACE_SpottingScope",
"ACE_SpottingScopeObject",

//	Tactical Ladder
"ACE_TacticalLadder_Pack",
//	"ACE_Tactical_Ladder",

//	ACE_Tactical_Ladder
"ACE_SpraypaintBlack",
"ACE_SpraypaintBlue",
"ACE_SpraypaintGreen",
"ACE_SpraypaintRed",

//	Trenches
"ACE_EntrenchingTool",

//	Tripod
"ACE_Tripod",
"ACE_TripodObject",

//	Vehicle Lock
"ACE_key_master",
"ACE_key_lockpick",
"ACE_key_west",
"ACE_key_east",
"ACE_key_indp",
"ACE_key_civ",

//	Vector
"ACE_Vector",
"ACE_VectorDay",

//	Yardage 450
"ACE_Yardage450"
]; 


			
			
//________________	Exclude list	________________

GF_SCL_Unsung_civilian_Exclude_List = [

	//	Ravage zombies
	"zombie_bolter",
	"zombie_runner",
	"zombie_walker",
	
	"B_Pilot_F",
	"B_Fighter_Pilot_F",
	"B_Helipilot_F",
	"B_helicrew_F",
	"B_soldier_PG_F",
	
	"O_Pilot_F",
	"O_Fighter_Pilot_F",
	"O_helipilot_F",
	"O_helicrew_F",
	"O_soldier_PG_F",
	
	"I_pilot_F",
	"I_Fighter_Pilot_F",
	"I_helipilot_F",
	"I_helicrew_F"
	]; 			

	
//________________	Exclude list for Medic , AT etc 	________________
/*
In order to exclude from changing their special Gear , as bagpacks or , AT  , mines , etc
To get automatically the classnames , you can add the units in the editor , link them all togethere 
and add this code in the init of the leader unit.
grpclasses = []; {hint format["%1",(typeOf  _x)]; grpclasses = grpclasses + [(typeOf _x)]; sleep 1} foreach units group this; copyToClipboard format["%1",grpclasses];
*/


GF_SCL_Unsung_civilian_Exclude_List_Gear = [
	
	"B_support_AMG_F",
	"B_support_AMort_F",
	"B_soldier_AAA_F",	
	"B_soldier_AAT_F",
	"B_engineer_F",
	"B_soldier_exp_F",
	"B_support_GMG_F",
	"B_support_MG_F",	
	"B_support_Mort_F",
	"B_soldier_mine_F",
	"B_soldier_AA_F",
	"B_soldier_AT_F",
	"B_soldier_LAT_F",	
	"B_soldier_LAT2_F",
	"B_soldier_UAV_F",
	"B_soldier_UAV_06_F",
	"B_soldier_UAV_06_medical_F",	
	"B_Patrol_Soldier_A_F",
	"B_Patrol_Medic_F",
	"B_Patrol_Engineer_F",	
	"B_Patrol_Soldier_AT_F",
	"B_Patrol_Soldier_UAV_F",
	"B_recon_exp_F",
	"B_recon_medic_F",
	"B_recon_LAT_F",
	"B_G_Soldier_A_F",	
	"B_G_medic_F",
	"B_G_engineer_F",
	"B_G_Soldier_exp_F",
	"B_G_Soldier_LAT_F",
	"B_G_Soldier_LAT2_F",
	
	"O_Soldier_A_F",
	"O_support_AMG_F",
	"O_support_AMort_F",
	"O_Soldier_AHAT_F",
	"O_Soldier_AAA_F",
	"O_Soldier_AAT_F",
	"O_medic_F",
	"O_engineer_F",
	"O_soldier_exp_F",
	"O_support_GMG_F",
	"O_support_MG_F",
	"O_support_Mort_F",
	"O_soldier_mine_F",
	"O_Soldier_AA_F",
	"O_Soldier_AT_F",
	"O_soldier_PG_F",
	"O_soldier_repair_F",
	"O_Soldier_LAT_F",
	"O_Soldier_HAT_F",
	"O_soldier_UAV_F",
	"O_soldier_UAV_06_F",
	"O_soldier_UAV_06_medical_F",
	"O_recon_exp_F",
	"O_recon_medic_F",
	"O_recon_LAT_F",
	"O_G_medic_F",
	"O_G_engineer_F",
	"O_G_Soldier_exp_F",
	"O_G_Soldier_LAT_F",
	"O_G_Soldier_LAT2_F",	
	
	"I_support_AMG_F",
	"I_support_AMort_F",
	"I_Soldier_AAA_F",
	"I_Soldier_AAT_F",
	"I_medic_F",
	"I_engineer_F",
	"I_Soldier_exp_F",
	"I_support_GMG_F",
	"I_support_MG_F",
	"I_support_Mort_F",
	"I_soldier_mine_F",
	"I_Soldier_AA_F",
	"I_Soldier_AT_F",
	"I_Soldier_repair_F",
	"I_Soldier_LAT_F",
	"I_Soldier_LAT2_F",
	"I_soldier_UAV_F",
	"I_soldier_UAV_06_F",
	"I_soldier_UAV_06_medical_F",
	"I_G_medic_F",
	"I_G_engineer_F",
	"I_G_Soldier_exp_F",
	"I_G_Soldier_LAT_F",
	"I_G_Soldier_LAT2_F"
	]; 	

	
				
GF_SCL_Unsung_civilian = {

	
//________________ Settings ________________
//________________ Set true or false  ________________
	
_Exclude_List_Gear			= true; 	//	exclude from changing their special Gear , as bagpacks or , AT  , mines , etc
	
//________________ Clear Unit's items ________________

_Remove_Everything 					= false;	//	If true  Remove Everything	
	
//________________ or filter ________________

_removeallweapons 					= true;	//	It' s better not in order to keep the certain classes of medics , AT etc
 	
_Remove_primaryWeapon 				= true; 
_Remove_secondaryWeapon				= true;		
_Remove_handgunWeapon 				= true; 
	
_removeAllItems 					= true; 	
_clear_UniformContainer 			= true; 	
_clear_VestContainer 				= true; 
_clear_BackpackContainer 			= true;	
_removeAllAssignedItems 			= true; 

_removeUniform 						= true; 	
_removeVest 						= true; 	
_removeBackpack 					= true; 	
_removeHeadgear 					= true; 
_removeGoggles 						= true; 

//________________ _add ________________

_Link_Items							= true; 		

_AddUniform							= true;             
_addVest							= true;        
_addBackpack						= true;	       
_addHeadgear						= true; 
_addGoggles							= true; 

_Add_primaryWeapon					= true; 
_Add_primaryWeapon_Attachments		= true; 

_Add_secondaryWeapon				= true; 
_Add_secondaryWeapon_Attachments	= true; 

_Add_handgunWeapon					= true; 		
_Add_handgunWeapon_Attachments		= true; 	

_addItemToUniform					= true;  
_addItemToVest						= true; 
_addItemToBackpack					= true;         

_Magazines_in_Backpack				= true; 

_addItems_for_Ravage_mod			= true;
_addItems_for_ACE3_mod				= true;


_Add_Rarity							= floor (random 10) < 4;	
_Random_Amount 						= round (1 + random 2);

_Change_Loadout_on_Respawn			= true; 


//________________	_Change_Loadout_on_Respawn	________________	

if (_Change_Loadout_on_Respawn) then {

_this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setVariable ["Var_GF_SCL_Unsung_civilian",false];
}];
};


//________________	Randomize	________________

_Uniform = selectRandom GF_SCL_Unsung_civilian_Uniform_array;	//	For Civilian : GF_SCL_Unsung_civilian_Civilian_Uniform_Custom_array
_Headgear = selectRandom GF_SCL_Unsung_civilian_Headgear_array; 
_Goggles = selectRandom GF_SCL_Unsung_civilian_Goggles_array; 
_Vests = selectRandom GF_SCL_Unsung_civilian_Vests_array; 
_Backpacks = selectRandom GF_SCL_Unsung_civilian_Backpacks_array;
_primaryWeapon = selectRandom GF_SCL_Unsung_civilian_primaryWeapon_array;
_secondaryWeapon = selectRandom GF_SCL_Unsung_civilian_secondaryWeapon_array;
_handgunWeapon = selectRandom GF_SCL_Unsung_civilian_handgunWeapon_array;


//________________ addItemToVest	________________

_items_array_1_addtoVest = selectRandom GF_SCL_Unsung_civilian_items_array_1;
_items_array_2_addtoVest = selectRandom GF_SCL_Unsung_civilian_items_array_2;
_items_array_3_addtoVest = selectRandom GF_SCL_Unsung_civilian_items_array_3;
_Ravage_items_array_addtoVest = selectRandom GF_SCL_Unsung_civilian_Ravage_items_array;
_ACE3_mod_Medical_array_addtoVest = selectRandom GF_SCL_Unsung_civilian_ACE3_mod_Medical_array;
_ACE3_mod_items_array_addtoVest = selectRandom GF_SCL_Unsung_civilian_ACE3_mod_items_array;

//________________ addItemToBackpack	________________

_items_array_1_addtoBackpack = selectRandom GF_SCL_Unsung_civilian_items_array_1;
_items_array_2_addtoBackpack = selectRandom GF_SCL_Unsung_civilian_items_array_2;
_items_array_3_addtoBackpack = selectRandom GF_SCL_Unsung_civilian_items_array_3;
_Ravage_items_array_addtoBackpack = selectRandom GF_SCL_Unsung_civilian_Ravage_items_array;
_ACE3_mod_Medical_array_addtoBackpack = selectRandom GF_SCL_Unsung_civilian_ACE3_mod_Medical_array;
_ACE3_mod_items_array_addtoBackpack = selectRandom GF_SCL_Unsung_civilian_ACE3_mod_items_array;

//________________	add _primaryWeapon's mags	________________

_primaryWeapon_Magazines = getArray (configFile / "CfgWeapons" / _primaryWeapon / "magazines");
_Spawn_primaryWeapon_magazines = selectRandom _primaryWeapon_Magazines; 

//________________	add _secondaryWeapon's mags	________________

_secondaryWeapon_Magazines = getArray (configFile / "CfgWeapons" / _secondaryWeapon / "magazines");
_Spawn_secondaryWeapon_Magazines = selectRandom _secondaryWeapon_Magazines; 


//________________	add _handgunWeapon's mags	________________

_handgunWeapon_Magazines = getArray (configFile / "CfgWeapons" / _handgunWeapon / "magazines");
_Spawn_handgunWeapon_Magazines = selectRandom _handgunWeapon_Magazines; 


//________________	_Spawn_Magazines	________________

_Magazines = _primaryWeapon_Magazines + _secondaryWeapon_Magazines + _handgunWeapon_Magazines;
_Spawn_Magazines = selectRandom _Magazines;		


	
_UniformContainer =  UniformContainer _this;
_VestContainer = vestContainer _this;
_BackpackContainer = BackpackContainer _this;


//________________ Clear Unit's items ________________
//________________ Remove_Everything ________________

if (_Remove_Everything) then {

	removeallweapons _this;
	removeAllItems _this;
	removeAllAssignedItems _this;
	removeUniform _this;
	removeVest _this;
	removeBackpack _this;
	removeHeadgear _this;
	removeGoggles _this;	
};


//________________ or ________________

if (_removeallweapons) then {
		
	if (_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_SCL_Unsung_civilian_Exclude_List_Gear)) then {
	removeallweapons _this;
	};
	
	} else {
	removeallweapons _this;
	};
};

if (_Remove_primaryWeapon) then {
	_this removeWeapon (primaryWeapon _this);
};

if (_Remove_secondaryWeapon) then {

	if (_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_SCL_Unsung_civilian_Exclude_List_Gear)) then {
	_this removeWeapon (secondaryWeapon _this);
	};
	
	} else {
	_this removeWeapon (secondaryWeapon _this);
	};
};

if (_Remove_handgunWeapon) then {
	_this removeWeapon (handgunWeapon _this);
};

if (_removeAllItems) then {
	removeAllItems _this;
};

if (_clear_UniformContainer) then {
	clearMagazineCargoGlobal _UniformContainer;
	clearItemCargoGlobal _UniformContainer;
};

if (_clear_VestContainer) then {
	clearMagazineCargoGlobal _VestContainer;
	clearItemCargoGlobal _VestContainer;
};

if (_clear_BackpackContainer) then {

	if (_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_SCL_Unsung_civilian_Exclude_List_Gear)) then {
	clearMagazineCargoGlobal _BackpackContainer;
	clearItemCargoGlobal _BackpackContainer;
	};
	
	} else {
	clearMagazineCargoGlobal _BackpackContainer;
	clearItemCargoGlobal _BackpackContainer;
	};
};

if (_removeAllAssignedItems) then {
	removeAllAssignedItems _this;
};

if (_removeUniform) then {
	removeUniform _this;
};

if (_removeVest) then {
	removeVest _this;
};

if (_removeBackpack) then {

	if (_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_SCL_Unsung_civilian_Exclude_List_Gear)) then {
	removeBackpack _this;
	};
	
	} else {
	removeBackpack _this;
	};
};

if (_removeHeadgear) then {
	removeHeadgear _this;
};

if (_removeGoggles) then {
	removeGoggles _this;
};




//________________	Link items to their inventory	________________			

if (_Link_Items) then {
											
	//	link an item
	//	_this linkItem "ItemMap";		
			
	//	or _Add_Rarity 
	if (_Add_Rarity) then {_this linkItem "ItemMap"};
	if (_Add_Rarity) then {_this linkItem "ItemCompass"};
	if (_Add_Rarity) then {_this linkItem "ItemWatch"};
	if (_Add_Rarity) then {_this linkItem "ItemRadio"};
	
};			 


//________________	_AddUniform	________________

if (_AddUniform) then {

_this forceAddUniform _Uniform;
};


//________________ _addVest ________________

if (_addVest) then {
			
_this addVest _Vests;			
};


//________________ _addBackpack ________________

if (_addBackpack) then {			

if (_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_SCL_Unsung_civilian_Exclude_List_Gear)) then {			
	//_this addBackpack _Backpacks;	
	//	add rarity 
	if (_Add_Rarity) then {_this addBackpack _Backpacks;};	
	};
	
	} else {
	if (_Add_Rarity) then {_this addBackpack _Backpacks;};
	};
};


//________________ addHeadgear ________________

if (_addHeadgear) then {			
			
_this addHeadgear _Headgear;										
};


//________________ _addGoggles ________________

if (_addGoggles) then {			
			
_this addGoggles _Goggles;					
};


//________________	add _primaryWeapon	________________

if (_Add_primaryWeapon) then {			
	
_this addWeapon _primaryWeapon;
};


//________________	addPrimaryWeaponItem	________________	

if (_Add_primaryWeapon_Attachments) then {

//________________	add _primaryWeapon's compatible attachments	________________

_primaryWeapon_MuzzleSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
if (count _primaryWeapon_MuzzleSlot >= 1) then {_primaryWeapon_Muzzle = selectRandom _primaryWeapon_MuzzleSlot;
if (_Add_Rarity) then {_this addPrimaryWeaponItem _primaryWeapon_Muzzle;};}; 

_primaryWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _primaryWeapon_CowsSlot >= 1) then {_primaryWeapon_Optic = selectRandom _primaryWeapon_CowsSlot;
if (_Add_Rarity) then {_this addPrimaryWeaponItem _primaryWeapon_Optic;};}; 

_primaryWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _primaryWeapon_PointerSlot >= 1) then {_primaryWeapon_Pointer = selectRandom _primaryWeapon_PointerSlot;
if (_Add_Rarity) then {_this addPrimaryWeaponItem _primaryWeapon_Pointer;};}; 

_primaryWeapon_UnderBarrelSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
if (count _primaryWeapon_UnderBarrelSlot >= 1) then {_primaryWeapon_UnderBarrel = selectRandom _primaryWeapon_UnderBarrelSlot;
if (_Add_Rarity) then {_this addPrimaryWeaponItem _primaryWeapon_UnderBarrel;};}; 
};


//________________	_Add_secondaryWeapon	________________

if (_Add_secondaryWeapon) then {			

if (_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_SCL_Unsung_civilian_Exclude_List_Gear)) then {	

	//	add rarity 
	if (_Add_Rarity) then {
	
	_has_Backpack = backpack _this;
	if (_has_Backpack isequalto [])  then {
	_this addBackpack _Backpacks;
	};
	_this addWeapon _secondaryWeapon;
	for "_i" from 0 to 3 do {_this addItemToBackpack _Spawn_secondaryWeapon_Magazines;};
	};	
	};
	} else {
	
	_has_Backpack = backpack _this;
	if (_has_Backpack isequalto [])  then {
	_this addBackpack _Backpacks;
	};
	_this addWeapon _secondaryWeapon;
	for "_i" from 0 to 3 do {_this addItemToBackpack _Spawn_secondaryWeapon_Magazines;};
	};
};


//________________	addSecondaryWeaponItem	________________	

if (_Add_secondaryWeapon_Attachments) then {

//________________	add _secondaryWeapon 's compatible attachments	________________

_secondaryWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _secondaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _secondaryWeapon_CowsSlot >= 1) then {_secondaryWeapon_Optic = selectRandom _secondaryWeapon_CowsSlot;
if (_Add_Rarity) then {_this addSecondaryWeaponItem _secondaryWeapon_Optic;};}; 

_secondaryWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _secondaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _secondaryWeapon_PointerSlot >= 1) then {_secondaryWeapon_Pointer = selectRandom _secondaryWeapon_PointerSlot;
if (_Add_Rarity) then {_this addSecondaryWeaponItem _secondaryWeapon_Pointer;};}; 
};

//________________	add _handgunWeapon	________________

if (_Add_handgunWeapon) then {

_this addWeapon _handgunWeapon; 
};


//________________	addHandgunItem	________________

if (_Add_handgunWeapon_Attachments) then {

//________________	add _handgunWeapon's compatible attachments	________________

_handgunWeapon_MuzzleSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
if (count _handgunWeapon_MuzzleSlot >= 1) then {_handgunWeapon_Muzzle = selectRandom _handgunWeapon_MuzzleSlot;
if (_Add_Rarity) then {_this addHandgunItem _handgunWeapon_Muzzle;};}; 

_handgunWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _handgunWeapon_CowsSlot >= 1) then {_handgunWeapon_Optic = selectRandom _handgunWeapon_CowsSlot;
if (_Add_Rarity) then {_this addHandgunItem _handgunWeapon_Optic;};}; 

_handgunWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _handgunWeapon_PointerSlot >= 1) then {_handgunWeapon_Pointer = selectRandom _handgunWeapon_PointerSlot;
if (_Add_Rarity) then {_this addHandgunItem _handgunWeapon_Pointer;};}; 
};


//________________	addItemToUniform	________________

if (_addItemToUniform) then {

for "_i" from 1 to 1 do {_this addItemToUniform "FirstAidKit";};
for "_i" from 1 to 2 do {_this addItemToUniform _Spawn_handgunWeapon_Magazines;};
};


//________________	addItemToVest	________________

if (_addItemToVest) then {

for "_i" from 1 to 6 do {_this addItemToVest _Spawn_primaryWeapon_magazines;};
for "_i" from 1 to 1 do {_this addItemToVest "FirstAidKit";};
for "_i" from 1 to 1 do {_this addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 1 do {_this addItemToVest "SmokeShell";};

if (_Add_Rarity) then {_this addItemToVest _items_array_1_addtoVest;};
if (_Add_Rarity) then {_this addItemToVest _items_array_2_addtoVest;};
if (_Add_Rarity) then {_this addItemToVest _items_array_3_addtoVest;};

if (_addItems_for_Ravage_mod) then {
if (_Add_Rarity) then {_this addItemToVest _Ravage_items_array_addtoVest;};
};

if (_addItems_for_ACE3_mod) then {
if (_Add_Rarity) then {_this addItemToVest _ACE3_mod_Medical_array_addtoVest;};
if (_Add_Rarity) then {_this addItemToVest _ACE3_mod_items_array_addtoVest;};
};

//________________	vestContainer	________________
if (_Add_Rarity) then {_VestContainer addItemCargoGlobal [_items_array_3_addtoVest, _Random_Amount];};

if (_addItems_for_Ravage_mod) then {
if (_Add_Rarity) then {_VestContainer addItemCargoGlobal [_Ravage_items_array_addtoVest, _Random_Amount];};
};

if (_addItems_for_ACE3_mod) then {
if (_Add_Rarity) then {_VestContainer addItemCargoGlobal [_ACE3_mod_Medical_array_addtoVest, _Random_Amount];};
if (_Add_Rarity) then {_VestContainer addItemCargoGlobal [_ACE3_mod_items_array_addtoVest, _Random_Amount];};
};
};


//________________	addItemToBackpack	________________

if (_addItemToBackpack) then {

if (_Add_Rarity) then {_this addItemToBackpack _items_array_1_addtoBackpack;};
if (_Add_Rarity) then {_this addItemToBackpack _items_array_2_addtoBackpack;};
if (_Add_Rarity) then {_this addItemToBackpack _items_array_3_addtoBackpack;};

if (_addItems_for_Ravage_mod) then {
if (_Add_Rarity) then {_this addItemToBackpack _Ravage_items_array_addtoBackpack;};
};

if (_addItems_for_ACE3_mod) then {
if (_Add_Rarity) then {_this addItemToBackpack _ACE3_mod_Medical_array_addtoBackpack;};
if (_Add_Rarity) then {_this addItemToBackpack _ACE3_mod_items_array_addtoBackpack;};
};

if (_Add_Rarity) then {_BackpackContainer addItemCargoGlobal [_items_array_3_addtoBackpack, _Random_Amount];};

if (_addItems_for_Ravage_mod) then {
if (_Add_Rarity) then {_BackpackContainer addItemCargoGlobal [_Ravage_items_array_addtoBackpack, _Random_Amount];};
};

if (_addItems_for_ACE3_mod) then {
if (_Add_Rarity) then {_BackpackContainer addItemCargoGlobal [_ACE3_mod_Medical_array_addtoBackpack, _Random_Amount];};
if (_Add_Rarity) then {_BackpackContainer addItemCargoGlobal [_ACE3_mod_items_array_addtoBackpack, _Random_Amount];};
};
};


//________________	_Magazines_in_Backpack	________________	

if (_Magazines_in_Backpack) then {

_BackpackContainer	= BackpackContainer _this;
//________________	_Spawn_Magazines	________________
_BackpackContainer addMagazineCargoGlobal [_Spawn_Magazines, _Random_Amount];	
};	


//________________	reload handgunWeapon	________________

_this selectweapon handgunWeapon _this;
sleep 3;
reload _this;
sleep 8; 

//________________	reload primaryWeapon	________________

_this selectweapon primaryWeapon _this;
sleep 3;
reload _this;
sleep 8;

//________________	reload secondaryWeapon	________________

_this selectweapon secondaryWeapon _this;
sleep 3;
reload _this;

};
//________________	*** End *** 	________________	
	


//________________	This are extra	________________


GF_SCL_Unsung_civilian_Change_Equipment_civilian = {

removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

//________________	Randomize	________________

_Uniform = selectRandom GF_SCL_Unsung_civilian_Civilian_Uniform_Custom_array;	//	GF_SCL_Unsung_civilian_Uniform_array;
_Headgear = selectRandom GF_SCL_Unsung_civilian_Headgear_array; 
_Goggles = selectRandom GF_SCL_Unsung_civilian_Goggles_array; 
_Vests = selectRandom GF_SCL_Unsung_civilian_Vests_array; 
_Backpacks = selectRandom GF_SCL_Unsung_civilian_Backpacks_array;

_this forceAddUniform _Uniform;
_this addHeadgear _Headgear;
_this addGoggles _Goggles;

//	add rarity 
if (floor (random 10) < 4) then {_this addVest _Vests;};
if (floor (random 10) < 3) then {_this addBackpack _Backpacks;};
};






//________________	Informations about exlude or spawn	________________	 
/*
In order to exlude or spawn , you can do it with many ways:

1.	You can  write the classnames in the Exclude lists ,

2.	you can add in the init of the unit :
	this setVariable ["Var_GF_SCL_Unsung_civilian", true];

3.	you can also spawn this for a certain unit :
	name this unit  ex : GF_SCL_Unsung_civilian_1
	GF_SCL_Unsung_civilian_1 spawn GF_SCL_Unsung_civilian;
 
4. 	you can also spawn this for a certain unit in the Editor :
	add this in the init of a unit :
	null = this execVM "GF_SCL_Unsung_civilian\GF_SCL_Unsung_civilian.sqf";

	and add instead of the spawn code in the end :
	_this spawn GF_SCL_Unsung_civilian;
	
5.	only for player : 
	player spawn GF_SCL_Unsung_civilian;
	
6.	for everyone : 
	null = {_x spawn GF_SCL_Unsung_civilian_Spawn_Custom_Equipment;}forEach allUnits;
*/
//________________	End	________________	 



[] spawn {
	while {true} do {		
		{		
		if (
		((alive _x)) 
		&& (!(_x getVariable ["Var_GF_SCL_Unsung_civilian",false])) 
		&& (!((typeOf _x) in GF_SCL_Unsung_civilian_Exclude_List)) 
		
		/*
		//________________	You can filter the side here	________________	
		&& {((side group _x) == west || 
			(side group _x) == east || 
			(side group _x) == independent || 
			(side group _x) == civilian)}
		*/
		
		//	&& (side group _x == playerSide)
		//	&& (!(side group _x == playerSide))
		
		&& (side group _x == civilian)
		
		) then {
			
			_x spawn GF_SCL_Unsung_civilian;
			
			};						
			_x setVariable ["Var_GF_SCL_Unsung_civilian",true];
			{waitUntil {!alive _x};
			_x setVariable ["Var_GF_SCL_Unsung_civilian",false];		 
			};
		}forEach allUnits;
		sleep 5;
	};
};		


diag_log "//________________	GF Set Custom Loadout Script Initialized	_____________";
systemchat "GF Set Custom Loadout Script Initialized";