


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


//________________	DAC	________________
//	This is for the DAC Script.  * You don't need to edit the DAC_Config_Unit.sqf *

GF_Missions_DAC_Pool_Infantry = [
	"O_helipilot_F",	//	pilot	
	"O_helicrew_F",		//	pilot	
	"O_G_officer_F",	//	driver	
	"O_G_Soldier_SL_F",	//	group leader	
	
	"O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F",
	"O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT_F"
	];
	
GF_Missions_DAC_Pool_Land_Vehicles = [
	"I_G_Offroad_01_repair_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Quadbike_01_F","I_G_Quadbike_01_F","I_MRAP_03_hmg_F",
	"I_MRAP_03_gmg_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_C_Offroad_02_unarmed_F","I_C_Offroad_02_unarmed_brown_F",
	"I_C_Offroad_02_unarmed_olive_F","I_C_Van_01_transport_F","B_LSV_01_armed_black_F","B_LSV_01_armed_olive_F","B_G_Offroad_01_AT_F",
	"B_LSV_01_armed_sand_F","B_G_Van_01_transport_F","O_Truck_03_transport_F","I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F",
	"B_G_Offroad_01_armed_F","O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F","O_Truck_03_covered_F","O_Truck_02_transport_F",
	"O_G_Van_01_transport_F","O_T_LSV_02_armed_viper_F","O_LSV_02_armed_F","O_T_LSV_02_armed_black_F","O_LSV_02_armed_arid_F",
	"C_Hatchback_01_sport_F","C_SUV_01_F","C_Offroad_01_repair_F","C_Truck_02_covered_F","C_Quadbike_01_black_F"
	];
	
GF_Missions_DAC_Pool_Armoured_Vehicles = [
	"I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","O_MBT_02_arty_F","O_MBT_02_cannon_F",
	"O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_v2_F","I_Truck_02_MRL_F"
	];
	
GF_Missions_DAC_Pool_Air_Vehicles = [
	"O_Heli_Attack_02_F","O_Heli_Light_02_armed_F","I_Heli_light_03_F","O_Heli_Light_02_F","B_Heli_Attack_01_F",	
	"B_Heli_Light_01_armed_F","O_Heli_Attack_02_black_F","B_Heli_Transport_03_F","B_Heli_Transport_01_F",
	"O_Heli_Light_02_v2_F","O_Heli_Transport_04_bench_black_F","O_Heli_Transport_04_covered_F","B_Heli_Light_01_F",
	"B_Heli_Light_01_dynamicLoadout_F",
	"O_Heli_Attack_02_dynamicLoadout_F",
	"O_Heli_Light_02_dynamicLoadout_F",
	"I_Heli_light_03_dynamicLoadout_F",
	"O_Heli_Transport_04_bench_F"	
	];

//________________	End of DAC Pool	________________	




//________________	Missions Units Pool	________________

//________________	Civilian	________________

