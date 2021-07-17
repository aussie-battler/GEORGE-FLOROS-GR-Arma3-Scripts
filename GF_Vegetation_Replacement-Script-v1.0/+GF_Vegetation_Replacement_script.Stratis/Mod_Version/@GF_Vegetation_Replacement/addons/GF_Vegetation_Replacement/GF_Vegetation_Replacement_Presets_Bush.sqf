


//________________  Author : GEORGE FLOROS [GR] ___________	17.02.19	_____________


/*
________________	GF Vegetation Replacement Script - Mod	________________

https://forums.bohemia.net/forums/topic/221658-gf-auto-loot-road-crash-script-mod/

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

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


/*
________________	Available Selections :	________________

case 1 : CUP Winter Bushes
case 2 : CUP Cold Bushes Theme
case 3 : CUP Autumn Bushes Theme
case 4 : CUP Spring Theme
case 5 : CUP Summer Theme
case 6 : CUP Tropical Theme
case 7 : CUP Spruce Theme
case 8 : Eden Extended Objects Altis Theme
case 9 : Eden Extended Objects Tanoa Theme
case 10 : MIX CUP + Eden Extended Objects Namalsk Theme
case 11 : Custom Theme
*/




GF_Vegetation_Replacement_Preset_Bush_initialized = false;




switch (GF_Vegetation_Replacement_Preset_Bush) do {


case 1 : {

//________________	CUP Winter Bushes 	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Cup Winter Plants
	
	"CUP_blueBerryW",
	"CUP_GrassCrookedW",	
	"CUP_fernW",	
	"CUP_piceaW",
	"CUP_raspBerryW",
	
	
	//	Cup Winter Bushes
	
	"CUP_b_betulaHumilisW",
	"CUP_blueBerryW",	
	"CUP_b_canina2sW",	
	"CUP_b_corylusW",
	"CUP_b_corylus2sW",
	"CUP_b_craet1W",
	"CUP_b_craet2W",
	"CUP_GrassCrookedW",
	"CUP_fernW",
	"CUP_p_heracleumW",
	"CUP_piceaW",
	"CUP_b_pmugoW",
	"CUP_b_prunusW",
	"CUP_raspBerryW",
	"CUP_b_salix2sW",
	"CUP_p_urticaW"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 1 : CUP Winter Bushes";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 1 : CUP Winter Bushes	________________";
};
};




case 2 : {

//________________	case 2 : CUP Cold Bushes Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Cup Cold Plants
	
	"CUP_p_heracleum",
	"CUP_c_GrassDryLong",	
	"CUP_clutter_mochomurka",	
	"CUP_c_Plants_HightSingleDeath_EP1",
	"CUP_c_Plants_HightSingleHard_EP1",
	"CUP_bodlak_group",
	"CUP_p_wheat_EP1",
	
	
	//	Cup Cold Bushes
	
	"CUP_b_AmygdalusN1s_EP1",
	"CUP_b_betulaHumilis",	
	"CUP_Krovi",	
	"CUP_Krovi4",
	"CUP_Krovi_long",
	"CUP_ker_buxus",
	"CUP_ker_deravej",
	"CUP_b_Elderberry2s_PMC",
	"CUP_b_PinusM1s_EP1",
	"CUP_pinus_mugo_lowpoly",
	"CUP_b_PistaciaL1s_EP1",
	"CUP_ker_pichlavej",
	"CUP_b_salix2s",
	"CUP_b_sambucus",
	"CUP_b_sambucus"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 2 : CUP Cold Bushes Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 2 : CUP Cold Bushes Theme	________________";
};
};




case 3 : {

//________________	case 3 : CUP Autumn Bushes Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Cup Autumn Plants
	
	"CUP_p_articum",
	"CUP_c_GrassAutumn",	
	"CUP_c_leaves",	
	"CUP_c_PlantsAutumnForest",
	"CUP_lopuch_podzimni",
	"CUP_c_GrassAutumnBrown",
	"CUP_p_Phragmites",
	"CUP_clutter_trava_dlouha",
	"CUP_c_GrassGreen_GroupHard_EP1",	
	"CUP_bolsevnik_group",	
	"CUP_c_GrassDryLong",
	"CUP_clutter_grass_short",
	"CUP_c_GrassAutumn_t",
	"CUP_ker_trs_travy5",
	"CUP_c_Plants_Yellow_EP1",
	
	
	//	Cup Autumn Bushes
	
	"CUP_b_AmygdalusN1s_EP1",
	"CUP_b_betulaHumilis",	
	"CUP_Krovi",	
	"CUP_Krovi4",
	"CUP_Krovi_long",
	"CUP_ker_buxus",
	"CUP_ker_deravej",
	"CUP_b_Elderberry2s_PMC",
	"CUP_b_PinusM1s_EP1",
	"CUP_pinus_mugo_lowpoly",
	"CUP_b_PistaciaL1s_EP1",
	"CUP_ker_pichlavej",
	"CUP_b_salix2s",
	"CUP_b_sambucus",
	"CUP_b_sambucus"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 3 : CUP Autumn Bushes Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 3 : CUP Autumn Bushes Theme	________________";
};
};




