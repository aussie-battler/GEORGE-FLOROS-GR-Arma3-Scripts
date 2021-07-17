


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
________________	Available Selections Trees :	________________

case 1 : CUP Winter Trees
case 2 : CUP Cold Theme
case 3 : CUP Autumn Theme
case 4 : CUP Spring Theme
case 5 : CUP Summer Theme
case 6 : CUP Tropical Theme
case 7 : CUP Spruce Theme
case 8 : Eden Extended Objects Altis Theme
case 9 : Eden Extended Objects Tanoa Theme
case 10 : MIX CUP + Eden Extended Objects Namalsk Theme
case 11 : Custom Theme
*/




GF_Vegetation_Replacement_Preset_Trees_initialized = false;




switch (GF_Vegetation_Replacement_Preset_Trees) do {


case 1 : {

//________________	case 1 : CUP Winter Trees 	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	
	//________________	Trees NO leaves	________________

	"CUP_misc_BrokenSpruce_PMC",
	"CUP_misc_BurnSpruce_PMC",
	"CUP_misc_TorzoTree_PMC",
	"CUP_misc_StubLeafs_PMC",
	"CUP_kmen_1_buk",
	"CUP_parez",
	"CUP_Akat02S",
	
	
	//________________	Trees NO leaves fallen	________________
	
	"CUP_vetev_1_buk",
	"CUP_vetev_3_borovice",
	"CUP_vetev_2_dub",
	"CUP_vetev_4_smrk",
	
	
	//	CUP Winter Trees
	
	"CUP_t_acer2sW",
	"CUP_t_alnus2sW",
	"CUP_t_betula2fW",
	"CUP_t_betula2sW",
	"CUP_t_carpinus2sW",
	"CUP_t_fagus2fW",
	"CUP_t_fagus2sW",
	"CUP_t_fraxinus2sW",
	"CUP_t_fraxinus2wW",
	"CUP_t_larix3fW",
	"CUP_t_larix3sW",
	"CUP_t_malus1sW",
	"CUP_t_picea1sW",
	"CUP_t_picea2sW",
	"CUP_t_picea3fWW",
	"CUP_t_picea3fWW",
	"CUP_t_pinusN1sW",
	"CUP_t_populus3sW",
	"CUP_t_pyrus2sW",
	"CUP_t_quercus2fW",
	"CUP_t_pyrus2sW",
	"CUP_t_quercus2fW"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 1 : CUP Winter Trees";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 1 : CUP Winter Trees	________________";
};
};




case 2 : {

//________________	case 2 : CUP Cold Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	
	//________________	Trees NO leaves	________________

	"CUP_misc_BrokenSpruce_PMC",
	"CUP_misc_BurnSpruce_PMC",
	"CUP_misc_TorzoTree_PMC",
	"CUP_misc_StubLeafs_PMC",
	"CUP_kmen_1_buk",
	"CUP_parez",
	"CUP_Akat02S",
	
	
	//________________	Trees NO leaves fallen	________________
	
	"CUP_vetev_1_buk",
	"CUP_vetev_3_borovice",
	"CUP_vetev_2_dub",
	"CUP_vetev_4_smrk",
	
	
	//	CUP Cold Theme
	
	"CUP_t_JuniperusC2s_EP1",
	"CUP_DD_borovice",
	"CUP_DD_borovice02",
	"CUP_t_pinusN1s",
	"CUP_t_pinusS2f",
	"CUP_t_pinusN2s",
	"CUP_t_PinusE2s_EP1",
	"CUP_t_PinusS3s_EP1",
	"CUP_t_picea1s",
	"CUP_t_picea2s",
	"CUP_t_picea3f"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 2 : CUP Cold Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 2 : CUP Cold Theme	________________";
};
};




