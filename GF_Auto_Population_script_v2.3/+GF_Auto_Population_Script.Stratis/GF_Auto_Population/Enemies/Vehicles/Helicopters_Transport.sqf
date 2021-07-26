


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
//___________________	Helicopters_Transport_	___________________
[] spawn GF_AP_Spawn_Helicopters_Transport_Stalk;
[] spawn GF_AP_Spawn_Helicopters_Transport_Patrol;
[] spawn GF_AP_Spawn_Helicopters_Transport_Defend;
[] spawn GF_AP_Spawn_Helicopters_Transport_Attack;
*/


//___________________	GF_AP_Spawn_Helicopters_Transport_Stalk	___________________

GF_AP_Spawn_Helicopters_Transport_Stalk = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn = _Pos getPos [GF_AP_Attack_Distance,random 360];

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Spawn_Height = 1000;
_Group = createGroup GF_AP_Enemy_Side;
_Group_Crew = createGroup GF_AP_Enemy_Side;

_Helicopter = selectRandom GF_AP_Pool_Helicopters_Transport; 
_Spawned_Helicopter = createVehicle [_Helicopter,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Helicopter setPosATL [getPosATL _Spawned_Helicopter select 0, getPosATL _Spawned_Helicopter select 1, _Spawn_Height];
_Spawned_Helicopter engineOn true;
_Spawned_Helicopter setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Helicopter,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Helicopter , _Seats_Number];
};


//___________________	 Counts all available seats excluding cargo slots	___________________

_Seats_Number_Crew = [_Helicopter,false] call BIS_fnc_crewCount;


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number_Crew do {

	_Unit_Crew = _Group_Crew createunit [selectrandom GF_AP_Pool_Infantry_Helicopters,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group_Crew;
	_Unit_Crew moveInAny _Spawned_Helicopter;
	(leader _Group_Crew) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Crew spawn GF_AP_ARL;
};

	removeBackpack _Unit_Crew;
	_Unit_Crew addBackPack "B_parachute";
	
};


//___________________	 Counts all cargo slots	___________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//___________________	 Spawn units in Cargo	___________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _Spawned_Helicopter;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};

	private _data = [backpack _Unit,backpackitems _Unit];
    removeBackpack _Unit;
	_Unit addBackPack "B_parachute";	
	
	[_Unit,_data] spawn {
	private ["_Unit","_data"];
	_Unit = _this select 0;
	_data = _this select 1;
	waitUntil {uisleep 1; isTouchingGround _Unit || (position _Unit select 2) < 1 };
	uisleep 1;
	removeBackpack _Unit;
	_Unit addbackpack (_data select 0);
	{_Unit additemtobackpack _x;} foreach (_data select 1);
	};
	
};

_Group_Crew setBehaviour "AWARE";
_Group_Crew setCombatMode "RED";
_Group setBehaviour "AWARE";
_Group setCombatMode "RED";

if (isMultiplayer) then {	
_stalked = selectrandom GF_AP_allPlayers;
[_Group_Crew,group _stalked,10,nil,{true} ,0] spawn BIS_fnc_stalk;
[_Group,group _stalked] spawn BIS_fnc_stalk;

}else{

[_Group_Crew,group player,10,nil,{true} ,0] spawn BIS_fnc_stalk;
[_Group,group player] spawn BIS_fnc_stalk;
};


if (isMultiplayer) then {
waitUntil {uisleep 1;{_x distance2D _Spawned_Helicopter < 600}count playableUnits > 0};
}else{
waitUntil {uisleep 1; _Spawned_Helicopter distance player < 600};
};

{	
unassignvehicle _x;
_x action ["Eject", vehicle _x];
}foreach units _Group;


//___________________	 addwaypoint	___________________

_Pos = getpos _Spawned_Helicopter;
_random_Wp = _Pos getPos [3500,random 360];

_Wp = _Group_Crew addwaypoint [(_random_Wp),0];
_Wp setWaypointType "MOVE"; 
_Wp setWaypointSpeed "FULL";
_Wp setWaypointBehaviour "AWARE";
_Wp setWaypointCombatMode "RED";

//___________________	 Delete	___________________

waitUntil {uisleep 1; _Spawned_Helicopter distance2D _Pos > 3000 };
deleteVehicle _Spawned_Helicopter;
{deleteVehicle _x} forEach units _Group_Crew;
};
};
};