case 4 : {

//________________	case 4 : CUP Spring Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Cup Spring Plants
	
	"CUP_p_carduus_summer",
	"CUP_clutter_flower_mix",	
	"CUP_grass_general_shader",	
	"CUP_p_Helianthus_summer",
	"CUP_p_heracleum_summer",
	"CUP_p_papaver_EP1",
	"CUP_pumpkin2",	
	"CUP_grass_general_shader",	
	"CUP_pumpkin",
	"CUP_C_SmallLeafPlant",
	"CUP_ker_trs_travy5",	
	"CUP_p_urtica",	
	"CUP_c_Plants_Yellow_EP1",
	
	
	//	Cup Spring Bushes
	
	"CUP_b_AmygdalusN1s_EP1",
	"CUP_ker_s_bobulema",	
	"CUP_lopuch",	
	"CUP_DD_bush01",
	"CUP_ker_buxus",
	"CUP_b_corylus2s_summer",
	"CUP_b_craet1_summer",
	"CUP_ker_deravej",
	"CUP_ker_trs_travy3",
	"CUP_koprivy",
	"CUP_ker_pichlavej",
	"CUP_b_sambucus_summer",
	"CUP_Krovi_bigest"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 4 : CUP Spring Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 4 : CUP Spring Theme	________________";
};
};




case 5 : {

//________________	case 5 : CUP Summer Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Cup Summer Plants
	
	"CUP_p_carduus_summer",
	"CUP_clutter_flower_mix",	
	"CUP_grass_general_shader",	
	"CUP_p_Helianthus_summer",
	"CUP_p_heracleum_summer",
	"CUP_p_papaver_EP1",
	"CUP_pumpkin2",	
	"CUP_grass_general_shader",	
	"CUP_pumpkin",
	"CUP_C_SmallLeafPlant",
	"CUP_ker_trs_travy5",	
	"CUP_p_urtica",	
	"CUP_c_Plants_Yellow_EP1",
	
	
	//	Cup Summer Bushes
	
	"CUP_b_AmygdalusN1s_EP1",
	"CUP_b_betula2w_summer",
	"CUP_ker_s_bobulema",
	"CUP_DD_bush01",
	"CUP_DD_bush02",
	"CUP_Krovi",
	"CUP_Krovi4",
	"CUP_Krovi_long",
	"CUP_b_canina2s_summer",
	"CUP_b_corylus2s_summer",
	"CUP_b_craet1_summer",
	"CUP_ker_deravej",
	"CUP_koprivyv",
	"CUP_ker_pichlavej",
	"CUP_b_sambucus_summer",
	"CUP_Krovi_bigest"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 5 : CUP Summer Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 5 : CUP Summer Theme	________________";
};
};




case 6 : {

//________________	case 6 : CUP Tropical Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	CUP Tropical Trees *** also for bushes 
	
	"CUP_banana_1",
	"CUP_banana_2",
	"CUP_banana_3",
	"CUP_banana_4",
	"CUP_palm_01",
	"CUP_palm_10",
	"CUP_palm_02",
	"CUP_palm_03",
	"CUP_palm_09",
	"CUP_palm_08small",
	"CUP_palm_04"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 6 : CUP Tropical Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 6 : CUP Tropical Theme	________________";
};
};




case 7 : {

//________________	case 7 : CUP Spruce Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	CUP Spruce Trees *** also for bushes 
	
	"CUP_Smrk_siroky",
	"CUP_t_picea1s",
	"CUP_t_picea3f",
	"CUP_t_picea2s",
	"CUP_les_singlestrom",
	"CUP_les_singlestrom_b",
	"CUP_Smrk_maly",
	"CUP_Smrk_velky"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 7 : CUP Spruce Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 7 : CUP Spruce Theme	________________";
};
};




