


//________________  Author : GEORGE FLOROS [GR] ___________ 06.01.19 _____________

/*
________________ GF Auto Random Loadout Script ________________

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


//________________	***	Every sqf has different variables	***	________________
//________________	You can add in the init of a unit to exclude 	________________	
//	this setVariable ["Var_GF_ARL", true];
	
	
diag_log "//________________	GF Auto Random Loadout Script Initializing	_____________";
diag_log "//________________	GF_Auto_Random_Loadout.sqf	_____________";

systemchat "GF Auto Random Loadout Script Initializing";



//________________ Settings ________________
//________________ Set true or false  ________________


GF_ARL_Systemchat_info						= true;
GF_ARL_Hintsilent_info						= true;
GF_ARL_diag_log_info						= true;	

//GF_ARL_Select	-->	1 = Load every Mod + Bohemia Items , 2 = Load every Mod - No Bohemia Items , 3 = Load Bohemia Items Only , 4 = Custom items only
GF_ARL_Select 								= 1;


//________________ Gear ________________
//________________ Set true or false  ________________

GF_ARL_Exclude_List_Gear					= true; 	//	exclude from changing their special Gear , as bagpacks or , AT  , mines , etc
	
//________________ Clear Unit's items ________________

GF_ARL_Remove_Everything 					= false;	//	If true  Remove Everything	, it' s better not
	
//________________ or filter ________________

GF_ARL_removeallweapons 					= true;	
 	
GF_ARL_Remove_primaryWeapon 				= true; 
GF_ARL_Remove_secondaryWeapon				= true;		
GF_ARL_Remove_handgunWeapon 				= true; 
	
GF_ARL_removeAllItems 						= true; 	
GF_ARL_clear_UniformContainer 				= true; 	
GF_ARL_clear_VestContainer 					= true; 
GF_ARL_clear_BackpackContainer 				= true;	
GF_ARL_removeAllAssignedItems 				= true; 

GF_ARL_removeUniform 						= true; 	
GF_ARL_removeVest 							= true; 	
GF_ARL_removeBackpack 						= true; 	
GF_ARL_removeHeadgear 						= true; 
GF_ARL_removeGoggles 						= true; 

//________________ _add ________________
//________________ Set true or false  ________________

GF_ARL_Link_Items							= true; 		

GF_ARL_AddUniform							= true;             
GF_ARL_addVest								= true;        
GF_ARL_addBackpack							= true;	       
GF_ARL_addHeadgear							= true; 
GF_ARL_addGoggles							= true; 

GF_ARL_Add_primaryWeapon					= true; 
GF_ARL_Add_primaryWeapon_Attachments		= true; 

GF_ARL_Add_secondaryWeapon					= true; 
GF_ARL_Add_secondaryWeapon_Attachments		= true; 

GF_ARL_Add_handgunWeapon					= true; 		
GF_ARL_Add_handgunWeapon_Attachments		= true; 	

GF_ARL_addItemToUniform						= true;  
GF_ARL_addItemToVest						= true; 
GF_ARL_addItemToVest						= true;         

GF_ARL_Magazines_in_Backpack				= true; 


GF_ARL_Possibility							= 4;	//	ex:	floor (random 10) < 4;
GF_ARL_Possibility_random					= 10;

GF_ARL_Change_Loadout_on_Respawn			= true; 




//________________	Exclude list	________________

GF_ARL_Exclude_List = [

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


GF_ARLGF_ARL_Exclude_List_Gear = [
	
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
	
	
//________________	GF_Auto_Random_Loadout_cfgArray 	________________

/*
//________________	GF_ARL_Binocular_and_Nvg_array	Binocular and Nvg slot 	________________

It might be needed , to add also the mods , that you want to blacklist , in the GF_ARL_Assignable_Items_Mod_Blacklist
in case that the GF_ARL_Attachments_array , generates also items from the blacklisted mods.
To check this , uncomment the line that you will find below (in case : % ) , depending the selection GF_ARL_Select

copyToClipboard str GF_ARL_Binocular_and_Nvg_array; 

then run the mission and it will copy the generated array , then ctrl + v to paste the array.

The "mcc_sandbox_a3" mod will generate items that they are not Binocular or Nvg.
*/

