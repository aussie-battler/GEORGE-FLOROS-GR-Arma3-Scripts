


//________________	Author : GEORGE FLOROS [GR]	___________	06.04.19	___________


/*
________________	GF Auto Loot with userconfig	________________

https://forums.bohemia.net/forums/topic/220706-gf-auto-loot-with-userconfig/

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


//________________ Settings ________________
//________________ Set true or false  ________________

GF_AL_Systemchat_info					= true;		
GF_AL_Hintsilent_info					= true;
GF_AL_diag_log_info						= true;
GF_AL_Debug 							= true;

GF_AL_Systemchat_info_count_items		= true;
GF_AL_diag_log_info_count_items			= true;


GF_AL_items_number 						= 1000;		//	Number of the spawned items

//	1 = Load every Mod + Bohemia Items , 2 = Load every Mod - No Bohemia Items , 3 = Load Bohemia Items Only , 4 = Custom items only
GF_AL_Select							= 1;

GF_AL_Blacklist_Zone_distance			= 1000;		//	Add here the distance from the Blacklist Zones
GF_AL_Distance							= 200;		//	Add here the distance from players

GF_AL_Cleaner_Spawn_Enabled				= true;
GF_AL_Cleaner_Spawn_Loop				= 14400;	//	ex : 4 hours = 14400 sec



GF_AL_Exclude_List = [
"Land_Pier_F",
"Land_Pier_small_F",
"Land_NavigLight",
"Land_LampHarbour_F"
];




if (GF_AL_Systemchat_info) then {
systemchat "GF Auto Loot Script initializing";			
};	

if (GF_AL_diag_log_info) then {
diag_log "//________________ GF Auto Loot Script initializing ________________";
};


GF_AL_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
GF_AL_size = worldsize;




//________________	Array 	________________

/*
//________________	GF_AL_Binocular_and_Nvg_array	Binocular and Nvg slot 	________________

It might be needed , to add also the mods , that you want to blacklist , in the GF_AL_Assignable_Items_Mod_Blacklist
in case that the GF_AL_Attachments_array , generates also items from the blacklisted mods.
To check this , uncomment the line that you will find below (in case : % ) , depending the selection GF_AL_Select

copyToClipboard str GF_AL_Binocular_and_Nvg_array; 

then run the mission and it will copy the generated array , then ctrl + v to paste the array.

The "mcc_sandbox_a3" mod will generate items that they are not Binocular or Nvg.
*/

GF_AL_Binocular_and_Nvg_array_Mod_Blacklist = [
	"mcc_sandbox_a3",
	"CUP_Weapons"		//	Example
	];
//________________	GF_AL_Assignable_Items_Mod_Blacklist 	________________




//________________	INFO : Everything will Spawn automaticaly	________________
//________________	adding extra custom arrays , will give more percetage possibility to find theese items	________________

GF_AL_Custom_array_1 = [		

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
GF_AL_Custom_array_2 = [

	//	ACE3_mod_Medical

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


GF_AL_Custom_array_3 = [

	//	ACE3_mod_items_array
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



	
//________________	case	________________
	
_Array_Loaded = false;
_Select_items_Loaded = false;

private ["_items_case"];

switch (GF_AL_Select) do {


case 1 : {

//________________	Load every Mod + Bohemia items	________________

GF_AL_primaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_secondaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_handgunWeapon_array = ("getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Magazines_array = ("getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_AL_Uniform_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Vests_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Headgear_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Backpacks_array = ("getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_AL_Goggles_array = ("getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_AL_Items_array = ("getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Attachments_array = ("getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_AL_Binocular_and_Nvg_array = (
	"getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
	//	copyToClipboard str GF_AL_Binocular_and_Nvg_array; 


_items_case = "Load every Mod + Bohemia items";
_Select_items_Loaded = true;
};


case 2 : {

//________________	Load every Mod / No Bohemia items	________________

GF_AL_primaryWeapon_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_secondaryWeapon_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_handgunWeapon_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Magazines_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_AL_Uniform_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Vests_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Headgear_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Backpacks_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_AL_Goggles_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_AL_Items_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Attachments_array = ("(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_AL_Binocular_and_Nvg_array = (
	"(!(getText( _x >> 'author' ) isEqualto 'Bohemia Interactive'))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
	//	copyToClipboard str GF_AL_Binocular_and_Nvg_array; 

_items_case = "Load every Mod - No Bohemia items";
_Select_items_Loaded = true;	
};


case 3 : {

//________________	Bohemia items Only	________________

GF_AL_primaryWeapon_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_secondaryWeapon_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_handgunWeapon_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Magazines_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_AL_Uniform_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Vests_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Headgear_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Backpacks_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_AL_Goggles_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_AL_Items_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_AL_Attachments_array = ("getText( _x >> 'author' ) isEqualto 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_AL_Binocular_and_Nvg_array = (
	"getText( _x >> 'author' ) isEqualto 'Bohemia Interactive'
	&& (!(getText( _x >> 'DLC' ) in GF_AL_Binocular_and_Nvg_array_Mod_Blacklist))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
	//	copyToClipboard str GF_AL_Binocular_and_Nvg_array; 


_items_case = "Load Bohemia items Only";
_Select_items_Loaded = true;	
};


case 4 : {

/*
//________________	Custom items only	________________
It is posible to add everything to one array and the code below will manage the spawn , 
GF_AL_cfgArray = [];
But then delete the arrays and their count below
*/

//	add the classnames (as many you want ex : ["classnames","classnames"];	ex:
GF_AL_primaryWeapon_array  = ["arifle_MX_SW_F"];
GF_AL_secondaryWeapon_array = ["launch_NLAW_F"];
GF_AL_handgunWeapon_array = ["hgun_P07_F"];
GF_AL_Magazines_array = ["100Rnd_65x39_caseless_mag","16Rnd_9x21_Mag"];
GF_AL_Uniform_array = ["U_B_CombatUniform_mcam_tshirt"];
GF_AL_Vests_array = ["V_PlateCarrier2_rgr"];
GF_AL_Headgear_array = ["H_HelmetB_grass"];
GF_AL_Backpacks_array = ["B_AssaultPack_mcamo"];
GF_AL_Goggles_array = ["G_Combat"];
GF_AL_Items_array = ["FirstAidKit"];
GF_AL_Attachments_array = ["acc_pointer_IR"];
GF_AL_Binocular_and_Nvg_array = ["NVGoggles"];

_items_case = "Custom items only";
_Select_items_Loaded = true;	
};


};


//________________	_Array_Loaded	________________

waituntil {_Select_items_Loaded};
_Array_Loaded = true;

if (GF_AL_Hintsilent_info) then {
hintsilent format ["%1",_items_case]; 
};

if (GF_AL_diag_log_info) then {
diag_log format ["%1",_items_case]; 
};


GF_AL_cfgArray = 
	GF_AL_primaryWeapon_array 
	+ GF_AL_secondaryWeapon_array 
	+ GF_AL_handgunWeapon_array
	+ GF_AL_Magazines_array
	+ GF_AL_Uniform_array
	+ GF_AL_Vests_array
	+ GF_AL_Headgear_array
	+ GF_AL_Backpacks_array
	+ GF_AL_Goggles_array
	+ GF_AL_Items_array
	+ GF_AL_Attachments_array
	+ GF_AL_Binocular_and_Nvg_array
	
	//	+ Custom arrays	
	+ GF_AL_Custom_array_1		//	Ravage_items
	+ GF_AL_Custom_array_2		//	ACE3_mod_Medical
	+ GF_AL_Custom_array_3;		//	ACE3_mod_items_array



waituntil {_Array_Loaded};