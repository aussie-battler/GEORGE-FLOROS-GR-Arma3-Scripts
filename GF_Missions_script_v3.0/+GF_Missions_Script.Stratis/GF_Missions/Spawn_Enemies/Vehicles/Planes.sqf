


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
//________________	Helicopters_Transport_	________________
[] spawn GF_Missions_Spawn_Planes_Patrol;
[] spawn GF_Missions_Spawn_Planes_Defend;
[] spawn GF_Missions_Spawn_Planes_Attack;
*/


//________________	GF_Missions_Spawn_Planes_Patrol	________________

GF_Missions_Spawn_Planes_Patrol = {

_Pos = GF_Missions_pos;
_Pos_Spawn = _Pos getPos [250,random 360];
_Spawn_Height = 2000;
_Group = createGroup GF_Missions_Enemy_Side;
_Group_Crew = createGroup GF_Missions_Enemy_Side;

_Plane = selectRandom GF_Missions_Pool_Planes; 
_Spawned_Plane = createVehicle [_Plane,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Plane setPosATL [getPosATL _Spawned_Plane select 0, getPosATL _Spawned_Plane select 1, _Spawn_Height];
_Spawned_Plane engineOn true;


//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Plane,true] call BIS_fnc_crewCount;	

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Plane , _Seats_Number];
};


//________________	 Counts all available seats excluding cargo slots	________________

_Seats_Number_Crew = [_Plane,false] call BIS_fnc_crewCount;


//________________	 Spawn Crew	________________

for "_x" from 1 to _Seats_Number_Crew do {

	_unit_Crew = _Group_Crew createunit [GF_Missions_Pool_Infantry_Planes select floor(random count GF_Missions_Pool_Infantry_Planes),_Pos_Spawn,[],0,"None"];
	[_unit_Crew] JoinSilent _Group_Crew;
	_unit_Crew moveInAny _Spawned_Plane;
	(leader _Group_Crew) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit_Crew spawn GF_SCL_GF_Missions;
};

	removeBackpack _unit_Crew;
	_unit_Crew addBackPack "B_parachute";
	
};


//________________	 Counts all cargo slots	________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//________________	 Spawn units in Cargo	________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry select floor(random count GF_Missions_Pool_Infantry),_Pos_Spawn,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _Spawned_Plane;
	(leader _Group) setSkill GF_Missions_set_AiSkill;
			
if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};

	private _data = [backpack _unit,backpackitems _unit];
    removeBackpack _unit;
	_unit addBackPack "B_parachute";	
		  
	[_unit,_data] spawn {
	private ["_unit","_data"];
	_unit = _this select 0;
	_data = _this select 1;
	waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
	sleep 1;
	removeBackpack _unit;
	_unit addbackpack (_data select 0);
	{_unit additemtobackpack _x;} foreach (_data select 1);
	};
	
};


[_Group_Crew,_Pos,GF_Missions_Air_Patrol_distance] call BIS_fnc_taskPatrol;
[_Group,_Pos,GF_Missions_Air_Patrol_distance] call BIS_fnc_taskPatrol;

_Group_Crew setBehaviour "AWARE";
_Group_Crew setCombatMode "RED";

while {(alive _Spawned_Plane)} do {
	_Spawned_Plane flyInHeight (300 + (random 3000));
	_getPosATL = getPosATL _Spawned_Plane;
	_nearEntities = _getPosATL nearEntities 3000;
	{_Group_Crew reveal [_x,4];} count _nearEntities;
	sleep 50;
	};
};


//________________	GF_Missions_Spawn_Planes_Defend	________________

GF_Missions_Spawn_Planes_Defend = {

_Pos = GF_Missions_pos;
_Pos_Spawn = _Pos getPos [250,random 360];
_Spawn_Height = 2000;
_Group = createGroup GF_Missions_Enemy_Side;
_Group_Crew = createGroup GF_Missions_Enemy_Side;

_Plane = selectRandom GF_Missions_Pool_Planes; 
_Spawned_Plane = createVehicle [_Plane,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Plane setPosATL [getPosATL _Spawned_Plane select 0, getPosATL _Spawned_Plane select 1, _Spawn_Height];
_Spawned_Plane engineOn true;


//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Plane,true] call BIS_fnc_crewCount;	

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Plane , _Seats_Number];
};


//________________	 Counts all available seats excluding cargo slots	________________

_Seats_Number_Crew = [_Plane,false] call BIS_fnc_crewCount;


//________________	 Spawn Crew	________________