GF_ARL_Binocular_and_Nvg_array_Mod_Blacklist = [
	"mcc_sandbox_a3",
	"CUP_Weapons"		//	Example
	];
//________________	GF_ARL_Assignable_Items_Mod_Blacklist 	________________



	
//________________	case	________________
	
_Array_Loaded = false;
_Select_items_Loaded = false;

private ["_items_case"];

switch (GF_ARL_Select) do {
							

case 1 : {

//________________	Load every Mod + Bohemia items	________________

GF_ARL_primaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_secondaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_handgunWeapon_array = ("getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Magazines_array = ("getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ARL_Uniform_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Vests_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Headgear_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Backpacks_array = ("getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ARL_Goggles_array = ("getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ARL_Items_array = ("getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Attachments_array = ("getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ARL_Binocular_and_Nvg_array = (
	"(!(getText( _x >> 'DLC' ) == 'mcc_sandbox_a3'))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
	copyToClipboard str GF_ARL_Binocular_and_Nvg_array; 


_items_case = "Load every Mod + Bohemia items";
_Select_items_Loaded = true;
};


case 2 : {

//________________	Load every Mod / No Bohemia items	________________

GF_ARL_primaryWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_secondaryWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_handgunWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Magazines_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ARL_Uniform_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Vests_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Headgear_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Backpacks_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ARL_Goggles_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ARL_Items_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Attachments_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ARL_Binocular_and_Nvg_array = (
	"(!(getText( _x >> 'author' ) == 'Bohemia Interactive'))
	&& (!(getText( _x >> 'DLC' ) == 'mcc_sandbox_a3'))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
//	copyToClipboard str GF_ARL_Binocular_and_Nvg_array; 

_items_case = "Load every Mod - No Bohemia items";
_Select_items_Loaded = true;	
};


case 3 : {

//________________	Bohemia items Only	________________

GF_ARL_primaryWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_secondaryWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_handgunWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Magazines_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ARL_Uniform_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Vests_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Headgear_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Backpacks_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ARL_Goggles_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ARL_Items_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ARL_Attachments_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ARL_Binocular_and_Nvg_array = (
	"getText( _x >> 'author' ) == 'Bohemia Interactive'
	&& (!(getText( _x >> 'DLC' ) in GF_ARL_Binocular_and_Nvg_array_Mod_Blacklist))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
//	copyToClipboard str GF_ARL_Binocular_and_Nvg_array; 


_items_case = "Load Bohemia items Only";
_Select_items_Loaded = true;	
};


case 4 : {

/*
//________________	Custom items only	________________
It is posible to add everything to one array and the code below will manage the spawn , 
GF_ARL_cfgArray = [];
But then delete the arrays and their count below
*/

//	add the classnames	ex:
GF_ARL_primaryWeapon_array  = ["arifle_MX_SW_F"];
GF_ARL_secondaryWeapon_array = ["launch_NLAW_F"];
GF_ARL_handgunWeapon_array = ["hgun_ACPC2_F"];	
GF_ARL_Magazines_array = ["100Rnd_65x39_caseless_mag","16Rnd_9x21_Mag"];
GF_ARL_Uniform_array = ["U_B_CombatUniform_mcam_tshirt"];
GF_ARL_Vests_array = ["V_PlateCarrier2_rgr"];
GF_ARL_Headgear_array = ["H_HelmetB_grass"];
GF_ARL_Backpacks_array = ["B_AssaultPack_mcamo"];
GF_ARL_Goggles_array = ["G_Combat"];
GF_ARL_Items_array = ["FirstAidKit"];
GF_ARL_Attachments_array = ["acc_pointer_IR"];
GF_ARL_Binocular_and_Nvg_array = ["NVGoggles"];


_items_case = "Custom items only";
_Select_items_Loaded = true;	
};




};


//________________	_Array_Loaded	________________

waituntil {_Select_items_Loaded};
_Array_Loaded = true;

if (GF_ARL_Hintsilent_info) then {
hintsilent format ["%1",_items_case]; 
};

if (GF_ARL_diag_log_info) then {
diag_log format ["%1",_items_case]; 
};

waituntil {_Array_Loaded};

	
				
GF_ARL = {

	
//________________	GF_ARL_Change_Loadout_on_Respawn	________________	

if (GF_ARL_Change_Loadout_on_Respawn) then {

_this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setVariable ["Var_GF_ARL",false];
}];
};

//________________	Randomize	________________

_Uniform = selectRandom GF_ARL_Uniform_array;
_Headgear = selectRandom GF_ARL_Headgear_array; 
_Goggles = selectRandom GF_ARL_Goggles_array; 
_Vests = selectRandom GF_ARL_Vests_array; 
_Backpacks = selectRandom GF_ARL_Backpacks_array;
_primaryWeapon = selectRandom GF_ARL_primaryWeapon_array;
_secondaryWeapon = selectRandom GF_ARL_secondaryWeapon_array;
_handgunWeapon = selectRandom GF_ARL_handgunWeapon_array;


//________________ _Items	________________

_Items_array = selectRandom GF_ARL_Items_array;
_Attachments_array = selectRandom GF_ARL_Attachments_array;
_Magazines_array = selectRandom GF_ARL_Magazines_array;


//________________	add _primaryWeapon's mags	________________

_primaryWeapon_Magazines = getArray (configFile / "CfgWeapons" / _primaryWeapon / "magazines");
_Spawn_primaryWeapon_magazines = selectRandom _primaryWeapon_Magazines;


//________________	add _secondaryWeapon's mags	________________

_secondaryWeapon_Magazines = getArray (configFile / "CfgWeapons" / _secondaryWeapon / "magazines");
_Spawn_secondaryWeapon_Magazines = selectRandom _secondaryWeapon_Magazines;


//________________	add _handgunWeapon's mags	________________

_handgunWeapon_Magazines = getArray (configFile / "CfgWeapons" / _handgunWeapon / "magazines");
_Spawn_handgunWeapon_Magazines = selectRandom _handgunWeapon_Magazines;

	

	

//________________ Clear Unit's items ________________
//________________ Remove_Everything ________________

_UniformContainer =  UniformContainer _this;
_VestContainer = vestContainer _this;
_BackpackContainer = BackpackContainer _this;


if (GF_ARL_Remove_Everything) then {

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

if (GF_ARL_removeallweapons) then {
		
	if (GF_ARL_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARLGF_ARL_Exclude_List_Gear)) then {
	removeallweapons _this;
	};
	
	} else {
	removeallweapons _this;
	};
};

if (GF_ARL_Remove_primaryWeapon) then {
	_this removeWeapon (primaryWeapon _this);
};

if (GF_ARL_Remove_secondaryWeapon) then {

	if (GF_ARL_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARLGF_ARL_Exclude_List_Gear)) then {
	_this removeWeapon (secondaryWeapon _this);
	};
	
	} else {
	_this removeWeapon (secondaryWeapon _this);
	};
};

if (GF_ARL_Remove_handgunWeapon) then {
	_this removeWeapon (handgunWeapon _this);
};

if (GF_ARL_removeAllItems) then {
	removeAllItems _this;
};

if (GF_ARL_clear_UniformContainer) then {
	clearMagazineCargoGlobal _UniformContainer;
	clearItemCargoGlobal _UniformContainer;
};

if (GF_ARL_clear_VestContainer) then {
	clearMagazineCargoGlobal _VestContainer;
	clearItemCargoGlobal _VestContainer;
};

if (GF_ARL_clear_BackpackContainer) then {

	if (GF_ARL_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARLGF_ARL_Exclude_List_Gear)) then {
	clearMagazineCargoGlobal _BackpackContainer;
	clearItemCargoGlobal _BackpackContainer;
	};
	
	} else {
	clearMagazineCargoGlobal _BackpackContainer;
	clearItemCargoGlobal _BackpackContainer;
	};
};

