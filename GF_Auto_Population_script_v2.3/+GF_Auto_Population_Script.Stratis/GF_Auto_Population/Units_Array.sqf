


//________________	Author : GEORGE FLOROS [GR]	___________	08.03.19	___________


/*
________________	GF Auto Population Script - Mod	________________

https://forums.bohemia.net/forums/topic/221987-gf-auto-population-script-mod/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts - Mods , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


diag_log "//______________________ GF Auto Population Units Array initializing  ___________________";


//______________________	Units Pool	______________________



	
//______________________	Man	______________________

GF_AP_Pool_Infantry_Man = [
	"O_G_officer_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F",
	"O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F","O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F",
	"O_G_Soldier_universal_F"
	];
	
//______________________	Infantry	______________________
	
GF_AP_Pool_Infantry = [
	"O_G_officer_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F",
	"O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F","O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F",
	"O_G_Soldier_universal_F"
	];

GF_AP_Pool_Infantry_SF = [
	"O_Soldier_SL_F","O_Soldier_TL_F","O_soldier_M_F","O_Soldier_LAT_F","O_medic_F","O_soldier_repair_F","O_soldier_exp_F",
	"O_Soldier_A_F","O_Soldier_AT_F","O_Soldier_AA_F","O_engineer_F","O_Soldier_F","O_soldier_UAV_F","O_Soldier_AAR_F",
	"O_Soldier_AR_F","O_Soldier_AAT_F","O_Soldier_AAA_F"
	];
	
GF_AP_Pool_Infantry_SF_Urban = [
	"O_SoldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_AR_F","O_soldierU_AAR_F","O_soldierU_LAT_F","O_soldierU_AT_F",
	"O_soldierU_AAT_F","O_soldierU_AA_F","O_soldierU_AAA_F","O_soldierU_medic_F","O_soldierU_repair_F","O_soldierU_exp_F",
	"O_engineer_U_F","O_soldierU_M_F","O_soldierU_A_F","O_SoldierU_GL_F"
	];
	
GF_AP_Pool_Infantry_Recon = [
	"O_recon_TL_F","O_recon_JTAC_F","O_recon_M_F","O_recon_LAT_F","O_recon_medic_F","O_recon_exp_F","O_recon_F","O_HeavyGunner_F","O_soldier_UAV_F"
	];
	
GF_AP_Pool_Infantry_Recon_SF = [
	"O_Pathfinder_F","O_Pathfinder_F","O_Sharpshooter_F","O_recon_M_F","O_HeavyGunner_F","O_recon_medic_F","O_soldier_UAV_F"
	];
	
GF_AP_Pool_Infantry_Snipers = [
	"O_spotter_F","O_sniper_F","O_ghillie_lsh_F","O_ghillie_sard_F","O_ghillie_ard_F"
	];
	
GF_AP_Pool_Infantry_Divers = [
	"O_diver_TL_F","O_diver_exp_F","O_diver_F"
	];

GF_AP_Pool_Infantry_Paratroopers = [
	"O_soldier_PG_F"
	];
	
GF_AP_Pool_Infantry_Helicopters = [
	"O_helipilot_F","O_helicrew_F"
	];
	
GF_AP_Pool_Infantry_Crew = [
	"O_crew_F"
	];
	
GF_AP_Pool_Infantry_Planes = [
	"O_pilot_F"
	];



	
//______________________	Vehicles	______________________

GF_AP_Pool_Vehicles_Armoured = [

	"B_APC_Wheeled_01_cannon_F",
	"B_APC_Tracked_01_CRV_F",
	"B_APC_Tracked_01_rcws_F",
	"B_MBT_01_arty_F",
	"B_MBT_01_mlrs_F",
	"B_MBT_01_cannon_F",
	"B_MBT_01_TUSK_F",
	"B_APC_Tracked_01_AA_F",
	"O_APC_Tracked_02_AA_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_v2_F",
	"O_MBT_02_arty_F",
	"O_MBT_02_cannon_F",
	"I_APC_Wheeled_03_cannon_F",
	"I_APC_tracked_03_cannon_F",
	"I_Truck_02_MRL_F",
	"I_MBT_03_cannon_F"
	];
	
GF_AP_Pool_Vehicles_Land = [

	"B_MRAP_01_F",
	"B_MRAP_01_gmg_F",
	"B_MRAP_01_hmg_F",
	"B_Quadbike_01_F",
	"B_G_Offroad_01_AT_F",
	"B_G_Offroad_01_armed_F",
	"O_MRAP_02_F",
	"O_MRAP_02_gmg_F",
	"O_MRAP_02_hmg_F",
	"O_G_Offroad_01_AT_F",
	"O_G_Offroad_01_armed_F",
	"O_G_Quadbike_01_F",
	"I_MRAP_03_F",
	"I_MRAP_03_gmg_F",
	"I_MRAP_03_hmg_F",
	"I_G_Offroad_01_AT_F",
	"I_G_Offroad_01_armed_F"
	];
	
GF_AP_Pool_Vehicles_Land_Transport = [

	"B_G_Offroad_01_F",
	"B_G_Quadbike_01_F",
	"B_G_Van_01_transport_F",
	"B_Truck_01_transport_F",
	"B_Truck_01_covered_F",
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F",
	"O_Truck_02_transport_F",
	"O_Truck_02_covered_F",
	"O_G_Offroad_01_F",
	"O_G_Offroad_01_repair_F",
	"O_G_Van_01_transport_F",
	"I_Quadbike_01_F",
	"I_Truck_02_transport_F",
	"I_Truck_02_covered_F",
	"I_G_Offroad_01_F",
	"I_G_Quadbike_01_F",
	"I_G_Van_01_transport_F"
	];


GF_AP_Pool_Helicopters = [
	"O_Heli_Light_02_armed_F","I_Heli_light_03_dynamicLoadout_F","B_Heli_Transport_03_F","B_Heli_Transport_01_F",
	"O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_v2_F","O_Heli_Transport_04_bench_black_F","O_Heli_Transport_04_covered_F",
	"B_Heli_Light_01_F","O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Transport_04_bench_F","I_Heli_Transport_02_F",
	"B_Heli_Transport_03_unarmed_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F"
	];
	
GF_AP_Pool_Helicopters_Attack = [
	"O_Heli_Attack_02_F","B_Heli_Attack_01_F","B_Heli_Light_01_armed_F","O_Heli_Attack_02_black_F","I_Heli_light_03_F",
	"O_Heli_Light_02_F","I_Heli_light_03_dynamicLoadout_F","O_Heli_Attack_02_dynamicLoadout_F","B_Heli_Light_01_dynamicLoadout_F",
	"B_Heli_Attack_01_dynamicLoadout_F"
	];
	
GF_AP_Pool_Helicopters_Transport = [
	"O_Heli_Light_02_armed_F","I_Heli_light_03_dynamicLoadout_F","B_Heli_Transport_03_F","B_Heli_Transport_01_F",
	"O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_v2_F","O_Heli_Transport_04_bench_black_F","O_Heli_Transport_04_covered_F",
	"B_Heli_Light_01_F","O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Transport_04_bench_F",
	"I_Heli_Transport_02_F","B_Heli_Transport_03_unarmed_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F"
	];
	
GF_AP_Pool_Static_Weapons = [
	"I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_Mortar_01_F","I_G_Mortar_01_F",
	"I_static_AA_F","I_static_AT_F"	
	];

GF_AP_Pool_Boats  = [
	"O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F","O_Boat_Transport_01_F","B_SDV_01_F"
	//	"C_Scooter_Transport_01_F"	//	apex
	];
	
GF_AP_Pool_Planes = [
	"O_Plane_CAS_02_dynamicLoadout_F","I_Plane_Fighter_03_dynamicLoadout_F","O_Plane_CAS_02_dynamicLoadout_F"
	];

GF_AP_Pool_Uav = [
	//"O_UAV_02_F","O_UAV_02_CAS_F","O_UAV_02_dynamicLoadout_F","O_UAV_01_F",
	"O_UAV_01_F"
	];
	
GF_AP_Pool_Ugv = [
	"O_UGV_01_F","O_UGV_01_rcws_F"
	];
	
	
diag_log "//______________________ GF Auto Population Units Array initialized  ___________________";