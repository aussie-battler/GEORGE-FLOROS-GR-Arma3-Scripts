


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
diag_log "//________________ GF_Crashsites_CUP.sqf _____________";


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
GF_GF_Wrecks_array = [
			//CUP
			"BlackhawkWreck",
			"Mi8Wreck",
			"cwa_C130Wreck",
			"Land_Wreck_C130J_EP1_ruins",
			//Vanilla
			"Plane_Fighter_01_wreck_F",
			"Plane_Fighter_02_wreck_F",
			"Plane_Fighter_03_wreck_F",
			"Plane_Fighter_04_wreck_F",
			"Land_Wreck_Commanche_F"
			];
_Wrecks = selectRandom GF_GF_Wrecks_array;

_crashsite = _Wrecks createVehicle _GF_random_pos;


//________________ Type of loot ________________
_weapons_Loot = selectRandom [
			//LightMachineGuns
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
						
			//Shotgun
			"CUP_sgun_AA12",
			"CUP_sgun_Saiga12K",
			"CUP_sgun_M1014",
						
			// Grenade Launcher
			"CUP_glaunch_M32",
			"CUP_glaunch_M79",
			"CUP_glaunch_Mk13",			
			"CUP_glaunch_6G30",
			
			//AssaultRifles
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

			//SniperRifles
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
			"CUP_arifle_M4A1_LeupoldMk4MRT",
			
			// Launchers
			"CUP_launch_Igla",
			"CUP_launch_Javelin",
			"CUP_launch_M136",
			"CUP_launch_M47",
			"CUP_launch_MAAWS",
			"CUP_launch_MAAWS_Scope",
			"CUP_launch_Metis",
			"CUP_launch_NLAW",
			"CUP_launch_RPG18",
			"CUP_launch_Mk153Mod0",
			"CUP_launch_Mk153Mod0_SMAWOptics",
			"CUP_launch_FIM92Stinger",
			"CUP_launch_9K32Strela",
			"CUP_launch_RPG7V",
			"CUP_launch_RPG7V_PGO7V",
			"CUP_launch_RPG7V_PGO7V2",
			"CUP_launch_RPG7V_PGO7V3",
			"CUP_launch_RPG7V_NSPU"			
			];
			

_sideweapons_loot = selectRandom [
			//Pistols
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
						
			//SubMachineGuns
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
			"Laserdesignator_03",
			//Rangefinder
			"CUP_LRTV",
			"CUP_LRTV_ACR",
			"CUP_Binocular_Vector"
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
			//Flashlight 
			"CUP_acc_Flashlight",
			"CUP_acc_Flashlight_desert",
			"CUP_acc_Flashlight_wdl",
			"CUP_acc_XM8_light_module",
			"CUP_acc_Glock17_Flashlight",
			"CUP_acc_LLM",
				
			//BipodAttachments
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
				
			//MuzzleAttachments
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
			
			//OpticAttachments
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
			//NVG
			"CUP_NVG_PVS14",
			"CUP_NVG_PVS7",
			"CUP_NVG_HMNVS"
			];

	
_items_loot3 = selectRandom [
			//Flares
			"Chemlight_blue",
			"Chemlight_green",
			"Chemlight_red",
			"FlareGreen_F",
			"FlareRed_F",
			"FlareWhite_F",
			"FlareYellow_F",
			"UGL_FlareGreen_F",
			"UGL_FlareRed_F",
			"UGL_FlareWhite_F",
			"UGL_FlareYellow_F",
			"3Rnd_UGL_FlareGreen_F",
			"3Rnd_UGL_FlareRed_F",
			"3Rnd_UGL_FlareWhite_F",
			"3Rnd_UGL_FlareYellow_F",
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
			
			//Explosives
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
			

_Clothes_array = selectRandom [
				
				//RacingHelmet
			"H_RacingHelmet_2_F", 
			"H_RacingHelmet_3_F", 
			"H_RacingHelmet_4_F",  
			"H_RacingHelmet_1_blue_F", 
			"H_RacingHelmet_1_green_F", 
			"H_RacingHelmet_1_red_F", 
			"H_RacingHelmet_1_white_F", 
			"H_RacingHelmet_1_yellow_F",
			"H_RacingHelmet_1_orange_F",
			
				// CUP Helmets
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
			
				//Uniforms
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
			"U_I_GhillieSuit",
			
				//Glasses
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
			"CUP_FR_NeckScarf2",

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
			];

	
_Vests_array = selectRandom [
				//Vests
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


_Backpacks_array = selectRandom [
				//Backpacks
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
			"CUP_T10_Parachute_backpack",

			// lootBackpack_list Ravage
				
			"B_Kitbag_rgr",
			"B_FieldPack_khk",
			"B_FieldPack_oli",
			"B_BergenG",
			"B_BergenC_red"
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
//_Box_container_Item addItemCargo [_Ravage_items, 2];



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
//_lootitems10 = "groundweaponHolder" createVehicle _lootPos10; _lootitems10 addItemCargo [_Ravage_items, 2];


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