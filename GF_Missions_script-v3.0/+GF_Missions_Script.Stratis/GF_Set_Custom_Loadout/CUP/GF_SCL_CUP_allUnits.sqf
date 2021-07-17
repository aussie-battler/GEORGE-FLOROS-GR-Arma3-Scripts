


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
//	this setVariable ["Var_GF_SCL_CUP_allUnits", true];
	
	
diag_log "//________________	GF Set Custom Loadout Script Initializing	_____________";
diag_log "//________________	GF_SCL_CUP_allUnits.sqf	_____________";

systemchat "GF Set Custom Loadout Script Initializing";


//________________ GF_SCL_CUP_allUnits.sqf _____________


GF_SCL_CUP_allUnits_primaryWeapon_array = [
//	LightMachineGuns
"CUP_lmg_UK59",
"CUP_arifle_RPK74",
"CUP_arifle_RPK74_45",
"CUP_arifle_RPK74M",
"CUP_arifle_MG36_camo",
"CUP_arifle_MG36_holo",				
"CUP_arifle_MG36_camo_holo",
"CUP_lmg_L110A1",
"CUP_lmg_L110A1_Aim_Laser",
"CUP_arifle_L86A2_ACOG",
"CUP_lmg_M240",			
"CUP_lmg_M240_ElcanM143",
"CUP_lmg_L7A2",
"CUP_lmg_minimipara",
"CUP_lmg_minimi",
"CUP_lmg_m249_para",
"CUP_lmg_M249_E2",
"CUP_lmg_minimi_railed",
"CUP_lmg_m249_pip1",
"CUP_lmg_m249_pip2",
"CUP_lmg_m249_pip3",
"CUP_lmg_m249_pip4",
"CUP_lmg_m249_SQuantoon",
"CUP_lmg_M249_ElcanM145_Laser",
"CUP_lmg_M249_Laser",
"CUP_lmg_M249_ANPAS13c2_Laser",
"CUP_lmg_M60E4",
"CUP_lmg_Mk48_des",
"CUP_lmg_Mk48_wdl",
"CUP_lmg_Mk48_des_Aim_Laser",
"CUP_lmg_Mk48_wdl_Aim_Laser",
"CUP_lmg_PKM",
"CUP_lmg_Pecheneg",
"CUP_lmg_Pecheneg_PScope",
			
//	Shotgun
"CUP_sgun_AA12",
"CUP_sgun_Saiga12K",
"CUP_sgun_M1014",
			
//	Grenade Launcher
"CUP_glaunch_M32",
"CUP_glaunch_M79",
"CUP_glaunch_Mk13",			
"CUP_glaunch_6G30",

//	AssaultRifles
"CUP_arifle_AK47",
"CUP_arifle_AK74",
"CUP_arifle_AK74M",
"CUP_arifle_AK74M_GL",
"CUP_arifle_AK107",
"CUP_arifle_AK107_GL",
"CUP_arifle_AKS74",
"CUP_arifle_AKS74U",
"CUP_arifle_AK74_GL",
"CUP_arifle_AKM",
"CUP_arifle_AKS",
"CUP_arifle_AKS_Gold",
"CUP_arifle_AK107_GL_kobra",
"CUP_arifle_AK107_kobra",			
"CUP_arifle_AK107_GL_pso",
"CUP_arifle_AK107_pso",
"CUP_arifle_AKS74_kobra",
"CUP_arifle_AKS74_pso",
"CUP_arifle_AKS74UN_kobra_snds",
"CUP_arifle_AKS74_Goshawk",
"CUP_arifle_AKS74_NSPU",
"CUP_arifle_AK74_GL_kobra",
"CUP_arifle_AK74M_GL_kobra",
"CUP_arifle_AK74M_kobra",
"CUP_arifle_AK74M_GL_pso",
"CUP_arifle_AK74M_pso",
"CUP_arifle_CZ805_A2",
"CUP_arifle_CZ805_A1",
"CUP_arifle_CZ805_GL",			
"CUP_arifle_CZ805_A2_Holo_Laser",
"CUP_arifle_CZ805_A1_Holo_Laser",
"CUP_arifle_CZ805_A2_Aco_Laser",
"CUP_arifle_CZ805_A1_Aco_Laser",
"CUP_arifle_CZ805_A1_MRCO_Laser",
"CUP_arifle_CZ805_A2_MRCO_Laser",
"CUP_arifle_CZ805_GL_Hamr_Laser",
"CUP_arifle_CZ805_A1_ZDDot_Laser",
"CUP_arifle_CZ805_GL_ZDDot_Laser",
"CUP_arifle_CZ805_A2_ZDDot_Flashlight_Snds",
"CUP_arifle_CZ805_B_GL",
"CUP_arifle_CZ805_B",
"CUP_arifle_CZ805B_GL_ACOG_Laser",
"CUP_arifle_FNFAL",
"CUP_arifle_FNFAL5061",
"CUP_arifle_FNFAL5062",
"CUP_arifle_FNFAL_OSW",
"CUP_arifle_FNFAL_railed",
"CUP_arifle_FNFAL_ANPVS4",
"CUP_arifle_G36A",
"CUP_arifle_G36A_camo",
"CUP_arifle_G36K",
"CUP_arifle_G36K_camo",
"CUP_arifle_G36C",
"CUP_arifle_G36C_camo",
"CUP_srifle_L129A1",
"CUP_srifle_L129A1_HG",
"CUP_arifle_G36C_holo_snds",
"CUP_arifle_G36C_camo_holo_snds",
"CUP_arifle_L85A2",
"CUP_arifle_L85A2_G",
"CUP_arifle_L85A2_NG",			
"CUP_arifle_L85A2_GL",
"CUP_arifle_L86A2",
"CUP_arifle_L85A2_Holo_laser",
"CUP_arifle_L85A2_GL_Holo_Laser",
"CUP_arifle_L85A2_SUSAT_Laser",
"CUP_arifle_L85A2_GL_SUSAT_Laser",
"CUP_arifle_L85A2_CWS_Laser",
"CUP_arifle_L85A2_ACOG_Laser",
"CUP_arifle_L85A2_GL_ACOG_Laser",
"CUP_arifle_M16A2",
"CUP_arifle_M16A2_GL",
"CUP_arifle_M16A4_Base",
"CUP_arifle_M16A4_GL",
"CUP_arifle_M16A4_Aim_Laser",
"CUP_arifle_M16A4_ACOG_Laser",
"CUP_arifle_M16A4_GL_Laser",
"CUP_arifle_M16A4_GL_ACOG_Laser",
"CUP_arifle_M4A1_BUIS_GL",
"CUP_arifle_M4A1_BUIS_camo_GL",
"CUP_arifle_M4A1_BUIS_desert_GL",
"CUP_arifle_M4A1",
"CUP_arifle_M4A1_camo",
"CUP_arifle_M4A1_black",
"CUP_arifle_M4A1_desert",
"CUP_arifle_M4A3_desert",
"CUP_arifle_M4A1_camo_Aim",
"CUP_arifle_M4A3_desert_Aim_Flashlight",
"CUP_arifle_M4A3_desert_GL_ACOG_Laser",
"CUP_arifle_M4A1_Aim",
"CUP_arifle_M4A1_camo_AIM_snds",
"CUP_arifle_M4A1_GL_Holo_Flashlight",
"CUP_arifle_M4A1_GL_ACOG_Flashlight",
"CUP_arifle_M4A1_camo_GL_Holo_Flashlight",
"CUP_arifle_M4A1_camo_GL_Holo_Flashlight_Snds",
"CUP_arifle_M4A1_LeupoldMk4MRT",
"CUP_arifle_M4A1_Aim_Laser_snds",
"CUP_arifle_M4A1_M203_Holo_Laser",
"CUP_arifle_M4A1_Holo",
"CUP_arifle_M4A1_M203_ACOG_Laser",
"CUP_arifle_M4A1_M203_ANPAS13c1_Laser",
"CUP_arifle_M4A1_Holo_Laser",
"CUP_arifle_M4A1_LeupoldMk4CQT_Laser",
"CUP_arifle_Sa58P",
"CUP_arifle_Sa58P_des",
"CUP_arifle_Sa58V",
"CUP_arifle_Sa58V_camo",
"CUP_arifle_Sa58RIS1",
"CUP_arifle_Sa58RIS2_gl",
"CUP_arifle_Sa58RIS1_des",
"CUP_arifle_Sa58RIS2",
"CUP_arifle_Sa58RIS2_camo",
"CUP_arifle_Sa58RIS1_Aco_Laser",
"CUP_arifle_Sa58RIS2_Arco_Laser",
"CUP_arifle_Sa58RIS1_camo_Aco_Laser",
"CUP_arifle_Sa58RIS2_camo_Arco_Laser",
"CUP_arifle_Sa58V_ACOG_Laser",
"CUP_arifle_Sa58V_Aim_Laser",
"CUP_arifle_Mk16_CQC",
"CUP_arifle_Mk16_CQC_FG",
"CUP_arifle_Mk16_CQC_SFG",
"CUP_arifle_Mk16_CQC_EGLM",
"CUP_arifle_Mk16_STD",
"CUP_arifle_Mk16_STD_FG",
"CUP_arifle_Mk16_STD_SFG",
"CUP_arifle_Mk16_STD_EGLM",
"CUP_arifle_Mk16_SV",
"CUP_arifle_Mk16_LeupoldMk4MRT",
"CUP_arifle_Mk16_CQC_FG_Aim_Laser_snds",
"CUP_arifle_Mk16_CQC_EGLM_Holo_Laser_mfsup",
"CUP_arifle_Mk16_CQC_SFG_Holo",
"CUP_arifle_Mk16_STD_EGLM_ACOG_Laser",
"CUP_arifle_Mk16_STD_EGLM_ANPAS13c1_Laser_mfsup",
"CUP_arifle_Mk16_STD_FG_Holo_Laser",
"CUP_arifle_Mk16_STD_FG_LeupoldMk4CQT_Laser",
"CUP_arifle_Mk17_CQC",
"CUP_arifle_Mk17_CQC_FG",
"CUP_arifle_Mk17_CQC_SFG",
"CUP_arifle_Mk17_CQC_EGLM",
"CUP_arifle_Mk17_STD",
"CUP_arifle_Mk17_STD_FG",
"CUP_arifle_Mk17_STD_SFG",
"CUP_arifle_Mk17_STD_EGLM",
"CUP_arifle_Mk20",
"CUP_arifle_Mk17_CQC_SFG_Aim_mfsup",
"CUP_arifle_Mk17_STD_FG_Aim_Laser_snds",
"CUP_arifle_Mk17_STD_EGL_ElcanSpecter_Laser",
"CUP_arifle_Mk17_STD_FG_ANPAS13c1_Laser_Snds",
"CUP_arifle_Mk20_LeupoldMk4MRT",
"CUP_arifle_Mk20_SB11420_snds",
"CUP_arifle_XM8_Carbine",
"CUP_arifle_XM8_Carbine_GL",
"CUP_arifle_xm8_sharpshooter",
"CUP_arifle_xm8_SAW",
"CUP_arifle_XM8_Compact",
"CUP_arifle_XM8_Compact_Rail",
"CUP_arifle_XM8_Compact_Holo_Flashlight",
"CUP_arifle_XM8_Railed",
"CUP_arifle_XM8_Railed_ANPAS13c1_Laser",
"CUP_arifle_XM8_Railed_ANPAS13c1_Laser_snds",
"CUP_arifle_XM8_Railed_Holo_Laser_snds",
"CUP_arifle_XM8_Carbine_FG",

//	SniperRifles
"CUP_srifle_CZ750",
"CUP_srifle_CZ750_SOS_bipod",
"CUP_srifle_CZ550",
"CUP_srifle_CZ550_rail",
"CUP_srifle_LeeEnfield",
"CUP_srifle_LeeEnfield_rail",
"CUP_srifle_M24_des",
"CUP_srifle_M24_wdl",
"CUP_srifle_M24_ghillie",
"CUP_srifle_M40A3",
"CUP_srifle_M24_des_LeupoldMk4LRT",
"CUP_srifle_M24_wdl_LeupoldMk4LRT",
"CUP_srifle_M24_ghillie_bipod",
"CUP_srifle_M40A3_bipod",
"CUP_srifle_ksvk",
"CUP_srifle_ksvk_PSO3",
"CUP_srifle_SVD",
"CUP_srifle_SVD_des",
"CUP_srifle_SVD_des_ghillie_pso",
"CUP_srifle_SVD_wdl_ghillie",
"CUP_srifle_SVD_pso",
"CUP_srifle_SVD_Des_pso",
"CUP_srifle_SVD_NSPU",
"CUP_srifle_VSSVintorez",
"CUP_srifle_VSSVintorez_pso",
"CUP_srifle_AS50",
"CUP_srifle_AS50_SBPMII",
"CUP_srifle_AS50_AMPAS13c2",
"CUP_srifle_AWM_des",
"CUP_srifle_AWM_wdl",
"CUP_srifle_G22_des",
"CUP_srifle_AWM_des_SBPMII",
"CUP_srifle_G22_des_SBPMII",
"CUP_srifle_AWM_wdl_SBPMII",
"CUP_srifle_M107_Base",
"CUP_srifle_M107_LeupoldVX3",
"CUP_srifle_M107_ANPAS13c2",
"CUP_srifle_M110",
"CUP_srifle_M110_ANPAS13c2",
"CUP_srifle_M110_ANPVS10",
"CUP_srifle_M14",
"CUP_srifle_Mk12SPR",
"CUP_srifle_Mk12SPR_LeupoldM3LR",
"CUP_srifle_Mk12SPR_LeupoldM3LR_bipod",
"CUP_arifle_M4A1_LeupoldMk4MRT"
];
	

