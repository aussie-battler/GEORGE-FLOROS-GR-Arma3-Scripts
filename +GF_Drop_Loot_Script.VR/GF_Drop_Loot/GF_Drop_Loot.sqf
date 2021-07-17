


//________________  Author : [GR]GEORGE F ___________ 28.06.18 _____________

/*
________________ GF Drop Loot Script ________________

https://forums.bohemia.net/forums/topic/215771-drop-loot-gf-script/

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


diag_log "//________________ GF Drop Loot Script _____________";

systemchat "GF Drop Loot Script    I n i t i a l i z e d";


//________________ Enemies , will drop items or add to their inventory , when killed , configurable ________________

addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];	
	if (_killed isKindOf "CAManBase"  

//________________ you can select to enable the script with the side of the killed persons ________________	

/*	
	&& {(	
		(side group _killed) == east || 
		(side group _killed) == independent ||
		(side group _killed) == civilian ||  		
		(side group _killed) == west)	
		}
*/
		
		) then
	{
	//systemChat format ["killed"];

	//________________ Just a kill notification ________________	
	_distance = _killer distance2D _killed;
	
	[[
	[ format ["HIT %1m", floor _distance,"align = 'center' size = '1' font='PuristaBold'","#FBFCFE"]]
	]]spawn BIS_fnc_typeText2;		


	
//________________ Settings ________________
//________________ Set true or false  ________________

_Systemchat_Enabled						= true;			//	Show spawn selections


_1_Remove_Everything_from_Unit			= false; 		//	Remove Everything from Unit , else comment with //
_2_Clear_Unit_Items						= true; 		//	Clear Unit's items

_3_Link_Items_to_their_inventory		= false; 		//	Link items to their inventory

_4_Add_a_random_side_weapon_in_hands	= false; 		//	Add a random side weapon in hands 
_5_Add_a_random_weapon_in_hands			= true; 		//	Add a random weapon in hands

_6_Add_a_random_uniform					= false;         //	Add a random uniform 
_7_Add_a_random_item_in_uniform 		= true;         //	Add a random item in their uniform

_8_Add_a_random_vest					= false;         //	Add a random vest
_9_Add_a_random_item_in_vest			= false;         //	Add a random item in their vest

_10_Add_a_random_backpack				= false;         //	Add a random backpack
_11_Add_a_random_item_in_backpack		= false;         //	Add a random item in their backpack

_12_Drop_Items							= true;         //	Add a random item in their backpack
_13_Drop_Magazines_Side_Weapon			= false;         //	Drop Magazines for Side Weapon
_14_Drop_Magazines_Primary_Weapons		= false;         //	Drop Magazines for Primary Weapons




_unit = _this select 0;


//________________ Clear Unit's items ________________

if (_1_Remove_Everything_from_Unit) then {

if (_Systemchat_Enabled) then {
systemchat "_1_Remove_Everything_from_Unit";
};

	removeallweapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	
};

			
//________________ Clear Unit's items ________________

if (_2_Clear_Unit_Items) then {

if (_Systemchat_Enabled) then {
systemchat "_2_Clear_Unit_Items";
};

clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

};	


//________________	Link items to their inventory	________________			

if (_3_link_Items_to_their_inventory) then {

if (_Systemchat_Enabled) then {
systemchat "_3_link_Items_to_their_inventory";
};						
						
	//	you link a certain item
	_unit linkItem "ItemMap";		
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemRadio";
	_unit linkItem "NVGoggles_OPFOR";
	_unit linkItem "ItemGPS";
			
	//	OR add rarity 
	//	if (floor (random 20) < 2) then {_unit linkItem "ItemRadio"};
	
};			



//________________	Amount of items spawned	________________
_Random_Amount =   round (1 + random 1);

			
//________________	Items Pool	________________

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
			

			
			
//________________	MAGS	________________


//________________	sideweapon's mag	________________
_magazines_sideweapon = getArray (configFile / "CfgWeapons" / _sideweapons_loot / "magazines");
_magazineClass_sideweapon = _magazines_sideweapon call bis_fnc_selectRandom; 
//________________	Amount of sideweapon's mag spawned	________________
_magazines_sideweapon_Amount =   round (1 + random 1);


//________________	weapon's mags	________________
_magazines_weapon = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass_weapon = _magazines_weapon call bis_fnc_selectRandom; 
//________________	Amount of weapon's mags spawned	________________
_magazines_weapon_Amount =   round (1 + random 1);


//________________ Item Pool End	________________


//________________	Add random items in containers ( uniform , vest and backpack )	________________
//________________	You can adjust here the arrays
_addItemCargoGlobal_Array_1 = selectRandom[	

	_sideweapons_loot,
	_weapons_Loot,
	
	_magazineClass_sideweapon,
	_magazineClass_weapon,
	
	_items_loot1,
	_items_loot2,
	_items_loot3,
	_Clothes_array,
	_Vests_array,
	_Backpacks_array,
	
	_Ravage_items
];	


_addItemCargoGlobal_Array_2 = selectRandom[	

	_sideweapons_loot,
	_weapons_Loot,
	
	_magazineClass_sideweapon,
	_magazineClass_weapon,
	
	_items_loot1,
	_items_loot2,
	_items_loot3,
	
	_Ravage_items
];	


_addItemCargoGlobal_Array_3 = selectRandom[	

	_magazineClass_sideweapon,
	_magazineClass_weapon,
	
	_items_loot1,
	_items_loot2,
	_items_loot3,
	
	_Ravage_items
];


_addItemCargoGlobal_Array_4 = selectRandom[	

	_items_loot1,
	_items_loot2,
	_items_loot3,
	
	_Ravage_items
];


_addMagazineCargoGlobal_Array = selectRandom[	
	
	_magazineClass_sideweapon,
	_magazineClass_weapon
];	




//________________ Add a random side weapon in hands	________________

if (_4_Add_a_random_side_weapon_in_hands) then {	

if (_Systemchat_Enabled) then {
systemchat "_4_Add_a_random_side_weapon_in_hands";
};	
	
_unit addWeaponGlobal _sideweapons_loot;

//	you can add a certain weapon
//	_unit addWeaponGlobal	"SMG_05_F";
			
//	you can add attachments to the weapon
//	_unit addPrimaryWeaponItem	"acc_flashlight";

//	OR add rarity 
//	if (floor (random 20) < 2) then {	the code below here	};

_unit addmagazines [_magazineClass_sideweapon, _magazines_sideweapon_Amount];	//	or write 5 mags
		
};	


//________________ Add a random weapon in hands on random ________________

if (_5_Add_a_random_weapon_in_hands) then {

if (_Systemchat_Enabled) then {
systemchat "_5_Add_a_random_weapon_in_hands";
};
			
_unit addWeaponGlobal _weapons_Loot;

//	you can add a certain weapon
//	_unit addWeaponGlobal	"SMG_05_F";
			
//	you can add attachments to the weapon
//	_unit addPrimaryWeaponItem	"acc_flashlight";

//	OR add rarity 
//	if (floor (random 20) < 2) then {	the code below here	};

_unit addmagazines [_magazineClass_weapon, _magazines_weapon_Amount];		//	or write 5 mags	
		
};	


//________________	Add a random uniform	________________

if (_6_Add_a_random_uniform) then {

if (_Systemchat_Enabled) then {
systemchat "_6_Add_a_random_uniform";
};

_unit forceAddUniform  _Clothes_array;

};


//________________	Add a random item in their uniform	________________

if (_7_Add_a_random_item_in_uniform) then {

if (_Systemchat_Enabled) then {
systemchat "_7_Add_a_random_item_in_uniform";
};

_uniform	= uniformContainer _unit;

//________________	you can add a certain item in their uniform ________________
//_uniform addMagazineCargoGlobal ["FirstAidKit", 2];
//_uniform addMagazineCargoGlobal ["Chemlight_blue", 2];

//	OR add rarity 
//	if (floor (random 20) < 2) then {	the code below here	};

_uniform addItemCargoGlobal [_addItemCargoGlobal_Array_3, _Random_Amount];	
_uniform addItemCargoGlobal [_addItemCargoGlobal_Array_4, _Random_Amount];
_uniform addMagazineCargoGlobal [_addMagazineCargoGlobal_Array, _Random_Amount];	

//________________	OR more certain	________________
/*	
	
//	items 1
_uniform addItemCargoGlobal [_items_loot1, _Random_Amount];	//	or write 5 Items

//	items 2 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_uniform addItemCargoGlobal [_items_loot2, _Random_Amount];

//	items 2 Here ONLY :Flares , Smokes , Explosives
_uniform addItemCargoGlobal [_items_loot3, _Random_Amount];	

//	sideweapon's mag			
_uniform addMagazineCargoGlobal [_magazineClass_sideweapon, _magazines_sideweapon_Amount];	//	or write 5 mags
//	weapon's mags
_uniform addMagazineCargoGlobal [_magazineClass_weapon, _magazines_weapon_Amount];		//	or write 5 mags	
*/

};


//________________ Add a random vest ________________

if (_8_Add_a_random_vest) then {

if (_Systemchat_Enabled) then {
systemchat "_8_Add_a_random_vest";
};

	//	you can add a vest 
	//	_unit addVest "V_Rangemaster_belt";
			
_unit addVest _Vests_array;	
			
};


//________________ Add a random item in their vest ________________

if (_9_Add_a_random_item_in_vest) then {

if (_Systemchat_Enabled) then {
systemchat "_9_Add_a_random_item_in_vest";
};

_vest		= vestContainer _unit;

//	you can add a certain item in their vest 
//	_vest addMagazineCargoGlobal ["30Rnd_9x21_Mag_SMG_02", 3];

//	OR add rarity 
//	if (floor (random 20) < 2) then {	the code below here	};

_vest addItemCargoGlobal [_addItemCargoGlobal_Array_2, _Random_Amount];
_vest addItemCargoGlobal [_addItemCargoGlobal_Array_3, _Random_Amount];
_vest addItemCargoGlobal [_addItemCargoGlobal_Array_4, _Random_Amount];
_vest addMagazineCargoGlobal [_addMagazineCargoGlobal_Array, _Random_Amount];	

//________________	OR more certain	________________
/*	
	
_vest addMagazineCargoGlobal [_backpack_addMagazineCargoGlobal_Array, _Random_Amount];	

			
//	items 1
_vest addItemCargoGlobal [_items_loot1, _Random_Amount];	//	or write 5 Items

//	items 2 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_vest addItemCargoGlobal [_items_loot2, _Random_Amount];

//	items 2 Here ONLY :Flares , Smokes , Explosives
_vest addMagazineCargoGlobal [_items_loot3, _Random_Amount];	


//	sideweapon's mag			
_vest addMagazineCargoGlobal [_magazineClass_sideweapon, _magazines_sideweapon_Amount];	//	or write 5 mags
//	weapon's mags
_vest addMagazineCargoGlobal [_magazineClass_weapon, _magazines_weapon_Amount];		//	or write 5 mags	
*/
};

			
//________________ Add a random item in their backpack ________________

if (_10_Add_a_random_backpack) then {			

if (_Systemchat_Enabled) then {
systemchat "_10_Add_a_random_backpack";
};
			
_unit addBackpack _Backpacks_array;				
						
};


//________________ Add a random item in their vest ________________

if (_11_Add_a_random_item_in_backpack) then {

if (_Systemchat_Enabled) then {
systemchat "_11_Add_a_random_item_in_backpack";
};

_backpack	= BackpackContainer _unit;

//	you can add a certain item in their vest 
//	_backpack addMagazineCargoGlobal ["30Rnd_9x21_Mag_SMG_02", 3];
		
//	OR add rarity 
//	if (floor (random 20) < 2) then {	the code below here	};

_backpack addItemCargoGlobal [_addItemCargoGlobal_Array_1, _Random_Amount];
_backpack addItemCargoGlobal [_addItemCargoGlobal_Array_2, _Random_Amount];
_backpack addItemCargoGlobal [_addItemCargoGlobal_Array_3, _Random_Amount];
_backpack addItemCargoGlobal [_addItemCargoGlobal_Array_4, _Random_Amount];
_backpack addMagazineCargoGlobal [_addMagazineCargoGlobal_Array, _Random_Amount];	


//________________	OR more certain	________________
/*	

//	items 1
_backpack addItemCargoGlobal [_items_loot1, _Random_Amount];	//	or write 5 Items

//	items 2 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_backpack addItemCargoGlobal [_items_loot2, _Random_Amount];

//	items 2 Here ONLY :Flares , Smokes , Explosives
_backpack addMagazineCargoGlobal [_items_loot3, _Random_Amount];	


//	sideweapon's mag			
_backpack addMagazineCargoGlobal [_magazineClass_sideweapon, _magazines_sideweapon_Amount];	//	or write 5 mags
//	weapon's mags
_backpack addMagazineCargoGlobal [_magazineClass_weapon, _magazines_weapon_Amount];		//	or write 5 mags	
*/


//________________	OR For more Random you can enable this	________________
/*

_backpack_Items_Array = selectRandom[	

	_sideweapons_loot,
	_weapons_Loot,
	
	_magazineClass_sideweapon,
	_magazineClass_weapon,
	
	_items_loot1,
	_items_loot2,
	_items_loot3,
	_Clothes_array,
	_Vests_array,
	_Backpacks_array,
	
	_Ravage_items
];		
						
_backpack_Items_Amount =   round (1 + random 1);
_backpack addItemCargoGlobal [_backpack_Items_Array, _backpack_Items_Amount];
*/

};

			
//________________	Drop Items	________________			


if (_12_Drop_Items) then {	

if (_Systemchat_Enabled) then {
systemchat "_12_Drop_Items";
};
			

//_Drop_Items = "groundWeaponHolder" createVehicle (getpos _unit);
						
_Drop_Items_Amount =   round (1 + random 1);
_Drop_Items = "WeaponHolderSimulated" createVehicle (getpos _unit); 

//	OR add rarity 
//	if (floor (random 20) < 2) then {	the code below here	};

_Drop_Items addItemCargoGlobal [_addItemCargoGlobal_Array_1, _Drop_Items_Amount];
			
};			


//________________ Drop Magazines Side Weapons	________________

if (_13_Drop_Magazines_Side_Weapon) then {	

if (_Systemchat_Enabled) then {
systemchat "_13_Drop_Magazines_Side_Weapons";
};
		

//_Drop_Magazines_Side_Weapon = "groundWeaponHolder" createVehicle (getpos _unit);
//_Drop_Magazines_Side_Weapon addMagazineCargoGlobal [_magazineClass_Extra, _magazines_Extra_Amount];		//	or write 5 mags

//_Drop_Magazines_Side_Weapon attachTo [_unit, [0,0,0.6]]; 
//detach _Drop_Magazines_Side_Weapon;   


_Drop_Magazines_Side_Weapon = "WeaponHolderSimulated" createVehicle (getpos _unit); 

//	OR add rarity 
//	if (floor (random 20) < 2) then {	the code below here	};

//	sideweapon's mag			
_Drop_Magazines_Side_Weapon addMagazineCargoGlobal [_magazineClass_sideweapon, _magazines_sideweapon_Amount];	//	or write 5 mags	

};			

			
//________________	Drop Magazines Primary Weapons	________________

if (_14_Drop_Magazines_Primary_Weapons) then {	

if (_Systemchat_Enabled) then {
systemchat "_14_Drop_Magazines_Primary_Weapons";
};
			

//_Drop_Magazines_Primary_Weapons = "groundWeaponHolder" createVehicle (getpos _unit);
//_Drop_Magazines_Primary_Weapons addMagazineCargoGlobal [_magazineClass_Extra, _magazines_Extra_Amount];		//	or write 5 mags

//_Drop_Magazines_Primary_Weapons attachTo [_unit, [0,0,0.6]]; 
//detach _Drop_Magazines_Primary_Weapons;   


_Drop_Magazines_Primary_Weapons = "WeaponHolderSimulated" createVehicle (getpos _unit); 

//	OR add rarity 
//	if (floor (random 20) < 2) then {	the code below here	};

//	weapon's mags
_Drop_Magazines_Primary_Weapons addMagazineCargoGlobal [_magazineClass_weapon, _magazines_weapon_Amount];		//	or write 5 mags
				
};


			
};}];