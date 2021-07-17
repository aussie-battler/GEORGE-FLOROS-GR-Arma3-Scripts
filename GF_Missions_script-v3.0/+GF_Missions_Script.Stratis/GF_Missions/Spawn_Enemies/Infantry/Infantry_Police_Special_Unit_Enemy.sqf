


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


/*
//________________	add this to use	________________
//________________	Infantry_Police_Special_Unit_Enemy	________________
[] spawn GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Defend;
[] spawn GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Police_Special_Unit_Enemy;		//	add the name of the building ex : [_Building] spawn GF_Missions_Garrison_The_Building_Infantry_Police_Special_Unit_Enemy;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Police_Special_Unit_Enemy;
*/


//________________	GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Patrol	________________

GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Patrol = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 250]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;


_Uniform = selectRandom [
			"U_C_Driver_4"
			]; 
if (isServer) then {[_x,[0,"#(rgb,1,1,1)color(0,0,0,0)"]] remoteExec ["setObjectTexture",0,true]};			


_Vests = selectRandom [
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrier1_blk"
			]; 

_Headgear = selectRandom [
			"H_PASGT_basic_black_F"
			]; 
			
_Goggles = selectRandom [
			"G_Balaclava_TI_G_blk_F"
			]; 
						
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;


comment "Add containers";
_unit forceAddUniform _Uniform;
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom [
			"srifle_EBR_MRCO_pointer_F",
			"srifle_EBR_SOS_F",
			"srifle_EBR_ARCO_pointer_snds_F",
			"srifle_EBR_DMS_F",
			"rifle_EBR_DMS_pointer_snds_F",
			"srifle_GM6_SOS_F",
			"srifle_GM6_LRPS_F",
			"srifle_LRR_SOS_F",
			"srifle_LRR_LRPS_F",
			"LMG_Mk200_MRCO_F",
			"LMG_Zafir_ARCO_F",
			"arifle_Katiba_GL_ARCO_pointer_F",
			"srifle_DMR_01_SOS_F",
			"srifle_DMR_01_DMS_snds_F",
			"hgun_PDW2000_Holo_snds_F",
			"SMG_02_ARCO_pointg_F",
			"arifle_Katiba_ARCO_pointer_F",
			"arifle_Katiba_ARCO_pointer_snds_F"
			];
			
//________________	add _Primary_Weapon's mags	________________

_Primary_Weapon_Magazines = getArray (configFile / "CfgWeapons" / _Primary_Weapon / "magazines");
_Spawn_Primary_Weapon_magazines = selectRandom _Primary_Weapon_Magazines; 
		
comment "Add weapons";
_Unit addWeapon _Primary_Weapon;

for "_i" from 1 to 3 do {_Unit addItemToUniform _Spawn_Primary_Weapon_magazines;};
for "_i" from 1 to 1 do {_Unit addItemToUniform "FirstAidKit";};
for "_i" from 1 to 1 do {_Unit addItemToUniform "HandGrenade";};

for "_i" from 1 to 1 do {_Unit addItemToVest "FirstAidKit";};
for "_i" from 1 to 2 do {_Unit addItemToVest "SmokeShell";};
for "_i" from 1 to 1 do {_Unit addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_Unit addItemToVest "MiniGrenade";};

for "_i" from 1 to 2 do {_Unit addItemToVest _Spawn_Primary_Weapon_magazines;}; 
for "_i" from 1 to 2 do {_Unit addItemToBackpack _Spawn_Primary_Weapon_magazines;};

//________________	reload_Primary_Weapon	________________
_Unit selectweapon primaryWeapon _Unit;
reload _Unit;

comment "Add items";
//	add possibility 
if (floor (random 10) < 4) then {_Unit linkItem "ItemMap";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemCompass";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemWatch";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemGPS";};


};
[_Group,_Pos,GF_Missions_BIS_fnc_taskPatrol_distance] call BIS_fnc_taskPatrol;
};


//________________	GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Defend	________________	

GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Defend = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 100]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;


_Uniform = selectRandom [
			"U_C_Driver_4"
			]; 
if (isServer) then {[_x,[0,"#(rgb,1,1,1)color(0,0,0,0)"]] remoteExec ["setObjectTexture",0,true]};			


_Vests = selectRandom [
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrier1_blk"
			]; 

_Headgear = selectRandom [
			"H_PASGT_basic_black_F"
			]; 
			
_Goggles = selectRandom [
			"G_Balaclava_TI_G_blk_F"
			]; 
						
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;