if (GF_ARL_removeAllAssignedItems) then {
	removeAllAssignedItems _this;
};

if (GF_ARL_removeUniform) then {
	removeUniform _this;
};

if (GF_ARL_removeVest) then {
	removeVest _this;
};

if (GF_ARL_removeBackpack) then {

	if (GF_ARL_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARLGF_ARL_Exclude_List_Gear)) then {
	removeBackpack _this;
	};
	
	} else {
	removeBackpack _this;
	};
};

if (GF_ARL_removeHeadgear) then {
	removeHeadgear _this;
};

if (GF_ARL_removeGoggles) then {
	removeGoggles _this;
};




//________________	Link items to their inventory	________________			

if (GF_ARL_Link_Items) then {
											
	//	link an item
	//	_this linkItem "ItemMap";
	
for "_i" from 1 to random 6 do {
	
	_assignableItems = selectRandom GF_ARL_Binocular_and_Nvg_array;
	if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this linkItem _assignableItems;};	
	};
	
for "_i" from 1 to random 6 do {
	
	_assignableItems = selectRandom GF_ARL_Binocular_and_Nvg_array;
	if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this linkItem _assignableItems;};
	};
	
};			 


//________________	GF_ARL_AddUniform	________________

if (GF_ARL_AddUniform) then {

_this forceAddUniform _Uniform;
};


