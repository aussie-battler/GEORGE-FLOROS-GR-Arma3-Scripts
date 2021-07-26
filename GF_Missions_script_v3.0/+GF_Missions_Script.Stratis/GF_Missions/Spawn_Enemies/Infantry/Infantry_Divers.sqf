


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
//________________	Infantry_Divers	________________
[] spawn GF_Missions_Spawn_Infantry_Divers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Divers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Divers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Divers;		//	add the name of the building ex : [_Building] spawn GF_Missions_Garrison_The_Building_Infantry;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Divers;
*/


//________________	GF_Missions_Spawn_Infantry_Divers_Patrol	________________

GF_Missions_Spawn_Infantry_Divers_Patrol = {

_Pos = GF_Missions_pos;
_Pos_Spawn = _Pos getPos [random 250,random 360];
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Divers select floor(random count GF_Missions_Pool_Infantry_Divers),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
};


//________________	addWaypoint	________________

private ["_Found" , "_Wp", "_Wp_Pos" , "_Radius"];

_Wp_Number = 4;

for "_i" from 1 to _Wp_Number do {
	
_Radius = random 400;	

_a = 0;
_Found = false;
while {(!_Found) && _a < 10} do {

_a = _a + 1;

_Wp_Pos = _Pos getPos [_Radius,random 360];
	
	//Syntax:  position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject] 
	//	Check if area 10m around the position is relatively flat and empty:
	//	https://community.bistudio.com/wiki/isFlatEmpty
	_Found = !(_Wp_Pos isFlatEmpty  [
	10,		//	minDistance (Optional): Number - Objects within 50m cannot be closer than minDistance. -1 to ignore proximity check. Default: -1
	-1,		//	mode (Optional): Number - Position check mode (ALWAYS USE DEFAULT VALUE!). Default: -1
	-1,	//	maxGradient (Optional): Number - Maximum terrain steepness allowed. -1 to ignore. Default: -1
	1,		//	maxGradientRadius (Optional): Number - How far to extend gradient check. Default: 1
	2,		//	overLandOrWater (Optional): Number - 0: position cannot be over water; 2: position cannot be over land. -1 to ignore. Default: 0
	false	//	shoreLine (Optional): Boolean - true: position is over shoreline (< ~25 m from water). false to ignore. Default: false
	] isEqualTo []);
	
if (GF_Missions_Systemchat_info) then {
systemchat format ["_Found %1",_Found];
};	
	
};


if (_Found isEqualTo false) then {

_Pos = [] call BIS_fnc_randomPos;
_Found = true;
};


waitUntil {_Found};


_Wp = _Group addWaypoint [_Wp_Pos, 0];
_Wp setWaypointType "MOVE";
_Wp setWaypointCompletionRadius _Radius / 2;
};

//________________	Cycle	________________

_Wp = _Group addWaypoint [_Wp_Pos, 0];
_Wp setWaypointType "CYCLE";
_Wp setWaypointCompletionRadius _Radius / 2;
};


//________________	GF_Missions_Spawn_Infantry_Divers_Defend	________________	

GF_Missions_Spawn_Infantry_Divers_Defend = {

_Pos = GF_Missions_pos;
_Pos_Spawn = _Pos getPos [random 100,random 360];
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Divers select floor(random count GF_Missions_Pool_Infantry_Divers),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};

};
[_Group, _Pos] call BIS_fnc_taskDefend;
};


//________________	GF_Missions_Spawn_Infantry_Divers_Attack	________________

GF_Missions_Spawn_Infantry_Divers_Attack = {

_Pos = GF_Missions_pos;
_Pos_Spawn = _Pos getPos [GF_Missions_Attack_Distance,random 360];
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Divers select floor(random count GF_Missions_Pool_Infantry_Divers),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};

};
[_Group, _Pos] call BIS_fnc_taskAttack;


//________________	GF_Missions_Garrison_The_Building_Infantry_Divers	________________ 

GF_Missions_Garrison_The_Building_Infantry_Divers = {

_building = _this select 0;

_buildingPositions = [_building] call BIS_fnc_buildingPositions;
_count = count _buildingPositions;
_round = _count / 3;
_round_count = round _round;
_Positions = _round_count;

//	hint format ["%1",_count];
//	hint format ["%1",_Positions];

if (_count > 0) then {

_Group = createGroup GF_Missions_Enemy_Side;
for "_x" from 0 to (_Positions) do {

_Pos_Spawn = selectRandom _buildingPositions;

_Unit = _Group createunit [GF_Missions_Pool_Infantry_Divers select floor(random count GF_Missions_Pool_Infantry_Divers),_Pos_Spawn,[],0,"None"];
[_Unit] JoinSilent _Group;
_Unit disableAI "PATH";
};
};
};


//________________	GF_Missions_Garrison_Area_Buildings_Infantry_Divers	________________ 

GF_Missions_Garrison_Area_Buildings_Infantry_Divers = {

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
	
	_Group = createGroup GF_Missions_Enemy_Side;
	_Unit = _Group createunit [GF_Missions_Pool_Infantry_Divers select floor(random count GF_Missions_Pool_Infantry_Divers),_buildingpos,[],0,"None"];
	[_Unit] JoinSilent _Group;
	_Unit disableAI "PATH";
			
			};	
		};
	};				
}foreach _Buildings;
};
};