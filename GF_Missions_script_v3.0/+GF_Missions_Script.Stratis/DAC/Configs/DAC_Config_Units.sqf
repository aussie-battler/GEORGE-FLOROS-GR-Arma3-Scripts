//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

//________________	DAC	________________
//	Case 5 is selected in DAC_Config_Creator.sqf , 
//	edit the GF_Missions\Custom_Units_Array.sqf .  * You don't need to edit below * ( the DAC_Config_Unit.sqf )

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do {
//-------------------------------------------------------------------------------------------------
// REDFOR (A3)
case 0: {
    _Unit_Pool_S = [
	"O_crew_F","O_Helipilot_F","O_Soldier_SL_F","O_soldier_AR_F","O_soldier_AR_F","O_soldier_exp_F",
	"O_soldier_GL_F","O_soldier_GL_F","O_soldier_M_F","O_medic_F","O_soldier_AA_F","O_soldier_repair_F",
	"O_Soldier_F","O_Soldier_F","O_soldier_LAT_F","O_soldier_LAT_F","O_soldier_lite_F","O_soldier_TL_F","O_soldier_TL_F"
	];
    _Unit_Pool_V = [
	"O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","B_G_Offroad_01_armed_F","O_APC_Wheeled_02_rcws_F","I_APC_Wheeled_03_cannon_F"
	];
    _Unit_Pool_T = [
	"I_APC_Wheeled_03_cannon_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F"
	];
	_Unit_Pool_A = [
	"O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Light_02_armed_F"
	];
};
//-------------------------------------------------------------------------------------------------
// BLUFOR (A3)
case 1: {
    _Unit_Pool_S = ["B_crew_F","B_Helipilot_F","B_Soldier_SL_F","B_soldier_AR_F","B_soldier_AR_F","B_soldier_exp_F","B_soldier_GL_F","B_soldier_GL_F","B_soldier_AA_F","B_soldier_M_F","B_medic_F","B_soldier_repair_F","B_Soldier_F","B_Soldier_F","B_soldier_LAT_F","B_soldier_LAT_F","B_soldier_lite_F","B_soldier_TL_F","B_soldier_TL_F"];
    _Unit_Pool_V = ["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"];
    _Unit_Pool_T = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_rcws_F","B_MBT_01_cannon_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
    _Unit_Pool_A = ["B_Heli_Light_01_armed_F","B_Heli_Transport_01_camo_F","B_Heli_Light_01_F"];
};
//-------------------------------------------------------------------------------------------------
// Independent (A3)
case 2:  {
    _Unit_Pool_S = ["I_crew_F","I_helipilot_F","I_officer_F","I_Soldier_AT_F","I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_GL_F","I_Soldier_exp_F","I_engineer_F","I_medic_F","I_Soldier_AR_F","I_Soldier_A_F"];
    _Unit_Pool_V = ["I_Truck_02_covered_F","I_Truck_02_transport_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_MRAP_03_F"];
    _Unit_Pool_T = ["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F"];
    _Unit_Pool_A = ["I_Heli_light_03_F"];
};
//-------------------------------------------------------------------------------------------------
// Civilians (A3)
case 3: {
    _Unit_Pool_S = ["C_man_1","C_man_1","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
    _Unit_Pool_V = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_T = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_A = [];
};

//-------------------------------------------------------------------------------------------------
// guer -  (Independent)mix Indep (A3)
case 4: {
    _Unit_Pool_S = ["I_crew_F","I_helipilot_F","I_Spotter_F","I_Sniper_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_8_F","I_C_Soldier_Camo_F","I_C_Pilot_F","I_C_Helipilot_F","I_Soldier_universal_F","I_G_Soldier_universal_F","I_C_Soldier_universal_F","I_ghillie_lsh_F","I_ghillie_sard_F","I_ghillie_ard_F","I_G_Sharpshooter_F","I_diver_TL_F","I_diver_exp_F","I_diver_F","I_soldier_UAV_F","I_officer_F","I_helicrew_F","I_pilot_F","I_helipilot_F","I_crew_F","I_engineer_F","I_Soldier_exp_F","I_Soldier_repair_F","I_medic_F","I_Soldier_AA_F","I_Soldier_AT_F","I_Soldier_LAT_F","I_Soldier_M_F","I_Soldier_TL_F","I_Soldier_SL_F","I_Soldier_AR_F","I_Soldier_GL_F","I_Soldier_A_F","I_Soldier_lite_F","I_soldier_F","I_G_officer_F","I_G_Soldier_A_F","I_G_Soldier_LAT_F","I_G_Soldier_M_F","I_G_Soldier_GL_F","I_G_Soldier_exp_F","I_G_engineer_F","I_G_medic_F","I_G_Soldier_AR_F","I_G_Soldier_TL_F","I_G_Soldier_SL_F","I_G_Soldier_lite_F","I_G_Soldier_F"];
    _Unit_Pool_V = ["I_G_Offroad_01_repair_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Quadbike_01_F","I_G_Quadbike_01_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_C_Offroad_02_unarmed_F","I_C_Offroad_02_unarmed_brown_F","I_C_Offroad_02_unarmed_olive_F","I_C_Van_01_transport_F","B_LSV_01_armed_black_F","B_LSV_01_armed_olive_F","B_LSV_01_armed_sand_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_arty_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F","O_Truck_03_covered_F","O_Truck_02_transport_F","O_G_Van_01_transport_F","O_T_LSV_02_armed_viper_F","O_LSV_02_armed_F","O_T_LSV_02_armed_black_F","O_LSV_02_armed_arid_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Offroad_01_repair_F","C_Truck_02_covered_F","C_Quadbike_01_black_F","I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_Mortar_01_F","I_G_Mortar_01_F","I_static_AA_F","I_static_AT_F"];
    _Unit_Pool_T = ["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","O_MBT_02_arty_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_Mortar_01_F","I_G_Mortar_01_F","I_static_AA_F","I_static_AT_F"];
	_Unit_Pool_A = ["O_Heli_Attack_02_F","O_Heli_Light_02_armed_F","I_Heli_light_03_F","O_Heli_Light_02_F","B_Heli_Attack_01_F","B_Heli_Light_01_armed_F","O_Heli_Attack_02_black_F","O_T_VTOL_02_infantry_ghex_F","B_T_VTOL_01_armed_olive_F","B_T_VTOL_01_armed_F","B_Heli_Transport_03_F","B_Heli_Transport_01_F"];
};

  
	//________________	DAC GF Missions	________________
	//________________	edit the GF_Missions\Custom_Units_Array.sqf	________________
 
case 5: {
    _Unit_Pool_S = GF_Missions_DAC_Pool_Infantry;
    _Unit_Pool_V = GF_Missions_DAC_Pool_Land_Vehicles;
    _Unit_Pool_T = GF_Missions_DAC_Pool_Armoured_Vehicles;
	_Unit_Pool_A = GF_Missions_DAC_Pool_Air_Vehicles;
};
//-------------------------------------------------------------------------------------------------

Default {
    if(DAC_Basic_Value != 6) then {
      DAC_Basic_Value = 6;publicvariable "DAC_Basic_Value",
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if(count _this == 2) then {
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
} else {
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray