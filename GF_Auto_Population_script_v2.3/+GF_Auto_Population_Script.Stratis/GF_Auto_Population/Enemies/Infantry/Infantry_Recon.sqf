


//________________	Author : GEORGE FLOROS [GR]	___________	08.03.19	___________


/*
________________	GF Auto Population Script - Mod	________________

https://forums.bohemia.net/forums/topic/221987-gf-auto-population-script-mod/

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

For the Compilation List of my GF Scripts - Mods , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


/*
//___________________	add this to use	___________________
//___________________	Infantry_Recon	___________________
[] spawn GF_AP_Spawn_Infantry_Recon_Stalk
[] spawn GF_AP_Spawn_Infantry_Recon_Patrol;
[] spawn GF_AP_Spawn_Infantry_Recon_Defend;
[] spawn GF_AP_Spawn_Infantry_Recon_Attack;
[] spawn GF_AP_Garrison_Area_Buildings_Infantry_Recon;
*/


//___________________	GF_AP_Spawn_Infantry_Recon_Stalk	___________________

GF_AP_Spawn_Infantry_Recon_Stalk = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;

for "_x" from 0 to (GF_AP_Squad_Members + random GF_AP_Squad_Members_random) do {

_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry_Recon,_Pos_Spawn,[],0,"Can_collide"];
[_Unit] JoinSilent _Group;
(leader _Group) setSkill GF_AP_set_AiSkill_leader + random GF_AP_set_AiSkill_leader_random;
_Unit setSkill GF_AP_set_AiSkill + random GF_AP_set_AiSkill_random;

if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};
_Unit setVariable ["Var_GF_AP_Spawn",true];
};	

_Group setBehaviour "AWARE";
_Group setCombatMode "RED";

if (isMultiplayer) then {	
_stalked = selectrandom GF_AP_allPlayers;
[_Group,group _stalked] spawn BIS_fnc_stalk;
}else{
[_Group,group player] spawn BIS_fnc_stalk;
};

};
};
};


//___________________	GF_AP_Spawn_Infantry_Recon_Patrol	___________________

GF_AP_Spawn_Infantry_Recon_Patrol = {
	
if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;

for "_x" from 0 to (GF_AP_Squad_Members + random GF_AP_Squad_Members_random) do {

_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry_Recon,_Pos_Spawn,[],0,"Can_collide"];
[_Unit] JoinSilent _Group;
(leader _Group) setSkill GF_AP_set_AiSkill_leader + random GF_AP_set_AiSkill_leader_random;
_Unit setSkill GF_AP_set_AiSkill + random GF_AP_set_AiSkill_random;

if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};

_Unit setVariable ["Var_GF_AP_Spawn",true];	
};
[_Group,_Pos,GF_AP_Patrol_distance_Land + random GF_AP_Patrol_distance_Land_random] call BIS_fnc_taskPatrol;

if (GF_AP_DynamicSimulation) then {	
_Group enableDynamicSimulation true;
};

};
};
};


//___________________	GF_AP_Spawn_Infantry_Recon_Defend	___________________	

GF_AP_Spawn_Infantry_Recon_Defend = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;

for "_x" from 0 to (GF_AP_Squad_Members + random GF_AP_Squad_Members_random) do {

_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry_Recon,_Pos_Spawn,[],0,"Can_collide"];
[_Unit] JoinSilent _Group;
(leader _Group) setSkill GF_AP_set_AiSkill_leader + random GF_AP_set_AiSkill_leader_random;
_Unit setSkill GF_AP_set_AiSkill + random GF_AP_set_AiSkill_random;

if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};
_Unit setVariable ["Var_GF_AP_Spawn",true];
};
[_Group, _Pos] call BIS_fnc_taskDefend;

if (GF_AP_DynamicSimulation) then {	
_Group enableDynamicSimulation true;
};

};
};
};


//___________________	GF_AP_Spawn_Infantry_Recon_Attack	___________________

GF_AP_Spawn_Infantry_Recon_Attack = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, GF_AP_Attack_Distance]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;

for "_x" from 0 to (GF_AP_Squad_Members + random GF_AP_Squad_Members_random) do {

_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry_Recon,_Pos_Spawn,[],0,"Can_collide"];
[_Unit] JoinSilent _Group;
(leader _Group) setSkill GF_AP_set_AiSkill_leader + random GF_AP_set_AiSkill_leader_random;
_Unit setSkill GF_AP_set_AiSkill + random GF_AP_set_AiSkill_random;

if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};
_Unit setVariable ["Var_GF_AP_Spawn",true];
};
[_Group, _Pos] call BIS_fnc_taskAttack;

if (GF_AP_DynamicSimulation) then {	
_Group enableDynamicSimulation true;
};

};
};
};


//___________________	GF_AP_Garrison_Area_Buildings_Infantry_Recon	___________________ 

GF_AP_Garrison_Area_Buildings_Infantry_Recon = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Buildings = nearestObjects [GF_AP_Pos,["House", "Building"],GF_AP_Garrison_Area_Distance];

if (typeName _Buildings != "ARRAY") exitWith {};
if (count _Buildings > 0) then {

_Building = selectRandom _Buildings;

if (!(typeOf _Building in GF_AP_Garrison_Excluded_Buildings)) then {

	_buildingPositions = [_Building] call BIS_fnc_buildingPositions;
	_count = count _buildingPositions;
	
	if (_count > 0) then {
	_buildingpos = selectRandom _buildingPositions;
	
	if !(_buildingpos isEqualTo [0,0,0]) then {
	_Group = createGroup GF_AP_Enemy_Side;
	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry_Recon,_buildingpos,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	// _Unit disableAI "PATH";
	_Unit setSkill GF_AP_set_AiSkill + random GF_AP_set_AiSkill_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];	
	
	if (GF_AP_DynamicSimulation) then {	
	_Group enableDynamicSimulation true;
	};

	};
	};	
};	
};
};	
};	