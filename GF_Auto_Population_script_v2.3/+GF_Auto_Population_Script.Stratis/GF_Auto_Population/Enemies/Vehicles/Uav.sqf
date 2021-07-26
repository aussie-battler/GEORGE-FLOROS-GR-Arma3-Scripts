


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
//___________________	Uav	___________________
[] spawn GF_AP_Spawn_Uav_Stalk;
[] spawn GF_AP_Spawn_Uav_Patrol;
[] spawn GF_AP_Spawn_Uav_Defend;
[] spawn GF_AP_Spawn_Uav_Attack;
*/


//___________________	GF_AP_Spawn_Uav_Stalk	___________________

GF_AP_Spawn_Uav_Stalk = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn = _Pos getPos [250,random 360];

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Spawn_Height = 2000;
_Group = createGroup GF_AP_Enemy_Side;

_Uav = selectRandom GF_AP_Pool_Uav; 
_Spawned_Uav = createVehicle [_Uav,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Uav setPosATL [getPosATL _Spawned_Uav select 0, getPosATL _Spawned_Uav select 1, _Spawn_Height];
_Spawned_Uav engineOn true;
_Spawned_Uav setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Uav,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Uav , _Seats_Number];
};


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number do {

	_Unit_Crew = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group;
	_Unit_Crew moveInAny _Spawned_Uav;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;	
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


//___________________	GF_AP_Spawn_Uav_Patrol	___________________

GF_AP_Spawn_Uav_Patrol = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn = _Pos getPos [250,random 360];

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Spawn_Height = 2000;
_Group = createGroup GF_AP_Enemy_Side;

_Uav = selectRandom GF_AP_Pool_Uav; 
_Spawned_Uav = createVehicle [_Uav,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Uav setPosATL [getPosATL _Spawned_Uav select 0, getPosATL _Spawned_Uav select 1, _Spawn_Height];
_Spawned_Uav engineOn true;
_Spawned_Uav setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Uav,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Uav , _Seats_Number];
};


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number do {

	_Unit_Crew = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group;
	_Unit_Crew moveInAny _Spawned_Uav;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;	
};


[_Group,_Pos,GF_AP_Patrol_distance_Air_Vehicles + floor random GF_AP_Patrol_distance_Air_Vehicles_random] call BIS_fnc_taskPatrol;

_Group setBehaviour "AWARE";
_Group setCombatMode "RED";

if (GF_AP_DynamicSimulation) then {	
_Group enableDynamicSimulation true;
};

while {(alive _Spawned_Uav)} do {
	_Spawned_Uav flyInHeight (300 + (random 3000));
	_getPosATL = getPosATL _Spawned_Uav;
	_nearEntities = _getPosATL nearEntities 3000;
	{_Group reveal [_x,4];} count _nearEntities;
	uisleep 50;
	};
	};
};
};


//___________________	GF_AP_Spawn_Uav_Defend	___________________

GF_AP_Spawn_Uav_Defend = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn = _Pos getPos [250,random 360];

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Spawn_Height = 2000;
_Group = createGroup GF_AP_Enemy_Side;

_Uav = selectRandom GF_AP_Pool_Uav; 
_Spawned_Uav = createVehicle [_Uav,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Uav setPosATL [getPosATL _Spawned_Uav select 0, getPosATL _Spawned_Uav select 1, _Spawn_Height];
_Spawned_Uav engineOn true;
_Spawned_Uav setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Uav,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Uav , _Seats_Number];
};


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number do {

	_Unit_Crew = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group;
	_Unit_Crew moveInAny _Spawned_Uav;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
	removeBackpack _Unit_Crew;
	_Unit_Crew addBackPack "B_parachute";
	
};


[_Group, _Pos] call BIS_fnc_taskDefend;

_Group setBehaviour "AWARE";
_Group setCombatMode "RED";

if (GF_AP_DynamicSimulation) then {	
_Group enableDynamicSimulation true;
};

while {(alive _Spawned_Uav)} do {
	_Spawned_Uav flyInHeight (300 + (random 3000));
	_getPosATL = getPosATL _Spawned_Uav;
	_nearEntities = _getPosATL nearEntities 3000;
	{_Group reveal [_x,4];} count _nearEntities;
	uisleep 50;
	};
	};
};
};


//___________________	GF_AP_Spawn_Uav_Attack	___________________

GF_AP_Spawn_Uav_Attack = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn = _Pos getPos [GF_AP_Attack_Distance,random 360];

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Spawn_Height = 2000;
_Group = createGroup GF_AP_Enemy_Side;

_Uav = selectRandom GF_AP_Pool_Uav; 
_Spawned_Uav = createVehicle [_Uav,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Uav setPosATL [getPosATL _Spawned_Uav select 0, getPosATL _Spawned_Uav select 1, _Spawn_Height];
_Spawned_Uav engineOn true;
_Spawned_Uav setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Uav,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Uav , _Seats_Number];
};


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number do {

	_Unit_Crew = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group;
	_Unit_Crew moveInAny _Spawned_Uav;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
	removeBackpack _Unit_Crew;
	_Unit_Crew addBackPack "B_parachute";
	
};


[_Group, _Pos] call BIS_fnc_taskAttack;

_Group setBehaviour "AWARE";
_Group setCombatMode "RED";

if (GF_AP_DynamicSimulation) then {	
_Group enableDynamicSimulation true;
};

while {(alive _Spawned_Uav)} do {
	_Spawned_Uav flyInHeight (300 + (random 3000));
	_getPosATL = getPosATL _Spawned_Uav;
	_nearEntities = _getPosATL nearEntities 3000;
	{_Group reveal [_x,4];} count _nearEntities;
	uisleep 50;
	};
	};
};
};