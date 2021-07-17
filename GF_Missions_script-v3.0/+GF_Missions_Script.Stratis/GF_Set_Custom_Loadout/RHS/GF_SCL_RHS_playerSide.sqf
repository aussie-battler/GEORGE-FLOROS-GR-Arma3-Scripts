


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
//	this setVariable ["Var_GF_SCL_RHS_playerSide", true];
	
	
diag_log "//________________	GF Set Custom Loadout Script Initializing	_____________";
diag_log "//________________	GF_SCL_RHS_playerSide.sqf	_____________";

systemchat "GF Set Custom Loadout Script Initializing";


//________________ GF_SCL_RHS_playerSide.sqf _____________


GF_SCL_RHS_playerSide_primaryWeapon_array = [
//________________	RHSUSAF & RHSAFRF	_____________

//________________	RHSUSAF	_____________	
		
"rhs_weap_m4",
"rhs_weap_m4_m203",
"rhs_weap_m4_carryhandle",
"rhs_weap_m4_carryhandle_pmag",
"rhs_weap_m4_m320",

"rhs_weap_m4a1_m320",
"rhs_weap_m4a1_m203",
"rhs_weap_m4a1_carryhandle_m203",
"rhs_weap_m4a1",
"rhs_weap_m4a1_carryhandle",

"rhs_weap_m4a1_d",
"rhs_weap_m4a1_d_mstock",

"rhs_weap_m4a1_wd",
"rhs_weap_m4a1_wd_mstock",

"rhs_weap_m4a1_m203s",
"rhs_weap_m4a1_m203s_wd",
"rhs_weap_m4a1_m203s_d",
"rhs_weap_m4a1_m203s_sa",

"rhs_weap_hk416d10",
"rhs_weap_hk416d10_m320",
"rhs_weap_hk416d10_LMT",
"rhs_weap_hk416d10_LMT_d",
"rhs_weap_hk416d10_LMT_wd",
"rhs_weap_hk416d145",
"rhs_weap_hk416d145_m320",
"rhs_weap_hk416d145_d",
"rhs_weap_hk416d145_d_2",
"rhs_weap_hk416d145_wd",
"rhs_weap_hk416d145_wd_2",

"rhs_weap_m4a1_blockII",
"rhs_weap_m4a1_blockII_bk",
"rhs_weap_m4a1_blockII_KAC",
"rhs_weap_m4a1_blockII_KAC_bk",
"rhs_weap_m4a1_blockII_M203",
"rhs_weap_m4a1_blockII_M203_bk",

"rhs_weap_m4a1_blockII_wd",
"rhs_weap_m4a1_blockII_d",

"rhs_weap_mk18",
"rhs_weap_mk18_KAC",
"rhs_weap_mk18_M320",
"rhs_weap_mk18_bk",
"rhs_weap_mk18_KAC_bk",
"rhs_weap_mk18_wd",
"rhs_weap_mk18_KAC_wd",
"rhs_weap_mk18_d",
"rhs_weap_mk18_KAC_d",

"rhs_weap_m16a4",
"rhs_weap_m16a4_carryhandle",
"rhs_weap_m16a4_carryhandle_M203",
"rhs_weap_m16a4_carryhandle_pmag",

"rhs_weap_m27iar",

"rhs_weap_m249",
"rhs_weap_m249_pip",
"rhs_weap_m249_pip_S",
"rhs_weap_m249_pip_S_para",
"rhs_weap_m249_pip_S_vfg",
"rhs_weap_m249_pip_L",
"rhs_weap_m249_pip_L_para",
"rhs_weap_m249_pip_L_vfg",

"rhs_weap_m240B",
"rhs_weap_m240B_CAP",
"rhs_weap_m240G",

"rhs_weap_m14ebrri",
"rhs_weap_sr25",
"rhs_weap_sr25_ec",

"rhs_weap_m24sws",
"rhs_weap_m24sws_d",
"rhs_weap_m24sws_wd",

"rhs_weap_m40a5",
"rhs_weap_m40a5_d",
"rhs_weap_m40a5_wd",

"rhs_weap_m39",
"rhs_weap_XM2010",
"rhs_weap_XM2010_d",
"rhs_weap_XM2010_wd",
"rhs_weap_XM2010_sa",

"rhs_weap_m32",

"rhsusf_weap_MP7A2",
"rhsusf_weap_MP7A2_winter",
"rhsusf_weap_MP7A2_desert",
"rhsusf_weap_MP7A2_aor1",

"rhs_weap_M107",
"rhs_weap_M107_w",
"rhs_weap_M107_d",
"rhs_weap_M107_lc",

"rhs_weap_M320",

"rhsusf_weap_m1911a1",
"rhsusf_weap_glock17g4",
"rhsusf_weap_m9",

"rhs_weap_M590_8RD",
"rhs_weap_M590_5RD",

// Weap AI - Is this needed?

/* "rhs_m4_compm4",
"rhs_m4_acog",
"rhs_m4_acog2",
"rhs_m4_acog3",
"rhs_m4_grip_compm4",
"rhs_m4_grip_acog",
"rhs_m4_grip_acog2",
"rhs_m4_grip_acog3",
"rhs_m4_m320_compm4",
"rhs_m4_m320_acog",
"rhs_m4_m320_acog2",
"rhs_m4_m320_acog3"
*/


//________________	RHSAFRF	_____________	

"rhs_tr8_periscope",
"rhs_tr8_periscope_pip",
"rhs_pdu4",

"rhs_weap_ak74m",
"rhs_weap_asval",
"rhs_weap_asval_grip",
"rhs_weap_asval_npz",
"rhs_weap_asval_grip_npz",
"rhs_weap_vss",
"rhs_weap_vss_grip",
"rhs_weap_vss_npz",
"rhs_weap_vss_grip_npz",
"rhs_weap_ak74m_zenitco01",
"rhs_weap_ak74m_zenitco01_b33",
"rhs_weap_ak74mr",
"rhs_weap_ak74mr_gp25",
"rhs_weap_ak105",
"rhs_weap_ak105_zenitco01",
"rhs_weap_ak105_npz",
"rhs_weap_ak105_zenitco01_b33",
"rhs_weap_ak74m_camo",
"rhs_weap_ak74m_npz",
"rhs_weap_ak74m_desert_npz",
"rhs_weap_akm",
"rhs_weap_akmn",
"rhs_weap_akmn_npz",
"rhs_weap_akm_zenitco01_b33",
"rhs_weap_akms",
"rhs_weap_akms_folded",
"rhs_weap_akm_gp25",
"rhs_weap_akmn_gp25",
"rhs_weap_akms_gp25",
"rhs_weap_pm63",
"rhs_weap_ak103",
"rhs_weap_ak104",
"rhs_weap_ak104_npz",
"rhs_weap_ak104_zenitco01",
"rhs_weap_ak104_zenitco01_b33",
"rhs_weap_ak103_npz",
"rhs_weap_ak103_zenitco01",
"rhs_weap_ak103_zenitco01_b33",
"rhs_weap_ak103_1",
"rhs_weap_ak103_1_npz",
"rhs_weap_ak103_2",
"rhs_weap_ak103_2_npz",
"rhs_weap_ak103_gp25",
"rhs_weap_ak103_gp25_npz",
"rhs_weap_ak74m_folded",
"rhs_weap_ak74m_camo_folded",
"rhs_weap_ak74m_desert_folded",
"rhs_weap_ak74m_plummag_folded",
"rhs_weap_ak74m_2mag",
"rhs_weap_ak74m_2mag_npz",
"rhs_weap_ak74m_2mag_camo",
"rhs_weap_ak74m_desert",
"rhs_weap_ak74m_plummag",
"rhs_weap_ak74m_plummag_npz",
"rhs_weap_ak74m_gp25",
"rhs_weap_ak74m_gp25_npz",
"rhs_weap_ak74m_fullplum",
"rhs_weap_ak74m_fullplum_npz",
"rhs_weap_ak74m_fullplum_gp25",
"rhs_weap_ak74m_fullplum_gp25_npz",
"rhs_weap_ak74",
"rhs_weap_ak74_2",
"rhs_weap_ak74n_2",
"rhs_weap_ak74n_2_npz",
"rhs_weap_ak74_3",
"rhs_weap_ak74_gp25",
"rhs_weap_ak74n",
"rhs_weap_ak74n_gp25",
"rhs_weap_ak74n_gp25_npz",
"rhs_weap_ak74n_npz",
"rhs_weap_aks74",
"rhs_weap_aks74_folded",
"rhs_weap_aks74_2",
"rhs_weap_aks74_2_folded",
"rhs_weap_aks74_gp25",
"rhs_weap_aks74n",
"rhs_weap_aks74n_npz",
"rhs_weap_aks74n_folded",
"rhs_weap_aks74n_gp25",
"rhs_weap_aks74n_gp25_npz",
"rhs_weap_aks74n_2",
"rhs_weap_aks74n_2_npz",
"rhs_weap_aks74u",
"rhs_weap_aks74u_folded",
"rhs_weap_aks74un",
"rhs_weap_aks74un_folded",
"rhs_weap_svdp",
"rhs_weap_svdp_npz",
"rhs_weap_svdp_wd",
"rhs_weap_svdp_wd_npz",
"rhs_weap_svds",
"rhs_weap_svds_npz",
"rhs_weap_t5000",

"rhs_weap_pkp",
"rhs_weap_pkm"
];
	