GF_SCL_CUP_allUnits_secondaryWeapon_array = [
// Launchers
"launch_O_Vorona_brown_F",
"launch_O_Vorona_green_F",
"launch_MRAWS_green_rail_F",
"launch_MRAWS_olive_rail_F",
"launch_MRAWS_sand_rail_F",
"launch_MRAWS_green_F",	//x2
"launch_MRAWS_olive_F",
"launch_MRAWS_sand_F",
	
"launch_NLAW_F",
"launch_RPG32_F",
"launch_RPG32_ghex_F",
"launch_RPG7_F",
"launch_RPG7_F",	//x2
"launch_Titan_F",
"launch_I_Titan_F",
"launch_O_Titan_ghex_F",
"launch_O_Titan_F",
"launch_B_Titan_F",
"launch_B_Titan_tna_F",
"launch_Titan_short_F",
"launch_O_Titan_short_F",
"launch_O_Titan_short_ghex_F",
"launch_I_Titan_short_F",
"launch_B_Titan_short_F",
"launch_B_Titan_short_tna_F"
];
			
GF_SCL_CUP_allUnits_handgunWeapon_array = [
//	Pistols
"CUP_hgun_Duty",
"CUP_hgun_Duty_M3X",
"CUP_hgun_Phantom",
"CUP_hgun_Phantom_Flashlight",
"CUP_hgun_Phantom_Flashlight_snds",
"CUP_hgun_Glock17",
"CUP_hgun_glock17_flashlight",
"CUP_hgun_glock17_flashlight_snds",
"CUP_hgun_glock17_snds",
"CUP_hgun_M9",
"CUP_hgun_M9_snds",
"CUP_hgun_Makarov",
"CUP_hgun_PB6P9",
"CUP_hgun_PB6P9_snds",
"CUP_hgun_TaurusTracker455",
"CUP_hgun_TaurusTracker455_gold",
"CUP_hgun_BallisticShield_Armed",
"CUP_hgun_Colt1911",
"CUP_hgun_Colt1911_snds",
			
//	SubMachineGuns
"CUP_hgun_MicroUzi",
"CUP_hgun_MicroUzi_snds",
"CUP_smg_MP5SD6",
"CUP_smg_MP5A5",
"CUP_smg_bizon",
"CUP_smg_bizon_snds",
"CUP_smg_EVO",
"CUP_smg_EVO_MRad_Flashlight",
"CUP_smg_EVO_MRad_Flashlight_Snds",
"CUP_hgun_SA61"	
];
			
			
GF_SCL_CUP_allUnits_Civilian_Uniform_Custom_array = [
"CUP_U_O_Villager_03",
"CUP_U_O_Villager_04",
"CUP_U_I_Villager_03",
"CUP_U_I_Villager_04",
"CUP_U_C_Citizen_01",
"CUP_U_C_Citizen_02",
"CUP_U_C_Citizen_03",
"CUP_U_C_Citizen_04",
"CUP_U_C_Fireman_01",
"CUP_U_C_Policeman_01",
"CUP_U_C_Priest_01",
"CUP_U_C_Profiteer_01",
"CUP_U_C_Profiteer_02",
"CUP_U_C_Profiteer_03",
"CUP_U_C_Profiteer_04",
"CUP_U_C_Rocker_01",
"CUP_U_C_Rocker_02",
"CUP_U_C_Rocker_03",
"CUP_U_C_Rocker_04",
"CUP_U_C_Suit_01",
"CUP_U_C_Suit_02",
"CUP_U_C_Villager_01",
"CUP_U_C_Villager_04",
"CUP_U_C_Villager_02",
"CUP_U_C_Villager_03"
];