GF_Missions_Pool_Civilian = [

	/*
	//Idap 
	"C_Man_ConstructionWorker_01_Black_F", "C_Man_ConstructionWorker_01_Blue_F", "C_Man_ConstructionWorker_01_Red_F", 
	"C_Man_ConstructionWorker_01_Vrana_F", "C_Man_Fisherman_01_F", "C_Journalist_01_War_F", "C_Man_Messenger_01_F",
	"C_Man_Paramedic_01_F","C_Man_UAV_06_F","C_Man_UAV_06_medical_F","C_Man_UtilityWorker_01_F","C_Story_Mechanic_01_F",

	"C_IDAP_Man_AidWorker_01_F", "C_IDAP_Man_AidWorker_07_F", "C_IDAP_Man_AidWorker_08_F","C_IDAP_Man_AidWorker_09_F",
	"C_IDAP_Man_AidWorker_02_F", "C_IDAP_Man_AidWorker_05_F", "C_IDAP_Man_AidWorker_06_F", "C_IDAP_Man_AidWorker_04_F",
	"C_IDAP_Man_AidWorker_03_F","C_IDAP_Man_EOD_01_F","C_IDAP_Man_Paramedic_01_F","C_IDAP_Pilot_01_F","C_IDAP_Man_UAV_06_antimine_F",
	"C_IDAP_Man_UAV_01_F", "C_IDAP_Man_UAV_06_F", "C_IDAP_Man_UAV_06_medical_F","C_Story_EOD_01_F",
	*/
	
	"C_man_1", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_1_F_afro", "C_man_polo_1_F_euro", 
	"C_man_polo_1_F_asia", "C_man_polo_2_F", "C_man_polo_2_F_afro", "C_man_polo_2_F_euro", "C_man_polo_2_F_asia", "C_man_polo_3_F",
	"C_man_polo_3_F_afro", "C_man_polo_3_F_euro", "C_man_polo_3_F_asia", "C_man_polo_4_F", "C_man_polo_4_F_afro", 
	"C_man_polo_4_F_euro","C_man_polo_4_F_asia", "C_man_polo_5_F", "C_man_polo_5_F_afro", "C_man_polo_5_F_euro", 
	"C_man_polo_5_F_asia", "C_man_polo_6_F","C_man_polo_6_F_afro", "C_man_polo_6_F_euro", "C_man_polo_6_F_asia", 
	"C_man_p_fugitive_F", "C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro", "C_man_p_fugitive_F_asia", "C_man_p_beggar_F", 
	"C_man_p_beggar_F_afro", "C_man_p_beggar_F_euro","C_man_p_beggar_F_asia", "C_man_w_worker_F", "C_scientist_F",
	"C_man_hunter_1_F", "C_man_p_shorts_1_F", "C_man_p_shorts_1_F_afro","C_man_p_shorts_1_F_euro", "C_man_p_shorts_1_F_asia",
	"C_man_shorts_1_F", "C_man_shorts_1_F_afro", "C_man_shorts_1_F_euro", "C_man_shorts_1_F_asia", "C_man_shorts_2_F", 
	"C_man_shorts_2_F_afro", "C_man_shorts_2_F_euro", "C_man_shorts_2_F_asia", "C_man_shorts_3_F", "C_man_shorts_3_F_afro",
	"C_man_shorts_3_F_euro", "C_man_shorts_3_F_asia", "C_man_shorts_4_F", "C_man_shorts_4_F_afro", "C_man_shorts_4_F_euro", 
	"C_man_shorts_4_F_asia", "C_journalist_F", "C_Orestes", "C_Nikos","C_Nikos_aged"
	];

//________________	Police	________________

GF_Missions_Pool_Infantry_Police = [
	"B_officer_F"
	];
	
//________________	Infantry	________________
	
GF_Missions_Pool_Infantry = [
	"O_G_officer_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F",
	"O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F","O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F",
	"O_G_Soldier_universal_F"
	];

GF_Missions_Pool_Infantry_SF = [
	"O_Soldier_SL_F","O_Soldier_TL_F","O_soldier_M_F","O_Soldier_LAT_F","O_medic_F","O_soldier_repair_F","O_soldier_exp_F",
	"O_Soldier_A_F","O_Soldier_AT_F","O_Soldier_AA_F","O_engineer_F","O_Soldier_F","O_soldier_UAV_F","O_Soldier_AAR_F",
	"O_Soldier_AR_F","O_Soldier_AAT_F","O_Soldier_AAA_F"
	];
	
GF_Missions_Pool_Infantry_SF_Urban = [
	"O_SoldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_AR_F","O_soldierU_AAR_F","O_soldierU_LAT_F","O_soldierU_AT_F",
	"O_soldierU_AAT_F","O_soldierU_AA_F","O_soldierU_AAA_F","O_soldierU_medic_F","O_soldierU_repair_F","O_soldierU_exp_F",
	"O_engineer_U_F","O_soldierU_M_F","O_soldierU_A_F","O_SoldierU_GL_F"
	];
	
GF_Missions_Pool_Infantry_Recon = [
	"O_recon_TL_F","O_recon_JTAC_F","O_recon_M_F","O_recon_LAT_F","O_recon_medic_F","O_recon_exp_F","O_recon_F","O_HeavyGunner_F","O_soldier_UAV_F"
	];
	
GF_Missions_Pool_Infantry_Recon_SF = [
	"O_Pathfinder_F","O_Pathfinder_F","O_Sharpshooter_F","O_recon_M_F","O_HeavyGunner_F","O_recon_medic_F","O_soldier_UAV_F"
	];
	
GF_Missions_Pool_Infantry_Snipers = [
	"O_spotter_F","O_sniper_F","O_ghillie_lsh_F","O_ghillie_sard_F","O_ghillie_ard_F"
	];
	
