


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
//________________	Infantry_Police_Playerside	________________
[] spawn GF_Missions_Spawn_Infantry_Police_Playerside_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Police_Playerside_Defend;
[] spawn GF_Missions_Spawn_Infantry_Police_Playerside_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Police_Playerside;		//	add the name of the building ex : [_Building] spawn GF_Missions_Garrison_The_Building_Infantry_Police_Playerside;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Police_Playerside;
*/


//________________	GF_Missions_Spawn_Infantry_Police_Playerside_Patrol	________________

GF_Missions_Spawn_Infantry_Police_Playerside_Patrol = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 250]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup playerside;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;


_Vests = selectRandom [
			"V_TacVestIR_blk",
			"V_TacVest_blk_POLICE",
			""
			]; 

_Headgear = selectRandom [
			"H_Cap_police",
			"H_Beret_blk_POLICE",
			""
			]; 
			
_Goggles = selectRandom [
			"G_Shades_Black",
			"G_Squares_Tinted",
			"G_Aviator",
			"G_Sport_Blackred",
			""
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
_unit forceAddUniform "U_Marshal";
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;
_unit addWeapon _weapons;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom GF_SCL_GF_Missions_primaryWeapon_array;

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

//________________	GF_Missions_addaction_Join_Disband_Officer	________________

_Unit spawn GF_Missions_addaction_Join_Disband_Officer;

};
[_Group,_Pos,GF_Missions_BIS_fnc_taskPatrol_distance] call BIS_fnc_taskPatrol;
};


//________________	GF_Missions_Spawn_Infantry_Police_Playerside_Defend	________________	

GF_Missions_Spawn_Infantry_Police_Playerside_Defend = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 100]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup playerside;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;


_Vests = selectRandom [
			"V_TacVestIR_blk",
			"V_TacVest_blk_POLICE",
			""
			]; 

_Headgear = selectRandom [
			"H_Cap_police",
			"H_Beret_blk_POLICE",
			""
			]; 
			
_Goggles = selectRandom [
			"G_Shades_Black",
			"G_Squares_Tinted",
			"G_Aviator",
			"G_Sport_Blackred",
			""
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
_unit forceAddUniform "U_Marshal";
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;
_unit addWeapon _weapons;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom GF_SCL_GF_Missions_primaryWeapon_array;

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

//________________	GF_Missions_addaction_Join_Disband_Officer	________________

_Unit spawn GF_Missions_addaction_Join_Disband_Officer;

};
[_Group, _Pos] call BIS_fnc_taskDefend;

};


//________________	GF_Missions_Spawn_Infantry_Police_Playerside_Attack	________________

GF_Missions_Spawn_Infantry_Police_Playerside_Attack = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, GF_Missions_Attack_Distance]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup playerside;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;


_Vests = selectRandom [
			"V_TacVestIR_blk",
			"V_TacVest_blk_POLICE",
			""
			]; 

_Headgear = selectRandom [
			"H_Cap_police",
			"H_Beret_blk_POLICE",
			""
			]; 
			
_Goggles = selectRandom [
			"G_Shades_Black",
			"G_Squares_Tinted",
			"G_Aviator",
			"G_Sport_Blackred",
			""
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
_unit forceAddUniform "U_Marshal";
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;
_unit addWeapon _weapons;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom GF_SCL_GF_Missions_primaryWeapon_array;

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

//________________	GF_Missions_addaction_Join_Disband_Officer	________________

_Unit spawn GF_Missions_addaction_Join_Disband_Officer;

};
[_Group, _Pos] call BIS_fnc_taskAttack;

};


//________________	GF_Missions_Garrison_The_Building_Infantry_Police_Playerside	________________ 

GF_Missions_Garrison_The_Building_Infantry_Police_Playerside = {

_building = _this select 0;

_buildingPositions = [_building] call BIS_fnc_buildingPositions;
_count = count _buildingPositions;
_round = _count / 3;
_round_count = round _round;
_Positions = _round_count;

//	hint format ["%1",_count];
//	hint format ["%1",_Positions];

if (_count > 0) then {

_Group = createGroup playerside;
for "_x" from 0 to (_Positions) do {

_Pos_Spawn = selectRandom _buildingPositions;

_Unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_Pos_Spawn,[],0,"None"];
[_Unit] JoinSilent _Group;
_Unit disableAI "PATH";


_Vests = selectRandom [
			"V_TacVestIR_blk",
			"V_TacVest_blk_POLICE",
			""
			]; 

_Headgear = selectRandom [
			"H_Cap_police",
			"H_Beret_blk_POLICE",
			""
			]; 
			
_Goggles = selectRandom [
			"G_Shades_Black",
			"G_Squares_Tinted",
			"G_Aviator",
			"G_Sport_Blackred",
			""
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
_unit forceAddUniform "U_Marshal";
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;
_unit addWeapon _weapons;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom GF_SCL_GF_Missions_primaryWeapon_array;

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

//________________	GF_Missions_addaction_Join_Disband_Officer	________________

_Unit spawn GF_Missions_addaction_Join_Disband_Officer;

};
};
};


//________________	GF_Missions_Garrison_Area_Buildings_Infantry_Police_Playerside	________________ 

GF_Missions_Garrison_Area_Buildings_Infantry_Police_Playerside = {

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
	
	_Group = createGroup playerside;
	_Unit = _Group createunit [GF_Missions_Pool_Infantry_Police select floor(random count GF_Missions_Pool_Infantry_Police),_buildingpos,[],0,"None"];
	[_Unit] JoinSilent _Group;
	_Unit disableAI "PATH";
	

_Vests = selectRandom [
			"V_TacVestIR_blk",
			"V_TacVest_blk_POLICE",
			""
			]; 

_Headgear = selectRandom [
			"H_Cap_police",
			"H_Beret_blk_POLICE",
			""
			]; 
			
_Goggles = selectRandom [
			"G_Shades_Black",
			"G_Squares_Tinted",
			"G_Aviator",
			"G_Sport_Blackred",
			""
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
_unit forceAddUniform "U_Marshal";
_unit addHeadgear _Headgear;
_unit addGoggles _Goggles;
_unit addVest _Vests;
_unit addWeapon _weapons;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};




//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom GF_SCL_GF_Missions_primaryWeapon_array;

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
	
//________________	GF_Missions_addaction_Join_Disband_Officer	________________

_Unit spawn GF_Missions_addaction_Join_Disband_Officer;
	
			};	
		};
	};				
}foreach _Buildings;
};