


//________________  Author : GEORGE FLOROS [GR] ___________ 16.12.18 _____________

/*
________________ GF Missions Script ________________

https://forums.bohemia.net/forums/topic/219080-gf-missions-script/

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


//________________ Missions Settings _____________
//________________ Set true or false  _____________

//________________ You can disable them completly in the Missions_init _____________

_EOS_Spawn 					= true;					
_DAC_Spawn 					= true;					
_Custom_Spawn 				= true;					




sleep GF_Missions_Wait_Time;

diag_log "//________________	15_Big_Search_Crashsite.sqf	Initializing	_____________";
diag_log "________________	taskSetState	15_Big_Search_Crashsite_1	________________";
diag_log "________________	taskSetState	15_Big_Search_Crashsite_2	________________";


if (GF_Missions_Systemchat_info) then {
systemchat "15_Big_Search_Crashsite Initializing";
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Select the spawn Position	________________
/*
//________________	To use this add	________________
GF_Missions_pos = [] call GF_Missions_Pos_isFlatEmpty;	

//________________	There is a test spawn inside the script	________________
//________________	uncomment and use ex : 	________________ 
[]spawn GF_Missions_Pos_isFlatEmpty;

GF_Missions_Pos_isEmpty
GF_Missions_Pos_isFlat
GF_Missions_Pos_isFlatEmpty

GF_Missions_Pos_Random_Building
GF_Missions_Pos_Residential

GF_Missions_Pos_Airport_Tanoa_Only
GF_Missions_Pos_Hill
GF_Missions_Pos_Mount
GF_Missions_Pos_NameCity
GF_Missions_Pos_NameCityCapital
GF_Missions_Pos_NameLocal
GF_Missions_Pos_NameMarine
GF_Missions_Pos_NameVillage

GF_Missions_Pos_ShoreLine_Shore
GF_Missions_Pos_ShoreLine_Water
GF_Missions_Pos_Found
*/


//________________	Select the spawn Position	________________

GF_Missions_pos = [] call GF_Missions_Pos_NameLocal;


waitUntil {GF_Missions_pos_initialized};
waitUntil {time >5};

//________________	This will be used for DAC and any other position will be as	 _2 , _3 , etc	________________
_Pos_1 = GF_Missions_pos;



//________________	Spawn Objects	________________


//________________ GF Crashsites Script _____________

//________________ Settings ________________
//________________ Set true or false  ________________

_1_Create_Box_container		= false;		//	Create a Box container at the Crashsites with random loot	
_2_Create_Loot				= true;		//	Create Create Loot at the Crashsites	
_3_Grass_Cutter				= true;		//	Cut the grass around the Crashsites 

	
//________________ Wrecks at the crashsites ________________

//Wrecks at the crashsites
_Wrecks_array = [
			"Plane_Fighter_03_wreck_F",
			"Land_UWreck_Heli_Attack_02_F",
			"Land_Wreck_Heli_Attack_01_F",
			"Land_Wreck_Heli_Attack_02_F",
			"Land_Wreck_Plane_Transport_01_F",
			"Plane_Fighter_01_wreck_F",
			"Plane_Fighter_02_wreck_F",
			"Plane_Fighter_04_wreck_F"
			];
_Wrecks = selectRandom _Wrecks_array;

_Building = _Wrecks createVehicle _Pos_1;


