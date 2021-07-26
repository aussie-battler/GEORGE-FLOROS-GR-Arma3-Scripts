


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
//	this setVariable ["Var_GF_SCL_east", true];
	
	
diag_log "//________________	GF Set Custom Loadout Script Initializing	_____________";
diag_log "//________________	GF_SCL_east.sqf	_____________";

systemchat "GF Set Custom Loadout Script Initializing";


//________________ GF_SCL_east.sqf _____________


GF_SCL_east_primaryWeapon_array = [
//	LightMachineGuns
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

//	Apex
"LMG_03_F",

//	AssaultRifles
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

//	Apex AssaultRifles
//	AK
"arifle_AK12_F",
"arifle_AK12_GL_F",
"arifle_AKM_F",
"arifle_AKM_FL_F",
"arifle_AKS_F",

//	AK x2
"arifle_AK12_F",
"arifle_AK12_GL_F",
"arifle_AKM_F",
"arifle_AKM_FL_F",
"arifle_AKS_F",

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

//	SniperRifles
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

//	Apex SniperRifles
"srifle_LRR_tna_F",
"srifle_GM6_ghex_F",
"srifle_DMR_07_blk_F",
"srifle_DMR_07_hex_F",
"srifle_DMR_07_ghex_F"		
];
	

GF_SCL_east_secondaryWeapon_array = [
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
			
GF_SCL_east_handgunWeapon_array = [
//	Pistols
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_02_F",
"hgun_Pistol_Signal_F",
"hgun_Rook40_F",

//	Apex
"hgun_Pistol_01_F",
"hgun_P07_khk_F",

//	SubMachineGuns
"hgun_PDW2000_F",
"SMG_01_F",
"SMG_02_F",
"SMG_05_F"		
];
			
			
GF_SCL_east_Civilian_Uniform_Custom_array = [
"U_OG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1",
"U_BG_leader","U_I_G_resistanceLeader_F","U_Competitor","U_C_HunterBody_grn","U_OrestesBody",
"U_C_Journalist","U_Marshal","U_Rangemaster","U_I_G_Story_Protagonist_F"
];


GF_SCL_east_Uniform_array = [
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

//	IDAP
"U_C_IDAP_Man_cargo_F",
"U_C_IDAP_Man_jeans_F",
"U_C_IDAP_Man_Casual_F",
"U_C_IDAP_Man_shorts_F",
"U_C_IDAP_Man_tee_F",
"U_C_IDAP_Man_teeshorts_F",
"U_C_ConstructionCoverall_Black_F",
"U_C_ConstructionCoverall_Blue_F"
];

			
GF_SCL_east_Vests_array =  [
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


GF_SCL_east_Backpacks_array = [
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

			
GF_SCL_east_Headgear_array = [
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
/*
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
*/
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

/*
"H_HelmetO_ViperSP_hex_F",
"H_HelmetO_ViperSP_ghex_F",

"H_HelmetB_tna_F",
"H_HelmetB_Enh_tna_F",
"H_HelmetB_Light_tna_F",
"H_HelmetSpecO_ghex_F",
"H_HelmetLeaderO_ghex_F",
"H_HelmetO_ghex_F",
"H_HelmetCrew_O_ghex_F",
*/
"H_MilCap_tna_F",
"H_MilCap_ghex_F",
"H_Booniehat_tna_F",
"H_Beret_gen_F",
"H_MilCap_gen_F",
"H_Cap_oli_Syndikat_F",
"H_Cap_tan_Syndikat_F",
"H_Cap_blk_Syndikat_F",
"H_Cap_grn_Syndikat_F",
"H_Cap_police"
];


GF_SCL_east_Goggles_array = [
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
"G_Combat_Goggles_tna_F"
];
			
			
GF_SCL_east_items_array_1 = [
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
	
	
GF_SCL_east_items_array_2 = [
//Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
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

//	PointerAttachments
"acc_flashlight",
"acc_pointer_IR",

//	BipodAttachments
"bipod_01_F_blk",
"bipod_01_F_mtp",
"bipod_01_F_snd",
"bipod_02_F_blk",
"bipod_02_F_hex",
"bipod_02_F_tan",
"bipod_03_F_blk",
"bipod_03_F_oli",

//	Apex
"bipod_01_F_khk",

//	MuzzleAttachments
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

//	Apex
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

//	OpticAttachments
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

//	Apex
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

//	NVG
"NVGoggles",
"NVGoggles_INDEP",
"NVGoggles_OPFOR",
//	Apex
"O_NVGoggles_hex_F",
"O_NVGoggles_urb_F",
"O_NVGoggles_ghex_F",
"NVGoggles_tna_F"
];

	
GF_SCL_east_items_array_3 = [
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
			

GF_SCL_east_Ravage_items_array = [		
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
GF_SCL_east_ACE3_mod_Medical_array = [
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


GF_SCL_east_ACE3_mod_items_array = [
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

GF_SCL_east_Exclude_List = [

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


GF_SCL_east_Exclude_List_Gear = [
	
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

	
				
GF_SCL_east = {

	
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
	_unit setVariable ["Var_GF_SCL_east",false];
}];
};


//________________	Randomize	________________

_Uniform = selectRandom GF_SCL_east_Uniform_array;	//	For Civilian : GF_SCL_east_Civilian_Uniform_Custom_array
_Headgear = selectRandom GF_SCL_east_Headgear_array; 
_Goggles = selectRandom GF_SCL_east_Goggles_array; 
_Vests = selectRandom GF_SCL_east_Vests_array; 
_Backpacks = selectRandom GF_SCL_east_Backpacks_array;
_primaryWeapon = selectRandom GF_SCL_east_primaryWeapon_array;
_secondaryWeapon = selectRandom GF_SCL_east_secondaryWeapon_array;
_handgunWeapon = selectRandom GF_SCL_east_handgunWeapon_array;


//________________ addItemToVest	________________

_items_array_1_addtoVest = selectRandom GF_SCL_east_items_array_1;
_items_array_2_addtoVest = selectRandom GF_SCL_east_items_array_2;
_items_array_3_addtoVest = selectRandom GF_SCL_east_items_array_3;
_Ravage_items_array_addtoVest = selectRandom GF_SCL_east_Ravage_items_array;
_ACE3_mod_Medical_array_addtoVest = selectRandom GF_SCL_east_ACE3_mod_Medical_array;
_ACE3_mod_items_array_addtoVest = selectRandom GF_SCL_east_ACE3_mod_items_array;

//________________ addItemToBackpack	________________

_items_array_1_addtoBackpack = selectRandom GF_SCL_east_items_array_1;
_items_array_2_addtoBackpack = selectRandom GF_SCL_east_items_array_2;
_items_array_3_addtoBackpack = selectRandom GF_SCL_east_items_array_3;
_Ravage_items_array_addtoBackpack = selectRandom GF_SCL_east_Ravage_items_array;
_ACE3_mod_Medical_array_addtoBackpack = selectRandom GF_SCL_east_ACE3_mod_Medical_array;
_ACE3_mod_items_array_addtoBackpack = selectRandom GF_SCL_east_ACE3_mod_items_array;

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
	if (!((typeOf _this) in GF_SCL_east_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_east_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_east_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_east_Exclude_List_Gear)) then {
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
	if (!((typeOf _this) in GF_SCL_east_Exclude_List_Gear)) then {			
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
	if (!((typeOf _this) in GF_SCL_east_Exclude_List_Gear)) then {	

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


GF_SCL_east_Change_Equipment_civilian = {

removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

//________________	Randomize	________________

_Uniform = selectRandom GF_SCL_east_Civilian_Uniform_Custom_array;	//	GF_SCL_east_Uniform_array;
_Headgear = selectRandom GF_SCL_east_Headgear_array; 
_Goggles = selectRandom GF_SCL_east_Goggles_array; 
_Vests = selectRandom GF_SCL_east_Vests_array; 
_Backpacks = selectRandom GF_SCL_east_Backpacks_array;

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
	this setVariable ["Var_GF_SCL_east", true];

3.	you can also spawn this for a certain unit :
	name this unit  ex : GF_SCL_east_1
	GF_SCL_east_1 spawn GF_SCL_east;
 
4. 	you can also spawn this for a certain unit in the Editor :
	add this in the init of a unit :
	null = this execVM "GF_SCL_east\GF_SCL_east.sqf";

	and add instead of the spawn code in the end :
	_this spawn GF_SCL_east;
	
5.	only for player : 
	player spawn GF_SCL_east;
	
6.	for everyone : 
	null = {_x spawn GF_SCL_east_Spawn_Custom_Equipment;}forEach allUnits;
*/
//________________	End	________________	 



[] spawn {
	while {true} do {		
		{		
		if (
		((alive _x)) 
		&& (!(_x getVariable ["Var_GF_SCL_east",false])) 
		&& (!((typeOf _x) in GF_SCL_east_Exclude_List)) 
		
		/*
		//________________	You can filter the side here	________________	
		&& {((side group _x) == west || 
			(side group _x) == east || 
			(side group _x) == independent || 
			(side group _x) == civilian)}
		*/
						
		//	&& (side group _x == playerSide)
		//	&& (!(side group _x == playerSide))
		
		&& (side group _x == east)
		
		) then {
			
			_x spawn GF_SCL_east;
			
			};						
			_x setVariable ["Var_GF_SCL_east",true];
			{waitUntil {!alive _x};
			_x setVariable ["Var_GF_SCL_east",false];		 
			};
		}forEach allUnits;
		sleep 5;
	};
};		


diag_log "//________________	GF Set Custom Loadout Script Initialized	_____________";
systemchat "GF Set Custom Loadout Script Initialized";