GF_Missions_Pool_Infantry_Divers = [
	"O_diver_TL_F","O_diver_exp_F","O_diver_F"
	];
	
GF_Missions_Pool_Infantry_Helicopters = [
	"O_helipilot_F","O_helicrew_F"
	];
	
GF_Missions_Pool_Infantry_Crew = [
	"O_crew_F"
	];
	
GF_Missions_Pool_Infantry_Planes = [
	"O_pilot_F"
	];

	
//________________	Vehicles	________________
	
GF_Missions_Pool_Land_Vehicles = [
	"I_G_Offroad_01_repair_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Quadbike_01_F","I_G_Quadbike_01_F","I_MRAP_03_hmg_F",
	"I_MRAP_03_gmg_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_C_Offroad_02_unarmed_F","I_C_Offroad_02_unarmed_brown_F",
	"I_C_Offroad_02_unarmed_olive_F","I_C_Van_01_transport_F","B_LSV_01_armed_black_F","B_LSV_01_armed_olive_F","B_G_Offroad_01_AT_F",
	"B_LSV_01_armed_sand_F","B_G_Van_01_transport_F","O_Truck_03_transport_F","I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F",
	"B_G_Offroad_01_armed_F","O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F","O_Truck_03_covered_F","O_Truck_02_transport_F",
	"O_G_Van_01_transport_F","O_T_LSV_02_armed_viper_F","O_LSV_02_armed_F","O_T_LSV_02_armed_black_F","O_LSV_02_armed_arid_F",
	"C_Hatchback_01_sport_F","C_SUV_01_F","C_Offroad_01_repair_F","C_Truck_02_covered_F","C_Quadbike_01_black_F",
	"O_G_Offroad_01_armed_F","O_G_Offroad_01_AT_F"
	];
	
GF_Missions_Pool_Armoured_Vehicles = [
	"I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","O_MBT_02_arty_F","O_MBT_02_cannon_F",
	"O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_v2_F"
	];
	
GF_Missions_Pool_Helicopters = [
	"O_Heli_Attack_02_F","O_Heli_Light_02_armed_F","I_Heli_light_03_F","O_Heli_Light_02_F","B_Heli_Attack_01_F",
	"I_Heli_light_03_dynamicLoadout_F","B_Heli_Light_01_armed_F","O_Heli_Attack_02_black_F","B_Heli_Transport_03_F",
	"B_Heli_Transport_01_F","O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_v2_F","O_Heli_Transport_04_bench_black_F",
	"O_Heli_Transport_04_covered_F","B_Heli_Light_01_F","B_Heli_Light_01_dynamicLoadout_F","O_Heli_Attack_02_dynamicLoadout_F",
	"O_Heli_Transport_04_bench_F"
	];
	
GF_Missions_Pool_Helicopters_Attack = [
	"O_Heli_Attack_02_F","B_Heli_Attack_01_F","B_Heli_Light_01_armed_F","O_Heli_Attack_02_black_F","I_Heli_light_03_F",
	"O_Heli_Light_02_F"
	];
	
GF_Missions_Pool_Helicopters_Transport = [
	"I_Heli_Transport_02_F","I_Heli_light_03_dynamicLoadout_F","O_Heli_Light_02_unarmed_F",
	"B_Heli_Transport_03_F","B_Heli_Transport_01_F","O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_v2_F",
	"O_Heli_Transport_04_bench_black_F","O_Heli_Transport_04_covered_F","B_Heli_Light_01_F",
	"O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Transport_04_bench_F"
	];
	
GF_Missions_Pool_Static_Weapons = [
	"I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_Mortar_01_F","I_G_Mortar_01_F",
	"I_static_AA_F","I_static_AT_F"	
	];

GF_Missions_Pool_Boats  = [
	"O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F","O_Boat_Transport_01_F","B_SDV_01_F"
	];
		
GF_Missions_Pool_UAV  = [
	"O_UAV_01_F","O_UAV_02_CAS_F","O_UGV_01_rcws_F"
	];
	
GF_Missions_Pool_Planes = [
	"O_Plane_CAS_02_dynamicLoadout_F","I_Plane_Fighter_03_dynamicLoadout_F","O_Plane_CAS_02_dynamicLoadout_F"
	];