//________________	Type of loot	________________
_weapons_Loot = selectRandom [
			//LightMachineGuns
			"arifle_MX_SW_Black_F",
			"arifle_MX_SW_F",
			"LMG_Mk200_F",
			"LMG_Zafir_F",
			"LMG_03_F",				
			"MMG_01_hex_F",
			"MMG_01_tan_F",
			"MMG_02_black_F",
			"MMG_02_camo_F",
			"MMG_02_sand_F",
			//Apex
			"LMG_03_F",

			//AssaultRifles
			"arifle_Katiba_C_F",
			"arifle_Katiba_F",
			"arifle_Katiba_GL_F",
			"arifle_Mk20_F",
			"arifle_Mk20_GL_F",
			"arifle_Mk20_GL_plain_F",
			"arifle_Mk20_plain_F",
			"arifle_Mk20C_F",
			"arifle_Mk20C_plain_F",
			"arifle_MX_Black_F",
			"arifle_MX_F",
			"arifle_MX_GL_Black_F",
			"arifle_MX_GL_F",
			"arifle_MXC_Black_F",
			"arifle_MXC_F",
			"arifle_SDAR_F",
			"arifle_TRG20_F",
			"arifle_TRG21_F",
			"arifle_TRG21_GL_F",			
			//Apex AssaultRifles
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			//AK x2
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			//
			"arifle_ARX_blk_F",
			"arifle_ARX_ghex_F",
			"arifle_ARX_hex_F",
			"arifle_CTAR_blk_F",
			"arifle_CTAR_hex_F",
			"arifle_CTAR_ghex_F",
			"arifle_CTAR_GL_blk_F",
			"arifle_CTARS_blk_F",
			"arifle_CTARS_hex_F",
			"arifle_CTARS_ghex_F",
			"arifle_SPAR_01_blk_F",
			"arifle_SPAR_01_khk_F",
			"arifle_SPAR_01_snd_F",
			"arifle_SPAR_01_GL_blk_F",
			"arifle_SPAR_01_GL_khk_F",
			"arifle_SPAR_01_GL_snd_F",
			"arifle_SPAR_02_blk_F",
			"arifle_SPAR_02_khk_F",
			"arifle_SPAR_02_snd_F",			
			"arifle_SPAR_03_blk_F",
			"arifle_SPAR_03_khk_F",
			"arifle_SPAR_03_snd_F",
			"arifle_MX_khk_F",
			"arifle_MX_GL_khk_F",
			"arifle_MXC_khk_F",
			"arifle_MXM_khk_F",

			//SniperRifles
			"arifle_MXM_Black_F",
			"arifle_MXM_F",
			"srifle_DMR_01_F",
			"srifle_DMR_02_camo_F",
			"srifle_DMR_02_F",
			"srifle_DMR_02_sniper_F",
			"srifle_DMR_03_F",
			"srifle_DMR_03_khaki_F",
			"srifle_DMR_03_multicam_F",
			"srifle_DMR_03_tan_F",
			"srifle_DMR_03_woodland_F",
			"srifle_DMR_04_F",
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_05_blk_F",
			"srifle_DMR_05_hex_F",
			"srifle_DMR_05_tan_f",
			"srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F",
			"srifle_EBR_F",
			"srifle_GM6_camo_F",
			"srifle_GM6_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_F",			
			//Apex SniperRifles
			"srifle_LRR_tna_F",
			"srifle_GM6_ghex_F",
			"srifle_DMR_07_blk_F",
			"srifle_DMR_07_hex_F",
			"srifle_DMR_07_ghex_F",
			
			// Launchers
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
			

_sideweapons_loot = selectRandom [
			//Pistols
			"hgun_ACPC2_F",
			"hgun_P07_F",
			"hgun_Pistol_heavy_01_F",
			"hgun_Pistol_heavy_02_F",
			"hgun_Pistol_Signal_F",
			"hgun_Rook40_F",
			//Apex
			"hgun_Pistol_01_F",
			"hgun_P07_khk_F",

			//SubMachineGuns
			"hgun_PDW2000_F",
			"SMG_01_F",
			"SMG_02_F",
			"SMG_05_F"		
			];


_items_loot1 = selectRandom [
			//for RyanZombies
			//"RyanZombiesAntiVirusTemporary_Item",
			//"RyanZombiesAntiVirusCure_Item",
			
			//Vanilla			
			"ToolKit",
			"MediKit",
			"FirstAidKit",
			"FirstAidKit", 			
			//Tools
			"Binocular",
			"Rangefinder",			
			"Laserdesignator",
			"Laserdesignator_02",
			"Laserdesignator_03"
			];
	
	
_items_loot2 = selectRandom [
			//Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"ItemMap",
			//x2
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"ItemMap",
			//PointerAttachments
			"acc_flashlight",
			"acc_pointer_IR",
			//BipodAttachments
			"bipod_01_F_blk",
			"bipod_01_F_mtp",
			"bipod_01_F_snd",
			"bipod_02_F_blk",
			"bipod_02_F_hex",
			"bipod_02_F_tan",
			"bipod_03_F_blk",
			"bipod_03_F_oli",
			//Apex
			"bipod_01_F_khk",
			//MuzzleAttachments
			"muzzle_snds_338_black",
			"muzzle_snds_338_green",
			"muzzle_snds_338_sand",
			"muzzle_snds_93mmg",
			"muzzle_snds_93mmg_tan",
			"muzzle_snds_acp",
			"muzzle_snds_B",
			"muzzle_snds_H",
			"muzzle_snds_H_MG",
			"muzzle_snds_H_SW",
			"muzzle_snds_L",
			"muzzle_snds_M",
			//Apex
			"muzzle_snds_H_khk_F",
			"muzzle_snds_H_snd_F",
			"muzzle_snds_58_blk_F",
			"muzzle_snds_m_khk_F",
			"muzzle_snds_m_snd_F",
			"muzzle_snds_B_khk_F",
			"muzzle_snds_B_snd_F",
			"muzzle_snds_58_wdm_F",
			"muzzle_snds_65_TI_blk_F",
			"muzzle_snds_65_TI_hex_F",
			"muzzle_snds_65_TI_ghex_F",
			"muzzle_snds_H_MG_blk_F",
			"muzzle_snds_H_MG_khk_F",
			//OpticAttachments
			"optic_Aco",
			"optic_ACO_grn",
			"optic_ACO_grn_smg",
			"optic_Aco_smg",
			"optic_AMS",
			"optic_AMS_khk",
			"optic_AMS_snd",
			"optic_Arco",
			"optic_DMS",
			"optic_Hamr",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_KHS_blk",
			"optic_KHS_hex",
			"optic_KHS_old",
			"optic_KHS_tan",
			"optic_LRPS",
			"optic_MRCO",
			"optic_MRD",
			"optic_Nightstalker",
			"optic_NVS",
			"optic_SOS",
			"optic_tws",
			"optic_tws_mg",
			"optic_Yorris",
			//Apex
			"optic_Arco_blk_F",
			"optic_Arco_ghex_F",
			"optic_DMS_ghex_F",
			"optic_Hamr_khk_F",
			"optic_ERCO_blk_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_snd_F",
			"optic_SOS_khk_F",
			"optic_LRPS_tna_F",
			"optic_LRPS_ghex_F",
			"optic_Holosight_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_smg_blk_F",
			
			//NVG
			"NVGoggles",
			"NVGoggles_INDEP",
			"NVGoggles_OPFOR",
			//Apex
			"O_NVGoggles_hex_F",
			"O_NVGoggles_urb_F",
			"O_NVGoggles_ghex_F",
			"NVGoggles_tna_F"
			];

	
_items_loot3 = selectRandom [
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
			//Explosives
			"HandGrenade",
			"MiniGrenade",
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
			"SLAMDirectionalMine_Wire_Mag"
			];
			

_Clothes_array = selectRandom [
			"U_C_Journalist",
			"U_C_Poloshirt_blue",
			"U_C_Poloshirt_burgundy",
			"U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped",
			"U_C_Poloshirt_tricolour",
			"U_C_Poor_1",
			"U_C_Poor_2",
			"U_C_Poor_shorts_1",
			"U_C_Scientist",
			"U_OrestesBody",
			"U_Rangemaster",
			"U_NikosAgedBody",
			"U_NikosBody",
			"U_Competitor",
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_CombatUniform_mcam_worn",
			"U_B_CTRG_1",
			"U_B_CTRG_2",
			"U_B_CTRG_3",
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve",
			"U_I_CombatUniform_tshirt",
			"U_I_OfficerUniform",
			"U_O_CombatUniform_ocamo",
			"U_O_CombatUniform_oucamo",
			"U_O_OfficerUniform_ocamo",
			"U_B_SpecopsUniform_sgg",
			"U_O_SpecopsUniform_blk",
			"U_O_SpecopsUniform_ocamo",
			"U_I_G_Story_Protagonist_F",
			"U_C_HunterBody_grn",
			"U_IG_Guerilla1_1",
			"U_IG_Guerilla2_1",
			"U_IG_Guerilla2_2",
			"U_IG_Guerilla2_3",
			"U_IG_Guerilla3_1",
			"U_BG_Guerilla2_1",
			"U_IG_Guerilla3_2",
			"U_BG_Guerrilla_6_1",
			"U_BG_Guerilla1_1",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_3",
			"U_BG_Guerilla3_1",
			"U_BG_leader",
			"U_IG_leader",
			"U_I_G_resistanceLeader_F",
			
			"U_B_FullGhillie_ard",
			"U_B_FullGhillie_lsh",
			"U_B_FullGhillie_sard",
			"U_B_GhillieSuit",
			"U_I_FullGhillie_ard",
			"U_I_FullGhillie_lsh",
			"U_I_FullGhillie_sard",
			"U_I_GhillieSuit",
			"U_O_FullGhillie_ard",
			"U_O_FullGhillie_lsh",
			"U_O_FullGhillie_sard",
			"U_O_GhillieSuit",
			
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit",
			"U_B_survival_uniform",
			"U_B_HeliPilotCoveralls",
			"U_I_HeliPilotCoveralls",
			"U_B_PilotCoveralls",
			"U_I_pilotCoveralls",
			"U_O_PilotCoveralls",

			"U_B_T_Soldier_F",
			"U_B_T_Soldier_AR_F",
			"U_B_T_Soldier_SL_F",
			
			"U_B_T_Sniper_F",
			"U_B_T_FullGhillie_tna_F",
			
			"U_B_CTRG_Soldier_F",
			"U_B_CTRG_Soldier_2_F",
			"U_B_CTRG_Soldier_3_F",
			"U_B_GEN_Soldier_F",
			"U_B_GEN_Commander_F",
			"U_O_T_Soldier_F",
			"U_O_T_Officer_F",
			
			"U_O_T_Sniper_F",
			"U_O_T_FullGhillie_tna_F",
			
			"U_O_V_Soldier_Viper_F",
			"U_O_V_Soldier_Viper_hex_F",
			"U_I_C_Soldier_Para_1_F",
			"U_I_C_Soldier_Para_2_F",
			"U_I_C_Soldier_Para_3_F",
			"U_I_C_Soldier_Para_4_F",
			"U_I_C_Soldier_Para_5_F",
			"U_I_C_Soldier_Bandit_1_F",
			"U_I_C_Soldier_Bandit_2_F",
			"U_I_C_Soldier_Bandit_3_F",
			"U_I_C_Soldier_Bandit_4_F",
			"U_I_C_Soldier_Bandit_5_F",
			"U_I_C_Soldier_Camo_F",
			"U_C_man_sport_1_F",
			"U_C_man_sport_2_F",
			"U_C_man_sport_3_F",
			"U_C_Man_casual_1_F",
			"U_C_Man_casual_2_F",
			"U_C_Man_casual_3_F",
			"U_C_Man_casual_4_F",
			"U_C_Man_casual_5_F",
			"U_C_Man_casual_6_F",
			"U_B_CTRG_Soldier_urb_1_F",
			"U_B_CTRG_Soldier_urb_2_F",
			"U_B_CTRG_Soldier_urb_3_F",

			"H_Cap_blk",
			"H_Cap_blk_Raven",
			"H_Cap_blu",
			"H_Cap_brn_SPECOPS",
			"H_Cap_grn",
			"H_Cap_headphones",
			"H_Cap_khaki_specops_UK",
			"H_Cap_oli",
			"H_Cap_press",
			"H_Cap_red",
			"H_Cap_tan",
			"H_Cap_tan_specops_US",
			"H_Watchcap_blk",
			"H_Watchcap_camo",
			"H_Watchcap_khk",
			"H_Watchcap_sgg",
			"H_MilCap_blue",
			"H_MilCap_dgtl",
			"H_MilCap_mcamo",
			"H_MilCap_ocamo",
			"H_MilCap_oucamo",
			"H_MilCap_rucamo",
			"H_Bandanna_camo",
			"H_Bandanna_cbr",
			"H_Bandanna_gry",
			"H_Bandanna_khk",
			"H_Bandanna_khk_hs",
			"H_Bandanna_mcamo",
			"H_Bandanna_sgg",
			"H_Bandanna_surfer",
			"H_Booniehat_dgtl",
			"H_Booniehat_dirty",
			"H_Booniehat_grn",
			"H_Booniehat_indp",
			"H_Booniehat_khk",
			"H_Booniehat_khk_hs",
			"H_Booniehat_mcamo",
			"H_Booniehat_tan",
			"H_Hat_blue",
			"H_Hat_brown",
			"H_Hat_camo",
			"H_Hat_checker",
			"H_Hat_grey",
			"H_Hat_tan",
			"H_StrawHat",
			"H_StrawHat_dark",
			"H_Beret_02",
			"H_Beret_blk",
			"H_Beret_blk_POLICE",
			"H_Beret_brn_SF",
			"H_Beret_Colonel",
			"H_Beret_grn",
			"H_Beret_grn_SF",
			"H_Beret_ocamo",
			"H_Beret_red",
			"H_Shemag_khk",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_Shemag_tan",
			"H_ShemagOpen_khk",
			"H_ShemagOpen_tan",
			"H_TurbanO_blk",
			"H_HelmetB",
			"H_HelmetB_black",
			"H_HelmetB_camo",
			"H_HelmetB_desert",
			"H_HelmetB_grass",
			"H_HelmetB_light",
			"H_HelmetB_light_black",
			"H_HelmetB_light_desert",
			"H_HelmetB_light_grass",
			"H_HelmetB_light_sand",
			"H_HelmetB_light_snakeskin",
			"H_HelmetB_paint",
			"H_HelmetB_plain_blk",
			"H_HelmetB_sand",
			"H_HelmetB_snakeskin",
			"H_HelmetCrew_B",
			"H_HelmetCrew_I",
			"H_HelmetCrew_O",
			"H_HelmetIA",
			"H_HelmetIA_camo",
			"H_HelmetIA_net",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetO_oucamo",
			"H_HelmetSpecB",
			"H_HelmetSpecB_blk",
			"H_HelmetSpecB_paint1",
			"H_HelmetSpecB_paint2",
			"H_HelmetSpecO_blk",
			"H_HelmetSpecO_ocamo",
			"H_CrewHelmetHeli_B",
			"H_CrewHelmetHeli_I",
			"H_CrewHelmetHeli_O",
			"H_HelmetCrew_I",
			"H_HelmetCrew_B",
			"H_HelmetCrew_O",
			"H_PilotHelmetHeli_B",
			"H_PilotHelmetHeli_I",
			"H_PilotHelmetHeli_O",

			"H_RacingHelmet_2_F", 
			"H_RacingHelmet_3_F", 
			"H_RacingHelmet_4_F",  
			"H_RacingHelmet_1_blue_F", 
			"H_RacingHelmet_1_green_F", 
			"H_RacingHelmet_1_red_F", 
			"H_RacingHelmet_1_white_F", 
			"H_RacingHelmet_1_yellow_F",
			"H_RacingHelmet_1_orange_F",

			"H_Helmet_Skate",
			"H_HelmetB_TI_tna_F",
			
			"H_HelmetO_ViperSP_hex_F",
			"H_HelmetO_ViperSP_ghex_F",
			
			"H_HelmetB_tna_F",
			"H_HelmetB_Enh_tna_F",
			"H_HelmetB_Light_tna_F",
			"H_HelmetSpecO_ghex_F",
			"H_HelmetLeaderO_ghex_F",
			"H_HelmetO_ghex_F",
			"H_HelmetCrew_O_ghex_F",
			"H_MilCap_tna_F",
			"H_MilCap_ghex_F",
			"H_Booniehat_tna_F",
			"H_Beret_gen_F",
			"H_MilCap_gen_F",
			"H_Cap_oli_Syndikat_F",
			"H_Cap_tan_Syndikat_F",
			"H_Cap_blk_Syndikat_F",
			"H_Cap_grn_Syndikat_F",

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
			
			"H_Cap_Black_IDAP_F",
			"H_Cap_Orange_IDAP_F",
			"H_Cap_White_IDAP_F",
			"H_EarProtectors_black_F",
			"H_EarProtectors_orange_F",
			"H_Construction_basic_black_F",
			"H_Construction_basic_orange_F",
			"H_Construction_earprot_orange_F",
			"H_Construction_headset_red_F",
			"H_Construction_headset_vrana_F",
			"H_Construction_headset_yellow_F",
			"H_HeadBandage_clean_F",
			"H_HeadBandage_bloody_F",
			"H_Hat_Safari_olive_F",
			"H_Hat_Safari_sand_F",
			"H_WirelessEarpiece_F",
			"H_PASGT_basic_blue_F",
			"H_PASGT_basic_olive_F",
			"H_PASGT_basic_white_F",
			"H_PASGT_basic_blue_press_F",
			"H_PASGT_neckprot_blue_press_F",
			"C_UavTerminal",
			"U_C_IDAP_Man_cargo_F",
			"U_C_IDAP_Man_jeans_F",
			"U_C_IDAP_Man_Casual_F",
			"U_C_IDAP_Man_shorts_F",
			"U_C_IDAP_Man_tee_F",
			"U_C_IDAP_Man_teeshorts_F",
			"U_C_ConstructionCoverall_Black_F",
			"U_C_ConstructionCoverall_Blue_F"
			];  
			

_Vests_array = selectRandom [
			"V_Press_F",
			"V_Rangemaster_belt",
			"V_TacVest_blk",
			"V_TacVest_blk_POLICE",
			"V_TacVest_brn",
			"V_TacVest_camo",
			"V_TacVest_khk",
			"V_TacVest_oli",
			"V_TacVestCamo_khk",
			"V_TacVestIR_blk",
			"V_I_G_resistanceLeader_F",
			"V_BandollierB_blk",
			"V_BandollierB_cbr",
			"V_BandollierB_khk",
			"V_BandollierB_oli",
			"V_BandollierB_rgr",
			"V_Chestrig_blk",
			"V_Chestrig_khk",
			"V_Chestrig_oli",
			"V_Chestrig_rgr",
			"V_HarnessO_brn",
			"V_HarnessO_gry",
			"V_HarnessOGL_brn",
			"V_HarnessOGL_gry",
			"V_HarnessOSpec_brn",
			"V_HarnessOSpec_gry",
			"V_PlateCarrier1_blk",
			"V_PlateCarrier1_rgr",
			"V_PlateCarrier2_rgr",
			"V_PlateCarrier3_rgr",
			"V_PlateCarrierGL_blk",
			"V_PlateCarrierGL_mtp",
			"V_PlateCarrierGL_rgr",
			"V_PlateCarrierH_CTRG",
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierIA2_dgtl",
			"V_PlateCarrierIAGL_dgtl",
			"V_PlateCarrierIAGL_oli",
			"V_PlateCarrierL_CTRG",
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrierSpec_mtp",
			"V_PlateCarrierSpec_rgr",

			"V_TacChestrig_grn_F",
			"V_TacChestrig_oli_F",
			"V_TacChestrig_cbr_F",
			"V_PlateCarrier1_tna_F",
			"V_PlateCarrier2_tna_F",
			"V_PlateCarrierSpec_tna_F",
			"V_PlateCarrierGL_tna_F",
			"V_HarnessO_ghex_F",
			"V_HarnessOGL_ghex_F",
			"V_BandollierB_ghex_F",
			"V_TacVest_gen_F",
			"V_PlateCarrier1_rgr_noflag_F",
			"V_PlateCarrier2_rgr_noflag_F",

			"V_LegStrapBag_black_F",
			"V_Plain_medical_F",
			"V_Plain_crystal_F",
			"V_Pocketed_black_F",
			"V_Pocketed_coyote_F",
			"V_Pocketed_olive_F",
			"V_EOD_blue_F",
			"V_EOD_IDAP_blue_F",
			"V_EOD_coyote_F",
			"V_EOD_olive_F"			
			]; 


_Backpacks_array = selectRandom [
			"B_AssaultPack_blk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_dgtl",
			"B_AssaultPack_khk",
			"B_AssaultPack_mcamo",
			"B_AssaultPack_rgr",
			"B_AssaultPack_sgg",
			"B_Bergen_blk",
			"B_Bergen_mcamo",
			"B_Bergen_rgr",
			"B_Bergen_sgg",
			"B_Carryall_cbr",
			"B_Carryall_khk",
			"B_Carryall_mcamo",
			"B_Carryall_ocamo",
			"B_Carryall_oli",
			"B_Carryall_oucamo",
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_ocamo",
			"B_FieldPack_oucamo",
			"B_HuntingBackpack",
			"B_Kitbag_cbr",
			"B_Kitbag_mcamo",
			"B_Kitbag_sgg",
			"B_OutdoorPack_blk",
			"B_OutdoorPack_blu",
			"B_OutdoorPack_tan",
			"B_TacticalPack_blk",
			"B_TacticalPack_mcamo",
			"B_TacticalPack_ocamo",
			"B_TacticalPack_oli",
			"B_TacticalPack_rgr",

			"B_Bergen_mcamo_F",
			"B_Bergen_dgtl_F",
			"B_Bergen_hex_F",
			"B_Bergen_tna_F",
			"B_AssaultPack_tna_F",
			"B_Carryall_ghex_F",
			"B_FieldPack_ghex_F",
			"B_ViperHarness_blk_F",
			"B_ViperHarness_ghex_F",
			"B_ViperHarness_hex_F",
			"B_ViperHarness_khk_F",
			"B_ViperHarness_oli_F",
			"B_ViperLightHarness_blk_F",
			"B_ViperLightHarness_ghex_F",
			"B_ViperLightHarness_hex_F",
			"B_ViperLightHarness_khk_F",
			"B_ViperLightHarness_oli_F",
			
			"O_HMG_01_high_weapon_F",
			"O_HMG_01_weapon_F",
			"O_GMG_01_high_weapon_F",
			"O_GMG_01_weapon_F",
			"O_Mortar_01_support_F",
			"O_Mortar_01_weapon_F",
			"O_HMG_01_support_high_F",
			"O_HMG_01_support_F",
			"O_AA_01_weapon_F",
			"O_AT_01_weapon_F",
			"O_Static_Designator_02_weapon_F",
			"B_Static_Designator_01_weapon_F",
			
			"B_LegStrapBag_black_F",
			"B_LegStrapBag_coyote_F",
			"B_LegStrapBag_olive_F",
			"B_Messenger_Black_F",
			"B_Messenger_Coyote_F",
			"B_Messenger_IDAP_F",
			"I_UAV_06_backpack_F",
			"O_UAV_06_backpack_F",
			"B_UAV_06_backpack_F"
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
_lootPos1  = _Building getRelPos [8, 1];
_lootPos2  = _Building getRelPos [8, 2];
_lootPos3  = _Building getRelPos [8, 3];
_lootPos4  = _Building getRelPos [8, 4];
_lootPos5  = _Building getRelPos [8, 5];
_lootPos6  = _Building getRelPos [8, 6];
_lootPos7  = _Building getRelPos [8, 7];
_lootPos8  = _Building getRelPos [8, 8];
_lootPos9  = _Building getRelPos [8, 9];
_lootPos10 = _Building getRelPos [8, 10];


_Object1_Pos = _Building getRelPos [4, 3];
//you can spawn an item next to the wreck , like an ammobox	 _Object1_Pos

_Box_container_Item_Pos = _Building getRelPos [4, 9];
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
_particle1 = "#particlesource" createVehicleLocal getpos _Building;
_particle1 setParticleClass "MediumSmoke";
_particle1 attachTo [_Building,[0,0,0]];


//https://community.bistudio.com/wiki/setParticleFire
//source setParticleFire [coreIntensity, coreDistance, damageTime] 
_particle2 = "#particlesource" createVehicleLocal (getPos _Building);
_particle2 setParticleClass "BigDestructionSmoke";
_particle2 setParticleFire [0.3,1.0,0.1];

//MediumSmoke	ObjectDestructionSmoke	ObjectDestructionFire1Smallx
//SmallDestructionSmoke	SmallDestructionFire MediumDestructionFire MediumDestructionSmoke BigDestructionFire BigDestructionSmoke

sleep 1;

//________________ Create a Crater	(Crater , CraterLong , CraterLong_small) ________________
_Create_Crater = createVehicle ["CraterLong", getPos _Building, [], 0, "CAN_COLLIDE"];


//________________ Cut the grass around the Crashsites ________________ 
if (_3_Grass_Cutter) then {

//	systemchat "_3_Grass_Cutter";

_Grass_Cutter_pos = _Building getRelPos [12, 6];
createVehicle ["Land_ClutterCutter_large_F", _Grass_Cutter_pos, [], 0, "CAN_COLLIDE"]; 
createVehicle ["Land_ClutterCutter_large_F", _Building, [], 0, "CAN_COLLIDE"]; 
};





///////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//________________	Enemies spawn commands	________________
/*
//________________	Examples :	________________
//________________	add this to Spawn one	________________
[] spawn GF_Missions_Spawn_Infantry_Patrol;

//________________ add this to Spawn the Number  ________________
for "_i" from 0 to 3 do {
[] spawn GF_Missions_Spawn_Infantry_Patrol;
sleep 3;
};
//________________	Examples :	________________


//________________	Infantry spawn commands	________________

//________________	Infantry	________________
[] spawn GF_Missions_Spawn_Infantry_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Defend;
[] spawn GF_Missions_Spawn_Infantry_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry;

//________________	Infantry_Divers	________________
[] spawn GF_Missions_Spawn_Infantry_Divers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Divers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Divers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Divers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Divers;

//________________	Infantry_Paratroopers	________________
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Paratroopers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Paratroopers;

//________________	Infantry_Recon	________________
[] spawn GF_Missions_Spawn_Infantry_Recon_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Recon_Defend;
[] spawn GF_Missions_Spawn_Infantry_Recon_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Recon;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Recon;

//________________	Infantry_Recon_SF	________________
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Defend;
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Recon_SF;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Recon_SF;

//________________	Infantry_SF	________________
[] spawn GF_Missions_Spawn_Infantry_SF_Patrol;
[] spawn GF_Missions_Spawn_Infantry_SF_Defend;
[] spawn GF_Missions_Spawn_Infantry_SF_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_SF;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_SF;

//________________	Infantry_SF_Urban	________________
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Patrol;
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Defend;
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_SF_Urban;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_SF_Urban;

//________________	Infantry_Snipers	________________
[] spawn GF_Missions_Spawn_Infantry_Snipers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Snipers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Snipers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Snipers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Snipers;


//________________	Vehicles spawn commands	________________

//________________	Armoured_Vehicles	________________
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Patrol;
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Defend;
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Attack;

//________________	Boats	________________
[] spawn GF_Missions_Spawn_Boats_Patrol;
[] spawn GF_Missions_Spawn_Boats_Defend;
[] spawn GF_Missions_Spawn_Boats_Attack;

//________________	Helicopters	________________
[] spawn GF_Missions_Spawn_Helicopters_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Attack;

//________________	Helicopters_Attack	________________
[] spawn GF_Missions_Spawn_Helicopters_Attack_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Attack_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Attack_Attack;

//________________	Helicopters_Transport_	________________
[] spawn GF_Missions_Spawn_Helicopters_Transport_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Transport_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Transport_Attack;

//________________	Land_Vehicles	________________
[] spawn GF_Missions_Spawn_Land_Vehicles_Patrol;
[] spawn GF_Missions_Spawn_Land_Vehicles_Defend;
[] spawn GF_Missions_Spawn_Land_Vehicles_Attack;

//________________	Planes	________________
[] spawn GF_Missions_Spawn_Planes_Patrol;
[] spawn GF_Missions_Spawn_Planes_Defend;
[] spawn GF_Missions_Spawn_Planes_Attack;

//________________	Static_Weapons	________________
[] spawn GF_Missions_Spawn_Static_Weapons;

//________________	END of examples	________________
*/




if (GF_Missions_Custom_Spawn) then {

//________________	GF_Missions_Custom_Spawn	________________

if (_Custom_Spawn) then {

//________________	add _possibility	________________

_possibility			= floor (random 10) < 3;


if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Infantry_Defend;
sleep 3;
};
};

if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Infantry_Snipers_Patrol;
sleep 3;
};
};