GF_SCL_RHS_playerSide_secondaryWeapon_array = [
// Launchers
"rhs_weap_m72a7",
"rhs_weap_M136",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp",
"rhs_weap_smaw",
"rhs_weap_smaw_green",
"rhs_weap_fim92",
"rhs_weap_fgm148",
"rhs_weap_maaws",
"rhs_weap_mk40_sraw",
"rhs_weap_mk41_sraw",

"rhs_weap_rpg26",
"rhs_weap_rshg2",
"rhs_weap_rpg7",
"rhs_weap_igla"					
];
			
GF_SCL_RHS_playerSide_handgunWeapon_array = [

//________________	RHSUSAF	_____________

//	Pistols
"rhsusf_weap_m1911a1",
"rhsusf_weap_glock17g4",
"rhsusf_weap_m9",

//________________	RHSAFRF	_____________	

"rhs_weap_pp2000",
"rhs_weap_pp2000_folded",
"rhs_weap_pya",
"rhs_weap_rsp30_white",
"rhs_weap_rsp30_red",
"rhs_weap_rsp30_green",
"rhs_weap_tr8",
"rhs_weap_makarov_pm",
"rhs_weap_pb_6p9"
];
			
			
GF_SCL_RHS_playerSide_Civilian_Uniform_Custom_array = [
"U_OG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1",
"U_BG_leader","U_I_G_resistanceLeader_F","U_Competitor","U_C_HunterBody_grn","U_OrestesBody",
"U_C_Journalist","U_Marshal","U_Rangemaster","U_I_G_Story_Protagonist_F"
];


