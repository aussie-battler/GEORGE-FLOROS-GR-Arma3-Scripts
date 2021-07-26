


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
//___________________	Boats	___________________
[] spawn GF_AP_Spawn_Boats_Patrol;
[] spawn GF_AP_Spawn_Boats_Defend;
[] spawn GF_AP_Spawn_Boats_Attack;
*/


//___________________	GF_AP_Spawn_Boats_Patrol	___________________

GF_AP_Spawn_Boats_Patrol = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

GF_AP_Pos_initialized = false;
_Pos = [] call GF_AP_Pos_ShoreLine_Water;
waitUntil {GF_AP_Pos_initialized};
	
if !(_Pos isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;

_Boats = selectRandom GF_AP_Pool_Boats; 
_create_Boats = _Boats createVehicle _Pos;
_create_Boats setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Boats,true] call BIS_fnc_crewCount;

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Boats , _Seats_Number];
};

for "_x" from 1 to _Seats_Number do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry_Divers,_Pos,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _create_Boats;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
};


//________________	addWaypoint	________________

private ["_Wp", "_Wp_Pos"];

_Wp_Number = 4;

for "_i" from 1 to _Wp_Number do {

_Wp_Pos =  [[[_Pos, GF_AP_Patrol_distance_Sea_Vehicles + random GF_AP_Patrol_distance_Sea_Vehicles_random]],["ground"]] call BIS_fnc_randomPos;
	
_Wp = _Group addWaypoint [_Wp_Pos, 0];
_Wp setWaypointType "MOVE";
_Wp setWaypointCompletionRadius GF_AP_Patrol_distance_Sea_Vehicles + random GF_AP_Patrol_distance_Sea_Vehicles_random;
};


//________________	Cycle	________________

_Wp = _Group addWaypoint [_Wp_Pos, 0];
_Wp setWaypointType "CYCLE";

if (GF_AP_DynamicSimulation) then {
_Group enableDynamicSimulation true;
};

};
};
};


//___________________	GF_AP_Spawn_Boats_Defend	___________________

GF_AP_Spawn_Boats_Defend = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

GF_AP_Pos_initialized = false;
_Pos = [] call GF_AP_Pos_ShoreLine_Water;
waitUntil {GF_AP_Pos_initialized};

if !(_Pos isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;

_Boats = selectRandom GF_AP_Pool_Boats; 
_create_Boats = _Boats createVehicle _Pos;
_create_Boats setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Boats,true] call BIS_fnc_crewCount;

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Boats , _Seats_Number];
};

for "_x" from 1 to _Seats_Number do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry_Divers,_Pos,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _create_Boats;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
};

[_Group, _Pos] call BIS_fnc_taskDefend;

if (GF_AP_DynamicSimulation) then {
_Group enableDynamicSimulation true;
};

};
};
};


//___________________	GF_AP_Spawn_Boats_Attack	___________________

GF_AP_Spawn_Boats_Attack = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

GF_AP_Pos_initialized = false;
_Pos = [] call GF_AP_Pos_NameMarine;
waitUntil {GF_AP_Pos_initialized};

if !(_Pos isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;

_Pos_Attack =  [[[_Pos, GF_AP_Attack_Distance]],["ground"]] call BIS_fnc_randomPos;
_Boats = selectRandom GF_AP_Pool_Boats; 
_create_Boats = _Boats createVehicle _Pos_Attack;
_create_Boats setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Boats,true] call BIS_fnc_crewCount;

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Boats , _Seats_Number];
};

for "_x" from 1 to _Seats_Number do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry_Divers,_Pos_Attack,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _create_Boats;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
};

[_Group, _Pos] call BIS_fnc_taskAttack;

if (GF_AP_DynamicSimulation) then {
_Group enableDynamicSimulation true;
};

};
};
};