if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Patrol;
sleep 3;
};
};

if (_possibility) then {
for "_i" from 0 to random 4 do {
[] spawn GF_Missions_Spawn_Static_Weapons;
sleep 3;
};
};




if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Defend;
};
};

if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Helicopters_Attack_Defend;
};
};

if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Planes_Defend;
};
};


};
};
//________________	GF_Missions_Custom_Spawn End	________________




//________________	createMarker	________________
 
if (_EOS_Spawn or _DAC_Spawn) then {
 
_EOS_Marker = createMarker ["EOS_Marker", _Pos_1];
_EOS_Marker setMarkerShape "ELLIPSE";
_EOS_Marker setMarkerSize [GF_Missions_DAC_Area_Spawn_Meters,GF_Missions_DAC_Area_Spawn_Meters];
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (GF_Missions_DAC_Spawn) then {

//________________	DAC	________________


if (_DAC_Spawn) then {

/*
	________________	DAC	________________
	http://www.armaholic.com/page.php?id=25550
	https://forums.bohemia.net/forums/topic/167033-dac-v31-dynamic-ai-creator-released/
*/

//________________	add a unique name for the DAC zone	________________

waituntil{DAC_NewZone == 0};
_DAC_Values = [
//________________	DAC Tutorial Readme	________________
//	http://www.realisticarma.com/images/Bilder/Missionsbau/Skripte/DAC%20V3.1%20Readme.pdf

//_Create_DAC_Zone = ["A",[B,C,D,E],[F],[G],[H],[I],[J,K,L,M,N]] spawn DAC_Zone;

//	A Name of the zone (Trigger), please define as string (the given name here must be the same one which has been given to the trigger)
"EOS_Marker",
//	B The ID Number of the Zone (an arbitrary number), to connect zones which each other (same ID = connect zones, unambiguous ID = zone runs local)
[1,

//	C Status of the zone when zone has been initiated. 0 = zone keeps activated, 1 = zone will be deactivated
0,

//	D Statement of a valid number out of the DAC_Config_Events, default = 0 (means that no events will be processed).
0

//	E Only specify if the groups should have zero waypoints in their master zone (the parameter can be specified as an option).
//	optional
],
//	F Array to generate Infantry [5,2,50,10] generates Infantry 5 times, size of groups 2, 50 WP altogether, 10 wp per group
[(3 + (round(random 6))),3,50,5],

//	G Array to generate Wheeled vehicles [3,2,30,5] generates vehicles 3 times, size of groups 2, 30 WP altogether, 10 wp per group
[(1 + (round(random 2))),2,30,5],

//	H Array to generate Tracked vehicles [5,1,40,8] generates tanks 5 times, size of groups 1, 40 WP altogether, 8 WP per group
[(1 + (round(random 2))),1,20,5],

//	I Array to generate Helicopters [3,2,5] generates Helicopters 3 times Size of groups 2 (if cargo is used), 5 WP per group
//	or Array to generate DAC camps [1,2,50,0,100,10] generates 1 Camp Size of group 2, radius 50 meters, Vehicles and Infantry, 100%, 10 resapwns
//	*** CAUTION Spawning Helicopters in a NON Flat position , can stop DAC from working *** you can spawn a Camp or static instead
[],		//	[(1 + (round(random 2))),4,5],

//	J Zone belongs to Site > 0 = East, 1 = West, 2 = RACS, 3 = civilian (for more see readme page 7)
[0,	

//	K Unit configuration of the zone (DAC_Config_Units) > default units = 0 for East, 1 for West, 2 for RACS, 3 for civilians
5,	//	Custom editable Units in GF_Missions\Custom_Units_Array.sqf

//	L Behaviour configuration of the zone (DAC_Config_Behaviour) > default behaviour = 0 for East, 1 for West, 2 for RACS, 3 for civilian
0,	

//	M Camp configuration of the zone (DAC_Config_Camps) > needed only if 1 camp minimum will be generated in the respective zone.
0

//	N Waypoint configuration of the zone (DAC_Config_Waypoints) > parameter is optional. Config 0 will be used if there is no value defined (default)
//	optional
]];

[_Pos_1,GF_Missions_DAC_Area_Spawn_Meters,GF_Missions_DAC_Area_Spawn_Meters,0,0,_DAC_Values] call DAC_fNewZone;
waituntil{DAC_NewZone == 0};

};
};
//________________	End of DAC	________________




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (GF_Missions_EOS_Spawn) then {

//________________	EOS	________________

if (_EOS_Spawn) then {


/*
GROUP SIZES KEY
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20
 
NOTE: FOR 100% PROBABILITY OF UNITS SPAWNING SET 3rd PARAMETER TO 100 OR LEAVE EMPTY.
House Patrol groups spawn in buildings within the marker. After spawning each group will remain inside buildings. 
To spawn 1 house patrol  groups - [1,2] 
Spawn 3 house patrol groups with 50% probability of spawning - [3,2,50] 
To spawn a group with between 2 and 4 units - [1,1]
Spawn three groups with between 16 and 20 units and a 70% probability of spawning - [3,5,70]

Patrolling Infantry spawn anywhere within the marker. After spawning each group will be given waypoints and patrol the marker. 
To spawn 1 group of infantry  - [1,2] 
Spawn 3 patrol groups with 50% probability of spawning - [3,2,50] 
To spawn a group with between 2 and 4 units - [1,1]
Spawn three groups with between 16 and 20 units and a 70% probability of spawning - [3,5,70]

Motorised Infantry spawn anywhere within the marker. After spawning each group will be given waypoints and patrol the marker. Motorised infantry are light vehicles and carry units in the free seats.
To spawn 1 motorised infantry  - [1,2] 
Spawn 3 motorised infantry  with 50% probability of spawning - [3,2,50] 
Cargo with between 2 and 4 units - [1,1]
Cargo with between 16 and 20 units - [3,5]

Armoured Vehicles spawn within the marker. Similar to Motised infantry except they do not carry cargo. 
Spawn 3 armoured vehicles with 50% probability of spawning - [3,50] 
Spawn 3 armoured vehicles with 100% probability of spawning - [3] 
Helicopters spawn outside the marker and fly towards the zone. If the helicopter cargo is 0 then an attack helicopter will spawn. If the helicopter cargo is above 0 then a transport helicopter will carry units into the marker and land.
Spawn 1 transport helicopter with cargo and 75% probability of spawning - [1,3,75] 
Spawn 1 Attack helicopter and 15% probability of spawning - [1,0,15] 
 */

 
//________________	EOS_Spawn	________________

[["EOS_Marker"],									//	Marker Names
[1 + (round(random 3)), 2 + (round(random 10))],	//	House Patrol Groups	[Number of Groups , Size of each Group]
[1 + (round(random 2)), 1 + (round(random 8))],		//	Patroling Infantry
[],													//	Motorized Infantry	[(round(random 2)),(round(random 2))]
[],													//	Armoured Vehicles
[],													//	Static Weapons
[(round(random 2)),									//	Helicopters
(round(random 6))],									//	Helicopter Cargo
[GF_Missions_EOS_Faction,							//	Faction
GF_Missions_EOS_Marker_Type,						//	Marker Type , 0 = Highlight , 1 = Invinsible , 2 Normal 
GF_Missions_EOS_Spawn_Distance,						//	Spawn Distance
GF_Missions_Enemy_Side,								//	Unit Side
GF_Missions_EOS_HEIGHTLIMIT,						// 	HEIGHTLIMIT
GF_Missions_Debug_EOS								//	DEBUG
]] call EOS_Spawn;

};
};
//________________	End of EOS	________________




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Set Task 1	________________

[GF_Missions_allPlayers,["15_Big_Search_Crashsite_1","GF_Missions_Pack"],["Search for the Crashsite","Search for the Crashsite",""], _Pos_1,true,1,true,"search",true] call BIS_fnc_taskCreate;
["15_Big_Search_Crashsite_1","ASSIGNED",true] spawn BIS_fnc_taskSetState;


diag_log "//________________	15_Big_Search_Crashsite.sqf	Initialized	_____________";

if (GF_Missions_Systemchat_info) then {
systemchat "15_Big_Search_Crashsite.sqf	Initialized";
};	
	
	


///////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//________________	GF_Missions_Time_out_mission_fail	________________

if (GF_Missions_Time_out_mission_fail) then {

GF_Missions_Time_Out_Fail = false;
GF_Missions_Time_Out = false;
[] spawn {
sleep GF_Missions_Set_the_sec_for_fail;
GF_Missions_Time_Out_Fail = true;
sleep 80;
GF_Missions_Time_Out = true;
};

[] spawn {
while {!GF_Missions_Time_Out} do {

if (GF_Missions_Systemchat_info) then {
systemchat "Check for GF_Missions_Time_Out";
};

sleep 50;

if (GF_Missions_Time_Out_Fail) then { 

GF_Missions_Time_Out = true;

if (GF_Missions_Systemchat_info) then {
systemchat "GF_Missions_Time_Out";
};

//________________	Set mission_fail	________________

["15_Big_Search_Crashsite_1","FAILED",true] spawn BIS_fnc_taskSetState;

sleep 5;

if (GF_Missions_Systemchat_info) then {
systemchat "saving Game Wait";
systemchat "Next mission";
};	

if (GF_Missions_saveGame) then {
sleep 2;
saveGame;
};
	
null = []execVM "GF_Missions\Missions_init.sqf";
};
};
};

};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Check Task	________________

_Trigger_Present = createTrigger ["EmptyDetector", _Pos_1];
_Trigger_Present setTriggerArea [GF_Missions_Attack_Distance, GF_Missions_Attack_Distance, 0, false];
_Trigger_Present setTriggerActivation ["EAST", "PRESENT", false];
_Trigger_Present setTriggerStatements ["this","",""];




waitUntil {count list _Trigger_Present > 4};		
waitUntil {count list _Trigger_Present < 3};	
waitUntil { { _x distance _Trigger_Present < GF_Missions_Attack_Distance } count GF_Missions_allPlayers > 0 ;};
deleteVehicle _Trigger_Present;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Task SUCCEEDED	________________

["15_Big_Search_Crashsite_1", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;			
sleep 5;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	DAC_fDeleteZone , deleteMarker	________________

if (_DAC_Spawn) then {
if (GF_Missions_DAC_Spawn) then {
["EOS_Marker"] call DAC_fDeleteZone;
sleep 1;
};
};

if (_EOS_Spawn) then {
if (GF_Missions_EOS_Spawn) then {
deleteMarker "EOS_Marker";
sleep 1;
};	
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Mission End	________________

GF_Missions_Time_Out = true;


if (GF_Missions_Systemchat_info) then {
systemchat "saving Game Wait";
systemchat "Next mission";
};	

if (GF_Missions_saveGame) then {
sleep 2;
saveGame;
};
	
null = []execVM "GF_Missions\Missions_init.sqf";


//________________	Delete mission's objects	________________	
if (GF_Missions_Delete_Objects) then {
waitUntil { { _x distance _Building > GF_Missions_Delete_Objects_Distance } count GF_Missions_allPlayers > 0 };
{ deleteVehicle _x } forEach [
_Building,
_Create_Crater,
_particle1,
_particle2
];
};