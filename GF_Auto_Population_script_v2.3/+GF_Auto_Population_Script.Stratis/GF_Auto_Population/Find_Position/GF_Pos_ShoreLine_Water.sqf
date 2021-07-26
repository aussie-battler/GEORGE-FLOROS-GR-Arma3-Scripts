


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


GF_AP_Pos_ShoreLine_Water = {

 	
private ["_randomPos","_Pos"];

GF_AP_Pos_initialized = false;
GF_AP_Safe_distance_Check_initialized = false;
GF_AP_Safe_distance_Check_Ok = false;
_a = 0;


while {(!GF_AP_Safe_distance_Check_Ok) or _a < GF_AP_Find_Pos_Attempts} do {

_a = _a + 1;

_randomPos = [nil, ["ground"]] call BIS_fnc_randomPos;

//	https://community.bistudio.com/wiki/BIS_fnc_findSafePos
_Pos = [
_randomPos,	//	center
0,		//	minDist (Optional): Number - minimum distance from the center position. (Default: 0).
1500,	//	maxDist (Optional): Number - maximum distance from the center position. If -1, the world's "safePositionRadius" entry will be used. (Default: -1).
10,		//	objDist (Optional): Number - minimum distance from the resulting position to the center of nearest object. Specifying quite large distance here will slow the function and might often fail to find suitable position. Recommended value: 0 - 10. (Default: 0).
2,		//	waterMode (Optional): Number - water mode (Default: 0). Could be one of: 0 - cannot be in water , 1 - can either be in water or not	, 2 - must be in water
0.1, 	//	maxGrad (Optional): Number - maximum terrain gradient (hill steepness). A quite small non-zero value could result in failure to find suitable position. Recommended: 0.1+ (Default: 0).
1,		//	shoreMode (Optional): Number - shore mode (Default: 0). Could be one of: 0 - does not have to be at a shore , 1 - must be at a shore
[],		//	blacklistPos (Optional): List of blacklisted areas in format [area1, area2,
[]		//	defaultPos (Optional): Array - default position when no position is found (Default: []). Array format is [landPosition, seaPosition]
] call BIS_fnc_findSafePos;

_Pos = [(_Pos select 0) , (_Pos select 1) , 0];

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
	0.3,	//	maxGradient (Optional): Number - Maximum terrain steepness allowed. -1 to ignore. Default: -1
	5,		//	maxGradientRadius (Optional): Number - How far to extend gradient check. Default: 1
	2,		//	overLandOrWater (Optional): Number - 0: position cannot be over water; 2: position cannot be over land. -1 to ignore. Default: 0
	true	//	shoreLine (Optional): Boolean - true: position is over shoreline (< ~25 m from water). false to ignore. Default: false
	] isEqualTo []);
	
	
	if(_Check isEqualTo true) then {
	
	[_Pos] call GF_AP_Safe_distance_Check;	
	waituntil{GF_AP_Safe_distance_Check_initialized};
	
	if (GF_AP_Systemchat_info) then {
	systemchat format ["Position ShoreLine_Water Found %1",GF_AP_Safe_distance_Check_Ok];
	};	

	if (GF_AP_Diag_Log_info) then {
	diag_log format ["Position ShoreLine_Water Found %1",GF_AP_Safe_distance_Check_Ok];
	};		
	};
	}else{
	
	GF_AP_Safe_distance_Check_Ok = false;
	
	};
};

	
waitUntil {uisleep 1;GF_AP_Safe_distance_Check_Ok or _a isEqualTo GF_AP_Find_Pos_Attempts};


if (
	(GF_AP_Safe_distance_Check_Ok isEqualTo false) 
	or (_Pos isEqualTo [0,0,0])
	)then {
	
	_Pos = _randomPos;
	
if (GF_AP_Systemchat_info) then {
systemchat "There is NO Position ShoreLine_Water ! , selecting on Random"; 
};	

if (GF_AP_Diag_Log_info) then {
diag_log "There is NO Position ShoreLine_Water ! , selecting on Random"; 
};

};


	//___________________	GF_AP_Pos_Spawn_Test	___________________	
	
if (GF_AP_Pos_Spawn_Test) then {	

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
	
GF_AP_Pos_initialized = true;
_Pos	
};