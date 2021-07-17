


//___________________  Author : GEORGE FLOROS [GR] ___________ 07.03.19 _____________

/*
___________________ GF Auto Random Loadout Script ___________________

https://forums.bohemia.net/forums/topic/220873-gf-auto-random-loadout-script/

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


//___________________	***	Every sqf has different variables	***	___________________
//___________________	You can add in the init of a unit to exclude 	___________________	
//	this setVariable ["Var_GF_ARL_APZ", true];
	
	
diag_log "//___________________	GF Auto Random Loadout Script Initializing	_____________";
diag_log "//___________________	GF_Auto_Random_Loadout.sqf	_____________";

//systemchat "GF Auto Random Loadout Script Initializing";



//___________________ Settings ___________________
//___________________ Set true or false  ___________________


GF_ARL_APZ_Systemchat_info						= false;
GF_ARL_APZ_Hintsilent_info						= false;
GF_ARL_APZ_diag_log_info						= false;	

//GF_ARL_APZ_Select	-->	1 = Load every Mod + Bohemia Items , 2 = Load every Mod - No Bohemia Items , 3 = Load Bohemia Items Only , 4 = Custom items only
//GF_ARL_APZ_Select 								= 1;


//___________________ Gear ___________________
//___________________ Set true or false  ___________________

GF_ARL_APZ_Exclude_List_Gear					= true; 	//	exclude from changing their special Gear , as bagpacks or , AT  , mines , etc
	
//___________________ Clear Unit's items ___________________

GF_ARL_APZ_Remove_Everything 					= false;	//	If true  Remove Everything	, it' s better not
	
//___________________ or filter ___________________

GF_ARL_APZ_removeallweapons 					= true;	
 	
GF_ARL_APZ_Remove_primaryWeapon 				= true; 
GF_ARL_APZ_Remove_secondaryWeapon				= true;		
GF_ARL_APZ_Remove_handgunWeapon 				= true; 
	
GF_ARL_APZ_removeAllItems 						= true; 	
GF_ARL_APZ_clear_UniformContainer 				= true; 	
GF_ARL_APZ_clear_VestContainer 					= true; 
GF_ARL_APZ_clear_BackpackContainer 				= true;	
GF_ARL_APZ_removeAllAssignedItems 				= true; 

GF_ARL_APZ_removeUniform 						= true; 	
GF_ARL_APZ_removeVest 							= true; 	
GF_ARL_APZ_removeBackpack 						= true; 	
GF_ARL_APZ_removeHeadgear 						= true; 
GF_ARL_APZ_removeGoggles 						= true; 

//___________________ _add ___________________
//___________________ Set true or false  ___________________

GF_ARL_APZ_Link_Items							= true; 		

GF_ARL_APZ_AddUniform							= true;             
GF_ARL_APZ_addVest								= true;        
GF_ARL_APZ_addBackpack							= true;	       
GF_ARL_APZ_addHeadgear							= true; 
GF_ARL_APZ_addGoggles							= true; 

GF_ARL_APZ_Add_primaryWeapon					= false; 
GF_ARL_APZ_Add_primaryWeapon_Attachments		= false; 

GF_ARL_APZ_Add_secondaryWeapon					= false; 
GF_ARL_APZ_Add_secondaryWeapon_Attachments		= false; 

GF_ARL_APZ_Add_handgunWeapon					= false; 		
GF_ARL_APZ_Add_handgunWeapon_Attachments		= false; 	

GF_ARL_APZ_addItemToUniform						= true;  
GF_ARL_APZ_addItemToVest						= true; 
GF_ARL_APZ_addItemToVest						= true;         

GF_ARL_APZ_Magazines_in_Backpack				= true; 


GF_ARL_APZ_Possibility							= 4;	//	ex:	floor (random 10) < 4;
GF_ARL_APZ_Possibility_random					= 10;

GF_ARL_APZ_Change_Loadout_on_Respawn			= true; 




//___________________	Exclude list	___________________

GF_ARL_APZ_Exclude_List = [

/*
	//	Ravage zombies
	"zombie_bolter",
	"zombie_runner",
	"zombie_walker"
*/	
	
	]; 			

	
