


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
//________________	Boats	________________
[] spawn GF_Missions_Spawn_Boats_Patrol;
[] spawn GF_Missions_Spawn_Boats_Defend;
[] spawn GF_Missions_Spawn_Boats_Attack;
*/


//________________	GF_Missions_Spawn_Boats_Patrol	________________

GF_Missions_Spawn_Boats_Patrol = {

_Pos = GF_Missions_pos;

private ["_find_Position"];
_Pos_Water = false;
while {!_Pos_Water} do {

_find_Position = _Pos getPos [random 250,random 360];
	
	//Syntax:  position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject] 
	//	Check if area 10m around the position is relatively flat and empty:
	//	https://community.bistudio.com/wiki/isFlatEmpty
	_Pos_Water = !(_find_Position isFlatEmpty  [
	10,		//	minDistance (Optional): Number - Objects within 50m cannot be closer than minDistance. -1 to ignore proximity check. Default: -1
	-1,		//	mode (Optional): Number - Position check mode (ALWAYS USE DEFAULT VALUE!). Default: -1
	-1,	//	maxGradient (Optional): Number - Maximum terrain steepness allowed. -1 to ignore. Default: -1
	1,		//	maxGradientRadius (Optional): Number - How far to extend gradient check. Default: 1
	2,		//	overLandOrWater (Optional): Number - 0: position cannot be over water; 2: position cannot be over land. -1 to ignore. Default: 0
	false	//	shoreLine (Optional): Boolean - true: position is over shoreline (< ~25 m from water). false to ignore. Default: false
	] isEqualTo []);

	
if (GF_Missions_Systemchat_info) then {
systemchat format ["_Pos_Water %1",_Pos_Water];
};	
	
};

waitUntil {_Pos_Water};

if (GF_Missions_Systemchat_info) then {
systemchat format ["_Pos_Water %1",_Pos_Water];
};	

if (GF_Missions_Hintsilent_info) then {
	hint "GF_Missions_pos found";
};

	_Pos = _find_Position;
	
_Group = createGroup GF_Missions_Enemy_Side;

_Boats = selectRandom GF_Missions_Pool_Boats; 
_create_Boats = _Boats createVehicle _Pos;

//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Boats,true] call BIS_fnc_crewCount;

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Boats , _Seats_Number];
};

for "_x" from 1 to _Seats_Number do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry_Divers select floor(random count GF_Missions_Pool_Infantry_Divers),_Pos,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _create_Boats;
	(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
};


//________________	addWaypoint	________________

private ["_Wp", "_Wp_Pos","_Radius"];

_Wp_Number = 4;

for "_i" from 1 to _Wp_Number do {
	
_Radius = random 600;	

_Pos_Water = false;
while {!_Pos_Water} do {

_Wp_Pos = _Pos getPos [_Radius,random 360];
	
	//Syntax:  position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject] 
	//	Check if area 10m around the position is relatively flat and empty:
	//	https://community.bistudio.com/wiki/isFlatEmpty
	_Pos_Water = !(_Wp_Pos isFlatEmpty  [
	10,		//	minDistance (Optional): Number - Objects within 50m cannot be closer than minDistance. -1 to ignore proximity check. Default: -1
	-1,		//	mode (Optional): Number - Position check mode (ALWAYS USE DEFAULT VALUE!). Default: -1
	-1,	//	maxGradient (Optional): Number - Maximum terrain steepness allowed. -1 to ignore. Default: -1
	1,		//	maxGradientRadius (Optional): Number - How far to extend gradient check. Default: 1
	2,		//	overLandOrWater (Optional): Number - 0: position cannot be over water; 2: position cannot be over land. -1 to ignore. Default: 0
	false	//	shoreLine (Optional): Boolean - true: position is over shoreline (< ~25 m from water). false to ignore. Default: false
	] isEqualTo []);
	
if (GF_Missions_Systemchat_info) then {
systemchat format ["_Pos_Water %1",_Pos_Water];
};	
	
};


_Wp = _Group addWaypoint [_Wp_Pos, 0];
_Wp setWaypointType "MOVE";
_Wp setWaypointCompletionRadius _Radius / 2;
};

//________________	Cycle	________________

_Wp = _Group addWaypoint [_Wp_Pos, 0];
_Wp setWaypointType "CYCLE";
_Wp setWaypointCompletionRadius _Radius / 2;
};


//________________	GF_Missions_Spawn_Boats_Defend	________________