GF_SCL_RHS_playerSide_Uniform_array = [

//________________	RHSUSAF	_____________

//	G3 Uniform
"rhs_uniform_g3_mc",
"rhs_uniform_g3_m81",
"rhs_uniform_g3_tan",
"rhs_uniform_g3_rgr",
"rhs_uniform_g3_blk",

//	FROG
"rhs_uniform_FROG01_d",
"rhs_uniform_FROG01_wd",

//	Combat Uniform
"rhs_uniform_cu_ocp",
"rhs_uniform_cu_ucp",
"rhs_uniform_cu_ocp_82nd",
"rhs_uniform_cu_ocp_101st",
"rhs_uniform_cu_ocp_10th",
"rhs_uniform_cu_ucp_82nd",
"rhs_uniform_cu_ucp_101st",
"rhs_uniform_cu_ucp_10th",
"rhs_uniform_cu_ocp_patchless",
"rhs_uniform_cu_ucp_patchless",

//________________	RHSAFRF	_____________		

//	uniforms
"rhs_uniform_flora",
"rhs_uniform_vdv_emr",
"rhs_uniform_msv_emr",
"rhs_uniform_vdv_flora",
"rhs_uniform_vdv_mflora",
"rhs_uniform_mvd_izlom",
"rhs_uniform_vmf_flora",
"rhs_uniform_vmf_flora_subdued",
"rhs_uniform_rva_flora",
"rhs_uniform_m88_patchless",
"rhs_uniform_flora_patchless",
"rhs_uniform_flora_patchless_alt",
"rhs_uniform_emr_patchless",
"rhs_uniform_mflora_patchless",
"rhs_uniform_df15",
"rhs_uniform_gorka_r_y",
"rhs_uniform_gorka_r_g",
"rhs_uniform_vdv_emr_des"
];

			
GF_SCL_RHS_playerSide_Vests_array =  [

//________________	RHSUSAF	_____________

//	IOTV
"rhsusf_iotv_ocp",
"rhsusf_iotv_ocp_Grenadier",
"rhsusf_iotv_ocp_Medic",
"rhsusf_iotv_ocp_Repair",
"rhsusf_iotv_ocp_Rifleman",
"rhsusf_iotv_ocp_SAW",
"rhsusf_iotv_ocp_Squadleader",
"rhsusf_iotv_ocp_teamleader",

"rhsusf_iotv_ucp",
"rhsusf_iotv_ucp_Grenadier",
"rhsusf_iotv_ucp_Medic",
"rhsusf_iotv_ucp_Repair",
"rhsusf_iotv_ucp_Rifleman",
"rhsusf_iotv_ucp_SAW",
"rhsusf_iotv_ucp_Squadleader",
"rhsusf_iotv_ucp_teamleader",

//	SPC
"rhsusf_spc",
"rhsusf_spc_rifleman",
"rhsusf_spc_iar",
"rhsusf_spc_corpsman",
"rhsusf_spc_crewman",
"rhsusf_spc_light",
"rhsusf_spc_marksman",
"rhsusf_spc_mg",
"rhsusf_spc_squadleader",
"rhsusf_spc_teamleader",

//	MBAV
"rhsusf_mbav",
"rhsusf_mbav_light",
"rhsusf_mbav_rifleman",
"rhsusf_mbav_mg",
"rhsusf_mbav_grenadier",
"rhsusf_mbav_medic",

//________________	RHSAFRF	_____________	

//	vests
"rhs_6sh46",
//	6b13 series
"rhs_6b13",
"rhs_6b13_crewofficer",
"rhs_6b13_6sh92",
"rhs_6b13_6sh92_vog",
"rhs_6b13_6sh92_headset_mapcase",
"rhs_6b13_6sh92_radio",
"rhs_6b13_flora",
"rhs_6b13_Flora_crewofficer",
"rhs_6b13_Flora_6sh92",
"rhs_6b13_Flora_6sh92_vog",
"rhs_6b13_Flora_6sh92_headset_mapcase",
"rhs_6b13_Flora_6sh92_radio",
"rhs_6b13_emr",
"rhs_6b13_emr_crewofficer",
"rhs_6b13_emr_6sh92",
"rhs_6b13_emr_6sh92_vog",
"rhs_6b13_emr_6sh92_headset_mapcase",
"rhs_6b13_emr_6sh92_radio",
//	6b23 series
"rhs_6b23",
"rhs_6b23_crew",
"rhs_6b23_crewofficer",
"rhs_vest_commander",
"rhs_6b23_engineer",
"rhs_6b23_medic",
"rhs_6b23_rifleman",
"rhs_6b23_sniper",
"rhs_6b23_6sh92",
"rhs_6b23_6sh92_vog",
"rhs_6b23_6sh92_vog_headset",
"rhs_6b23_6sh92_headset",
"rhs_6b23_6sh92_headset_mapcase",
"rhs_6b23_6sh92_radio",
"rhs_6b23_vydra_3m",
//	vests digi
"rhs_6b23_digi",
"rhs_6b23_digi_crew",
"rhs_6b23_digi_crewofficer",
"rhs_6b23_digi_engineer",
"rhs_6b23_digi_medic",
"rhs_6b23_digi_rifleman",
"rhs_6b23_digi_sniper",
"rhs_6b23_digi_6sh92",
"rhs_6b23_digi_6sh92_vog",
"rhs_6b23_digi_6sh92_vog_headset",
"rhs_6b23_digi_6sh92_headset",
"rhs_6b23_digi_6sh92_headset_mapcase",
"rhs_6b23_digi_6sh92_radio",
"rhs_6b23_digi_vydra_3m",
//	6sh116
"rhs_6b23_6sh116",
"rhs_6b23_6sh116_flora",
"rhs_6b23_6sh116_od",
"rhs_6b23_6sh116_vog",
"rhs_6b23_6sh116_vog_flora",
"rhs_6b23_6sh116_vog_od",
//	mountain flora
"rhs_6b23_ML",
"rhs_6b23_ML_crew",
"rhs_6b23_ML_crewofficer",
"rhs_6b23_ML_engineer",
"rhs_6b23_ML_medic",
"rhs_6b23_ML_rifleman",
"rhs_6b23_ML_sniper",
"rhs_6b23_ML_6sh92",
"rhs_6b23_ML_6sh92_vog",
"rhs_6b23_ML_6sh92_vog_headset",
"rhs_6b23_ML_6sh92_headset",
"rhs_6b23_ML_6sh92_headset_mapcase",
"rhs_6b23_ML_6sh92_radio",
"rhs_6b23_ML_vydra_3m",

"rhs_6sh92",
"rhs_6sh92_vog",
"rhs_6sh92_vog_headset",
"rhs_6sh92_headset",
"rhs_6sh92_radio",
"rhs_6sh92_digi",
"rhs_6sh92_digi_vog",
"rhs_6sh92_digi_vog_headset",
"rhs_6sh92_digi_headset",
"rhs_6sh92_digi_radio",

//	other
"rhs_vydra_3m",
"rhs_vest_pistol_holster"
]; 


