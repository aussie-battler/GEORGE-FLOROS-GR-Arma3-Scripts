


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


GF_AP_Pos_NearestLocation = {

 	
private ["_randomPos","_Pos","_NearestLocation"];

GF_AP_Pos_initialized = false;
GF_AP_Safe_distance_Check_initialized = false;
GF_AP_Safe_distance_Check_Ok = false;
_a = 0;


while {(!GF_AP_Safe_distance_Check_Ok) or _a < GF_AP_Find_Pos_Attempts} do {

_a = _a + 1;

_randomPos = [] call BIS_fnc_randomPos;

	
_NearestLocation_1 = NearestLocation [_randomPos, "NameCityCapital"];
_NearestLocation_2 = NearestLocation [_randomPos, "NameCity"];
_NearestLocation_3 = NearestLocation [_randomPos, "NameVillage"];

_NearestLocation_1_meters = _randomPos distance _NearestLocation_1;
_NearestLocation_2_meters = _randomPos distance _NearestLocation_2;
_NearestLocation_3_meters = _randomPos distance _NearestLocation_3;


_Pos_initialized = false;

switch true do {
	
	
	case (
		(_NearestLocation_1_meters < _NearestLocation_2_meters)
		&& (_NearestLocation_1_meters < _NearestLocation_3_meters)
		)
		: {
		_NearestLocation = _NearestLocation_1;
		_Pos_initialized = true;
		
		if(GF_AP_Hintsilent_info) then {
		hintsilent "_NearestLocation_1";
		};
	
		};
	
	
	case (
		(_NearestLocation_2_meters < _NearestLocation_1_meters)
		&& (_NearestLocation_2_meters < _NearestLocation_3_meters)
		)
		: {
		_NearestLocation = _NearestLocation_2;
		_Pos_initialized = true;
		
		if(GF_AP_Hintsilent_info) then {
		hintsilent "_NearestLocation_2";
		};
	
		};
	
	case (
		(_NearestLocation_3_meters < _NearestLocation_1_meters)
		&& (_NearestLocation_3_meters < _NearestLocation_2_meters)
		)
		: {
		_NearestLocation = _NearestLocation_3;
		_Pos_initialized = true;
		
		if(GF_AP_Hintsilent_info) then {
		hintsilent "_NearestLocation_3";
		};
		
		};
		
};	


waitUntil {uisleep 1;_Pos_initialized};
_Pos = locationPosition _NearestLocation;	
_Pos = [(_Pos select 0) , (_Pos select 1) , (_Pos select 2)];


if !(_Pos isEqualTo [0,0,0]) then {
	
	[_Pos] call GF_AP_Safe_distance_Check;	
	waituntil{GF_AP_Safe_distance_Check_initialized};
	
	if (GF_AP_Systemchat_info) then {
	systemchat format ["Position NearestLocation Found %1",GF_AP_Safe_distance_Check_Ok];
	};	

	if (GF_AP_Diag_Log_info) then {
	diag_log format ["Position NearestLocation Found %1",GF_AP_Safe_distance_Check_Ok];
	};		

	};
};

	
waitUntil {uisleep 1;GF_AP_Safe_distance_Check_Ok or _a isEqualTo GF_AP_Find_Pos_Attempts};

if (GF_AP_Safe_distance_Check_Ok isEqualTo false) then {
_Pos = _randomPos;
	
if (GF_AP_Systemchat_info) then {
systemchat "There is NO Position NearestLocation ! , selecting on Random"; 
};	

if (GF_AP_Diag_Log_info) then {
diag_log "There is NO Position NearestLocation ! , selecting on Random"; 
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