comment "Add containers";
_unit forceAddUniform _Uniform;
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom [
			"srifle_EBR_MRCO_pointer_F",
			"srifle_EBR_SOS_F",
			"srifle_EBR_ARCO_pointer_snds_F",
			"srifle_EBR_DMS_F",
			"rifle_EBR_DMS_pointer_snds_F",
			"srifle_GM6_SOS_F",
			"srifle_GM6_LRPS_F",
			"srifle_LRR_SOS_F",
			"srifle_LRR_LRPS_F",
			"LMG_Mk200_MRCO_F",
			"LMG_Zafir_ARCO_F",
			"arifle_Katiba_GL_ARCO_pointer_F",
			"srifle_DMR_01_SOS_F",
			"srifle_DMR_01_DMS_snds_F",
			"hgun_PDW2000_Holo_snds_F",
			"SMG_02_ARCO_pointg_F",
			"arifle_Katiba_ARCO_pointer_F",
			"arifle_Katiba_ARCO_pointer_snds_F"
			];
			
//________________	add _Primary_Weapon's mags	________________

_Primary_Weapon_Magazines = getArray (configFile / "CfgWeapons" / _Primary_Weapon / "magazines");
_Spawn_Primary_Weapon_magazines = selectRandom _Primary_Weapon_Magazines; 
		
comment "Add weapons";
_Unit addWeapon _Primary_Weapon;

for "_i" from 1 to 3 do {_Unit addItemToUniform _Spawn_Primary_Weapon_magazines;};
for "_i" from 1 to 1 do {_Unit addItemToUniform "FirstAidKit";};
for "_i" from 1 to 1 do {_Unit addItemToUniform "HandGrenade";};

for "_i" from 1 to 1 do {_Unit addItemToVest "FirstAidKit";};
for "_i" from 1 to 2 do {_Unit addItemToVest "SmokeShell";};
for "_i" from 1 to 1 do {_Unit addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_Unit addItemToVest "MiniGrenade";};

for "_i" from 1 to 2 do {_Unit addItemToVest _Spawn_Primary_Weapon_magazines;}; 
for "_i" from 1 to 2 do {_Unit addItemToBackpack _Spawn_Primary_Weapon_magazines;};

//________________	reload_Primary_Weapon	________________
_Unit selectweapon primaryWeapon _Unit;
reload _Unit;

comment "Add items";
//	add possibility 
if (floor (random 10) < 4) then {_Unit linkItem "ItemMap";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemCompass";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemWatch";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemGPS";};

};
[_Group, _Pos] call BIS_fnc_taskDefend;

};


//________________	GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Attack	________________

GF_Missions_Spawn_Infantry_Police_Special_Unit_Enemy_Attack = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, GF_Missions_Attack_Distance]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;


_Uniform = selectRandom [
			"U_C_Driver_4"
			]; 
if (isServer) then {[_x,[0,"#(rgb,1,1,1)color(0,0,0,0)"]] remoteExec ["setObjectTexture",0,true]};			


_Vests = selectRandom [
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrier1_blk"
			]; 

_Headgear = selectRandom [
			"H_PASGT_basic_black_F"
			]; 
			
_Goggles = selectRandom [
			"G_Balaclava_TI_G_blk_F"
			]; 
						
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;


comment "Add containers";
_unit forceAddUniform _Uniform;
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom [
			"srifle_EBR_MRCO_pointer_F",
			"srifle_EBR_SOS_F",
			"srifle_EBR_ARCO_pointer_snds_F",
			"srifle_EBR_DMS_F",
			"rifle_EBR_DMS_pointer_snds_F",
			"srifle_GM6_SOS_F",
			"srifle_GM6_LRPS_F",
			"srifle_LRR_SOS_F",
			"srifle_LRR_LRPS_F",
			"LMG_Mk200_MRCO_F",
			"LMG_Zafir_ARCO_F",
			"arifle_Katiba_GL_ARCO_pointer_F",
			"srifle_DMR_01_SOS_F",
			"srifle_DMR_01_DMS_snds_F",
			"hgun_PDW2000_Holo_snds_F",
			"SMG_02_ARCO_pointg_F",
			"arifle_Katiba_ARCO_pointer_F",
			"arifle_Katiba_ARCO_pointer_snds_F"
			];
			
//________________	add _Primary_Weapon's mags	________________

_Primary_Weapon_Magazines = getArray (configFile / "CfgWeapons" / _Primary_Weapon / "magazines");
_Spawn_Primary_Weapon_magazines = selectRandom _Primary_Weapon_Magazines; 
		
comment "Add weapons";
_Unit addWeapon _Primary_Weapon;