GF_SCL_RHS_playerSide_Backpacks_array = [

//________________	RHSUSAF	_____________

"rhsusf_assault_eagleaiii_ucp",
"rhsusf_assault_eagleaiii_ocp",
"rhsusf_assault_eagleaiii_coy",
"rhsusf_falconii",

//	weapon bags
"B_rhsusf_B_BACKPACK",
"RHS_M2_Gun_Bag",
"RHS_M2_Tripod_Bag",
"RHS_M2_MiniTripod_Bag",
"RHS_Mk19_Gun_Bag",
"RHS_Mk19_Tripod_Bag",
"rhs_Tow_Gun_Bag",
"rhs_TOW_Tripod_Bag",
"rhs_M252_Gun_Bag",
"rhs_M252_Bipod_Bag",

//________________	RHSAFRF	_____________	

"rhs_assault_umbts",
"rhs_assault_umbts_engineer",
"rhs_assault_umbts_engineer_empty",
"rhs_assault_umbts_medic",
"rhs_rpg",
"rhs_rpg_empty",
"rhs_sidor",
"rhs_sidorMG",
"RHS_NSV_Gun_Bag",
"RHS_NSV_Tripod_Bag",
"RHS_DShkM_Gun_Bag",
"RHS_DShkM_TripodHigh_Bag",
"RHS_DShkM_TripodLow_Bag",
"RHS_Kord_Gun_Bag",
"RHS_Kord_Tripod_Bag",
"RHS_Metis_Gun_Bag",
"RHS_Metis_Tripod_Bag",
"RHS_Kornet_Gun_Bag",
"RHS_Kornet_Tripod_Bag",
"RHS_AGS30_Gun_Bag",
"RHS_AGS30_Tripod_Bag",
"RHS_SPG9_Gun_Bag",
"RHS_SPG9_Tripod_Bag",
"RHS_Podnos_Gun_Bag",
"RHS_Podnos_Bipod_Bag"
];  

			
GF_SCL_RHS_playerSide_Headgear_array = [

//________________	RHSUSAF	_____________

// Patrol Caps
"rhsusf_patrolcap_ocp",
"rhsusf_patrolcap_ucp",

"rhs_8point_marpatd",
"rhs_8point_marpatwd",

// Boonie hats
"rhs_Booniehat_ocp",
"rhs_Booniehat_ucp",
"rhs_Booniehat_marpatd",
"rhs_Booniehat_marpatwd",
"rhs_Booniehat_m81",

"rhs_booniehat2_marpatd",
"rhs_booniehat2_marpatwd",

// Caps
"rhsusf_Bowman",
"rhsusf_Bowman_cap",

// ACH
"rhsusf_ach_helmet_ocp",
"rhsusf_ach_helmet_ucp",
"rhsusf_ach_helmet_m81",
"rhsusf_ach_helmet_camo_ocp",
"rhsusf_ach_helmet_headset_ocp",
"rhsusf_ach_helmet_headset_ucp",
"rhsusf_ach_helmet_ess_ocp",
"rhsusf_ach_helmet_ess_ucp",
"rhsusf_ach_helmet_headset_ess_ocp",
"rhsusf_ach_helmet_headset_ess_ucp",
"rhsusf_ach_helmet_ocp_norotos",
"rhsusf_ach_helmet_ucp_norotos",
"rhsusf_ach_bare",
"rhsusf_ach_bare_ess",
"rhsusf_ach_bare_headset",
"rhsusf_ach_bare_headset_ess",
"rhsusf_ach_bare_tan",
"rhsusf_ach_bare_tan_ess",
"rhsusf_ach_bare_tan_headset",
"rhsusf_ach_bare_tan_headset_ess",
"rhsusf_ach_bare_wood",
"rhsusf_ach_bare_wood_ess",
"rhsusf_ach_bare_wood_headset",
"rhsusf_ach_bare_wood_headset_ess",
"rhsusf_ach_bare_des",
"rhsusf_ach_bare_des_ess",
"rhsusf_ach_bare_des_headset",
"rhsusf_ach_bare_des_headset_ess",
"rhsusf_ach_bare_semi",
"rhsusf_ach_bare_semi_ess",
"rhsusf_ach_bare_semi_headset",
"rhsusf_ach_bare_semi_headset_ess",

//	Opscore
"rhsusf_opscore_fg",
"rhsusf_opscore_fg_pelt",
"rhsusf_opscore_fg_pelt_nsw",
"rhsusf_opscore_fg_pelt_cam",
"rhsusf_opscore_ut",
"rhsusf_opscore_ut_pelt",
"rhsusf_opscore_ut_pelt_cam",
"rhsusf_opscore_ut_pelt_nsw",
"rhsusf_opscore_ut_pelt_nsw_cam",
"rhsusf_opscore_bk",
"rhsusf_opscore_bk_pelt",
"rhsusf_opscore_mc",
"rhsusf_opscore_mc_pelt",
"rhsusf_opscore_mc_pelt_nsw",
"rhsusf_opscore_aor1",
"rhsusf_opscore_aor1_pelt",
"rhsusf_opscore_aor1_pelt_nsw",
"rhsusf_opscore_aor2",
"rhsusf_opscore_aor2_pelt",
"rhsusf_opscore_aor2_pelt_nsw",
"rhsusf_opscore_paint",
"rhsusf_opscore_paint_pelt",
"rhsusf_opscore_paint_pelt_nsw",
"rhsusf_opscore_paint_pelt_nsw_cam",
"rhsusf_opscore_mc_cover",
"rhsusf_opscore_mc_cover_pelt",
"rhsusf_opscore_mc_cover_pelt_nsw",
"rhsusf_opscore_mc_cover_pelt_cam",
"rhsusf_opscore_rg_cover",
"rhsusf_opscore_rg_cover_pelt",
"rhsusf_opscore_coy_cover",
"rhsusf_opscore_coy_cover_pelt",

//	Opscore Maritime
"rhsusf_opscore_mar_ut",
"rhsusf_opscore_mar_ut_pelt",
"rhsusf_opscore_mar_fg",
"rhsusf_opscore_mar_fg_pelt",

//	CVC
"rhsusf_cvc_helmet",
"rhsusf_cvc_alt_helmet",
"rhsusf_cvc_ess",
"rhsusf_cvc_green_helmet",
"rhsusf_cvc_green_alt_helmet",
"rhsusf_cvc_green_ess",

//	HGU56p
"rhsusf_hgu56p",
"rhsusf_hgu56p_mask",

//	IHADSS
"rhsusf_ihadss",

//	USMC LWH
"rhsusf_lwh_helmet_marpatd",
"rhsusf_lwh_helmet_marpatd_ess",
"rhsusf_lwh_helmet_marpatd_headset",
"rhsusf_lwh_helmet_marpatwd",
"rhsusf_lwh_helmet_marpatwd_ess",
"rhsusf_lwh_helmet_marpatwd_headset",

//	USMC MICH 2000
"rhsusf_mich_helmet_marpatwd",
"rhsusf_mich_helmet_marpatwd_headset",
"rhsusf_mich_helmet_marpatd",
"rhsusf_mich_helmet_marpatd_headset",
"rhsusf_mich_helmet_marpatwd_alt",
"rhsusf_mich_helmet_marpatwd_alt_headset",
"rhsusf_mich_helmet_marpatd_alt",
"rhsusf_mich_helmet_marpatd_alt_headset",
"rhsusf_mich_helmet_marpatwd_norotos",
"rhsusf_mich_helmet_marpatwd_norotos_headset",
"rhsusf_mich_helmet_marpatd_norotos",
"rhsusf_mich_helmet_marpatd_norotos_headset",
"rhsusf_mich_helmet_marpatwd_norotos_arc",
"rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
"rhsusf_mich_helmet_marpatd_norotos_arc",
"rhsusf_mich_helmet_marpatd_norotos_arc_headset",
"rhsusf_mich_bare",
"rhsusf_mich_bare_headset",
"rhsusf_mich_bare_alt",
"rhsusf_mich_bare_norotos_alt",
"rhsusf_mich_bare_norotos_alt_headset",
"rhsusf_mich_bare_norotos_arc_alt",
"rhsusf_mich_bare_norotos_arc_alt_headset",
"rhsusf_mich_bare_norotos",
"rhsusf_mich_bare_norotos_headset",
"rhsusf_mich_bare_norotos_arc",
"rhsusf_mich_bare_norotos_arc_headset",
"rhsusf_mich_bare_tan",
"rhsusf_mich_bare_tan_headset",
"rhsusf_mich_bare_alt_tan",
"rhsusf_mich_bare_norotos_tan",
"rhsusf_mich_bare_norotos_tan_headset",
"rhsusf_mich_bare_norotos_alt_tan",
"rhsusf_mich_bare_norotos_alt_tan_headset",
"rhsusf_mich_bare_norotos_arc_tan",
"rhsusf_mich_bare_norotos_arc_tan_headset",
"rhsusf_mich_bare_norotos_arc_alt_tan",
"rhsusf_mich_bare_norotos_arc_alt_tan_headset",
"rhsusf_mich_bare_semi",
"rhsusf_mich_bare_semi_headset",
"rhsusf_mich_bare_alt_semi",
"rhsusf_mich_bare_norotos_semi",
"rhsusf_mich_bare_norotos_semi_headset",
"rhsusf_mich_bare_norotos_alt_semi",
"rhsusf_mich_bare_norotos_alt_semi_headset",
"rhsusf_mich_bare_norotos_arc_semi",
"rhsusf_mich_bare_norotos_arc_semi_headset",
"rhsusf_mich_bare_norotos_arc_alt_semi",
"rhsusf_mich_bare_norotos_arc_alt_semi_headset",

//________________	RHSAFRF	_____________	

//	headgear
"rhs_fieldcap",
"rhs_fieldcap_vsr",
"rhs_fieldcap_khk",
"rhs_fieldcap_helm",
"rhs_tsh4",
"rhs_tsh4_ess",
"rhs_tsh4_bala",
"rhs_tsh4_ess_bala",
"rhs_fieldcap_digi_des",

"rhs_zsh7a",
"rhs_zsh7a_mike",
"rhs_zsh7a_mike_green",
"rhs_zsh7a_mike_green_alt",
"rhs_zsh7a_alt",
"rhs_zsh7a_mike_alt",
"rhs_zsh12",
"rhs_zsh12_black",
"rhs_zsh12_bala",

"rhs_gssh18",

"rhs_6b26",
"rhs_6b26_ess",
"rhs_6b26_bala",
"rhs_6b26_ess_bala",

"rhs_altyn",
"rhs_altyn_bala",
"rhs_altyn_visordown",
"rhs_altyn_novisor",
"rhs_altyn_novisor_bala",
"rhs_altyn_novisor_ess",
"rhs_altyn_novisor_ess_bala",

"rhs_6b7_1m",
"rhs_6b7_1m_ess",
"rhs_6b7_1m_ess_bala",
"rhs_6b7_1m_emr",
"rhs_6b7_1m_emr_ess",
"rhs_6b7_1m_emr_ess_bala",
"rhs_6b7_1m_flora",
"rhs_6b7_1m_olive",
"rhs_6b7_1m_bala1",
"rhs_6b7_1m_bala1_emr",
"rhs_6b7_1m_bala1_flora",
"rhs_6b7_1m_bala1_olive",
"rhs_6b7_1m_bala2",
"rhs_6b7_1m_bala2_emr",
"rhs_6b7_1m_bala2_flora",
"rhs_6b7_1m_bala2_olive",
"rhs_6b7_1m_flora_ns3",

"rhs_6b47",
"rhs_6b47_bala",
"rhs_6b47_ess",
"rhs_6b47_ess_bala",

"rhs_6b26_green",
"rhs_6b26_ess_green",
"rhs_6b26_bala_green",
"rhs_6b26_ess_bala_green",

"rhs_6b27m",
"rhs_6b27m_ess",
"rhs_6b27m_bala",
"rhs_6b27m_ess_bala",

"rhs_6b27m_digi",
"rhs_6b27m_digi_ess",
"rhs_6b27m_digi_bala",
"rhs_6b27m_digi_ess_bala",

"rhs_6b27m_ml",
"rhs_6b27m_ml_ess",
"rhs_6b27m_ml_bala",
"rhs_6b27m_ml_ess_bala",

"rhs_6b27m_green",
"rhs_6b27m_green_ess",
"rhs_6b27m_green_bala",
"rhs_6b27m_green_ess_bala",

"rhs_6b28",
"rhs_6b28_ess",
"rhs_6b28_bala",
"rhs_6b28_ess_bala",

"rhs_6b28_flora",
"rhs_6b28_flora_ess",
"rhs_6b28_flora_ess_bala",
"rhs_6b28_flora_bala",

"rhs_6b28_green",
"rhs_6b28_green_ess",
"rhs_6b28_green_bala",
"rhs_6b28_green_ess_bala",
"rhs_ssh68",

"rhs_Booniehat_digi",
"rhs_Booniehat_flora",
"rhs_fieldcap_digi",
"rhs_fieldcap_digi2",
"rhs_fieldcap_helm_digi",
"rhs_fieldcap_ml",
"rhs_fieldcap_helm_ml",
"rhs_beanie",
"rhs_beanie_green",

//	Beret
"rhs_beret_vdv1",
"rhs_beret_vdv2",
"rhs_beret_vdv3",
"rhs_beret_milp",
"rhs_beret_mp1",
"rhs_beret_mp2"
];