GF_SCL_CUP_allUnits_Uniform_array = [
//	Uniforms
"CUP_U_O_CHDKZ_Kam_01",
"CUP_U_O_CHDKZ_Kam_02",
"CUP_U_O_CHDKZ_Kam_03",
"CUP_U_O_CHDKZ_Kam_04",
"CUP_U_O_CHDKZ_Kam_05",
"CUP_U_O_CHDKZ_Kam_06",
"CUP_U_O_CHDKZ_Kam_07",
"CUP_U_O_CHDKZ_Commander",
"CUP_U_O_CHDKZ_Lopotev",
"CUP_U_O_CHDKZ_Bardak",
"CUP_U_O_Pilot_01",
"CUP_U_O_Worker_02",
"CUP_U_O_Woodlander_01",
"CUP_U_O_Woodlander_02",
"CUP_U_O_Woodlander_03",
"CUP_U_O_Villager_03",
"CUP_U_O_Villager_04",
"CUP_U_O_partisan_ttsko",
"CUP_U_O_partisan_ttsko_Mixed",
"CUP_U_O_partisan_vsr_Mixed1",
"CUP_U_O_partisan_vsr_Mixed2",
"CUP_U_O_RUS_Gorka_Green",
"CUP_U_O_RUS_Gorka_Partizan",
"CUP_U_O_RUS_Gorka_Partizan_A",
"CUP_U_O_RUS_Flora_1",
"CUP_U_O_RUS_Flora_2",
"CUP_U_O_RUS_Ghillie",
"CUP_U_O_RUS_Commander",
"CUP_U_O_RUS_EMR_1",
"CUP_U_O_RUS_EMR_2",
"CUP_U_O_RUS_Flora_1_VDV",
"CUP_U_O_RUS_Flora_2_VDV",
"CUP_U_O_RUS_EMR_1_VDV",
"CUP_U_O_RUS_EMR_2_VDV",
"CUP_U_O_SLA_MixedCamo",
"CUP_U_O_sla_overalls_Tank",
"CUP_U_O_sla_overalls_Pilot",
"CUP_U_O_SLA_Officer_suit",
"CUP_U_O_sla_desert",
"CUP_U_O_sla_Green",
"CUP_U_O_sla_urban",
"CUP_U_O_TK_Green",
"CUP_U_O_TK_Officer",
"CUP_U_O_TK_Ghillie_Top",
"CUP_U_O_TK_Ghillie",
"CUP_U_O_TK_MixedCamo",
"CUP_O_TKI_Khet_Partug_01",
"CUP_O_TKI_Khet_Partug_02",
"CUP_O_TKI_Khet_Partug_03",
"CUP_O_TKI_Khet_Partug_04",
"CUP_O_TKI_Khet_Partug_05",
"CUP_O_TKI_Khet_Partug_06",
"CUP_O_TKI_Khet_Partug_08",
"U_B_CombatUniform_mcam",
"U_B_CombatUniform_mcam_vest",
"U_B_CombatUniform_mcam_tshirt",
"CUP_U_B_BAF_DDPM_S1_RolledUp",
"CUP_U_B_BAF_DDPM_Tshirt",
"CUP_U_B_BAF_DDPM_S2_UnRolled",
"CUP_U_B_BAF_DDPM_Ghillie",
"CUP_U_B_BAF_MTP_S1_RolledUp",
"CUP_U_B_BAF_MTP_Tshirt",
"CUP_U_B_BAF_MTP_S2_UnRolled",
"CUP_U_B_BAF_MTP_Ghillie",
"CUP_U_B_BAF_DPM_S1_RolledUp",
"CUP_U_B_BAF_DPM_Tshirt",
"CUP_U_B_BAF_DPM_S2_UnRolled",
"CUP_U_B_BAF_DPM_Ghillie",
"CUP_U_B_GER_Tropentarn_1",	
"CUP_U_B_GER_Tropentarn_2",
"CUP_U_B_GER_Ghillie",
"CUP_U_B_USArmy_Base",
"CUP_U_B_USArmy_ubacs",
"CUP_U_B_USArmy_TwoKnee",
"CUP_U_B_USArmy_soft",
"CUP_U_B_USArmy_Ghillie",
"CUP_U_B_USArmy_PilotOverall",
"CUP_U_B_USMC_MARPAT_WDL_RolledUp",
"CUP_U_B_USMC_MARPAT_WDL_Sleeves",
"CUP_U_B_USMC_Officer",
"CUP_U_B_USMC_Ghillie_WDL",
"CUP_U_B_USMC_PilotOverall",
"CUP_U_B_FR_SpecOps",
"CUP_U_B_FR_Officer",
"CUP_U_B_FR_Scout1",
"CUP_U_B_FR_Scout2",
"CUP_U_B_FR_Scout3",
"CUP_U_B_FR_Light",
"CUP_U_B_FR_Corpsman",
"CUP_U_B_FR_DirAction",
"CUP_U_B_FR_DirAction2",
"CUP_B_USMC_Navy_Blue",
"CUP_B_USMC_Navy_Brown",
"CUP_B_USMC_Navy_Green",
"CUP_B_USMC_Navy_Red",
"CUP_B_USMC_Navy_Violet",	
"CUP_B_USMC_Navy_White",			
"CUP_B_USMC_Navy_Yellow",
"CUP_U_B_GER_Flecktarn_1",
"CUP_U_B_GER_Flecktarn_2",
"U_B_CombatUniform_mcam",
"U_B_CombatUniform_mcam_vest",
"U_B_CombatUniform_mcam_tshirt",
"U_B_GhillieSuit",
"U_B_PilotCoveralls",			
"CUP_U_I_GUE_Flecktarn",
"CUP_U_I_GUE_Flecktarn2",
"CUP_U_I_GUE_Flecktarn3",
"CUP_U_I_Pilot_01",
"CUP_U_I_Ghillie_Top",
"CUP_U_I_Leader_01",
"CUP_U_I_Worker_02",
"CUP_U_I_Woodlander_01",
"CUP_U_I_Woodlander_02",
"CUP_U_I_Woodlander_03",
"CUP_U_I_Villager_03",
"CUP_U_I_Villager_04",
"CUP_U_I_RACS_Desert_1",
"CUP_U_I_RACS_Desert_2",
"CUP_U_I_RACS_PilotOverall",
"CUP_U_I_RACS_Urban_2",
"CUP_U_I_RACS_Mech_2",
"CUP_U_I_RACS_wdl_2",
"CUP_I_TKG_Khet_Jeans_01",
"CUP_I_TKG_Khet_Jeans_02",
"CUP_I_TKG_Khet_Jeans_03",
"CUP_I_TKG_Khet_Jeans_04",
"CUP_I_TKG_Khet_Partug_01",
"CUP_I_TKG_Khet_Partug_02",
"CUP_I_TKG_Khet_Partug_03",
"CUP_I_TKG_Khet_Partug_05",
"CUP_I_TKG_Khet_Partug_06",
"CUP_I_TKG_Khet_Partug_07",
"CUP_I_TKG_Khet_Partug_08",
"CUP_U_I_GUE_Anorak_01",
"CUP_U_I_GUE_Anorak_03",
"CUP_U_I_GUE_Anorak_02",
"CUP_U_B_CDF_DST_1",
"CUP_U_B_CDF_MNT_1",
"CUP_U_B_CDF_DST_2",
"CUP_U_B_CDF_FST_2",
"CUP_U_C_Citizen_01",
"CUP_U_C_Citizen_02",
"CUP_U_C_Citizen_03",
"CUP_U_C_Citizen_04",
"CUP_U_C_Fireman_01",
"CUP_U_C_Labcoat_01",
"CUP_U_C_Labcoat_02",
"CUP_U_C_Labcoat_03",
"CUP_U_C_Mechanic_01",
"CUP_U_C_Mechanic_02",
"CUP_U_C_Mechanic_03",
"CUP_U_C_Rescuer_01",
"CUP_U_O_Partisan_TTsKO",
"CUP_U_O_Partisan_TTsKO_Mixed",
"CUP_U_O_Partisan_VSR_Mixed1",
"CUP_U_O_Partisan_VSR_Mixed2",
"CUP_U_C_Pilot_01",
"CUP_I_B_PMC_Unit_1",
"CUP_I_B_PMC_Unit_2",
"CUP_I_B_PMC_Unit_3",
"CUP_I_B_PMC_Unit_4",
"CUP_I_B_PMC_Unit_5",
"CUP_I_B_PMC_Unit_6",
"CUP_I_B_PMC_Unit_7",
"CUP_I_B_PMC_Unit_8",
"CUP_I_B_PMC_Unit_9",
"CUP_I_B_PMC_Unit_10",
"CUP_I_B_PMC_Unit_11",
"CUP_I_B_PMC_Unit_12",
"CUP_I_B_PMC_Unit_13",
"CUP_I_B_PMC_Unit_14",
"CUP_I_B_PMC_Unit_15",
"CUP_I_B_PMC_Unit_16",
"CUP_I_B_PMC_Unit_17",
"CUP_I_B_PMC_Unit_18",
"CUP_I_B_PMC_Unit_19",
"CUP_I_B_PMC_Unit_20",
"CUP_I_B_PMC_Unit_21",
"CUP_I_B_PMC_Unit_22",
"CUP_I_B_PMC_Unit_23",
"CUP_I_B_PMC_Unit_24",
"CUP_I_B_PMC_Unit_25",
"CUP_I_B_PMC_Unit_26",
"CUP_I_B_PMC_Unit_27",
"CUP_I_B_PMC_Unit_28",
"CUP_U_C_Policeman_01",
"CUP_U_C_Priest_01",
"CUP_U_C_Profiteer_01",
"CUP_U_C_Profiteer_02",
"CUP_U_C_Profiteer_03",
"CUP_U_C_Profiteer_04",
"CUP_U_C_Rocker_01",
"CUP_U_C_Rocker_02",
"CUP_U_C_Rocker_03",
"CUP_U_C_Rocker_04",
"CUP_U_C_Suit_01",
"CUP_U_C_Suit_02",
"CUP_U_B_USMC_FROG1_DMARPAT",
"CUP_U_B_USMC_FROG1_WMARPAT",
"CUP_U_B_USMC_FROG2_DMARPAT",
"CUP_U_B_USMC_FROG2_WMARPAT",
"CUP_U_B_USMC_FROG3_DMARPAT",
"CUP_U_B_USMC_FROG3_WMARPAT",
"CUP_U_B_USMC_FROG4_DMARPAT",
"CUP_U_B_USMC_FROG4_WMARPAT",
"CUP_U_C_Villager_01",
"CUP_U_C_Villager_04",
"CUP_U_C_Villager_02",
"CUP_U_C_Villager_03",
"U_I_CombatUniform",
"U_I_CombatUniform_shortsleeve",
"U_I_pilotCoveralls",
"U_I_GhillieSuit"
];

			
GF_SCL_CUP_allUnits_Vests_array =  [
//	Vests
"CUP_V_O_Ins_Carrier_Rig",
"CUP_V_O_Ins_Carrier_Rig_Com",
"CUP_V_O_Ins_Carrier_Rig_Light",
"CUP_V_O_Ins_Carrier_Rig_MG",
"CUP_V_RUS_Smersh_1",
"CUP_V_RUS_Smersh_2",
"CUP_V_RUS_6B3_1",
"CUP_V_RUS_6B3_2",
"CUP_V_RUS_6B3_3",
"CUP_V_RUS_6B3_4",
"CUP_V_O_SLA_Carrier_Belt",
"CUP_V_O_SLA_Carrier_Belt02",
"CUP_V_O_SLA_Carrier_Belt03",
"CUP_V_O_SLA_flak_vest",
"CUP_V_O_SLA_flak_vest01",
"CUP_V_O_SLA_flak_vest02",
"CUP_V_O_TK_CrewBelt",
"CUP_V_O_TK_Vest_1",
"CUP_V_O_TK_Vest_2",
"CUP_V_O_TK_OfficerBelt",
"CUP_V_OI_TKI_Jacket1_01",
"CUP_V_OI_TKI_Jacket1_02",
"CUP_V_OI_TKI_Jacket1_03",
"CUP_V_OI_TKI_Jacket2_01",
"CUP_V_OI_TKI_Jacket2_02",
"CUP_V_OI_TKI_Jacket2_03",
"CUP_V_OI_TKI_Jacket3_01",
"CUP_V_OI_TKI_Jacket3_02",
"CUP_V_OI_TKI_Jacket3_03",
"CUP_V_OI_TKI_Jacket4_01",
"CUP_V_OI_TKI_Jacket4_02",
"CUP_V_OI_TKI_Jacket4_03",
"CUP_V_O_TK_Vest_1",			
"CUP_V_BAF_Osprey_Mk2_DDPM_Soldier1",
"CUP_V_BAF_Osprey_Mk2_DDPM_Soldier2",
"CUP_V_BAF_Osprey_Mk2_DDPM_Grenadier",
"CUP_V_BAF_Osprey_Mk2_DDPM_Officer",
"CUP_V_BAF_Osprey_Mk2_DDPM_Scout",
"CUP_V_B_GER_Carrier_Vest",
"CUP_V_BAF_Osprey_Mk2_DDPM_Pilot",
"CUP_V_BAF_Osprey_Mk2_DDPM_Crewman",
"CUP_V_BAF_Osprey_Mk2_DDPM_Medic",
"CUP_V_BAF_Osprey_Mk2_DDPM_Sapper",
"CUP_V_BAF_Osprey_Mk2_DDPM_Empty",
"CUP_V_BAF_Osprey_Mk2_DPM_Soldier1",
"CUP_V_BAF_Osprey_Mk2_DPM_Soldier2",
"CUP_V_BAF_Osprey_Mk2_DPM_Grenadier",
"CUP_V_BAF_Osprey_Mk2_DPM_Empty",
"CUP_V_BAF_Osprey_Mk2_DPM_Officer",
"CUP_V_BAF_Osprey_Mk2_DPM_Scout",
"CUP_V_BAF_Osprey_Mk2_DPM_Pilot",
"CUP_V_BAF_Osprey_Mk2_DPM_Crewman",
"CUP_V_BAF_Osprey_Mk2_DPM_Medic",
"CUP_V_B_GER_Carrier_Vest",
"CUP_V_B_GER_Vest_2",
"CUP_V_B_GER_Carrier_Vest_3",
"CUP_V_B_GER_Carrier_Rig",
"CUP_V_B_IOTV_Rifleman",
"CUP_V_B_IOTV_GL",
"CUP_V_B_IOTV_SL",
"CUP_V_B_IOTV_TL",
"CUP_V_B_IOTV_AT",
"CUP_V_B_IOTV_medic",
"CUP_V_B_IOTV_SAW",
"CUP_V_B_IOTV_mg",
"CUP_V_B_USArmy_PilotVest",
"CUP_V_B_MTV",
"CUP_V_B_MTV_Patrol",
"CUP_V_B_MTV_TL",
"CUP_V_B_MTV_noCB",
"CUP_V_B_MTV_Pouches",	
"CUP_V_B_MTV_LegPouch",
"CUP_V_B_MTV_MG",
"CUP_V_B_MTV_PistolBlack",	
"CUP_V_B_MTV_Mine",
"CUP_V_B_PilotVest",
"CUP_V_B_RRV_TL",
"CUP_V_B_RRV_Officer",
"CUP_V_B_RRV_Scout",
"CUP_V_B_RRV_Scout2",
"CUP_V_B_RRV_Scout3",
"CUP_V_B_RRV_Light",
"CUP_V_B_RRV_Medic",
"CUP_V_B_RRV_MG",
"CUP_V_B_RRV_DA1",
"CUP_V_B_RRV_DA2",
"CUP_V_B_LHDVest_Blue",
"CUP_V_B_LHDVest_Brown",
"CUP_V_B_LHDVest_Green",
"CUP_V_B_LHDVest_Red",
"CUP_V_B_LHDVest_Violet",
"CUP_V_B_LHDVest_White",
"CUP_V_B_LHDVest_Yellow",				
"CUP_V_I_Carrier_Belt",
"CUP_V_I_Guerilla_Jacket",
"CUP_V_I_RACS_Carrier_Vest",
"CUP_V_I_RACS_Carrier_Vest_2",
"CUP_V_I_RACS_Carrier_Vest_3",
"CUP_V_B_PilotVest",
"CUP_V_I_RACS_Carrier_Vest_wdl_2",
"CUP_V_OI_TKI_Jacket2_04",
"CUP_V_OI_TKI_Jacket1_05",
"CUP_V_OI_TKI_Jacket4_06"		
]; 