for "_i" from 1 to 3 do {_Unit addItemToUniform _Spawn_Primary_Weapon_magazines;};
for "_i" from 1 to 1 do {_Unit addItemToUniform "FirstAidKit";};
for "_i" from 1 to 1 do {_Unit addItemToUniform "HandGrenade";};

for "_i" from 1 to 1 do {_Unit addItemToVest "FirstAidKit";};
for "_i" from 1 to 2 do {_Unit addItemToVest "SmokeShell";};
for "_i" from 1 to 1 do {_Unit addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_Unit addItemToVest "MiniGrenade";};

for "_i" from 1 to 2 do {_Unit addItemToVest _Spawn_Primary_Weapon_magazines;}; 
for "_i" from 1 to 2 do {_Unit addItemToBackpack _Spawn_Primary_Weapon_magazines;};

//________________	reload_Primary_Weapon	________________
_Unit selectweapon primaryWeapon _Unit;
reload _Unit;

comment "Add items";
//	add possibility 
if (floor (random 10) < 4) then {_Unit linkItem "ItemMap";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemCompass";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemWatch";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemGPS";};

};
[_Group, _Pos] call BIS_fnc_taskAttack;

};


//________________	GF_Missions_Garrison_The_Building_Infantry_Police_Special_Unit_Enemy	________________ 

GF_Missions_Garrison_The_Building_Infantry_Police_Special_Unit_Enemy = {

_building = _this select 0;

_buildingPositions = [_building] call BIS_fnc_buildingPositions;
_count = count _buildingPositions;
_round = _count / 3;
_round_count = round _round;
_Positions = _round_count;

//	hint format ["%1",_count];
//	hint format ["%1",_Positions];

if (_count > 0) then {

_Group = createGroup GF_Missions_Enemy_Side;
for "_x" from 0 to (_Positions) do {

_Pos_Spawn = selectRandom _buildingPositions;

_Unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_Pos_Spawn,[],0,"None"];
[_Unit] JoinSilent _Group;
_Unit disableAI "PATH";


_Uniform = selectRandom [
			"U_C_Driver_4"
			]; 
if (isServer) then {[_x,[0,"#(rgb,1,1,1)color(0,0,0,0)"]] remoteExec ["setObjectTexture",0,true]};			


_Vests = selectRandom [
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrier1_blk"
			]; 

_Headgear = selectRandom [
			"H_PASGT_basic_black_F"
			]; 
			
_Goggles = selectRandom [
			"G_Balaclava_TI_G_blk_F"
			]; 
						
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;


comment "Add containers";
_unit forceAddUniform _Uniform;
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom [
			"srifle_EBR_MRCO_pointer_F",
			"srifle_EBR_SOS_F",
			"srifle_EBR_ARCO_pointer_snds_F",
			"srifle_EBR_DMS_F",
			"rifle_EBR_DMS_pointer_snds_F",
			"srifle_GM6_SOS_F",
			"srifle_GM6_LRPS_F",
			"srifle_LRR_SOS_F",
			"srifle_LRR_LRPS_F",
			"LMG_Mk200_MRCO_F",
			"LMG_Zafir_ARCO_F",
			"arifle_Katiba_GL_ARCO_pointer_F",
			"srifle_DMR_01_SOS_F",
			"srifle_DMR_01_DMS_snds_F",
			"hgun_PDW2000_Holo_snds_F",
			"SMG_02_ARCO_pointg_F",
			"arifle_Katiba_ARCO_pointer_F",
			"arifle_Katiba_ARCO_pointer_snds_F"
			];
			
//________________	add _Primary_Weapon's mags	________________

_Primary_Weapon_Magazines = getArray (configFile / "CfgWeapons" / _Primary_Weapon / "magazines");
_Spawn_Primary_Weapon_magazines = selectRandom _Primary_Weapon_Magazines; 
		
comment "Add weapons";
_Unit addWeapon _Primary_Weapon;

for "_i" from 1 to 3 do {_Unit addItemToUniform _Spawn_Primary_Weapon_magazines;};
for "_i" from 1 to 1 do {_Unit addItemToUniform "FirstAidKit";};
for "_i" from 1 to 1 do {_Unit addItemToUniform "HandGrenade";};

for "_i" from 1 to 1 do {_Unit addItemToVest "FirstAidKit";};
for "_i" from 1 to 2 do {_Unit addItemToVest "SmokeShell";};
for "_i" from 1 to 1 do {_Unit addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_Unit addItemToVest "MiniGrenade";};

for "_i" from 1 to 2 do {_Unit addItemToVest _Spawn_Primary_Weapon_magazines;}; 
for "_i" from 1 to 2 do {_Unit addItemToBackpack _Spawn_Primary_Weapon_magazines;};

//________________	reload_Primary_Weapon	________________
_Unit selectweapon primaryWeapon _Unit;
reload _Unit;

comment "Add items";
//	add possibility 
if (floor (random 10) < 4) then {_Unit linkItem "ItemMap";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemCompass";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemWatch";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemGPS";};

};
};
};