//___________________	Exclude list for Medic , AT etc 	___________________
/*
In order to exclude from changing their special Gear , as bagpacks or , AT  , mines , etc
To get automatically the classnames , you can add the units in the editor , link them all togethere 
and add this code in the init of the leader unit.
grpclasses = []; {hint format["%1",(typeOf  _x)]; grpclasses = grpclasses + [(typeOf _x)]; sleep 1} foreach units group this; copyToClipboard format["%1",grpclasses];
*/


GF_ARL_APZGF_ARL_APZ_Exclude_List_Gear = [
	
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
	
	
//___________________	GF_Auto_Random_Loadout_cfgArray 	___________________

/*
//___________________	GF_ARL_APZ_Binocular_and_Nvg_array	Binocular and Nvg slot 	___________________

It might be needed , to add also the mods , that you want to blacklist , in the GF_ARL_APZ_Assignable_Items_Mod_Blacklist
in case that the GF_ARL_APZ_Attachments_array , generates also items from the blacklisted mods.
To check this , uncomment the line that you will find below (in case : % ) , depending the selection GF_ARL_APZ_Select

copyToClipboard str GF_ARL_APZ_Binocular_and_Nvg_array; 

then run the mission and it will copy the generated array , then ctrl + v to paste the array.

The "mcc_sandbox_a3" mod will generate items that they are not Binocular or Nvg.
*/

GF_ARL_APZ_Binocular_and_Nvg_array_Mod_Blacklist = [
	"mcc_sandbox_a3",
	"CUP_Weapons"		//	Example
	];
//___________________	GF_ARL_APZ_Assignable_Items_Mod_Blacklist 	___________________



	
//___________________	case	___________________
	
_Array_Loaded = false;
_Select_items_Loaded = false;

private ["_items_case"];

switch (GF_ARL_APZ_Select) do {


case 1 : {

//___________________	Load every Mod + Bohemia items	___________________

GF_ARL_APZ_primaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_secondaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_handgunWeapon_array = ("getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Magazines_array = ("getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ARL_APZ_Uniform_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Vests_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Headgear_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Backpacks_array = ("getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ARL_APZ_Goggles_array = ("getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ARL_APZ_Items_array = ("getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Attachments_array = ("getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ARL_APZ_Binocular_and_Nvg_array = (
	"(!(getText( _x >> 'DLC' ) == 'mcc_sandbox_a3'))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
	//	copyToClipboard str GF_ARL_APZ_Binocular_and_Nvg_array; 


_items_case = "Load every Mod + Bohemia items";
_Select_items_Loaded = true;
};


case 2 : {

//___________________	Load every Mod / No Bohemia items	___________________

GF_ARL_APZ_primaryWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_secondaryWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_handgunWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Magazines_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ARL_APZ_Uniform_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Vests_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Headgear_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Backpacks_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ARL_APZ_Goggles_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ARL_APZ_Items_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Attachments_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ARL_APZ_Binocular_and_Nvg_array = (
	"(!(getText( _x >> 'author' ) == 'Bohemia Interactive'))
	&& (!(getText( _x >> 'DLC' ) == 'mcc_sandbox_a3'))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
//	copyToClipboard str GF_ARL_APZ_Binocular_and_Nvg_array; 

_items_case = "Load every Mod - No Bohemia items";
_Select_items_Loaded = true;	
};


case 3 : {

//___________________	Bohemia items Only	___________________

GF_ARL_APZ_primaryWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_secondaryWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_handgunWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Magazines_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ARL_APZ_Uniform_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Vests_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Headgear_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Backpacks_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ARL_APZ_Goggles_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ARL_APZ_Items_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_APZ_Attachments_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ARL_APZ_Binocular_and_Nvg_array = (
	"getText( _x >> 'author' ) == 'Bohemia Interactive'
	&& (!(getText( _x >> 'DLC' ) in GF_ARL_APZ_Binocular_and_Nvg_array_Mod_Blacklist))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
//	copyToClipboard str GF_ARL_APZ_Binocular_and_Nvg_array; 


_items_case = "Load Bohemia items Only";
_Select_items_Loaded = true;	
};


case 4 : {

/*
//___________________	Custom items only	___________________
It is posible to add everything to one array and the code below will manage the spawn , 
GF_ARL_APZ_cfgArray = [];
But then delete the arrays and their count below
*/

//	add the classnames	ex:
GF_ARL_APZ_primaryWeapon_array  = ["arifle_MX_SW_F"];
GF_ARL_APZ_secondaryWeapon_array = ["launch_NLAW_F"];
GF_ARL_APZ_handgunWeapon_array = ["hgun_ACPC2_F"];	
GF_ARL_APZ_Magazines_array = ["100Rnd_65x39_caseless_mag","16Rnd_9x21_Mag"];
GF_ARL_APZ_Uniform_array = ["U_B_CombatUniform_mcam_tshirt"];
GF_ARL_APZ_Vests_array = ["V_PlateCarrier2_rgr"];
GF_ARL_APZ_Headgear_array = ["H_HelmetB_grass"];
GF_ARL_APZ_Backpacks_array = ["B_AssaultPack_mcamo"];
GF_ARL_APZ_Goggles_array = ["G_Combat"];
GF_ARL_APZ_Items_array = ["FirstAidKit"];
GF_ARL_APZ_Attachments_array = ["acc_pointer_IR"];
GF_ARL_APZ_Binocular_and_Nvg_array = ["NVGoggles"];


_items_case = "Custom items only";
_Select_items_Loaded = true;	
};




};


//___________________	_Array_Loaded	___________________

waituntil {_Select_items_Loaded};
_Array_Loaded = true;

if (GF_ARL_APZ_Hintsilent_info) then {
hintsilent format ["%1",_items_case]; 
};

if (GF_ARL_APZ_diag_log_info) then {
diag_log format ["%1",_items_case]; 
};

waituntil {_Array_Loaded};

	

GF_ARL_APZ = {

	
//___________________	GF_ARL_APZ_Change_Loadout_on_Respawn	___________________	

if (GF_ARL_APZ_Change_Loadout_on_Respawn) then {

_this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setVariable ["Var_GF_ARL_APZ",false];
}];
};

//___________________	Randomize	___________________

_Uniform = selectRandom GF_ARL_APZ_Uniform_array;
_Headgear = selectRandom GF_ARL_APZ_Headgear_array; 
_Goggles = selectRandom GF_ARL_APZ_Goggles_array; 
_Vests = selectRandom GF_ARL_APZ_Vests_array; 
_Backpacks = selectRandom GF_ARL_APZ_Backpacks_array;
_primaryWeapon = selectRandom GF_ARL_APZ_primaryWeapon_array;
_secondaryWeapon = selectRandom GF_ARL_APZ_secondaryWeapon_array;
_handgunWeapon = selectRandom GF_ARL_APZ_handgunWeapon_array;


//___________________ _Items	___________________

_Items_array = selectRandom GF_ARL_APZ_Items_array;
_Attachments_array = selectRandom GF_ARL_APZ_Attachments_array;
_Magazines_array = selectRandom GF_ARL_APZ_Magazines_array;


//___________________	add _primaryWeapon's mags	___________________

_primaryWeapon_Magazines = getArray (configFile / "CfgWeapons" / _primaryWeapon / "magazines");
_Spawn_primaryWeapon_magazines = selectRandom _primaryWeapon_Magazines;


//___________________	add _secondaryWeapon's mags	___________________

_secondaryWeapon_Magazines = getArray (configFile / "CfgWeapons" / _secondaryWeapon / "magazines");
_Spawn_secondaryWeapon_Magazines = selectRandom _secondaryWeapon_Magazines;


//___________________	add _handgunWeapon's mags	___________________

_handgunWeapon_Magazines = getArray (configFile / "CfgWeapons" / _handgunWeapon / "magazines");
_Spawn_handgunWeapon_Magazines = selectRandom _handgunWeapon_Magazines;

	

	

//___________________ Clear Unit's items ___________________
//___________________ Remove_Everything ___________________

_UniformContainer =  UniformContainer _this;
_VestContainer = vestContainer _this;
_BackpackContainer = BackpackContainer _this;


if (GF_ARL_APZ_Remove_Everything) then {

	removeallweapons _this;
	removeAllItems _this;
	removeAllAssignedItems _this;
	removeUniform _this;
	removeVest _this;
	removeBackpack _this;
	removeHeadgear _this;
	removeGoggles _this;	
};


//___________________ or ___________________

if (GF_ARL_APZ_removeallweapons) then {
		
	if (GF_ARL_APZ_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARL_APZGF_ARL_APZ_Exclude_List_Gear)) then {
	removeallweapons _this;
	};
	
	} else {
	removeallweapons _this;
	};
};

if (GF_ARL_APZ_Remove_primaryWeapon) then {
	_this removeWeapon (primaryWeapon _this);
};

if (GF_ARL_APZ_Remove_secondaryWeapon) then {

	if (GF_ARL_APZ_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARL_APZGF_ARL_APZ_Exclude_List_Gear)) then {
	_this removeWeapon (secondaryWeapon _this);
	};
	
	} else {
	_this removeWeapon (secondaryWeapon _this);
	};
};

if (GF_ARL_APZ_Remove_handgunWeapon) then {
	_this removeWeapon (handgunWeapon _this);
};

if (GF_ARL_APZ_removeAllItems) then {
	removeAllItems _this;
};

if (GF_ARL_APZ_clear_UniformContainer) then {
	clearMagazineCargoGlobal _UniformContainer;
	clearItemCargoGlobal _UniformContainer;
};

if (GF_ARL_APZ_clear_VestContainer) then {
	clearMagazineCargoGlobal _VestContainer;
	clearItemCargoGlobal _VestContainer;
};

if (GF_ARL_APZ_clear_BackpackContainer) then {

	if (GF_ARL_APZ_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARL_APZGF_ARL_APZ_Exclude_List_Gear)) then {
	clearMagazineCargoGlobal _BackpackContainer;
	clearItemCargoGlobal _BackpackContainer;
	};
	
	} else {
	clearMagazineCargoGlobal _BackpackContainer;
	clearItemCargoGlobal _BackpackContainer;
	};
};