case 8 : {

//________________	case 8 : Eden Extended Objects Altis Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Eden Extended Objects bushes 
	
	"b_arundod2s_f",
	"b_arundod3s_f",
	"b_ficusc1s_f",
	"b_ficusc2d_f",
	"b_ficusc2s_f",
	"b_neriumo2d_f",
	"b_neriumo2s_f",
	"b_neriumo2s_white_f",
	"b_thistle_thorn_green",
	
	
	//	+ Clutter
	"c_bigfallenbranches_pine",
	"c_bigfallenbranches_pine02",
	"c_bigfallenbranches_pine03",
	"c_branchbig",
	"c_carduus",
	"c_flower_brushmedium_blue",
	"c_flower_brushmedium_white",
	"c_flower_cakile",
	"c_flower_low_yellow1",
	"c_flower_low_yellow2",
	"c_flower_medium_white1",
	"c_flower_medium_white2",
	"c_flower_tansy",
	"c_grass_brushhigh_dry",
	"c_grass_brushhigh_green",
	"c_grasslong_drybunch",
	"c_grasstall",
	"c_plant_chicory",
	"c_plant_dock",
	"c_plant_green_small",
	"c_plant_greenbunch",
	"c_plant_mullein",
	"c_strplantgermader_group",
	"c_strplantgreenshrub",
	"c_strplantmullein",
	"c_strplantgreensmall",
	"c_strthistleyellowshrub",
	"c_strthorngray",
	"c_strthorngreen",
	"c_strthornkhaki",
	"c_strweedbrowntall_group",
	"c_strweedgreentall",
	"c_thistle_high",
	"c_thistle_high_dead",
	"c_thistle_small",
	"c_thistle_small_greenyellow",
	"c_thistle_small_yellow"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 8 : Eden Extended Objects Altis Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 8 : Eden Extended Objects Altis Theme	________________";
};
};




case 9 : {

//________________	case 9 : Eden Extended Objects Tanoa Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Eden Extended Objects bushes 
	
	"c_forest_BiglLeaves",
	"c_forest_BiglLeaves2",
	"c_forest_fern",
	"c_forest_roots",
	"c_forest_violet_leaves",
	"c_forest_violet_leaves2",
	"c_forest_violet_single",
	"c_Grass_leaf_big",
	"c_Grass_mimosa",
	"c_Grass_nettle",
	"c_Grass_short_bunch",
	"c_Grass_short_nettle",
	"c_Grass_Tropic",
	"c_GrassBunch_HI",
	"c_GrassBunch_LO",
	"t_Banana_F",
	"t_Banana_slim_F",
	"t_Banana_wild_F",
	"b_Sugarcane_sapling_single_F",
	
	
	//	Srub 
	
	"b_Calochlaena_F",
	"b_Cestrum_F",
	"b_Colored_red_F",
	"b_Colored_yellow_F",
	"b_Cycas_F",
	"b_FicusC2d_tanoa_F",
	"b_Gardenia_dec_01_F",
	"b_Gardenia_dec_02_F",
	"b_Leucaena_F",
	"b_NeriumO2d_tanoa_F",
	"b_PiperMeth_F",
	"b_Rhizophora_F"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 9 : Eden Extended Objects Tanoa Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 9 : Eden Extended Objects Tanoa Theme	________________";
};
};




case 10 : {

//________________	case 10 : MIX CUP + Eden Extended Objects Namalsk Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Eden Extended Objects bushes 
	
	"c_grass_brushhigh_dry",
	"c_grass_brushhigh_green",
	"c_grassgreen_grouphard",
	"c_grasslong_drybunch",
	"c_grasstall",
	"c_plant_chicory",
	"c_plant_dock",
	"c_plant_green_small",
	"c_plant_mullein",
	"c_strgrassdry",
	"c_strgrassdry_group",
	"c_strplantgermader_group",
	"c_strplantgreenshrub",
	"c_strplantgreensmall",
	"c_strplantmullein",
	"c_strthistlepurple_small",
	"c_strthistleyellowshrub",
	"c_strweedbrowntall_group",
	"c_strweedgreentall",
	"c_thistle_high",
	"c_thistle_medium",
	"c_thistle_small",
	"c_thistle_small_greenyellow",
	"c_thistle_small_yellow"
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 10 : MIX CUP + Eden Extended Objects Namalsk Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 10 : MIX CUP + Eden Extended Objects Namalsk Theme	________________";
};
};




case 11 : {

//________________	case 11 : Custom Theme	_____________

GF_Vegetation_Replacement_Bush_array = [

	//	"",	//	It is possible to add nothing , in order to get less Bush
	
	//	Edit your bushes 
	
	""
];

GF_Vegetation_Replacement_Preset_Bush_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 11 : Custom Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 11 : Custom Theme	________________";
};
};




//________________	END of cases	_____________
};