//________________	GF_Missions_Garrison_Area_Buildings_Infantry_Police_Special_Unit_Enemy	________________ 

GF_Missions_Garrison_Area_Buildings_Infantry_Police_Special_Unit_Enemy = {

_Exclude_Buildings = [
"Land_Pier_F",
"Land_Pier_small_F",
"Land_NavigLight",
"Land_LampHarbour_F"
];


_Buildings = nearestObjects [GF_Missions_pos, ["House", "Building"], GF_Missions_Garrison_Area_Distance];
	
{
_Building = _x;

if (!(typeOf _Building in _Exclude_Buildings)) then {
	
for "_i" from 0 to 50 do {

	_buildingpos = _Building buildingpos _i;
	if (str _buildingpos == "[0,0,0]") exitwith {};
	
	_Possibility = floor (random 100) < GF_Missions_Garrison_Area_Possibility;
	if (_Possibility) then {
	
	_Group = createGroup GF_Missions_Enemy_Side;
	_Unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_buildingpos,[],0,"None"];
	[_Unit] JoinSilent _Group;
	_Unit disableAI "PATH";
	

_Uniform = selectRandom [
			"U_C_Driver_4"
			]; 
if (isServer) then {[_x,[0,"#(rgb,1,1,1)color(0,0,0,0)"]] remoteExec ["setObjectTexture",0,true]};			


_Vests = selectRandom [
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrier1_blk"
			]; 

_Headgear = selectRandom [
			"H_PASGT_basic_black_F"
			]; 
			
_Goggles = selectRandom [
			"G_Balaclava_TI_G_blk_F"
			]; 
						
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;


comment "Add containers";
_unit forceAddUniform _Uniform;
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom [
			"srifle_EBR_MRCO_pointer_F",
			"srifle_EBR_SOS_F",
			"srifle_EBR_ARCO_pointer_snds_F",
			"srifle_EBR_DMS_F",
			"rifle_EBR_DMS_pointer_snds_F",
			"srifle_GM6_SOS_F",
			"srifle_GM6_LRPS_F",
			"srifle_LRR_SOS_F",
			"srifle_LRR_LRPS_F",
			"LMG_Mk200_MRCO_F",
			"LMG_Zafir_ARCO_F",
			"arifle_Katiba_GL_ARCO_pointer_F",
			"srifle_DMR_01_SOS_F",
			"srifle_DMR_01_DMS_snds_F",
			"hgun_PDW2000_Holo_snds_F",
			"SMG_02_ARCO_pointg_F",
			"arifle_Katiba_ARCO_pointer_F",
			"arifle_Katiba_ARCO_pointer_snds_F"
			];
			
//________________	add _Primary_Weapon's mags	________________

_Primary_Weapon_Magazines = getArray (configFile / "CfgWeapons" / _Primary_Weapon / "magazines");
_Spawn_Primary_Weapon_magazines = selectRandom _Primary_Weapon_Magazines; 
		
comment "Add weapons";
_Unit addWeapon _Primary_Weapon;

for "_i" from 1 to 3 do {_Unit addItemToUniform _Spawn_Primary_Weapon_magazines;};
for "_i" from 1 to 1 do {_Unit addItemToUniform "FirstAidKit";};
for "_i" from 1 to 1 do {_Unit addItemToUniform "HandGrenade";};

for "_i" from 1 to 1 do {_Unit addItemToVest "FirstAidKit";};
for "_i" from 1 to 2 do {_Unit addItemToVest "SmokeShell";};
for "_i" from 1 to 1 do {_Unit addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_Unit addItemToVest "MiniGrenade";};

for "_i" from 1 to 2 do {_Unit addItemToVest _Spawn_Primary_Weapon_magazines;}; 
for "_i" from 1 to 2 do {_Unit addItemToBackpack _Spawn_Primary_Weapon_magazines;};

//________________	reload_Primary_Weapon	________________
_Unit selectweapon primaryWeapon _Unit;
reload _Unit;

comment "Add items";
//	add possibility 
if (floor (random 10) < 4) then {_Unit linkItem "ItemMap";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemCompass";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemWatch";};
if (floor (random 10) < 4) then {_Unit linkItem "ItemGPS";};
			
			};	
		};
	};				
}foreach _Buildings;
};