//___________________	GF_AP_Spawn_Helicopters_Transport_Patrol	___________________

GF_AP_Spawn_Helicopters_Transport_Patrol = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn = _Pos getPos [250,random 360];

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Spawn_Height = 1000;
_Group = createGroup GF_AP_Enemy_Side;
_Group_Crew = createGroup GF_AP_Enemy_Side;

_Helicopter = selectRandom GF_AP_Pool_Helicopters_Transport; 
_Spawned_Helicopter = createVehicle [_Helicopter,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Helicopter setPosATL [getPosATL _Spawned_Helicopter select 0, getPosATL _Spawned_Helicopter select 1, _Spawn_Height];
_Spawned_Helicopter engineOn true;
_Spawned_Helicopter setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Helicopter,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Helicopter , _Seats_Number];
};


//___________________	 Counts all available seats excluding cargo slots	___________________

_Seats_Number_Crew = [_Helicopter,false] call BIS_fnc_crewCount;


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number_Crew do {

	_Unit_Crew = _Group_Crew createunit [selectrandom GF_AP_Pool_Infantry_Helicopters,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group_Crew;
	_Unit_Crew moveInAny _Spawned_Helicopter;
	(leader _Group_Crew) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Crew spawn GF_AP_ARL;
};

	removeBackpack _Unit_Crew;
	_Unit_Crew addBackPack "B_parachute";
	
};


//___________________	 Counts all cargo slots	___________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//___________________	 Spawn units in Cargo	___________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _Spawned_Helicopter;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};

	private _data = [backpack _Unit,backpackitems _Unit];
    removeBackpack _Unit;
	_Unit addBackPack "B_parachute";	
	
	[_Unit,_data] spawn {
	private ["_Unit","_data"];
	_Unit = _this select 0;
	_data = _this select 1;
	waitUntil {uisleep 1; isTouchingGround _Unit || (position _Unit select 2) < 1 };
	uisleep 1;
	removeBackpack _Unit;
	_Unit addbackpack (_data select 0);
	{_Unit additemtobackpack _x;} foreach (_data select 1);
	};
	
};

[_Group_Crew,_Pos,GF_AP_Patrol_distance_Air_Vehicles + floor random GF_AP_Patrol_distance_Air_Vehicles_random] call BIS_fnc_taskPatrol;
[_Group,_Pos,GF_AP_Patrol_distance_Air_Vehicles + floor random GF_AP_Patrol_distance_Air_Vehicles_random] call BIS_fnc_taskPatrol;

if (GF_AP_DynamicSimulation) then {	
_Group_Crew enableDynamicSimulation true;
_Group enableDynamicSimulation true;
};

while {(alive _Spawned_Helicopter)} do {
	_Spawned_Helicopter flyInHeight (50 + (random 2000));
	_getPosATL = getPosATL _Spawned_Helicopter;
	_nearEntities = _getPosATL nearEntities 2000;
	{_Group_Crew reveal [_x,4];} count _nearEntities;
	uisleep 50;
	};
};
};
};


//___________________	GF_AP_Spawn_Helicopters_Transport_Defend	___________________

GF_AP_Spawn_Helicopters_Transport_Defend = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn = _Pos getPos [250,random 360];

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Spawn_Height = 1000;
_Group = createGroup GF_AP_Enemy_Side;
_Group_Crew = createGroup GF_AP_Enemy_Side;

_Helicopter = selectRandom GF_AP_Pool_Helicopters_Transport; 
_Spawned_Helicopter = createVehicle [_Helicopter,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Helicopter setPosATL [getPosATL _Spawned_Helicopter select 0, getPosATL _Spawned_Helicopter select 1, _Spawn_Height];
_Spawned_Helicopter engineOn true;
_Spawned_Helicopter setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Helicopter,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Helicopter , _Seats_Number];
};


//___________________	 Counts all available seats excluding cargo slots	___________________

_Seats_Number_Crew = [_Helicopter,false] call BIS_fnc_crewCount;


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number_Crew do {

	_Unit_Crew = _Group_Crew createunit [selectrandom GF_AP_Pool_Infantry_Helicopters,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group_Crew;
	_Unit_Crew moveInAny _Spawned_Helicopter;
	(leader _Group_Crew) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Crew spawn GF_AP_ARL;
};

	removeBackpack _Unit_Crew;
	_Unit_Crew addBackPack "B_parachute";
	
};


