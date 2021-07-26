


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
//___________________	Vehicles_Armoured_Transport_	___________________
[] spawn GF_AP_Spawn_Vehicles_Armoured_Stalk;
[] spawn GF_AP_Spawn_Vehicles_Armoured_Patrol;
[] spawn GF_AP_Spawn_Vehicles_Armoured_Defend;
[] spawn GF_AP_Spawn_Vehicles_Armoured_Attack;
*/


//___________________	GF_AP_Spawn_Vehicles_Armoured_Stalk	___________________

GF_AP_Spawn_Vehicles_Armoured_Stalk = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;
_Group_Crew = createGroup GF_AP_Enemy_Side;

_Armoured_Vehicle = selectRandom GF_AP_Pool_Vehicles_Armoured; 
_Spawned_Armoured_Vehicle = _Armoured_Vehicle createVehicle _Pos_Spawn;
_Spawned_Armoured_Vehicle setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Armoured_Vehicle,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Armoured_Vehicle , _Seats_Number];
};


//___________________	 Counts all available seats excluding cargo slots	___________________

_Seats_Number_Crew = [_Armoured_Vehicle,false] call BIS_fnc_crewCount;


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number_Crew do {

	_Unit_Crew = _Group_Crew createunit [selectrandom GF_AP_Pool_Infantry_Crew,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group_Crew;
	_Unit_Crew moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group_Crew) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Crew spawn GF_AP_ARL;
};
	
};


//___________________	 Counts all cargo slots	___________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//___________________	 Spawn units in Cargo	___________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};
	
};

_Group_Crew setBehaviour "AWARE";
_Group_Crew setCombatMode "RED";
_Group setBehaviour "AWARE";
_Group setCombatMode "RED";

if (isMultiplayer) then {	
_stalked = selectrandom GF_AP_allPlayers;
[_Group_Crew,group _stalked] spawn BIS_fnc_stalk;
[_Group,group _stalked] spawn BIS_fnc_stalk;

}else{

[_Group_Crew,group player] spawn BIS_fnc_stalk;
[_Group,group player] spawn BIS_fnc_stalk;
};

};
};
};


//___________________	GF_AP_Spawn_Vehicles_Armoured_Patrol	___________________

GF_AP_Spawn_Vehicles_Armoured_Patrol = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;
_Group_Crew = createGroup GF_AP_Enemy_Side;

_Armoured_Vehicle = selectRandom GF_AP_Pool_Vehicles_Armoured; 
_Spawned_Armoured_Vehicle = _Armoured_Vehicle createVehicle _Pos_Spawn;
_Spawned_Armoured_Vehicle setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Armoured_Vehicle,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Armoured_Vehicle , _Seats_Number];
};


//___________________	 Counts all available seats excluding cargo slots	___________________

_Seats_Number_Crew = [_Armoured_Vehicle,false] call BIS_fnc_crewCount;


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number_Crew do {

	_Unit_Crew = _Group_Crew createunit [selectrandom GF_AP_Pool_Infantry_Crew,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group_Crew;
	_Unit_Crew moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group_Crew) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Crew spawn GF_AP_ARL;
};
	
};


//___________________	 Counts all cargo slots	___________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//___________________	 Spawn units in Cargo	___________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};
	
};

[_Group_Crew,_Pos,GF_AP_Patrol_distance_Land_Vehicles + floor random GF_AP_Patrol_distance_Land_Vehicles_random] call BIS_fnc_taskPatrol;
[_Group,_Pos,GF_AP_Patrol_distance_Land_Vehicles + floor random GF_AP_Patrol_distance_Land_Vehicles_random] call BIS_fnc_taskPatrol;

if (GF_AP_DynamicSimulation) then {	
_Group_Crew enableDynamicSimulation true;
_Group enableDynamicSimulation true;
};

};
};
};


//___________________	GF_AP_Spawn_Vehicles_Armoured_Defend	___________________

GF_AP_Spawn_Vehicles_Armoured_Defend = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;
_Group_Crew = createGroup GF_AP_Enemy_Side;

_Armoured_Vehicle = selectRandom GF_AP_Pool_Vehicles_Armoured; 
_Spawned_Armoured_Vehicle = _Armoured_Vehicle createVehicle _Pos_Spawn;
_Spawned_Armoured_Vehicle setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Armoured_Vehicle,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Armoured_Vehicle , _Seats_Number];
};


//___________________	 Counts all available seats excluding cargo slots	___________________

_Seats_Number_Crew = [_Armoured_Vehicle,false] call BIS_fnc_crewCount;


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number_Crew do {

	_Unit_Crew = _Group_Crew createunit [selectrandom GF_AP_Pool_Infantry_Crew,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group_Crew;
	_Unit_Crew moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group_Crew) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Crew spawn GF_AP_ARL;
};
	
};


//___________________	 Counts all cargo slots	___________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//___________________	 Spawn units in Cargo	___________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};
	
};

[_Group_Crew, _Pos] call BIS_fnc_taskDefend;
[_Group, _Pos] call BIS_fnc_taskDefend;

if (GF_AP_DynamicSimulation) then {	
_Group_Crew enableDynamicSimulation true;
_Group enableDynamicSimulation true;
};

};
};
};


//___________________	GF_AP_Spawn_Vehicles_Armoured_Attack	___________________

GF_AP_Spawn_Vehicles_Armoured_Attack = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, GF_AP_Attack_Distance]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;
_Group_Crew = createGroup GF_AP_Enemy_Side;

_Armoured_Vehicle = selectRandom GF_AP_Pool_Vehicles_Armoured; 
_Spawned_Armoured_Vehicle = _Armoured_Vehicle createVehicle _Pos_Spawn;
_Spawned_Armoured_Vehicle setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Armoured_Vehicle,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Armoured_Vehicle , _Seats_Number];
};


//___________________	 Counts all available seats excluding cargo slots	___________________

_Seats_Number_Crew = [_Armoured_Vehicle,false] call BIS_fnc_crewCount;


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number_Crew do {

	_Unit_Crew = _Group_Crew createunit [selectrandom GF_AP_Pool_Infantry_Crew,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group_Crew;
	_Unit_Crew moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group_Crew) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Crew spawn GF_AP_ARL;
};
	
};


//___________________	 Counts all cargo slots	___________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//___________________	 Spawn units in Cargo	___________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};
	
};

[_Group_Crew, _Pos] call BIS_fnc_taskAttack;
[_Group, _Pos] call BIS_fnc_taskAttack;

if (GF_AP_DynamicSimulation) then {
_Group_Crew enableDynamicSimulation true;
_Group enableDynamicSimulation true;
};

};
};
};