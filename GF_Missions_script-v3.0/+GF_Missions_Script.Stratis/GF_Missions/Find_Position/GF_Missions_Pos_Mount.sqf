


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


GF_Missions_Pos_Mount = {

 	
private ["_Pos" , "_Found" , "_locationPos"];

GF_Missions_pos_initialized = false;
_Found = false;
while {!_Found} do {
	
	_Pos = [] call BIS_fnc_randomPos;
					
	if (		
	//________________	Add Safe Distance from all Players	________________
	(({((_Pos distance _x) <= GF_Missions_Safe_Zone_distance)} count GF_Missions_allPlayers) isEqualTo 0)
		
	//________________	Add here your Safe Zones	________________
	&& ((_Pos distance GF_Missions_Safe_Zone_1) > GF_Missions_Safe_Zone_distance) 
	&& ((_Pos distance GF_Missions_Safe_Zone_2) > GF_Missions_Safe_Zone_distance)
	&& ((_Pos distance GF_Missions_Safe_Zone_3) > GF_Missions_Safe_Zone_distance) 
	&& ((_Pos distance GF_Missions_Safe_Zone_4) > GF_Missions_Safe_Zone_distance)
	&& ((_Pos distance GF_Missions_Safe_Zone_5) > GF_Missions_Safe_Zone_distance)
			
	) then {
	
	_nearestLocation = nearestLocation [_Pos, "Mount"];
	_locationPos = locationPosition _nearestLocation;
	
	if !(_locationPos isEqualTo [0,0,0]) then {

	_Found = true;
	
if (GF_Missions_Systemchat_info) then {
systemchat format ["Position Mount Found %1",_Found];
};

if (GF_Missions_Diag_Log_info) then {
diag_log format ["Position Mount Found %1",_Found];
};

	} else{
	_locationPos = _Pos;
	_Found = true;	
	
if (GF_Missions_Systemchat_info) then {
systemchat format ["There is NO Mount , spawning on random : %1",_locationPos]; 
};	

if (GF_Missions_Diag_Log_info) then {
diag_log format ["There is NO Mount , spawning on random : %1",_locationPos]; 
};

	};
		
	_Found = true;
	
	}else{	

	_Found = false;
	
if (GF_Missions_Systemchat_info) then {
systemchat format ["Position Mount Found %1",_Found];
};

if (GF_Missions_Diag_Log_info) then {
diag_log format ["Position Mount Found %1",_Found];
};
		
	};
};


waitUntil {_Found};

	//________________	Get a random position , No water	________________
	_Pos =  [[[_locationPos, random 30]],["water"]] call BIS_fnc_randomPos;

	
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