GF_SCL_RHS_playerSide_Goggles_array = [
//	Optic gear
"rhs_googles_black",
"rhs_googles_clear",
"rhs_googles_yellow",
"rhs_googles_orange",

//________________	RHSAFRF	_____________	

//	facewear
"rhs_balaclava",
"rhs_scarf"
];
			
			
GF_SCL_RHS_playerSide_items_array_1 = [
//for RyanZombies
//"RyanZombiesAntiVirusTemporary_Item",
//"RyanZombiesAntiVirusCure_Item",

//Vanilla			
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
"MineDetector"
];
	
	
GF_SCL_RHS_playerSide_items_array_2 = [
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

//________________	RHSUSAF	_____________

"rhsusf_bino_lerca_1200_black",
"rhsusf_bino_lerca_1200_tan",
"rhsusf_bino_lrf_Vector21",
"rhsusf_bino_leopold_mk4",
"rhsusf_bino_m24",
"rhsusf_bino_m24_ARD",
//	nvg
"rhsusf_ANPVS_14",
"rhsusf_ANPVS_15",

//	accesories
"rhs_weap_optic_smaw",

"rhsusf_acc_LEUPOLDMK4",
"rhsusf_acc_LEUPOLDMK4_d",
"rhsusf_acc_LEUPOLDMK4_wd",
"rhsusf_acc_LEUPOLDMK4_2",
"rhsusf_acc_LEUPOLDMK4_2_d",

"rhsusf_acc_premier",
"rhsusf_acc_premier_low",
"rhsusf_acc_premier_anpvs27",

"rhsusf_acc_M8541",
"rhsusf_acc_M8541_low",
"rhsusf_acc_M8541_low_d",
"rhsusf_acc_M8541_low_wd",

"rhsusf_acc_EOTECH",
"rhsusf_acc_eotech_552",
"rhsusf_acc_eotech_552_d",
"rhsusf_acc_eotech_552_wd",
"rhsusf_acc_eotech_xps3",

"rhsusf_acc_g33_xps3",
"rhsusf_acc_g33_xps3_tan",

"rhsusf_acc_compm4",

"rhsusf_acc_T1_high",
"rhsusf_acc_T1_low",
"rhsusf_acc_T1_low_fwd",
"rhsusf_acc_RM05",
"rhsusf_acc_RM05_fwd",
"rhsusf_acc_mrds",
"rhsusf_acc_mrds_fwd",
"rhsusf_acc_mrds_c",
"rhsusf_acc_mrds_fwd_c",
"rhsusf_acc_g33_t1",
"rhsusf_acc_RX01",
"rhsusf_acc_RX01_NoFilter",
"rhsusf_acc_RX01_tan",
"rhsusf_acc_RX01_NoFilter_tan",

"rhsusf_acc_ACOG",
"rhsusf_acc_ACOG2",
"rhsusf_acc_ACOG3",
"rhsusf_acc_ACOG_wd",
"rhsusf_acc_ACOG_d",
"rhsusf_acc_ACOG_sa",
"rhsusf_acc_ACOG_RMR",
"rhsusf_acc_ACOG_USMC",
"rhsusf_acc_ACOG2_USMC",
"rhsusf_acc_ACOG3_USMC",

"rhsusf_acc_ACOG_PIP",
"rhsusf_acc_ACOG2_pip",
"rhsusf_acc_ACOG3_pip",
"rhsusf_acc_ACOG_wd_pip",
"rhsusf_acc_ACOG_d_pip",
"rhsusf_acc_ACOG_sa_pip",
"rhsusf_acc_ACOG_RMR_pip",
"rhsusf_acc_ACOG_USMC_pip",
"rhsusf_acc_ACOG2_USMC_pip",
"rhsusf_acc_ACOG3_USMC_pip",

"rhsusf_acc_ACOG_3d",
"rhsusf_acc_ACOG2_3d",
"rhsusf_acc_ACOG3_3d",
"rhsusf_acc_ACOG_wd_3d",
"rhsusf_acc_ACOG_d_3d",
"rhsusf_acc_ACOG_sa_3d",
"rhsusf_acc_ACOG_RMR_3d",
"rhsusf_acc_ACOG_USMC_3d",
"rhsusf_acc_ACOG2_USMC_3d",
"rhsusf_acc_ACOG3_USMC_3d",

"rhsusf_acc_ACOG_anpvs27",
"rhsusf_acc_anpas13gv1",

"rhsusf_acc_ACOG_MDO",

"rhsusf_acc_ELCAN",
"rhsusf_acc_ELCAN_ard",
"rhsusf_acc_ELCAN_3d",
"rhsusf_acc_ELCAN_ard_3d",
"rhsusf_acc_ELCAN_PIP",
"rhsusf_acc_ELCAN_ard_PIP",

"rhsusf_acc_su230",
"rhsusf_acc_su230_mrds",
"rhsusf_acc_su230a",
"rhsusf_acc_su230a_mrds",
"rhsusf_acc_su230_c",
"rhsusf_acc_su230_mrds_c",
"rhsusf_acc_su230a_c",
"rhsusf_acc_su230a_mrds_c",
"rhsusf_acc_su230_3d",
"rhsusf_acc_su230_mrds_3d",
"rhsusf_acc_su230a_3d",
"rhsusf_acc_su230a_mrds_3d",
"rhsusf_acc_su230_c_3d",
"rhsusf_acc_su230_mrds_c_3d",
"rhsusf_acc_su230a_c_3d",
"rhsusf_acc_su230a_mrds_c_3d",

"rhsusf_acc_anpvs27",
"rhsusf_acc_M2010S",
"rhsusf_acc_M2010S_d",
"rhsusf_acc_M2010S_sa",
"rhsusf_acc_M2010S_wd",
"rhsusf_acc_SR25S",
"rhsusf_acc_SR25S_wd",
"rhsusf_acc_SR25S_d",

"rhsusf_acc_M952V",
"rhsusf_acc_wmx",
"rhsusf_acc_wmx_bk",

"rhsusf_acc_anpeq15",
"rhsusf_acc_anpeq15_top",
"rhsusf_acc_anpeq15_light",
"rhsusf_acc_anpeq15side",
"rhsusf_acc_anpeq15A",

"rhsusf_acc_anpeq15_wmx",
"rhsusf_acc_anpeq15_wmx_light",

"rhsusf_acc_anpeq16a",
"rhsusf_acc_anpeq16a_light",
"rhsusf_acc_anpeq16a_top",
"rhsusf_acc_anpeq16a_light_top",

"rhsusf_acc_rotex5_grey",
"rhsusf_acc_rotex5_tan",
"rhsusf_acc_nt4_black",
"rhsusf_acc_nt4_tan",
"rhsusf_acc_SF3P556",
"rhsusf_acc_SFMB556",

"rhsusf_acc_ARDEC_M240",

"rhsusf_acc_m24_silencer_black",
"rhsusf_acc_m24_muzzlehider_black",
"rhsusf_acc_m24_silencer_d",
"rhsusf_acc_m24_muzzlehider_d",
"rhsusf_acc_m24_silencer_wd",
"rhsusf_acc_m24_muzzlehider_wd",

"rhsusf_acc_rotex_mp7",
"rhsusf_acc_rotex_mp7_desert",
"rhsusf_acc_rotex_mp7_winter",
"rhsusf_acc_rotex_mp7_aor1",

"rhsusf_acc_M2A1",

"rhsusf_acc_harris_bipod",
"rhsusf_acc_harris_swivel",

"rhsusf_acc_grip1",
"rhsusf_acc_grip2",
"rhsusf_acc_grip2_tan",
"rhsusf_acc_grip2_wd",
"rhsusf_acc_grip3",
"rhsusf_acc_grip3_tan",
"rhsusf_acc_grip4",

"rhsusf_acc_rvg_blk",
"rhsusf_acc_rvg_de",
"rhsusf_acc_tacsac_blk",
"rhsusf_acc_tacsac_tan",
"rhsusf_acc_tacsac_blue",
"rhsusf_acc_tdstubby_blk",
"rhsusf_acc_tdstubby_tan",

//________________	RHSAFRF	_____________	

//	accesories
"rhs_acc_harris_swivel",
"rhs_acc_tgpa",
"rhs_acc_pbs1",
"rhs_acc_tgpv",
"rhs_acc_tgpv2",
"rhs_acc_dtk4short",
"rhs_acc_dtk4long",
"rhs_acc_dtk4screws",
"rhs_acc_pbs4",
"rhs_acc_dtk3",
"rhs_acc_dtk",
"rhs_acc_dtk1983",
"rhs_acc_dtk1",
"rhs_acc_dtk1l",
"rhs_acc_dtk1p",
"rhs_acc_dtk2",
"rhs_acc_uuk",
"rhs_acc_ak5",
"rhs_acc_pgs64",
"rhs_acc_pgs64_74u",
"rhs_acc_pgs64_74un",
"rhs_acc_1p29",
"rhs_acc_1p78",
"rhs_acc_pkas",
"rhs_acc_1p63",
"rhs_acc_ekp1",
"rhs_acc_pso1m2",
"rhs_acc_pso1m21",
"rhs_acc_pgo7v",
"rhs_acc_pgo7v2",
"rhs_acc_pgo7v3",
"rhs_acc_1pn93_1",
"rhs_acc_1pn93_2",
"rhs_acc_dh520x56",
"rhs_acc_2dpZenit",
"rhs_acc_2dpZenit_ris",
"rhs_acc_perst1ik",
"rhs_acc_perst1ik_ris",
"rhs_acc_perst3",
"rhs_acc_perst3_top",
"rhs_acc_perst3_2dp_h",
"rhs_acc_perst3_2dp_light_h",
"rhs_acc_rakursPM",
"rhs_acc_grip_rk2",
"rhs_acc_grip_rk6",
"rhs_acc_grip_ffg2",
"rhs_acc_6p9_suppressor"
];

	
GF_SCL_RHS_playerSide_items_array_3 = [
//	Flares
"Chemlight_blue",
"Chemlight_green",
"Chemlight_red",

//	Explosives
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

//________________	RHSAFRF	_____________	

//	Grenades
"rhs_mag_m67",
"rhs_mag_m69",
"rhs_mag_mk84",
"rhs_mag_an_m8hc",
"rhs_mag_an_m14_th3",
"rhs_mag_m7a3_cs",
"rhs_mag_mk3a2",
"rhs_mag_m18_green",
"rhs_mag_m18_purple",
"rhs_mag_m18_red",
"rhs_mag_m18_yellow",
	
//	M320 ammo (we lack M651 CS Gas)
"rhs_mag_M441_HE",
"rhs_mag_M433_HEDP",
"rhs_mag_M781_Practice",
"rhs_mag_M4009",
"rhs_mag_m576", // Buckshot
"rhs_mag_M585_white", // Flares
"rhs_mag_M661_green",
"rhs_mag_M662_red",
"rhs_mag_M713_red", // Smoke
"rhs_mag_M714_white",
"rhs_mag_M715_green",
"rhs_mag_M716_yellow",
"rhs_mag_M397_HET",

"rhsusf_mag_6Rnd_M433_HEDP",
"rhsusf_mag_6Rnd_M781_Practice",
"rhsusf_mag_6Rnd_M576_Buckshot",
"rhsusf_mag_6Rnd_M441_HE",
"rhsusf_mag_6Rnd_M397_HET",
	
//	mines
"rhs_mine_M19_mag",
"rhsusf_mine_m14_mag",


"rhs_mag_rgd5",
"rhs_mag_rdg2_white",
"rhs_mag_rdg2_black",
"rhs_mag_nspn_yellow",
"rhs_mag_nspn_red",
"rhs_mag_nspn_green",
"rhs_mag_nspd",
"rhs_mag_fakel",
"rhs_mag_fakels",
"rhs_mag_zarya2",
"rhs_mag_plamyam",
"rhs_mag_rgn",
"rhs_mag_rgo",

//	GP25 ammo
"rhs_VOG25",
"rhs_VOG25p",
"rhs_vg40tb",
"rhs_vg40sz",
"rhs_vg40op_white",
"rhs_vg40op_green",
"rhs_vg40op_red",
"rhs_GRD40_white",
"rhs_GRD40_green",
"rhs_GRD40_red",
"rhs_GDM40",
"rhs_VG40MD_White",
"rhs_VG40MD_Green",
"rhs_VG40MD_Red",

//	mines
"rhs_mine_tm62m_mag",
"rhs_mine_pmn2_mag"
];
			