GF_SCL_CUP_allUnits_Backpacks_array = [
//	Backpacks
"CUP_B_AGS30_Gun_Bag",
"CUP_B_AGS30_Tripod_Bag",
"CUP_B_Bergen_BAF",
"CUP_B_AlicePack_Khaki",
"CUP_B_AlicePack_Bedroll",
"CUP_B_Bergen_BAF",
"CUP_B_CivPack_WDL",
"CUP_B_ACRPara_m95",
"CUP_B_ACRScout_m95",
"CUP_B_DShkM_Gun_Bag",
"CUP_B_DShkM_TripodHigh_Bag",
"CUP_B_DShkM_TripodLow_Bag",
"CUP_B_GER_Pack_Flecktarn",
"CUP_B_GER_Pack_Tropentarn",
"CUP_B_HikingPack_Civ",
"CUP_B_Kord_Gun_Bag",
"CUP_B_Kord_Tripod_Bag",
"CUP_B_M2_Gun_Bag",
"CUP_B_M2_MiniTripod_Bag",
"CUP_B_M2_Tripod_Bag",
"CUP_B_M252_Gun_Bag",
"CUP_B_M252_Bipod_Bag",
"CUP_B_GER_Medic_Desert",
"CUP_B_GER_Medic_FLecktarn",
"CUP_B_SLA_Medicbag",
"CUP_B_TK_Medic_Desert",
"CUP_B_GER_Medic_Tropentarn",
"CUP_B_Metis_Gun_Bag",
"CUP_B_Metis_Tripod_Bag",
"CUP_B_Mk19_Gun_Bag",
"CUP_B_Mk19_Tripod_Bag",
"CUP_B_Podnos_Bipod_Bag",
"CUP_B_Podnos_Gun_Bag",
"CUP_B_RPGPack_Khaki",
"CUP_B_RUS_Backpack",
"CUP_B_SPG9_Gun_Bag",
"CUP_B_SPG9_Tripod_Bag",
"CUP_B_Tow_Gun_Bag",
"CUP_B_TOW_Tripod_Bag",
"CUP_B_UAVTerminal_Black",
"CUP_B_AssaultPack_ACU",
"CUP_B_AssaultPack_Black",
"CUP_B_AssaultPack_Coyote",
"CUP_B_MedicPack_ACU",
"CUP_B_USPack_Black",
"CUP_B_USPack_Coyote",
"CUP_B_USMC_AssaultPack",
"CUP_B_USMC_MOLLE",
"CUP_B_USMC_MOLLE_WDL",
"CUP_T10_Parachute_backpack"
];  

			
GF_SCL_CUP_allUnits_Headgear_array = [
//	RacingHelmet
"H_RacingHelmet_2_F", 
"H_RacingHelmet_3_F", 
"H_RacingHelmet_4_F",  
"H_RacingHelmet_1_blue_F", 
"H_RacingHelmet_1_green_F", 
"H_RacingHelmet_1_red_F", 
"H_RacingHelmet_1_white_F", 
"H_RacingHelmet_1_yellow_F",
"H_RacingHelmet_1_orange_F",

//	CUP Helmets
"CUP_H_ChDKZ_Beret",
"CUP_H_ChDKZ_Beanie",
"CUP_H_TK_TankerHelmet",
"CUP_H_ChDKZ_Cap",
"CUP_H_C_Beret_04",
"CUP_H_C_Ushanka_01",
"CUP_H_C_Ushanka_02",
"CUP_H_C_Ushanka_03",
"CUP_H_C_Beanie_02",
"CUP_H_SLA_BeanieGreen",
"CUP_H_SLA_BeretRed",
"CUP_H_RUS_ZSH_1",
"CUP_H_RUS_ZSH_1_Goggles",
"CUP_H_RUS_6B27_olive",
"CUP_H_RUS_Bandana_HS",
"CUP_H_RUS_Beret_VDV",
"CUP_H_RUS_Bandana_HS",
"CUP_H_RUS_Beret_Spetsnaz",
"CUP_H_RUS_6B27",
"CUP_H_RUS_ZSH_Shield_Up",	
"CUP_H_RUS_TSH_4_Brown",			
"CUP_H_SLA_Helmet",
"CUP_H_SLA_Boonie",
"CUP_H_SLA_SLCap",
"CUP_H_SLA_BeretRed",
"CUP_H_SLA_OfficerCap",
"CUP_H_SLA_Pilot_Helmet",
"CUP_H_SLA_TankerHelmet",
"CUP_H_TK_Helmet",
"CUP_H_TK_PilotHelmet",
"CUP_H_TK_TankerHelmet",
"CUP_H_TK_Beret",
"CUP_H_TKI_Lungee_01",
"CUP_H_TKI_Lungee_open_02",
"CUP_H_BAF_Helmet_1_DDPM",
"CUP_H_BAF_Helmet_Net_2_DDPM",
"CUP_H_BAF_Officer_Beret_PRR_U",
"CUP_H_BAF_Helmet_Pilot",
"CUP_H_BAF_Crew_Helmet_DDPM",
"CUP_H_BAF_Helmet_3_DDPM",
"CUP_H_BAF_Helmet_4_DDPM",
"CUP_H_BAF_Helmet_1_MTP",
"CUP_H_BAF_Helmet_Net_2_MTP",
"CUP_H_BAF_Crew_Helmet_MTP",
"CUP_H_BAF_Helmet_3_MTP",
"CUP_H_BAF_Helmet_4_MTP",	
"CUP_H_BAF_Helmet_1_DPM",
"CUP_H_BAF_Helmet_2_DPM",
"CUP_H_BAF_Helmet_3_DPM",
"CUP_H_BAF_Helmet_4_DPM",
"CUP_H_BAF_Helmet_Net_2_DPM",
"CUP_H_BAF_Crew_Helmet_DPM",
"CUP_H_Ger_Boonie_desert",
"CUP_H_USArmy_HelmetMICH",
"CUP_H_USArmy_HelmetMICH_ess",
"CUP_H_USA_cap",
"CUP_H_USArmy_HelmetMICH_headset_ess",
"CUP_H_USArmy_HelmetMICH_headset",
"CUP_H_USArmy_HelmetMICH_earpro",
"CUP_H_USArmy_HelmetMICH_earpro_ess",
"CUP_H_USMC_Crew_Helmet",
"CUP_H_USMC_Helmet_Pilot",
"CUP_H_USArmy_Helmet_ECH1_Sand",
"CUP_H_USMC_HelmetWDL",
"CUP_H_USMC_Headset_GoggleW_HelmetWDL",
"CUP_H_USMC_Officer_Cap",
"CUP_H_USMC_Headset_HelmetWDL",
"CUP_H_FR_Cap_Headset_Green",
"CUP_H_FR_BoonieWDL",
"CUP_H_FR_BandanaGreen",
"CUP_H_FR_BoonieMARPAT",
"CUP_H_FR_BeanieGreen",
"CUP_H_FR_ECH",
"CUP_H_FR_Cap_Headset_Green",
"CUP_H_FR_Headband_Headset",
"CUP_H_FR_Headset",
"CUP_H_Navy_CrewHelmet_Blue",
"CUP_H_Navy_CrewHelmet_Brown",
"CUP_H_Navy_CrewHelmet_Green",
"CUP_H_Navy_CrewHelmet_Red",
"CUP_H_Navy_CrewHelmet_Violet",
"CUP_H_Navy_CrewHelmet_White",
"CUP_H_Navy_CrewHelmet_Yellow",
"CUP_H_Ger_Boonie_Flecktarn",
"CUP_H_NAPA_Fedora",			
"CUP_H_RACS_Beret_Blue",
"CUP_H_RACS_Helmet_DES",
"CUP_H_RACS_Helmet_Headset_DES",
"CUP_H_USMC_Crew_Helmet",
"CUP_H_USMC_Helmet_Pilot",
"CUP_H_RACS_Helmet_Mech",
"CUP_H_RACS_Helmet_wdl",
"CUP_H_TKI_SkullCap_05",
"CUP_H_TKI_Lungee_04",
"CUP_H_TKI_Lungee_05",
"CUP_H_TKI_Lungee_06",
"CUP_H_TKI_Pakol_2_04",
"CUP_H_TKI_Pakol_2_05",
"CUP_H_TKI_Lungee_Open_04",
"CUP_H_TKI_Lungee_Open_06",
"H_Cap_police"
];