for "_x" from 1 to _Seats_Number_Crew do {

	_unit_Crew = _Group_Crew createunit [GF_Missions_Pool_Infantry_Planes select floor(random count GF_Missions_Pool_Infantry_Planes),_Pos_Spawn,[],0,"None"];
	[_unit_Crew] JoinSilent _Group_Crew;
	_unit_Crew moveInAny _Spawned_Plane;
	(leader _Group_Crew) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit_Crew spawn GF_SCL_GF_Missions;
};

	removeBackpack _unit_Crew;
	_unit_Crew addBackPack "B_parachute";
	
};


//________________	 Counts all cargo slots	________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//________________	 Spawn units in Cargo	________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry select floor(random count GF_Missions_Pool_Infantry),_Pos_Spawn,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _Spawned_Plane;
	(leader _Group) setSkill GF_Missions_set_AiSkill;
			
if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};

	private _data = [backpack _unit,backpackitems _unit];
    removeBackpack _unit;
	_unit addBackPack "B_parachute";	
		  
	[_unit,_data] spawn {
	private ["_unit","_data"];
	_unit = _this select 0;
	_data = _this select 1;
	waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
	sleep 1;
	removeBackpack _unit;
	_unit addbackpack (_data select 0);
	{_unit additemtobackpack _x;} foreach (_data select 1);
	};
	
};


[_Group_Crew, _Pos] call BIS_fnc_taskDefend;
[_Group, _Pos] call BIS_fnc_taskDefend;

_Group_Crew setBehaviour "AWARE";
_Group_Crew setCombatMode "RED";

while {(alive _Spawned_Plane)} do {
	_Spawned_Plane flyInHeight (300 + (random 3000));
	_getPosATL = getPosATL _Spawned_Plane;
	_nearEntities = _getPosATL nearEntities 3000;
	{_Group_Crew reveal [_x,4];} count _nearEntities;
	sleep 50;
	};
};


//________________	GF_Missions_Spawn_Planes_Attack	________________

GF_Missions_Spawn_Planes_Attack = {

_Pos = GF_Missions_pos;
_Pos_Spawn = _Pos getPos [GF_Missions_Attack_Distance,random 360];
_Spawn_Height = 2000;
_Group = createGroup GF_Missions_Enemy_Side;
_Group_Crew = createGroup GF_Missions_Enemy_Side;

_Plane = selectRandom GF_Missions_Pool_Planes; 
_Spawned_Plane = createVehicle [_Plane,_Pos_Spawn, [], 0, "FLY"];
_Spawned_Plane setPosATL [getPosATL _Spawned_Plane select 0, getPosATL _Spawned_Plane select 1, _Spawn_Height];
_Spawned_Plane engineOn true;


//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Plane,true] call BIS_fnc_crewCount;	

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Plane , _Seats_Number];
};


//________________	 Counts all available seats excluding cargo slots	________________

_Seats_Number_Crew = [_Plane,false] call BIS_fnc_crewCount;


//________________	 Spawn Crew	________________

for "_x" from 1 to _Seats_Number_Crew do {

	_unit_Crew = _Group_Crew createunit [GF_Missions_Pool_Infantry_Planes select floor(random count GF_Missions_Pool_Infantry_Planes),_Pos_Spawn,[],0,"None"];
	[_unit_Crew] JoinSilent _Group_Crew;
	_unit_Crew moveInAny _Spawned_Plane;
	(leader _Group_Crew) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit_Crew spawn GF_SCL_GF_Missions;
};

	removeBackpack _unit_Crew;
	_unit_Crew addBackPack "B_parachute";
	
};


//________________	 Counts all cargo slots	________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//________________	 Spawn units in Cargo	________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry select floor(random count GF_Missions_Pool_Infantry),_Pos_Spawn,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _Spawned_Plane;
	(leader _Group) setSkill GF_Missions_set_AiSkill;
			
if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};

	private _data = [backpack _unit,backpackitems _unit];
    removeBackpack _unit;
	_unit addBackPack "B_parachute";	
		  
	[_unit,_data] spawn {
	private ["_unit","_data"];
	_unit = _this select 0;
	_data = _this select 1;
	waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
	sleep 1;
	removeBackpack _unit;
	_unit addbackpack (_data select 0);
	{_unit additemtobackpack _x;} foreach (_data select 1);
	};
	
};


[_Group_Crew, _Pos] call BIS_fnc_taskAttack;
[_Group, _Pos] call BIS_fnc_taskAttack;


_Group_Crew setBehaviour "AWARE";
_Group_Crew setCombatMode "RED";

while {(alive _Spawned_Plane)} do {
	_Spawned_Plane flyInHeight (300 + (random 3000));
	_getPosATL = getPosATL _Spawned_Plane;
	_nearEntities = _getPosATL nearEntities 3000;
	{_Group_Crew reveal [_x,4];} count _nearEntities;
	sleep 50;
	};
};