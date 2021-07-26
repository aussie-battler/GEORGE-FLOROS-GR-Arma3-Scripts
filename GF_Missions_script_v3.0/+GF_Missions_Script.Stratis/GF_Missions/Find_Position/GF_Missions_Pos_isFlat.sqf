


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


//________________ The Spawn position of the mission	________________

//	This is used to find your desired spawn position in a Safe Distance from all the players and the add Safe Zones.


GF_Missions_Pos_isFlat = {

 	
private ["_Pos" , "_Found" , "_nearestRoad" , "_nearest_House" , "_nearest_Building"];

GF_Missions_pos_initialized = false;

_a = 0;
_Found = false;
while {(!_Found) && _a < GF_Missions_Find_pos_Attempts} do {

_a = _a + 1;

if(GF_Missions_Hintsilent_info) then {
hintsilent format ["Attempts for _isFlat Position : %1",_a];
};

	_Pos = [] call BIS_fnc_randomPos;
	_nearestRoad = [_Pos, 50] call BIS_fnc_nearestRoad;	
	_nearest_House = nearestObject [_Pos, "House"];
	_nearest_Building = nearestObject [_Pos, "Building"];
				
	if (		
	//________________	Add Safe Distance from all Players	________________
	(({((_Pos distance _x) <= GF_Missions_Safe_Zone_distance)} count GF_Missions_allPlayers) isEqualTo 0)
		
	//________________	Add here your Safe Zones ( for more )	________________
	&& ((_Pos distance GF_Missions_Safe_Zone_1) > GF_Missions_Safe_Zone_distance) 
	&& ((_Pos distance GF_Missions_Safe_Zone_2) > GF_Missions_Safe_Zone_distance)
	&& ((_Pos distance GF_Missions_Safe_Zone_3) > GF_Missions_Safe_Zone_distance) 
	&& ((_Pos distance GF_Missions_Safe_Zone_4) > GF_Missions_Safe_Zone_distance)
	&& ((_Pos distance GF_Missions_Safe_Zone_5) > GF_Missions_Safe_Zone_distance)
	
	//________________	Add Distance from _nearestRoad - House - Building	________________
	&& ((_Pos distance _nearestRoad) > 50) 
	&& ((_Pos distance _nearest_House) > 50) 
	&& ((_Pos distance _nearest_Building) > 50) 
		
	) then {
	
	//Syntax:  position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject] 
	//	Check if area 10m around the position is relatively flat and empty:
	//	https://community.bistudio.com/wiki/isFlatEmpty
	_Found = !(_Pos isFlatEmpty  [
	-1,		//	minDistance (Optional): Number - Objects within 50m cannot be closer than minDistance. -1 to ignore proximity check. Default: -1
	-1,		//	mode (Optional): Number - Position check mode (ALWAYS USE DEFAULT VALUE!). Default: -1
	0.3,	//	maxGradient (Optional): Number - Maximum terrain steepness allowed. -1 to ignore. Default: -1
	10,		//	maxGradientRadius (Optional): Number - How far to extend gradient check. Default: 1
	-1,		//	overLandOrWater (Optional): Number - 0: position cannot be over water; 2: position cannot be over land. -1 to ignore. Default: 0
	false	//	shoreLine (Optional): Boolean - true: position is over shoreline (< ~25 m from water). false to ignore. Default: false
	] isEqualTo []);

	
if (GF_Missions_Systemchat_info) then {
systemchat format ["Position _isFlat Found %1",_Found];
};	

if (GF_Missions_Diag_Log_info) then {
diag_log format ["Position _isFlat Found %1",_Found];
};
	
};
};


if (_Found isEqualTo false) then {

if (GF_Missions_Systemchat_info) then {
systemchat "Position _isFlat not Found !";
systemchat "Selecting a Random Position";
};	

if (GF_Missions_Diag_Log_info) then {
diag_log "Position _isFlat not Found !";
diag_log "Selecting a Random Position";
};

_Pos = [] call BIS_fnc_randomPos;
_Found = true;
};


waitUntil {_Found};

	_Pos = [(_Pos select 0) , (_Pos select 1) , (_Pos select 2)];


	//________________	GF_Missions_pos_Spawn_Test	________________	
	
if (GF_Missions_pos_Spawn_Test) then {	

	_Civilian_Group = createGroup civilian;
	_Civilian_1 = _Civilian_Group createUnit ["C_man_polo_1_F", _Pos, [], 0, "CAN_COLLIDE"];	

	_Marker_Number_Pos = format ["%1",_Pos];
	_Marker_Pos = createMarker [_Marker_Number_Pos,_Pos];		
	_Marker_Pos setMarkerShape "ICON"; 
	_Marker_Pos setMarkerType "mil_marker"; 
	_Marker_Pos setMarkerColor "ColorBrown"; 
	_Marker_Pos setMarkerText format ["Spawn Test"];	
	_Marker_Pos setMarkerSize [1,1]; 	
};
	
GF_Missions_pos_initialized = true;
_Pos	
};