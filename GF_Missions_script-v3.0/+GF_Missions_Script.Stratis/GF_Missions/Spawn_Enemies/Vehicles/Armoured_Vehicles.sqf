


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
//________________	Armoured_Vehicles_Transport_	________________
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Patrol;
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Defend;
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Attack;
*/


//________________	GF_Missions_Spawn_Armoured_Vehicles_Patrol	________________

GF_Missions_Spawn_Armoured_Vehicles_Patrol = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 250]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;
_Group_Crew = createGroup GF_Missions_Enemy_Side;

_Armoured_Vehicle = selectRandom GF_Missions_Pool_Armoured_Vehicles; 
_Spawned_Armoured_Vehicle = _Armoured_Vehicle createVehicle _Pos_Spawn;


//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Armoured_Vehicle,true] call BIS_fnc_crewCount;	

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Armoured_Vehicle , _Seats_Number];
};


//________________	 Counts all available seats excluding cargo slots	________________

_Seats_Number_Crew = [_Armoured_Vehicle,false] call BIS_fnc_crewCount;


//________________	 Spawn Crew	________________

for "_x" from 1 to _Seats_Number_Crew do {

	_unit_Crew = _Group_Crew createunit [GF_Missions_Pool_Infantry_Crew select floor(random count GF_Missions_Pool_Infantry_Crew),_Pos_Spawn,[],0,"None"];
	[_unit_Crew] JoinSilent _Group_Crew;
	_unit_Crew moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group_Crew) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit_Crew spawn GF_SCL_GF_Missions;
};
	
};


//________________	 Counts all cargo slots	________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//________________	 Spawn units in Cargo	________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry select floor(random count GF_Missions_Pool_Infantry),_Pos_Spawn,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group) setSkill GF_Missions_set_AiSkill;
			
if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
	
};


[_Group_Crew,_Pos,GF_Missions_Air_Patrol_distance] call BIS_fnc_taskPatrol;
[_Group,_Pos,GF_Missions_Air_Patrol_distance] call BIS_fnc_taskPatrol;
};


//________________	GF_Missions_Spawn_Armoured_Vehicles_Defend	________________

GF_Missions_Spawn_Armoured_Vehicles_Defend = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 100]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;
_Group_Crew = createGroup GF_Missions_Enemy_Side;

_Armoured_Vehicle = selectRandom GF_Missions_Pool_Armoured_Vehicles; 
_Spawned_Armoured_Vehicle = _Armoured_Vehicle createVehicle _Pos_Spawn;


//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Armoured_Vehicle,true] call BIS_fnc_crewCount;	

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Armoured_Vehicle , _Seats_Number];
};


//________________	 Counts all available seats excluding cargo slots	________________

_Seats_Number_Crew = [_Armoured_Vehicle,false] call BIS_fnc_crewCount;


//________________	 Spawn Crew	________________

for "_x" from 1 to _Seats_Number_Crew do {

	_unit_Crew = _Group_Crew createunit [GF_Missions_Pool_Infantry_Crew select floor(random count GF_Missions_Pool_Infantry_Crew),_Pos_Spawn,[],0,"None"];
	[_unit_Crew] JoinSilent _Group_Crew;
	_unit_Crew moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group_Crew) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit_Crew spawn GF_SCL_GF_Missions;
};
	
};


//________________	 Counts all cargo slots	________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//________________	 Spawn units in Cargo	________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry select floor(random count GF_Missions_Pool_Infantry),_Pos_Spawn,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group) setSkill GF_Missions_set_AiSkill;
			
if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
	
};


[_Group_Crew, _Pos] call BIS_fnc_taskDefend;
[_Group, _Pos] call BIS_fnc_taskDefend;
};


//________________	GF_Missions_Spawn_Armoured_Vehicles_Attack	________________

GF_Missions_Spawn_Armoured_Vehicles_Attack = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, GF_Missions_Attack_Distance]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;
_Group_Crew = createGroup GF_Missions_Enemy_Side;

_Armoured_Vehicle = selectRandom GF_Missions_Pool_Armoured_Vehicles; 
_Spawned_Armoured_Vehicle = _Armoured_Vehicle createVehicle _Pos_Spawn;


//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Armoured_Vehicle,true] call BIS_fnc_crewCount;	

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Armoured_Vehicle , _Seats_Number];
};


//________________	 Counts all available seats excluding cargo slots	________________

_Seats_Number_Crew = [_Armoured_Vehicle,false] call BIS_fnc_crewCount;


//________________	 Spawn Crew	________________

for "_x" from 1 to _Seats_Number_Crew do {

	_unit_Crew = _Group_Crew createunit [GF_Missions_Pool_Infantry_Crew select floor(random count GF_Missions_Pool_Infantry_Crew),_Pos_Spawn,[],0,"None"];
	[_unit_Crew] JoinSilent _Group_Crew;
	_unit_Crew moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group_Crew) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit_Crew spawn GF_SCL_GF_Missions;
};
	
};


//________________	 Counts all cargo slots	________________

_Seats_Number_Cargo = _Seats_Number - _Seats_Number_Crew;	

//________________	 Spawn units in Cargo	________________

for "_x" from 1 to _Seats_Number_Cargo do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry select floor(random count GF_Missions_Pool_Infantry),_Pos_Spawn,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _Spawned_Armoured_Vehicle;
	(leader _Group) setSkill GF_Missions_set_AiSkill;
			
if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
	
};

[_Group_Crew, _Pos] call BIS_fnc_taskAttack;
[_Group, _Pos] call BIS_fnc_taskAttack;
};