case 3 : {

//________________	case 3 : CUP Autumn Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees

	
	//________________	Trees NO leaves	________________

	"CUP_misc_BrokenSpruce_PMC",
	"CUP_misc_BurnSpruce_PMC",
	"CUP_misc_TorzoTree_PMC",
	"CUP_misc_StubLeafs_PMC",
	"CUP_kmen_1_buk",
	"CUP_parez",
	"CUP_Akat02S",
	
	
	//________________	Trees NO leaves fallen	________________
	
	"CUP_vetev_1_buk",
	"CUP_vetev_3_borovice",
	"CUP_vetev_2_dub",
	"CUP_vetev_4_smrk",
	
	
	
	
	//	CUP Autumn Trees
	
	"CUP_t_alnus2s",
	"CUP_t_AmygdalusC2s_EP1",
	"CUP_jablon",
	"CUP_t_malus1s",
	"CUP_t_fraxinus2W",
	"CUP_t_fraxinus2s",
	"CUP_str_osika",
	"CUP_t_fagus2f",
	"CUP_t_fagus2s",
	"CUP_t_fagus2W",
	"CUP_t_betula2f",
	"CUP_t_betula2s",
	"CUP_str_Briza_kriva",
	"CUP_str_Briza_rovna",
	"CUP_str_trnka",
	"CUP_Krovi2",
	"CUP_str_krovisko_vysoke",
	"CUP_str_fikovnik_ker",
	"CUP_les_fikovnik2",
	"CUP_str_fikovnik",
	"CUP_str_fikovnik2",
	"CUP_t_carpinus2s",
	"CUP_t_larix3f",
	"CUP_t_acer2s",
	"CUP_t_quercus2f",
	"CUP_t_quercus3s",
	"CUP_t_fraxinus2W",
	"CUP_oliva",
	"CUP_t_populus3s",
	"CUP_t_pyrus2s",
	"CUP_str_jerabina",
	"CUP_t_betula1f",
	"CUP_t_sorbus2s",
	"CUP_t_FicusB2s_EP1",
	"CUP_t_salix2s"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 3 : CUP Autumn Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 3 : CUP Autumn Theme	________________";
};
};




case 4 : {

//________________	case 4 : CUP Spring Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	//________________	Trees NO leaves	________________

	"CUP_misc_BrokenSpruce_PMC",
	"CUP_misc_BurnSpruce_PMC",
	"CUP_misc_TorzoTree_PMC",
	"CUP_misc_StubLeafs_PMC",
	"CUP_kmen_1_buk",
	"CUP_parez",
	"CUP_Akat02S",
	
	
	//________________	Trees NO leaves fallen	________________
	
	"CUP_vetev_1_buk",
	"CUP_vetev_3_borovice",
	"CUP_vetev_2_dub",
	"CUP_vetev_4_smrk",
	
	
	//	CUP Spring Trees
	
	"CUP_jablon",
	"CUP_str_osika",
	"CUP_str_briza",
	"CUP_str_Briza_kriva",
	"CUP_str_Briza_rovna",
	"CUP_str_trnka",
	"CUP_Krovi2",
	"CUP_str_kastan",
	"CUP_str_krovisko_vysoke",
	"CUP_str_fikovnik_ker",
	"CUP_les_fikovnik2",
	"CUP_str_fikovnik2",
	"CUP_t_picea1sW",
	"CUP_str_habr",
	"CUP_str_jalovec",
	"CUP_str_lipa",
	"CUP_str_javor",
	"CUP_les_dub",
	"CUP_t_PistaciaL2s_EP1",
	"CUP_t_PopulusB2s_EP1",
	"CUP_t_PopulusF2s_EP1",
	"CUP_t_PrunusS2s_EP1",
	"CUP_str_jerabina",
	"CUP_les_singlestrom",
	"CUP_les_singlestrom_b",
	"CUP_str_liskac",
	"CUP_t_FicusB2s_EP1",
	"CUP_str_vrba"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 4 : CUP Spring Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 4 : CUP Spring Theme	________________";
};
};




case 5 : {

//________________	case 5 : CUP Summer Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	//________________	Trees NO leaves	________________

	"CUP_misc_BrokenSpruce_PMC",
	"CUP_misc_BurnSpruce_PMC",
	"CUP_misc_TorzoTree_PMC",
	"CUP_misc_StubLeafs_PMC",
	"CUP_kmen_1_buk",
	"CUP_parez",
	"CUP_Akat02S",
	
	
	//________________	Trees NO leaves fallen	________________
	
	"CUP_vetev_1_buk",
	"CUP_vetev_3_borovice",
	"CUP_vetev_2_dub",
	"CUP_vetev_4_smrk",
	
	
	//	CUP Summer Trees
	
	"CUP_jablon",
	"CUP_str_osika",
	"CUP_str_briza",
	"CUP_str_Briza_kriva",
	"CUP_str_Briza_rovna",
	"CUP_str_trnka",
	"CUP_Krovi2",
	"CUP_str_kastan",
	"CUP_str_krovisko_vysoke",
	"CUP_str_fikovnik_ker",
	"CUP_les_fikovnik2",
	"CUP_str_fikovnik2",
	"CUP_t_picea1sW",
	"CUP_str_habr",
	"CUP_str_jalovec",
	"CUP_str_lipa",
	"CUP_str_javor",
	"CUP_les_dub",
	"CUP_t_PistaciaL2s_EP1",
	"CUP_t_PopulusB2s_EP1",
	"CUP_t_PopulusF2s_EP1",
	"CUP_t_PrunusS2s_EP1",
	"CUP_str_jerabina",
	"CUP_les_singlestrom",
	"CUP_les_singlestrom_b",
	"CUP_str_liskac",
	"CUP_t_FicusB2s_EP1",
	"CUP_str_vrba"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 5 : CUP Summer Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 5 : CUP Summer Theme	________________";
};
};