//________________ GF_ARL_addVest ________________

if (GF_ARL_addVest) then {
			
_this addVest _Vests;			
};


//________________ GF_ARL_addBackpack ________________

if (GF_ARL_addBackpack) then {			

if (GF_ARL_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARLGF_ARL_Exclude_List_Gear)) then {			
	if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addBackpack _Backpacks;};	
	};
	
	} else {
	if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addBackpack _Backpacks;};
	};
};


//________________ addHeadgear ________________

if (GF_ARL_addHeadgear) then {			
			
_this addHeadgear _Headgear;										
};


//________________ GF_ARL_addGoggles ________________

if (GF_ARL_addGoggles) then {			
			
_this addGoggles _Goggles;					
};


//________________	add _primaryWeapon	________________

if (GF_ARL_Add_primaryWeapon) then {			
	
_this addWeapon _primaryWeapon;
};


//________________	addPrimaryWeaponItem	________________	

if (GF_ARL_Add_primaryWeapon_Attachments) then {

//________________	add _primaryWeapon's compatible attachments	________________

_primaryWeapon_MuzzleSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
if (count _primaryWeapon_MuzzleSlot >= 1) then {_primaryWeapon_Muzzle = selectRandom _primaryWeapon_MuzzleSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addPrimaryWeaponItem _primaryWeapon_Muzzle;};}; 

_primaryWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _primaryWeapon_CowsSlot >= 1) then {_primaryWeapon_Optic = selectRandom _primaryWeapon_CowsSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addPrimaryWeaponItem _primaryWeapon_Optic;};}; 

_primaryWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _primaryWeapon_PointerSlot >= 1) then {_primaryWeapon_Pointer = selectRandom _primaryWeapon_PointerSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addPrimaryWeaponItem _primaryWeapon_Pointer;};}; 

_primaryWeapon_UnderBarrelSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
if (count _primaryWeapon_UnderBarrelSlot >= 1) then {_primaryWeapon_UnderBarrel = selectRandom _primaryWeapon_UnderBarrelSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addPrimaryWeaponItem _primaryWeapon_UnderBarrel;};}; 
};


//________________	GF_ARL_Add_secondaryWeapon	________________

if (GF_ARL_Add_secondaryWeapon) then {			

if (GF_ARL_Exclude_List_Gear) then {
	if (!((typeOf _this) in GF_ARLGF_ARL_Exclude_List_Gear)) then {	

	//	add rarity 
	if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {
	
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


//________________	addSecondaryWeaponItem	________________	

if (GF_ARL_Add_secondaryWeapon_Attachments) then {

//________________	add _secondaryWeapon 's compatible attachments	________________

_secondaryWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _secondaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _secondaryWeapon_CowsSlot >= 1) then {_secondaryWeapon_Optic = selectRandom _secondaryWeapon_CowsSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addSecondaryWeaponItem _secondaryWeapon_Optic;};}; 

_secondaryWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _secondaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _secondaryWeapon_PointerSlot >= 1) then {_secondaryWeapon_Pointer = selectRandom _secondaryWeapon_PointerSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addSecondaryWeaponItem _secondaryWeapon_Pointer;};}; 
};

//________________	add _handgunWeapon	________________

