


//________________	Author : GEORGE FLOROS [GR]	___________	08.03.19	___________


/*
________________	GF Auto Population Zombie Script - Mod	________________

https://forums.bohemia.net/forums/topic/222245-gf-auto-population-zombie-script-mod/

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
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


/*
//___________________	add this to use	___________________
//___________________	Zombie	___________________
[] spawn GF_APZ_Spawn_Zombie_Stalk;
[] spawn GF_APZ_Spawn_Zombie_Patrol;
[] spawn GF_APZ_Garrison_Area_Buildings_Zombie;
*/


//___________________	GF_APZ_Spawn_Zombie_Stalk	___________________

GF_APZ_Spawn_Zombie_Stalk = {

if (count allUnits < GF_APZ_Enemy_Max_Number) then {

_Pos = GF_APZ_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_APZ_Enemy_Side;

_Unit = _Group createunit [selectrandom GF_APZ_Select_Zombies,_Pos_Spawn,[],0,"Can_collide"];
[_Unit] JoinSilent _Group;
(leader _Group) setSkill GF_APZ_set_AiSkill_leader + random GF_APZ_set_AiSkill_leader_random;
_Unit setSkill GF_APZ_set_AiSkill + random GF_APZ_set_AiSkill_random;
_Unit setVariable ["Var_GF_APZ_Spawn",true];

if (GF_APZ_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_ARL_APZ;
};


_Group setBehaviour "AWARE";
_Group setCombatMode "RED";

if (isMultiplayer) then {	
_stalked = selectrandom GF_APZ_allPlayers;
[_Group,group _stalked] spawn BIS_fnc_stalk;
}else{
[_Group,group player] spawn BIS_fnc_stalk;
};

};
};
};


//___________________	GF_APZ_Spawn_Zombie_Patrol	___________________

GF_APZ_Spawn_Zombie_Patrol = {
	
if (count allUnits < GF_APZ_Enemy_Max_Number) then {

_Pos = GF_APZ_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_APZ_Enemy_Side;

_Unit = _Group createunit [selectrandom GF_APZ_Select_Zombies,_Pos_Spawn,[],0,"Can_collide"];
[_Unit] JoinSilent _Group;
(leader _Group) setSkill GF_APZ_set_AiSkill_leader + random GF_APZ_set_AiSkill_leader_random;
_Unit setSkill GF_APZ_set_AiSkill + random GF_APZ_set_AiSkill_random;
_Unit setVariable ["Var_GF_APZ_Spawn",true];	

if (GF_APZ_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_ARL_APZ;
};

[_Group,_Pos,GF_APZ_Patrol_distance_Land + random GF_APZ_Patrol_distance_Land_random] call BIS_fnc_taskPatrol;

if (GF_APZ_DynamicSimulation) then {	
_Group enableDynamicSimulation true;
};

};
};
};


//___________________	GF_APZ_Garrison_Area_Buildings_Zombie	___________________ 

GF_APZ_Garrison_Area_Buildings_Zombie = {

if (count allUnits < GF_APZ_Enemy_Max_Number) then {

_Buildings = nearestObjects [GF_APZ_Pos,["House", "Building"],GF_APZ_Garrison_Area_Distance];

if (typeName _Buildings != "ARRAY") exitWith {};
if (count _Buildings > 0) then {

_Building = selectRandom _Buildings;

if (!(typeOf _Building in GF_APZ_Garrison_Excluded_Buildings)) then {

	_buildingPositions = [_Building] call BIS_fnc_buildingPositions;
	_count = count _buildingPositions;
	
	if (_count > 0) then {
	_buildingpos = selectRandom _buildingPositions;
	_buildingpos = [(_buildingpos select 0) , (_buildingpos select 1) , (_buildingpos select 2)];
	
	if !(_buildingpos isEqualTo [0,0,0]) then {
	_Group = createGroup GF_APZ_Enemy_Side;
	_Unit = _Group createunit [selectrandom GF_APZ_Select_Zombies,_buildingpos,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	//	_Unit disableAI "PATH";
	_Unit setSkill GF_APZ_set_AiSkill + random GF_APZ_set_AiSkill_random;
	_Unit setVariable ["Var_GF_APZ_Spawn",true];	
	
	if (GF_APZ_Auto_Random_Loadout_Enabled) then {	
	_Unit spawn GF_ARL_APZ;
	};

	if (GF_APZ_DynamicSimulation) then {	
	_Group enableDynamicSimulation true;
	};
	
	};
	};
};	
};
};	
};	