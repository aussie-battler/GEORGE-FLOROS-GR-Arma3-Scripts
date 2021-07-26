


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


GF_APZ_Pos_Mount = {

 	
private ["_randomPos","_Pos","_Mount_randomPosition"];

GF_APZ_Pos_initialized = false;
GF_APZ_Safe_distance_Check_initialized = false;
GF_APZ_Safe_distance_Check_Ok = false;
_a = 0;


while {(!GF_APZ_Safe_distance_Check_Ok) or _a < GF_APZ_Find_Pos_Attempts} do {

_a = _a + 1;

_randomPos = [] call BIS_fnc_randomPos;
_Mount_randomPosition = nearestLocation [_randomPos,"Mount"];
_Pos = locationPosition _Mount_randomPosition;
_Pos = [(_Pos select 0) , (_Pos select 1) , (_Pos select 2)];


if !(_Pos isEqualTo [0,0,0]) then {
	
	[_Pos] call GF_APZ_Safe_distance_Check;	
	waituntil{GF_APZ_Safe_distance_Check_initialized};
	
	if (GF_APZ_Systemchat_info) then {
	systemchat format ["Position Mount Found %1",GF_APZ_Safe_distance_Check_Ok];
	};	

	if (GF_APZ_Diag_Log_info) then {
	diag_log format ["Position Mount Found %1",GF_APZ_Safe_distance_Check_Ok];
	};		

	};
};

	
waitUntil {uisleep 1;GF_APZ_Safe_distance_Check_Ok or _a isEqualTo GF_APZ_Find_Pos_Attempts};

if (
	(GF_APZ_Safe_distance_Check_Ok isEqualTo false) 
	or (_Pos isEqualTo [0,0,0])
	)then {
	
	_Pos = _randomPos;
	
if (GF_APZ_Systemchat_info) then {
systemchat "There is NO Position Mount ! , selecting on Random"; 
};	

if (GF_APZ_Diag_Log_info) then {
diag_log "There is NO Position Mount ! , selecting on Random"; 
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