if (GF_ARL_APZ_removeAllAssignedItems) then {
	removeAllAssignedItems _this;
};

if (GF_ARL_APZ_removeUniform) then {
	removeUniform _this;
};

if (GF_ARL_APZ_removeVest) then {
	removeVest _this;
};

if (GF_ARL_APZ_removeBackpack) then {

	if (GF_ARL_APZ_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARL_APZGF_ARL_APZ_Exclude_List_Gear)) then {
	removeBackpack _this;
	};
	
	} else {
	removeBackpack _this;
	};
};

if (GF_ARL_APZ_removeHeadgear) then {
	removeHeadgear _this;
};

if (GF_ARL_APZ_removeGoggles) then {
	removeGoggles _this;
};




//___________________	Link items to their inventory	___________________			

if (GF_ARL_APZ_Link_Items) then {
											
	//	link an item
	//	_this linkItem "ItemMap";
	
for "_i" from 1 to random 6 do {
	
	_assignableItems = selectRandom GF_ARL_APZ_Binocular_and_Nvg_array;
	if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this linkItem _assignableItems;};	
	};
	
for "_i" from 1 to random 6 do {
	
	_assignableItems = selectRandom GF_ARL_APZ_Binocular_and_Nvg_array;
	if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this linkItem _assignableItems;};
	};
	
};			 