GF_SCL_CUP_allUnits_Goggles_array = [
//	Glasses
"G_Spectacles",
"G_Spectacles_Tinted",
"G_Combat",
"G_Lowprofile",
"G_Shades_Black",
"G_Shades_Green",
"G_Shades_Red",
"G_Squares",
"G_Squares_Tinted",
"G_Sport_BlackWhite",
"G_Sport_Blackyellow",
"G_Sport_Greenblack",
"G_Sport_Checkered",
"G_Sport_Red",
"G_Tactical_Black",
"G_Aviator",
"G_Lady_Mirror",
"G_Lady_Dark",
"G_Lady_Red",
"G_Lady_Blue",
"G_Diving",
"G_B_Diving",
"G_O_Diving",
"G_I_Diving",
"G_Goggles_VR",
"G_Balaclava_blk",
"G_Balaclava_oli",
"G_Balaclava_combat",
"G_Balaclava_lowprofile",
"G_Bandanna_blk",
"G_Bandanna_oli",
"G_Bandanna_khk",
"G_Bandanna_tan",
"G_Bandanna_beast",
"G_Bandanna_shades",
"G_Bandanna_sport",
"G_Bandanna_aviator",
"G_Shades_Blue",
"G_Sport_Blackred",
"G_Tactical_Clear",
"G_Balaclava_TI_blk_F",
"G_Balaclava_TI_tna_F",
"G_Balaclava_TI_G_blk_F",
"G_Balaclava_TI_G_tna_F",
"G_Combat_Goggles_tna_F",			
			
"CUP_RUS_Balaclava_blk",
"CUP_RUS_Balaclava_grn",
"CUP_TK_NeckScarf",
"CUP_FR_NeckScarf",
"CUP_FR_NeckScarf2"
];
			
			
GF_SCL_CUP_allUnits_items_array_1 = [
//	Vanilla			
"ToolKit",
"MediKit",
"FirstAidKit",
"FirstAidKit", 			
//	Tools
"Binocular",
"Rangefinder",			
"Laserdesignator",
"Laserdesignator_02",
"Laserdesignator_03",
"MineDetector",

//	Rangefinder
"CUP_LRTV",
"CUP_LRTV_ACR",
"CUP_Binocular_Vector"
];
	
	
GF_SCL_CUP_allUnits_items_array_2 = [
//	Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
"ItemCompass",
"ItemWatch",
"ItemRadio",
"ItemGPS",
"ItemMap",
//	x2
"ItemCompass",
"ItemWatch",
"ItemRadio",
"ItemGPS",
"ItemMap",

//	Flashlight 
"CUP_acc_Flashlight",
"CUP_acc_Flashlight_desert",
"CUP_acc_Flashlight_wdl",
"CUP_acc_XM8_light_module",
"CUP_acc_Glock17_Flashlight",
"CUP_acc_LLM",
	
//	BipodAttachments
"CUP_bipod_Harris_1A2_L",
"CUP_bipod_VLTOR_Modpod",
"bipod_01_F_snd",
"bipod_02_F_blk",
"bipod_02_F_hex",
"bipod_02_F_tan",
"bipod_03_F_blk",
"bipod_03_F_oli",
//Apex
"bipod_01_F_khk",
	
//	MuzzleAttachments
"CUP_muzzleFlash2SCAR_L",
"CUP_acc_bfa",
"CUP_muzzle_snds_G36_black",
"CUP_muzzle_snds_G36_desert",
"CUP_muzzle_snds_L85",
"CUP_muzzle_snds_M110",
"CUP_muzzle_snds_M16",
"CUP_muzzle_snds_M16_camo",
"CUP_muzzle_snds_Mk12",
"CUP_muzzle_mfsup_SCAR_L",
"CUP_muzzle_snds_SCAR_L",
"CUP_muzzle_mfsup_SCAR_H",
"CUP_muzzle_snds_SCAR_H",
"CUP_muzzle_PB6P9",
"CUP_muzzle_Bizon",
"CUP_muzzle_PBS4",
"CUP_muzzle_snds_M14",
"CUP_muzzle_snds_M9",
"CUP_muzzle_snds_MicroUzi",
"CUP_muzzle_snds_AWM",
"CUP_acc_sffh",
"CUP_muzzle_snds_XM8",
"CUP_acc_CZ_M3X",
"muzzle_snds_H_MG_blk_F",
"muzzle_snds_H_MG_khk_F",

//	OpticAttachments
"CUP_optic_CompM4",
"CUP_optic_AN_PAS_13c1",
"CUP_optic_AN_PAS_13c2",
"CUP_SVD_camo_d",
"CUP_SVD_camo_g",
"CUP_SVD_camo_d_half",
"CUP_SVD_camo_g_half",
"CUP_Mxx_camo",
"CUP_Mxx_camo_half",
"CUP_optic_RCO",
"CUP_optic_RCO_desert",
"CUP_optic_ACOG",
"CUP_optic_CWS",
"CUP_optic_Kobra",
"CUP_optic_LeupoldMk4_CQ_T",
"CUP_item_Cobalt_File",
"CUP_optic_Elcan",
"CUP_optic_Elcan_reflex",
"CUP_optic_Eotech533Grey",
"CUP_optic_Eotech533",
"CUP_optic_HoloBlack",
"CUP_optic_HoloDesert",
"CUP_optic_HoloWdl",
"CUP_optic_AN_PVS_4",
"CUP_optic_Leupold_VX3",
"CUP_optic_PSO_3",
"CUP_optic_LeupoldMk4",
"CUP_optic_SB_3_12x50_PMII",
"CUP_optic_LeupoldMk4_10x40_LRT_Desert",
"CUP_optic_LeupoldMk4_10x40_LRT_Woodland",
"CUP_optic_LeupoldM3LR",
"CUP_optic_AN_PAS_13c2",
"CUP_optic_PGO7V",
"CUP_optic_PGO7V2",
"CUP_optic_PGO7V3",
"CUP_optic_NSPU_RPG",
"CUP_optic_MAAWS_Scope",
"CUP_optic_PechenegScope",
"CUP_optic_SUSAT",
"CUP_optic_PSO_1",
"CUP_optic_LeupoldMk4_MRT_tan",
"CUP_optic_SB_11_4x20_PM",
"CUP_optic_ElcanM145",
"CUP_optic_ELCAN_SpecterDR",
"CUP_optic_AN_PAS_13c1",
"CUP_optic_AN_PVS_10",
"CUP_optic_NSPU",
"CUP_optic_SMAW_Scope",
"CUP_optic_CompM4",
"CUP_optic_CompM2_Black",
"CUP_optic_CompM2_Desert",
"CUP_optic_CompM2_Woodland2",
"CUP_optic_CompM2_Woodland",
"CUP_optic_ZDDot",
"CUP_optic_MRad",
"CUP_optic_TrijiconRx01_black",
"CUP_optic_TrijiconRx01_desert",
"CUP_optic_GOSHAWK",
//	NVG
"CUP_NVG_PVS14",
"CUP_NVG_PVS7",
"CUP_NVG_HMNVS"
];

	
GF_SCL_CUP_allUnits_items_array_3 = [
//	Flares
"Chemlight_blue",
"Chemlight_green",
"Chemlight_red",
//	Smokes
"SmokeShell",
"SmokeShellBlue",
"SmokeShellGreen",
"SmokeShellOrange",
"SmokeShellPurple",
"SmokeShellRed",
"SmokeShellYellow",
"1Rnd_Smoke_Grenade_shell",
"1Rnd_SmokeBlue_Grenade_shell",
"1Rnd_SmokeGreen_Grenade_shell",
"1Rnd_SmokeOrange_Grenade_shell",
"1Rnd_SmokePurple_Grenade_shell",
"1Rnd_SmokeRed_Grenade_shell",
"1Rnd_SmokeYellow_Grenade_shell",
"3Rnd_Smoke_Grenade_shell",
"3Rnd_SmokeBlue_Grenade_shell",
"3Rnd_SmokeGreen_Grenade_shell",
"3Rnd_SmokeOrange_Grenade_shell",
"3Rnd_SmokePurple_Grenade_shell",
"3Rnd_SmokeRed_Grenade_shell",
"3Rnd_SmokeYellow_Grenade_shell",
//	Explosives
"HandGrenade",
"MiniGrenade",
"CUP_HandGrenade_L109A1_HE",
"CUP_HandGrenade_L109A2_HE",
"CUP_HandGrenade_M67",
"CUP_HandGrenade_RGD5",
"CUP_HandGrenade_RGO",
"B_IR_Grenade",
"O_IR_Grenade",
"I_IR_Grenade",
"1Rnd_HE_Grenade_shell",
"3Rnd_HE_Grenade_shell",
"APERSBoundingMine_Range_Mag",
"APERSMine_Range_Mag",
"APERSTripMine_Wire_Mag",
"ClaymoreDirectionalMine_Remote_Mag",
"DemoCharge_Remote_Mag",
"IEDLandBig_Remote_Mag",
"IEDLandSmall_Remote_Mag",
"IEDUrbanBig_Remote_Mag",
"IEDUrbanSmall_Remote_Mag",
"SatchelCharge_Remote_Mag",
"SLAMDirectionalMine_Wire_Mag",

//	Explosives
"CUP_MineE_M",
"CUP_TimeBomb_M",
"IEDUrbanSmall_Remote_Mag",
"IEDLandSmall_Remote_Mag",
"CUP_PipeBomb_M",
"SLAMDirectionalMine_Wire_Mag",
"CUP_IED_V4_M",
"CUP_IED_V3_M",
"CUP_IED_V2_M",
"CUP_IED_V1_M",
"APERSMine_Range_Mag",
"DemoCharge_Remote_Mag",
"ClaymoreDirectionalMine_Remote_Mag",
"CUP_Mine_M"
];
			

