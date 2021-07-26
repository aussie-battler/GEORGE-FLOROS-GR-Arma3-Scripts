


//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Building Replacement Script - Mod	________________

https://forums.bohemia.net/forums/topic/221761-gf-building-replacement-script-mod/

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
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


waituntil{GF_BR_Distance_Check_Loaded};


if (GF_BR_Systemchat_info) then {
systemchat "GF Building Replacement Script initializing";			
};	


if (GF_BR_diag_log_info) then {
diag_log "//________________	GF Building Replacement Script initializing	________________";
};


//________________	Debug Markers	_____________

if(GF_BR_Debug_Markers) then {

if (GF_BR_Systemchat_info) then {
systemchat "GF Building Replacement Debug Markers Enabled";			
};	

if (GF_BR_diag_log_info) then {
diag_log "//________________	GF Building Replacement Debug Enabled	_____________";
};
};


//________________	Debug info	_____________

if(GF_BR_Debug_info) then {

if (GF_BR_Systemchat_info) then {
systemchat "GF Building Replacement Debug info Enabled";			
};	

if (GF_BR_diag_log_info) then {
diag_log "//________________	GF Building Replacement Debug Enabled	_____________";
};
};


//________________ _Exclude_Buildings _____________

_Exclude_Buildings = [

	"Land_Pier_F",
	"Land_Pier_small_F",
	"Land_NavigLight",
	"Land_LampHarbour_F"
];


//________________ _Replacing_array , add your desired buildings _____________

_Replacing_array = [
	
	"Land_spp_Tower_F",
	"Land_dp_smallTank_F"
];

_a = 0;
{
_a = _a + 1;

GF_BR_array = _x;

if (!(typeOf _x in _Exclude_Buildings)) then {

_buildingPositions = [_x] call BIS_fnc_buildingPositions;
_count = count _buildingPositions;

if (_count > GF_BR_buildingPositions) then {

private _pos = getPosATL _x;

GF_BR_Distance_Check_initialized = false;
GF_BR_Distance_Check_Ok = false;

[_pos] call GF_BR_Distance_Check;	
waituntil{GF_BR_Distance_Check_initialized};

if (GF_BR_Distance_Check_Ok isEqualTo true)then {

private _dir = getDir _x;
private _vectorDirUp = [vectorDir _x, vectorUp _x];		 
hideObjectGlobal _x;

_createVehicle = createVehicle [selectrandom _Replacing_array, _pos, [], 0, "CAN_COLLIDE"];
_createVehicle setDir _dir;
_createVehicle setVectorDirAndUp _vectorDirUp;

if(GF_Building_Disable_Simulation) then {
_createVehicle enableSimulationGlobal false;
};

//________________	Debug Markers	_____________

if(GF_BR_Debug_info) then {

_Marker_Number = format ["%1",_pos];
_Marker = createMarker [_Marker_Number,getpos _createVehicle];		
_Marker setMarkerShape "ICON"; 
_Marker setMarkerType "mil_dot"; 
_Marker setMarkerColor "Default"; 
//_Text = str [getModelInfo _x];	//	to get the model
_Text = str [typeOf _x];
_Marker setMarkerText _Text;	
_Marker setMarkerSize [0.6,0.6]; 	
};

};
};
};


//________________	Debug info	_____________

if(GF_BR_Debug_info) then {

hintsilent format["Replaced Buildings : %1 ",_a];
};

}forEach GF_BR_array;




if (GF_BR_Systemchat_info) then {
systemchat "GF Building Replacement Script initialized";			
};	


if (GF_BR_diag_log_info) then {
diag_log "//________________	GF Building Replacement Script initialized	________________";
};