//___________________	GF_ARL_APZ_AddUniform	___________________

if (GF_ARL_APZ_AddUniform) then {

_this forceAddUniform _Uniform;
};


//___________________ GF_ARL_APZ_addVest ___________________

if (GF_ARL_APZ_addVest) then {
			
_this addVest _Vests;			
};


//___________________ GF_ARL_APZ_addBackpack ___________________

if (GF_ARL_APZ_addBackpack) then {			

if (GF_ARL_APZ_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARL_APZGF_ARL_APZ_Exclude_List_Gear)) then {			
	if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addBackpack _Backpacks;};	
	};
	
	} else {
	if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addBackpack _Backpacks;};
	};
};


//___________________ addHeadgear ___________________

if (GF_ARL_APZ_addHeadgear) then {			
			
_this addHeadgear _Headgear;										
};


//___________________ GF_ARL_APZ_addGoggles ___________________

if (GF_ARL_APZ_addGoggles) then {			
			
_this addGoggles _Goggles;					
};


//___________________	add _primaryWeapon	___________________

if (GF_ARL_APZ_Add_primaryWeapon) then {			
	
_this addWeapon _primaryWeapon;
};


//___________________	addPrimaryWeaponItem	___________________	

if (GF_ARL_APZ_Add_primaryWeapon_Attachments) then {

//___________________	add _primaryWeapon's compatible attachments	___________________

_primaryWeapon_MuzzleSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
if (count _primaryWeapon_MuzzleSlot >= 1) then {_primaryWeapon_Muzzle = selectRandom _primaryWeapon_MuzzleSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addPrimaryWeaponItem _primaryWeapon_Muzzle;};}; 

_primaryWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _primaryWeapon_CowsSlot >= 1) then {_primaryWeapon_Optic = selectRandom _primaryWeapon_CowsSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addPrimaryWeaponItem _primaryWeapon_Optic;};}; 

_primaryWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _primaryWeapon_PointerSlot >= 1) then {_primaryWeapon_Pointer = selectRandom _primaryWeapon_PointerSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addPrimaryWeaponItem _primaryWeapon_Pointer;};}; 

_primaryWeapon_UnderBarrelSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
if (count _primaryWeapon_UnderBarrelSlot >= 1) then {_primaryWeapon_UnderBarrel = selectRandom _primaryWeapon_UnderBarrelSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addPrimaryWeaponItem _primaryWeapon_UnderBarrel;};}; 
};


//___________________	GF_ARL_APZ_Add_secondaryWeapon	___________________

if (GF_ARL_APZ_Add_secondaryWeapon) then {			

if (GF_ARL_APZ_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARL_APZGF_ARL_APZ_Exclude_List_Gear)) then {	

	//	add rarity 
	if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {
	
	_has_Backpack = backpack _this;
	if (_has_Backpack isEqualTo [])  then {
	_this addBackpack _Backpacks;
	};
	_this addWeapon _secondaryWeapon;
	if (count _Spawn_secondaryWeapon_Magazines >= 1) then {
	for "_i" from 0 to 3 do {_this addItemToBackpack _Spawn_secondaryWeapon_Magazines;};
	};
	};	
	};
	} else {
	
	_has_Backpack = backpack _this;
	if (_has_Backpack isEqualTo [])  then {
	_this addBackpack _Backpacks;
	};
	_this addWeapon _secondaryWeapon;
	if (count _Spawn_secondaryWeapon_Magazines >= 1) then {
	for "_i" from 0 to 3 do {_this addItemToBackpack _Spawn_secondaryWeapon_Magazines;};
	};
	};
};


//___________________	addSecondaryWeaponItem	___________________	

if (GF_ARL_APZ_Add_secondaryWeapon_Attachments) then {

//___________________	add _secondaryWeapon 's compatible attachments	___________________

_secondaryWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _secondaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _secondaryWeapon_CowsSlot >= 1) then {_secondaryWeapon_Optic = selectRandom _secondaryWeapon_CowsSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addSecondaryWeaponItem _secondaryWeapon_Optic;};}; 

_secondaryWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _secondaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _secondaryWeapon_PointerSlot >= 1) then {_secondaryWeapon_Pointer = selectRandom _secondaryWeapon_PointerSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addSecondaryWeaponItem _secondaryWeapon_Pointer;};}; 
};

//___________________	add _handgunWeapon	___________________