GF_SCL_CUP_allUnits_Ravage_items_array = [		
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
GF_SCL_CUP_allUnits_ACE3_mod_Medical_array = [
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


GF_SCL_CUP_allUnits_ACE3_mod_items_array = [
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

GF_SCL_CUP_allUnits_Exclude_List = [

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


GF_SCL_CUP_allUnits_Exclude_List_Gear = [
	
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

	
				
GF_SCL_CUP_allUnits = {

	
//________________ Settings ________________
//________________ Set true or false  ________________

_Exclude_List_Gear					= true; 	//	exclude from changing their special Gear , as bagpacks or , AT  , mines , etc
	
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
	_unit setVariable ["Var_GF_SCL_CUP_allUnits",false];
}];
};


//________________	Randomize	________________

_Uniform = selectRandom GF_SCL_CUP_allUnits_Uniform_array;	//	For Civilian : GF_SCL_CUP_allUnits_Civilian_Uniform_Custom_array
_Headgear = selectRandom GF_SCL_CUP_allUnits_Headgear_array; 
_Goggles = selectRandom GF_SCL_CUP_allUnits_Goggles_array; 
_Vests = selectRandom GF_SCL_CUP_allUnits_Vests_array; 
_Backpacks = selectRandom GF_SCL_CUP_allUnits_Backpacks_array;
_primaryWeapon = selectRandom GF_SCL_CUP_allUnits_primaryWeapon_array;
_secondaryWeapon = selectRandom GF_SCL_CUP_allUnits_secondaryWeapon_array;
_handgunWeapon = selectRandom GF_SCL_CUP_allUnits_handgunWeapon_array;


//________________ addItemToVest	________________

_items_array_1_addtoVest = selectRandom GF_SCL_CUP_allUnits_items_array_1;
_items_array_2_addtoVest = selectRandom GF_SCL_CUP_allUnits_items_array_2;
_items_array_3_addtoVest = selectRandom GF_SCL_CUP_allUnits_items_array_3;
_Ravage_items_array_addtoVest = selectRandom GF_SCL_CUP_allUnits_Ravage_items_array;
_ACE3_mod_Medical_array_addtoVest = selectRandom GF_SCL_CUP_allUnits_ACE3_mod_Medical_array;
_ACE3_mod_items_array_addtoVest = selectRandom GF_SCL_CUP_allUnits_ACE3_mod_items_array;

//________________ addItemToBackpack	________________

_items_array_1_addtoBackpack = selectRandom GF_SCL_CUP_allUnits_items_array_1;
_items_array_2_addtoBackpack = selectRandom GF_SCL_CUP_allUnits_items_array_2;
_items_array_3_addtoBackpack = selectRandom GF_SCL_CUP_allUnits_items_array_3;
_Ravage_items_array_addtoBackpack = selectRandom GF_SCL_CUP_allUnits_Ravage_items_array;
_ACE3_mod_Medical_array_addtoBackpack = selectRandom GF_SCL_CUP_allUnits_ACE3_mod_Medical_array;
_ACE3_mod_items_array_addtoBackpack = selectRandom GF_SCL_CUP_allUnits_ACE3_mod_items_array;

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
	if (!((typeOf _this) in GF_SCL_CUP_allUnits_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_CUP_allUnits_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_CUP_allUnits_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_CUP_allUnits_Exclude_List_Gear)) then {
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
	if (_Add_Rarity) then {_this linkItem "ItemGPS"};
	if (_Add_Rarity) then {_this linkItem "O_UavTerminal"};
	if (_Add_Rarity) then {_this linkItem "NVGoggles_OPFOR"};
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
	if (!((typeOf _this) in GF_SCL_CUP_allUnits_Exclude_List_Gear)) then {			
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
	if (!((typeOf _this) in GF_SCL_CUP_allUnits_Exclude_List_Gear)) then {	

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


GF_SCL_CUP_allUnits_Change_Equipment_civilian = {

removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

//________________	Randomize	________________

_Uniform = selectRandom GF_SCL_CUP_allUnits_Civilian_Uniform_Custom_array;	//	GF_SCL_CUP_allUnits_Uniform_array;
_Headgear = selectRandom GF_SCL_CUP_allUnits_Headgear_array; 
_Goggles = selectRandom GF_SCL_CUP_allUnits_Goggles_array; 
_Vests = selectRandom GF_SCL_CUP_allUnits_Vests_array; 
_Backpacks = selectRandom GF_SCL_CUP_allUnits_Backpacks_array;

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
	this setVariable ["Var_GF_SCL_CUP_allUnits", true];

3.	you can also spawn this for a certain unit :
	name this unit  ex : GF_SCL_CUP_allUnits_1
	GF_SCL_CUP_allUnits_1 spawn GF_SCL_CUP_allUnits;
 
4. 	you can also spawn this for a certain unit in the Editor :
	add this in the init of a unit :
	null = this execVM "GF_SCL_CUP_allUnits\GF_SCL_CUP_allUnits.sqf";

	and add instead of the spawn code in the end :
	_this spawn GF_SCL_CUP_allUnits;
	
5.	only for player : 
	player spawn GF_SCL_CUP_allUnits;
	
6.	for everyone : 
	null = {_x spawn GF_SCL_CUP_allUnits_Spawn_Custom_Equipment;}forEach allUnits;
*/
//________________	End	________________	 



[] spawn {
	while {true} do {		
		{		
		if (
		((alive _x)) 
		&& (!(_x getVariable ["Var_GF_SCL_CUP_allUnits",false])) 
		&& (!((typeOf _x) in GF_SCL_CUP_allUnits_Exclude_List)) 
		
		/*
		//________________	You can filter the side here	________________	
		&& {((side group _x) == west || 
			(side group _x) == east || 
			(side group _x) == independent || 
			(side group _x) == civilian)}
		*/
		
		//	&& (side group _x == playerSide)
		//	&& (!(side group _x == playerSide))
		
		) then {
			
			_x spawn GF_SCL_CUP_allUnits;
			
			};						
			_x setVariable ["Var_GF_SCL_CUP_allUnits",true];
			{waitUntil {!alive _x};
			_x setVariable ["Var_GF_SCL_CUP_allUnits",false];		 
			};
		}forEach allUnits;
		sleep 5;
	};
};		


diag_log "//________________	GF Set Custom Loadout Script Initialized	_____________";
systemchat "GF Set Custom Loadout Script Initialized";