if (GF_ARL_Add_handgunWeapon) then {

_this addWeapon _handgunWeapon; 
};


//________________	addHandgunItem	________________

if (GF_ARL_Add_handgunWeapon_Attachments) then {

//________________	add _handgunWeapon's compatible attachments	________________

_handgunWeapon_MuzzleSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
if (count _handgunWeapon_MuzzleSlot >= 1) then {_handgunWeapon_Muzzle = selectRandom _handgunWeapon_MuzzleSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addHandgunItem _handgunWeapon_Muzzle;};}; 

_handgunWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
if (count _handgunWeapon_CowsSlot >= 1) then {_handgunWeapon_Optic = selectRandom _handgunWeapon_CowsSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addHandgunItem _handgunWeapon_Optic;};}; 

_handgunWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
if (count _handgunWeapon_PointerSlot >= 1) then {_handgunWeapon_Pointer = selectRandom _handgunWeapon_PointerSlot;
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addHandgunItem _handgunWeapon_Pointer;};}; 
};


//________________	addItemToUniform	________________

if (GF_ARL_addItemToUniform) then {

for "_i" from 1 to 1 do {_this addItemToUniform "FirstAidKit";};

if (count _Spawn_handgunWeapon_Magazines >= 1) then {
for "_i" from 1 to 2 do {_this addItemToUniform _Spawn_handgunWeapon_Magazines;};
};

if (count _Spawn_primaryWeapon_magazines >= 1) then {
for "_i" from 1 to 2 do {_this addItemToUniform _Spawn_primaryWeapon_magazines;};
};

};


//________________	addItemToVest	________________

if (GF_ARL_addItemToVest) then {

if (count _Spawn_primaryWeapon_magazines >= 1) then {
for "_i" from 1 to 5 do {_this addItemToVest _Spawn_primaryWeapon_magazines;};
};

for "_i" from 1 to 1 do {_this addItemToVest "FirstAidKit";};
for "_i" from 1 to 1 do {_this addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 1 do {_this addItemToVest "SmokeShell";};

if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addItemToVest _Items_array;};
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addItemToVest _Attachments_array;};
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addItemToVest _Magazines_array;};
};



//________________	addItemToBackpack	________________

if (GF_ARL_addItemToVest) then {

if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addItemToBackpack _Items_array;};
if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addItemToBackpack _Attachments_array;};

if (count _Spawn_primaryWeapon_magazines >= 1) then {
for "_i" from 1 to 2 do {_this addItemToBackpack _Spawn_primaryWeapon_magazines;};
};

if (floor (random GF_ARL_Possibility_random) < GF_ARL_Possibility) then {_this addItemToBackpack _Magazines_array;};
};


//________________	GF_ARL_Magazines_in_Backpack	________________	

if (GF_ARL_Magazines_in_Backpack) then {

for "_i" from 0 to random 3 do {_this addItemToBackpack _Magazines_array;};
};	



//________________	reload handgunWeapon	________________

uisleep 8;
_this selectweapon handgunWeapon _this;
if (needReload _this == 1) then {reload _this;};
uisleep 8;
_this selectweapon primaryWeapon _this;
if (needReload _this == 1) then {reload _this;};

};
//________________	*** End *** 	________________	




[] spawn {
	while {true} do {		
		{		
		if (
		((alive _x)) 
		&& (!(_x getVariable ["Var_GF_ARL",false])) 
		&& (!((typeOf _x) in GF_ARL_Exclude_List)) 
		
		/*
		//________________	You can filter the side here	________________	
		&& {((side group _x) == west || 
			(side group _x) == east || 
			(side group _x) == independent || 
			(side group _x) == civilian)}
		*/
		
		//	&& (side group _x == playerSide)
		//	&& (!(side group _x == playerSide))
		
		) then {
			
			_x spawn GF_ARL;
			
			};						
			_x setVariable ["Var_GF_ARL",true];
			{waitUntil {!alive _x};
			_x setVariable ["Var_GF_ARL",false];		 
			};
		}forEach allUnits;
		sleep 5;
	};
};		


diag_log "//________________	GF Auto Random Loadout Script Initialized	_____________";
systemchat "GF Auto Random Loadout Script Initialized";