


//________________  Author : GEORGE FLOROS [GR] ___________ 24.12.18 _____________ 


/*
________________ GF Auto Loot Vehicles Script - Mod	________________



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


diag_log "//________________ GF_Auto_Loot_Vehicles initializing _____________";


//________________ Settings ________________
//________________ Set true or false  ________________

GF_ALV_Systemchat_info					= true;		
GF_ALV_Hintsilent_info					= true;
GF_ALV_diag_log_info					= true;
GF_ALV_Debug 							= true;

GF_ALV_Clear_Items						= true; 		
GF_ALV_Spawned_Items_Number    			= 10;
GF_ALV_Spawned_Items_Number_random    	= 10;


//GF_ALV_Select	-->	1 = Load every Mod + Bohemia Items , 2 = Load every Mod - No Bohemia Items , 3 = Load Bohemia Items Only , 4 = Custom items only
GF_ALV_Select 							= 1;					


	
	
if (GF_ALV_Systemchat_info) then {
systemchat "GF Auto Loot Vehicles Script initializing";			
};	



//________________	Array 	________________

/*
//________________	GF_ALV_Binocular_and_Nvg_array	Binocular and Nvg slot 	________________

It might be needed , to add also the mods , that you want to blacklist , in the GF_ALV_Assignable_Items_Mod_Blacklist
in case that the GF_ALV_Attachments_array , generates also items from the blacklisted mods.
To check this , uncomment the line that you will find below (in case : % ) , depending the selection GF_ALV_Select

copyToClipboard str GF_ALV_Binocular_and_Nvg_array; 

then run the mission and it will copy the generated array , then ctrl + v to paste the array.

The "mcc_sandbox_a3" mod will generate items that they are not Binocular or Nvg.
*/

GF_ALV_Binocular_and_Nvg_array_Mod_Blacklist = [
	"mcc_sandbox_a3",
	"CUP_Weapons"		//	Example
	];

	//________________	GF_ALV_Assignable_Items_Mod_Blacklist 	________________

GF_ALV_Vehicle_array_Mod_Blacklist = [
	"mcc_sandbox_a3",
	"@CUP_Vehicles"		//	Example
	];
	
//________________	case	________________
	
_Array_Loaded = false;
_Select_items_Loaded = false;

private ["_items_case"];