GF_Missions_Spawn_Boats_Defend = {

_Pos = GF_Missions_pos;

private ["_find_Position"];
_Pos_Water = false;
while {!_Pos_Water} do {

_find_Position = _Pos getPos [random 200,random 360];
	
	//Syntax:  position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject] 
	//	Check if area 10m around the position is relatively flat and empty:
	//	https://community.bistudio.com/wiki/isFlatEmpty
	_Pos_Water = !(_find_Position isFlatEmpty  [
	10,		//	minDistance (Optional): Number - Objects within 50m cannot be closer than minDistance. -1 to ignore proximity check. Default: -1
	-1,		//	mode (Optional): Number - Position check mode (ALWAYS USE DEFAULT VALUE!). Default: -1
	-1,	//	maxGradient (Optional): Number - Maximum terrain steepness allowed. -1 to ignore. Default: -1
	1,		//	maxGradientRadius (Optional): Number - How far to extend gradient check. Default: 1
	2,		//	overLandOrWater (Optional): Number - 0: position cannot be over water; 2: position cannot be over land. -1 to ignore. Default: 0
	false	//	shoreLine (Optional): Boolean - true: position is over shoreline (< ~25 m from water). false to ignore. Default: false
	] isEqualTo []);

	
if (GF_Missions_Systemchat_info) then {
systemchat format ["_Pos_Water %1",_Pos_Water];
};	
	
};

waitUntil {_Pos_Water};

if (GF_Missions_Systemchat_info) then {
systemchat format ["_Pos_Water %1",_Pos_Water];
};	

if (GF_Missions_Hintsilent_info) then {
	hint "GF_Missions_pos found";
};

	_Pos = _find_Position;
	
_Group = createGroup GF_Missions_Enemy_Side;

_Boats = selectRandom GF_Missions_Pool_Boats; 
_create_Boats = _Boats createVehicle _Pos;

//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Boats,true] call BIS_fnc_crewCount;

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Boats , _Seats_Number];
};

for "_x" from 1 to _Seats_Number do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry_Divers select floor(random count GF_Missions_Pool_Infantry_Divers),_Pos,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _create_Boats;
	(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
};
[_Group, _Pos] call BIS_fnc_taskDefend;
};


//________________	GF_Missions_Spawn_Boats_Attack	________________

GF_Missions_Spawn_Boats_Attack = {

_Pos = GF_Missions_pos;

private ["_find_Position"];
_Pos_Water = false;
while {!_Pos_Water} do {

_find_Position = _Pos getPos [GF_Missions_Attack_Distance,random 360];
	
	//Syntax:  position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject] 
	//	Check if area 10m around the position is relatively flat and empty:
	//	https://community.bistudio.com/wiki/isFlatEmpty
	_Pos_Water = !(_find_Position isFlatEmpty  [
	10,		//	minDistance (Optional): Number - Objects within 50m cannot be closer than minDistance. -1 to ignore proximity check. Default: -1
	-1,		//	mode (Optional): Number - Position check mode (ALWAYS USE DEFAULT VALUE!). Default: -1
	-1,	//	maxGradient (Optional): Number - Maximum terrain steepness allowed. -1 to ignore. Default: -1
	1,		//	maxGradientRadius (Optional): Number - How far to extend gradient check. Default: 1
	2,		//	overLandOrWater (Optional): Number - 0: position cannot be over water; 2: position cannot be over land. -1 to ignore. Default: 0
	false	//	shoreLine (Optional): Boolean - true: position is over shoreline (< ~25 m from water). false to ignore. Default: false
	] isEqualTo []);

	
if (GF_Missions_Systemchat_info) then {
systemchat format ["_Pos_Water %1",_Pos_Water];
};	
	
};


waitUntil {_Pos_Water};

if (GF_Missions_Systemchat_info) then {
systemchat format ["_Pos_Water %1",_Pos_Water];
};	

if (GF_Missions_Hintsilent_info) then {
	hint "GF_Missions_pos found";
};

	_Pos_Spawn = _find_Position;

	
_Group = createGroup GF_Missions_Enemy_Side;

_Boats = selectRandom GF_Missions_Pool_Boats; 
_create_Boats = _Boats createVehicle _Pos_Spawn;

//________________	Count all available seats including cargo slots	________________

_Seats_Number = [_Boats,true] call BIS_fnc_crewCount;

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Boats , _Seats_Number];
};

for "_x" from 1 to _Seats_Number do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry_Divers select floor(random count GF_Missions_Pool_Infantry_Divers),_Pos_Spawn,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _create_Boats;
	(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
};
[_Group, _Pos] call BIS_fnc_taskAttack;
};