case 6 : {

//________________	case 6 : CUP Tropical Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	
	//	CUP Tropical Trees
	
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

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 6 : CUP Tropical Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 6 : CUP Tropical Theme	________________";
};
};




case 7 : {

//________________	case 7 : CUP Spruce Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	
	//	CUP Spruce Trees
	
	"CUP_Smrk_siroky",
	"CUP_t_picea1s",
	"CUP_t_picea3f",
	"CUP_t_picea2s",
	"CUP_les_singlestrom",
	"CUP_les_singlestrom_b",
	"CUP_Smrk_maly",
	"CUP_Smrk_velky"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 7 : CUP Spruce Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 7 : CUP Spruce Theme	________________";
};
};




case 8 : {

//________________	case 8 : Eden Extended Objects Altis Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	
	//	Eden Extended Objects Altis Trees
	
	"t_broussonetiap1s_f",
	"t_ficusb1s_f",
	"t_ficusb2s_f",
	"t_fraxinusav2s_f",
	"t_oleae1s_f",
	"t_oleae2s_f",
	"t_pinusp3s_f",
	"t_pinuss1s_f",
	"t_pinuss2s_f",
	"t_pinuss2s_b_f",
	"t_poplar2f_dead_f",
	"t_populusn3s_f",
	"t_quercusir2s_f"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 8 : Eden Extended Objects Altis Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 8 : Eden Extended Objects Altis Theme	________________";
};
};




case 9 : {

//________________	case 9 : Eden Extended Objects Tanoa Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	
	//	Eden Extended Objects Altis Trees
	
	"t_Agathis_tall_F",
	"t_Agathis_wide_F",
	"t_Albizia_F",
	"t_cocos_bend_f",
	"t_Cocos_small_F",
	"t_Cocos_tall_F",
	"t_CocosNucifera2s_small_F",
	"t_CocosNucifera3s_bend_F",
	"t_CocosNucifera3s_tall_F",
	"t_Cyathea_F",
	"d_FallenBranch_F",
	"d_FallenTrunk_branches_F",
	"d_FallenTrunk_branches_LC_F",
	"d_FallenTrunk_clear_F",
	"d_FallenTrunk_clear_LC_F",
	"d_FallenTrunk_roots_F",
	"d_FallenTrunk_roots_LC_F",
	"t_Ficus_big_F",
	"t_Ficus_medium_F",
	"t_Ficus_small_F",
	"t_Inocarpus_F",
	"t_Leucaena_F",
	"t_Millettia_F",
	"t_Millettia_plantation_F",
	"t_Palaquium_F",
	"t_Pritchardia_F",
	"t_Rhizophora_F",
	"d_TreeStump_cut_large_F",
	"d_TreeStump_cut_small_F",
	"d_TreeStump_natural_large_F",
	"d_treestump_natural_small_f"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 9 : Eden Extended Objects Tanoa Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 9 : Eden Extended Objects Tanoa Theme	________________";
};
};




case 10 : {

//________________	case 10 : MIX CUP + Eden Extended Objects Namalsk Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	
	//________________	Trees NO leaves	________________
	
	"CUP_misc_BrokenSpruce_PMC",
	"CUP_misc_BurnSpruce_PMC",
	"CUP_misc_TorzoTree_PMC",
	"CUP_misc_StubLeafs_PMC",
	"CUP_kmen_1_buk",
	"CUP_parez",
	"CUP_Akat02S",
	
	
	//________________	Trees NO leaves fallen	________________
	
	"CUP_vetev_1_buk",
	"CUP_vetev_3_borovice",
	"CUP_vetev_2_dub",
	"CUP_vetev_4_smrk",
	

	//	CUP Spruce Trees
	
	"CUP_Smrk_siroky",
	"CUP_t_picea1s",
	"CUP_t_picea3f",
	"CUP_t_picea2s",
	"CUP_les_singlestrom",
	"CUP_les_singlestrom_b",
	"CUP_Smrk_maly",
	"CUP_Smrk_velky"
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 10 : MIX CUP + Eden Extended Objects Namalsk Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 10 : MIX CUP + Eden Extended Objects Namalsk Theme	________________";
};
};




case 11 : {

//________________	case 11 : Custom Theme	_____________

GF_Vegetation_Replacement_Tree_array = [

	//	"",	//	It is possible to add nothing , in order to get less trees
	
	
	//	Edit your Trees
	
	""
];

GF_Vegetation_Replacement_Preset_Trees_initialized = true;

if (GF_Vegetation_Replacement_Systemchat_info) then {
systemchat "case 11 : Custom Theme";			
};	


if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________	case 11 : Custom Theme	________________";
};
};




//________________	END of cases	_____________
};