switch (GF_ALV_Select) do {
							

case 1 : {

//________________	Load every Mod + Bohemia items	________________

GF_ALV_primaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_secondaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_handgunWeapon_array = ("getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Magazines_array = ("getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ALV_Uniform_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Vests_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Headgear_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Backpacks_array = ("getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ALV_Goggles_array = ("getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ALV_Items_array = ("getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Attachments_array = ("getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ALV_Binocular_and_Nvg_array = (
	"getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
	//	copyToClipboard str GF_ALV_Binocular_and_Nvg_array; 

	
_items_case = "Load every Mod + Bohemia items";
_Select_items_Loaded = true;
};


case 2 : {

//________________	Load every Mod / No Bohemia items	________________

GF_ALV_primaryWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_secondaryWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_handgunWeapon_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Magazines_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ALV_Uniform_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Vests_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Headgear_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Backpacks_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ALV_Goggles_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ALV_Items_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Attachments_array = ("(!(getText( _x >> 'author' ) == 'Bohemia Interactive')) && getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ALV_Binocular_and_Nvg_array = (
	"(!(getText( _x >> 'author' ) == 'Bohemia Interactive'))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
	//	copyToClipboard str GF_ALV_Binocular_and_Nvg_array; 

	
_items_case = "Load every Mod - No Bohemia items";
_Select_items_Loaded = true;	
};


case 3 : {

//________________	Bohemia items Only	________________

GF_ALV_primaryWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_secondaryWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_handgunWeapon_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Magazines_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines")) apply {configName _x};

GF_ALV_Uniform_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Vests_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Headgear_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Backpacks_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
GF_ALV_Goggles_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses")) apply {configName _x};

GF_ALV_Items_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};
GF_ALV_Attachments_array = ("getText( _x >> 'author' ) == 'Bohemia Interactive' && getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons")) apply {configName _x};

GF_ALV_Binocular_and_Nvg_array = (
	"getText( _x >> 'author' ) == 'Bohemia Interactive'
	&& (!(getText( _x >> 'DLC' ) in GF_ALV_Binocular_and_Nvg_array_Mod_Blacklist))
	&& getNumber ( _x >> 'scope' ) isEqualTo 2	
	&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
	&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
	"configClasses (configfile >> "CfgWeapons")
	) apply {configName _x};
	//	copyToClipboard str GF_ALV_Binocular_and_Nvg_array; 

	
_items_case = "Load Bohemia items Only";
_Select_items_Loaded = true;	
};


case 4 : {

/*
//________________	Custom items only	________________
It is posible to add everything to one array and the code below will manage the spawn , 
GF_ALV_cfgArray = [];
But then delete the arrays and their count below
*/

//	add the classnames	ex:
GF_ALV_primaryWeapon_array  = ["arifle_MX_SW_F"];
GF_ALV_secondaryWeapon_array = ["launch_NLAW_F"];
GF_ALV_handgunWeapon_array = ["hgun_P07_F"];
GF_ALV_Magazines_array = ["100Rnd_65x39_caseless_mag","16Rnd_9x21_Mag"];
GF_ALV_Uniform_array = ["U_B_CombatUniform_mcam_tshirt"];
GF_ALV_Vests_array = ["V_PlateCarrier2_rgr"];
GF_ALV_Headgear_array = ["H_HelmetB_grass"];
GF_ALV_Backpacks_array = ["B_AssaultPack_mcamo"];
GF_ALV_Goggles_array = ["G_Combat"];
GF_ALV_Items_array = ["FirstAidKit"];
GF_ALV_Attachments_array = ["acc_pointer_IR"];
GF_ALV_Binocular_and_Nvg_array = ["NVGoggles"];


_items_case = "Custom items only";
_Select_items_Loaded = true;	
};


};


//________________	_Array_Loaded	________________

waituntil {_Select_items_Loaded};
_Array_Loaded = true;

if (GF_ALV_Hintsilent_info) then {
hintsilent format ["%1",_items_case]; 
};

if (GF_ALV_diag_log_info) then {
diag_log format ["%1",_items_case]; 
};


//________________	It is possible to add here your custom array	________________

GF_ALV_cfgArray = 
	GF_ALV_primaryWeapon_array 
	+ GF_ALV_secondaryWeapon_array 
	+ GF_ALV_handgunWeapon_array
	+ GF_ALV_Magazines_array
	+ GF_ALV_Uniform_array
	+ GF_ALV_Vests_array
	+ GF_ALV_Headgear_array
	+ GF_ALV_Backpacks_array
	+ GF_ALV_Goggles_array
	+ GF_ALV_Items_array
	+ GF_ALV_Attachments_array
	+ GF_ALV_Binocular_and_Nvg_array;

	//	copyToClipBoard str GF_ALV_cfgArray;	//	uncomment to copy
	
waituntil {_Array_Loaded};




GF_ALV = {

_this setVariable ["Var_GF_ALV",true]; 

//________________ Clear Vehicle's items ________________

if (GF_ALV_Clear_Items) then {

clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;
clearItemCargoGlobal _this;
clearBackpackCargoGlobal _this;

};



//________________	Spawn Loot 	________________ 
		
for "_i" from 1 to GF_ALV_Spawned_Items_Number + random GF_ALV_Spawned_Items_Number_random do {


//________________	_Loot	________________

private ["_Loot","_Item","_magazines","_Item_magazines","_getText","_Color","_Marker","_Text"];
	
	_Item = selectRandom GF_ALV_cfgArray;
	_getText = getText (configFile >> "cfgVehicles" >> _Item >> "vehicleClass");	
	
	
	_Loot = _this;
	_Color = "Default";	//	https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
	_Text =  "Empty";
	
	
	//	https://forums.bohemia.net/forums/topic/193019-can-i-detect-all-pistols-from-cfgweapons/?tab=comments#comment-3072020
	_type = [0,1,2,4,16,256,4096,131072];	 
	
	if (
	(getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") in _type)
	or (getNumber (configFile >> "CfgWeapons" >> _item >> "type") in _type)
	or (getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") in [ 0 , 616 ])
	or (isClass (configFile >> "CfgGlasses" >> _Item))
	or (isClass (configFile >> "CfgMagazines" >> _Item))
	 
	) then {
	
		
switch true do {
		
//________________	Gear	________________
	
case(getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") == 801) : {
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "ColorGUER";_Text = "Uniforms";};
	
case(getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") == 701) : {
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "ColorKhaki";_Text = "Vests";};
		
case(getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") == 605) : {
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "ColorGreen";_Text = "Headgear";};
		
case(_getText isEqualTo "Backpacks") : {
	_Loot addBackPackCargoGlobal [ _Item, 1 ];
	_Color = "ColorBrown";_Text = "Backpacks";};
		
case(isClass (configFile >> "CfgGlasses" >> _Item)) : {
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "colorCivilian";_Text = "Glasses";};
	
	
//________________	Weapons	________________
	
case(getNumber (configFile >> "CfgWeapons" >> _item >> "type") == 1) : {
	_Loot addWeaponCargoGlobal [ _Item, 1 ];
	private _magazines = getArray (configFile >> "CfgWeapons" >> _Item >> "magazines");
	private _Item_magazines = selectRandom _magazines;
	_Loot addMagazineCargoGlobal [_Item_magazines, round (1 + random 2)];
	_Color = "ColorEAST";_Text = "WeaponsPrimary";};
		
case(getNumber (configFile >> "CfgWeapons" >> _item >> "type") == 2) : {
	_Loot addWeaponCargoGlobal [ _Item, 1 ];
	private _magazines = getArray (configFile >> "CfgWeapons" >> _Item >> "magazines");
	private _Item_magazines = selectRandom _magazines;
	_Loot addMagazineCargoGlobal [_Item_magazines, round (1 + random 2)];
	_Color = "ColorPink";_Text = "HandGuns";};	
		
case(getNumber (configFile >> "CfgWeapons" >> _item >> "type") == 4) : {
	_Loot addWeaponCargoGlobal [ _Item, 1 ];
	private _magazines = getArray (configFile >> "CfgWeapons" >> _Item >> "magazines");
	private _Item_magazines = selectRandom _magazines;
	_Loot addMagazineCargoGlobal [_Item_magazines, round (1 + random 2)];
	_Color = "ColorOrange";_Text = "WeaponsSecondary";};

case(isClass (configFile >> "CfgMagazines" >> _Item)) : {
	_Loot addMagazineCargoGlobal [ _Item, round (1 + random 2)];
	_Color = "colorRed";_Text =  "Mags";};

case(getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") == 616): {
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "ColorBlue";_Text = "Nvg";};
	
case(getNumber (configFile >> "CfgWeapons" >> _item >> "type") == 4096) : {
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "ColorWEST";_Text = "Items";};		

case(getNumber (configFile >> "CfgWeapons" >> _item >> "type") == 131072) : {
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "ColorWhite";_Text = "Weapon Attachments";};	
	
case(getNumber (configFile >> "CfgWeapons" >> _item >> "type") == 0) : {
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "colorBLUFOR";_Text = "Inventory Items";};
	
};

	} else {
	
	_Loot addItemCargoGlobal [ _Item, 1 ];
	_Color = "colorBLUFOR";_Text = "Inventory Items";	
	};
				
};			


};


[] spawn {
	while {true} do {	
		{	
		if (
			((alive _x))
			&& (!(_x getVariable ["Var_GF_ALV",false])) 
			&& ((_x isKindOf "LandVehicle") or (_x isKindOf "Air") or (_x isKindOf "Ship"))
														
			) then {		
			_x call GF_ALV;
			};				
				
			{waitUntil ({!alive _x} or (damage _x == 1) or {!canMove _x});
			_x setVariable ["Var_GF_ALV",false]; 
			};			
			
		}forEach vehicles;
		sleep 5;			
	};
};


if (GF_ALV_Systemchat_info) then {
systemchat "GF_Auto_Loot_Vehicles Script initialized";			
};	

diag_log "//________________ GF_Auto_Loot_Vehicles Script initialized ________________";