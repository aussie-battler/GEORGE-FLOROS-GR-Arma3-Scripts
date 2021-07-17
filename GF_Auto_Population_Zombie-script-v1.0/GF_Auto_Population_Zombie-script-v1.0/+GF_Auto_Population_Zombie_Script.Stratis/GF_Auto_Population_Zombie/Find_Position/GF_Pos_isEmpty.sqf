


//________________	Author : GEORGE FLOROS [GR]	___________	08.03.19	___________


/*
________________	GF Auto Population Zombie Script - Mod	________________

https://forums.bohemia.net/forums/topic/222245-gf-auto-population-zombie-script-mod/

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

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


GF_APZ_Pos_isEmpty = {

 	
private ["_randomPos","_Pos","_isEmpty_randomPosition"];

GF_APZ_Pos_initialized = false;
GF_APZ_Safe_distance_Check_initialized = false;
GF_APZ_Safe_distance_Check_Ok = false;
_a = 0;


while {(!GF_APZ_Safe_distance_Check_Ok) or _a < GF_APZ_Find_Pos_Attempts} do {

_a = _a + 1;

_randomPos = [] call BIS_fnc_randomPos;
_Pos = _randomPos;
_Pos = [(_Pos select 0) , (_Pos select 1) , (_Pos select 2)];

_nearestRoad = [_Pos, 50] call BIS_fnc_nearestRoad;	
_nearest_House = nearestObject [_Pos, "House"];
_nearest_Building = nearestObject [_Pos, "Building"];
	
if (

	(!(_Pos isEqualTo [0,0,0]))
	
	//___________________	Add Distance from _nearestRoad - House - Building	___________________
	&& ((_Pos distance _nearestRoad) > 50) 
	&& ((_Pos distance _nearest_House) > 50) 
	&& ((_Pos distance _nearest_Building) > 50) 
	
	) then {
	
	
	//Syntax:  position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject] 
	//	Check if area 10m around the position is relatively flat and empty:
	//	https://community.bistudio.com/wiki/isFlatEmpty
	_Check = !(_Pos isFlatEmpty [
	10,		//	minDistance (Optional): Number - Objects within 50m cannot be closer than minDistance. -1 to ignore proximity check. Default: -1
	-1,		//	mode (Optional): Number - Position check mode (ALWAYS USE DEFAULT VALUE!). Default: -1
	-1,	//	maxGradient (Optional): Number - Maximum terrain steepness allowed. -1 to ignore. Default: -1
	-1,		//	maxGradientRadius (Optional): Number - How far to extend gradient check. Default: 1
	-1,		//	overLandOrWater (Optional): Number - 0: position cannot be over water; 2: position cannot be over land. -1 to ignore. Default: 0
	false	//	shoreLine (Optional): Boolean - true: position is over shoreline (< ~25 m from water). false to ignore. Default: false
	] isEqualTo []);
	
	
	if(_Check isEqualTo true) then {
	
	[_Pos] call GF_APZ_Safe_distance_Check;	
	waituntil{GF_APZ_Safe_distance_Check_initialized};
	
	if (GF_APZ_Systemchat_info) then {
	systemchat format ["Position isEmpty Found %1",GF_APZ_Safe_distance_Check_Ok];
	};	

	if (GF_APZ_Diag_Log_info) then {
	diag_log format ["Position isEmpty Found %1",GF_APZ_Safe_distance_Check_Ok];
	};		
	};
	}else{
	
	GF_APZ_Safe_distance_Check_Ok = false;
	
	};
};

	
waitUntil {uisleep 1;GF_APZ_Safe_distance_Check_Ok or _a isEqualTo GF_APZ_Find_Pos_Attempts};


if (
	(GF_APZ_Safe_distance_Check_Ok isEqualTo false) 
	or (_Pos isEqualTo [0,0,0])
	)then {
	
	_Pos = _randomPos;
	
if (GF_APZ_Systemchat_info) then {
systemchat "There is NO Position isEmpty ! , selecting on Random"; 
};	

if (GF_APZ_Diag_Log_info) then {
diag_log "There is NO Position isEmpty ! , selecting on Random"; 
};

};


	//___________________	GF_APZ_Pos_Spawn_Test	___________________	
	
if (GF_APZ_Pos_Spawn_Test) then {	

	_Group = createGroup civilian;
	_Unit = _Group createUnit ["C_man_polo_1_F", _Pos, [], 0, "CAN_COLLIDE"];	

	_Marker_Number = format ["%1",_Pos];
	_Marker = createMarker [_Marker_Number,_Pos];		
	_Marker setMarkerShape "ICON"; 
	_Marker setMarkerType "mil_marker"; 
	_Marker setMarkerColor "ColorBrown"; 
	_Marker setMarkerText format ["Spawn Test"];	
	_Marker setMarkerSize [1,1]; 	
};
	
GF_APZ_Pos_initialized = true;
_Pos	
};