GF_SCL_RHS_playerSide_Ravage_items_array = [		
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
GF_SCL_RHS_playerSide_ACE3_mod_Medical_array = [
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


GF_SCL_RHS_playerSide_ACE3_mod_items_array = [
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

GF_SCL_RHS_playerSide_Exclude_List = [

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


GF_SCL_RHS_playerSide_Exclude_List_Gear = [
	
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

	
				
GF_SCL_RHS_playerSide = {

	
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
	_unit setVariable ["Var_GF_SCL_RHS_playerSide",false];
}];
};


//________________	Randomize	________________

_Uniform = selectRandom GF_SCL_RHS_playerSide_Uniform_array;	//	For Civilian : GF_SCL_RHS_playerSide_Civilian_Uniform_Custom_array
_Headgear = selectRandom GF_SCL_RHS_playerSide_Headgear_array; 
_Goggles = selectRandom GF_SCL_RHS_playerSide_Goggles_array; 
_Vests = selectRandom GF_SCL_RHS_playerSide_Vests_array; 
_Backpacks = selectRandom GF_SCL_RHS_playerSide_Backpacks_array;
_primaryWeapon = selectRandom GF_SCL_RHS_playerSide_primaryWeapon_array;
_secondaryWeapon = selectRandom GF_SCL_RHS_playerSide_secondaryWeapon_array;
_handgunWeapon = selectRandom GF_SCL_RHS_playerSide_handgunWeapon_array;


//________________ addItemToVest	________________

_items_array_1_addtoVest = selectRandom GF_SCL_RHS_playerSide_items_array_1;
_items_array_2_addtoVest = selectRandom GF_SCL_RHS_playerSide_items_array_2;
_items_array_3_addtoVest = selectRandom GF_SCL_RHS_playerSide_items_array_3;
_Ravage_items_array_addtoVest = selectRandom GF_SCL_RHS_playerSide_Ravage_items_array;
_ACE3_mod_Medical_array_addtoVest = selectRandom GF_SCL_RHS_playerSide_ACE3_mod_Medical_array;
_ACE3_mod_items_array_addtoVest = selectRandom GF_SCL_RHS_playerSide_ACE3_mod_items_array;

//________________ addItemToBackpack	________________

_items_array_1_addtoBackpack = selectRandom GF_SCL_RHS_playerSide_items_array_1;
_items_array_2_addtoBackpack = selectRandom GF_SCL_RHS_playerSide_items_array_2;
_items_array_3_addtoBackpack = selectRandom GF_SCL_RHS_playerSide_items_array_3;
_Ravage_items_array_addtoBackpack = selectRandom GF_SCL_RHS_playerSide_Ravage_items_array;
_ACE3_mod_Medical_array_addtoBackpack = selectRandom GF_SCL_RHS_playerSide_ACE3_mod_Medical_array;
_ACE3_mod_items_array_addtoBackpack = selectRandom GF_SCL_RHS_playerSide_ACE3_mod_items_array;

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
	if (!((typeOf _this) in GF_SCL_RHS_playerSide_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_RHS_playerSide_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_RHS_playerSide_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_RHS_playerSide_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_RHS_playerSide_Exclude_List_Gear)) then {			
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
	if (!((typeOf _this) in GF_SCL_RHS_playerSide_Exclude_List_Gear)) then {	

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


GF_SCL_RHS_playerSide_Change_Equipment_civilian = {

removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

//________________	Randomize	________________

_Uniform = selectRandom GF_SCL_RHS_playerSide_Civilian_Uniform_Custom_array;	//	GF_SCL_RHS_playerSide_Uniform_array;
_Headgear = selectRandom GF_SCL_RHS_playerSide_Headgear_array; 
_Goggles = selectRandom GF_SCL_RHS_playerSide_Goggles_array; 
_Vests = selectRandom GF_SCL_RHS_playerSide_Vests_array; 
_Backpacks = selectRandom GF_SCL_RHS_playerSide_Backpacks_array;

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
	this setVariable ["Var_GF_SCL_RHS_playerSide", true];

3.	you can also spawn this for a certain unit :
	name this unit  ex : GF_SCL_RHS_playerSide_1
	GF_SCL_RHS_playerSide_1 spawn GF_SCL_RHS_playerSide;
 
4. 	you can also spawn this for a certain unit in the Editor :
	add this in the init of a unit :
	null = this execVM "GF_SCL_RHS_playerSide\GF_SCL_RHS_playerSide.sqf";

	and add instead of the spawn code in the end :
	_this spawn GF_SCL_RHS_playerSide;
	
5.	only for player : 
	player spawn GF_SCL_RHS_playerSide;
	
6.	for everyone : 
	null = {_x spawn GF_SCL_RHS_playerSide_Spawn_Custom_Equipment;}forEach allUnits;
*/
//________________	End	________________	 



[] spawn {
	while {true} do {		
		{		
		if (
		((alive _x)) 
		&& (!(_x getVariable ["Var_GF_SCL_RHS_playerSide",false])) 
		&& (!((typeOf _x) in GF_SCL_RHS_playerSide_Exclude_List)) 
		
		/*
		//________________	You can filter the side here	________________	
		&& {((side group _x) == west || 
			(side group _x) == east || 
			(side group _x) == independent || 
			(side group _x) == civilian)}
		*/
				
		//	&& (side group _x == playerSide)
		//	&& (!(side group _x == playerSide))
		
		&& (side group _x == playerSide)
		
		) then {
			
			_x spawn GF_SCL_RHS_playerSide;
			
			};						
			_x setVariable ["Var_GF_SCL_RHS_playerSide",true];
			{waitUntil {!alive _x};
			_x setVariable ["Var_GF_SCL_RHS_playerSide",false];		 
			};
		}forEach allUnits;
		sleep 5;
	};
};		


diag_log "//________________	GF Set Custom Loadout Script Initialized	_____________";
systemchat "GF Set Custom Loadout Script Initialized";