//___________________	 Counts all cargo slots	___________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//___________________	 Spawn units in Cargo	___________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _Spawned_Helicopter;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};

	private _data = [backpack _Unit,backpackitems _Unit];
    removeBackpack _Unit;
	_Unit addBackPack "B_parachute";	
	
	[_Unit,_data] spawn {
	private ["_Unit","_data"];
	_Unit = _this select 0;
	_data = _this select 1;
	waitUntil {uisleep 1; isTouchingGround _Unit || (position _Unit select 2) < 1 };
	uisleep 1;
	removeBackpack _Unit;
	_Unit addbackpack (_data select 0);
	{_Unit additemtobackpack _x;} foreach (_data select 1);
	};
	
};

[_Group_Crew, _Pos] call BIS_fnc_taskDefend;
[_Group, _Pos] call BIS_fnc_taskDefend;

if (GF_AP_DynamicSimulation) then {	
_Group_Crew enableDynamicSimulation true;
_Group enableDynamicSimulation true;
};

while {(alive _Spawned_Helicopter)} do {
	_Spawned_Helicopter flyInHeight (50 + (random 2000));
	_getPosATL = getPosATL _Spawned_Helicopter;
	_nearEntities = _getPosATL nearEntities 2000;
	{_Group_Crew reveal [_x,4];} count _nearEntities;
	uisleep 50;
	};
};
};
};


//___________________	GF_AP_Spawn_Helicopters_Transport_Attack	___________________

GF_AP_Spawn_Helicopters_Transport_Attack = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn = _Pos getPos [GF_AP_Attack_Distance,random 360];

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Spawn_Height = 1000;
_Group = createGroup GF_AP_Enemy_Side;
_Group_Crew = createGroup GF_AP_Enemy_Side;

_Helicopter = selectRandom GF_AP_Pool_Helicopters_Transport; 
_Spawned_Helicopter = createVehicle [_Helicopter,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Helicopter setPosATL [getPosATL _Spawned_Helicopter select 0, getPosATL _Spawned_Helicopter select 1, _Spawn_Height];
_Spawned_Helicopter engineOn true;
_Spawned_Helicopter setVariable ["Var_GF_AP_Spawn",true];


//___________________	Count all available seats including cargo slots	___________________

_Seats_Number = [_Helicopter,true] call BIS_fnc_crewCount;	

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Helicopter , _Seats_Number];
};


//___________________	 Counts all available seats excluding cargo slots	___________________

_Seats_Number_Crew = [_Helicopter,false] call BIS_fnc_crewCount;


//___________________	 Spawn Crew	___________________

for "_x" from 1 to _Seats_Number_Crew do {

	_Unit_Crew = _Group_Crew createunit [selectrandom GF_AP_Pool_Infantry_Helicopters,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit_Crew] JoinSilent _Group_Crew;
	_Unit_Crew moveInAny _Spawned_Helicopter;
	(leader _Group_Crew) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit_Crew setVariable ["Var_GF_AP_Spawn",true];
	_Unit_Crew setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Crew spawn GF_AP_ARL;
};

	removeBackpack _Unit_Crew;
	_Unit_Crew addBackPack "B_parachute";
	
};


//___________________	 Counts all cargo slots	___________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//___________________	 Spawn units in Cargo	___________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _Spawned_Helicopter;
	(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};

	private _data = [backpack _Unit,backpackitems _Unit];
    removeBackpack _Unit;
	_Unit addBackPack "B_parachute";	
	
	[_Unit,_data] spawn {
	private ["_Unit","_data"];
	_Unit = _this select 0;
	_data = _this select 1;
	waitUntil {uisleep 1; isTouchingGround _Unit || (position _Unit select 2) < 1 };
	uisleep 1;
	removeBackpack _Unit;
	_Unit addbackpack (_data select 0);
	{_Unit additemtobackpack _x;} foreach (_data select 1);
	};
	
};

[_Group, _Pos] call BIS_fnc_taskAttack;
[_Group_Crew, _Pos] call BIS_fnc_taskAttack;

if (GF_AP_DynamicSimulation) then {	
_Group_Crew enableDynamicSimulation true;
_Group enableDynamicSimulation true;
};

};
};
};