if (GF_ARL_APZ_Add_handgunWeapon) then {

_this addWeapon _handgunWeapon; 
};


//___________________	addHandgunItem	___________________

if (GF_ARL_APZ_Add_handgunWeapon_Attachments) then {

//___________________	add _handgunWeapon's compatible attachments	___________________

_handgunWeapon_MuzzleSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
if (count _handgunWeapon_MuzzleSlot >= 1) then {_handgunWeapon_Muzzle = selectRandom _handgunWeapon_MuzzleSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addHandgunItem _handgunWeapon_Muzzle;};}; 

_handgunWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _handgunWeapon_CowsSlot >= 1) then {_handgunWeapon_Optic = selectRandom _handgunWeapon_CowsSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addHandgunItem _handgunWeapon_Optic;};}; 

_handgunWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _handgunWeapon_PointerSlot >= 1) then {_handgunWeapon_Pointer = selectRandom _handgunWeapon_PointerSlot;
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addHandgunItem _handgunWeapon_Pointer;};}; 
};


//___________________	addItemToUniform	___________________

if (GF_ARL_APZ_addItemToUniform) then {

for "_i" from 1 to 1 do {_this addItemToUniform "FirstAidKit";};

if (count _Spawn_handgunWeapon_Magazines >= 1) then {
for "_i" from 1 to 2 do {_this addItemToUniform _Spawn_handgunWeapon_Magazines;};
};

if (count _Spawn_primaryWeapon_magazines >= 1) then {
for "_i" from 1 to 2 do {_this addItemToUniform _Spawn_primaryWeapon_magazines;};
};

};


//___________________	addItemToVest	___________________

if (GF_ARL_APZ_addItemToVest) then {

if (count _Spawn_primaryWeapon_magazines >= 1) then {
for "_i" from 1 to 5 do {_this addItemToVest _Spawn_primaryWeapon_magazines;};
};

for "_i" from 1 to 1 do {_this addItemToVest "FirstAidKit";};
for "_i" from 1 to 1 do {_this addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 1 do {_this addItemToVest "SmokeShell";};

if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addItemToVest _Items_array;};
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addItemToVest _Attachments_array;};
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addItemToVest _Magazines_array;};
};



//___________________	addItemToBackpack	___________________

if (GF_ARL_APZ_addItemToVest) then {

if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addItemToBackpack _Items_array;};
if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addItemToBackpack _Attachments_array;};

if (count _Spawn_primaryWeapon_magazines >= 1) then {
for "_i" from 1 to 2 do {_this addItemToBackpack _Spawn_primaryWeapon_magazines;};
};

if (floor (random GF_ARL_APZ_Possibility_random) < GF_ARL_APZ_Possibility) then {_this addItemToBackpack _Magazines_array;};
};


//___________________	GF_ARL_APZ_Magazines_in_Backpack	___________________	

if (GF_ARL_APZ_Magazines_in_Backpack) then {

for "_i" from 0 to random 3 do {_this addItemToBackpack _Magazines_array;};
};	


};
//___________________	*** End *** 	___________________	


/*

[] spawn {
	while {true} do {		
		{		
		if (
		((alive _x)) 
		&& (!(_x getVariable ["Var_GF_ARL_APZ",false])) 
		&& (!((typeOf _x) in GF_ARL_APZ_Exclude_List)) 
		
		/*
		//___________________	You can filter the side here	___________________	
		&& {((side group _x) == west || 
			(side group _x) == east || 
			(side group _x) == independent || 
			(side group _x) == civilian)}
		*/
		
		//	&& (side group _x == playerSide)
		//	&& (!(side group _x == playerSide))
/*		
		) then {
			
			_x spawn GF_ARL_APZ;
			
			};						
			_x setVariable ["Var_GF_ARL_APZ",true];
			{waitUntil {!alive _x};
			_x setVariable ["Var_GF_ARL_APZ",false];		 
			};
		}forEach allUnits;
		sleep 5;
	};
};		

*/

diag_log "//___________________	GF Auto Random Loadout Script Initialized	_____________";
//systemchat "GF Auto Random Loadout Script Initialized";