


//________________  Author : GEORGE FLOROS [GR] ___________ 08.08.18 _____________

/*
________________ GF Ravage Static Traders Script ________________

https://forums.bohemia.net/forums/topic/218581-gf-ravage-static-traders-script/

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


//	If you want the script to run only in the server use the code below
if(!isServer) exitWith {};


diag_log "//________________ GF Ravage Static Traders Script _____________";
diag_log "//________________ Trader_rvg_gear_s.sqf _____________";


//________________ GF Traders Script _____________

//________________ Settings ________________
//________________ Set true or false  ________________


_1_Create_Markers			= true;		//	Create a Marker for the Traders	



systemchat "GF Ravage Static Traders Script   I n i t i a l i z i n g";

private ["_marker","_x"];
_x = 0;

//________________ Number of the Traders to spawn (on random) ________________
for "_x" from 0 to (1 + (random 3)) do {

//________________ For spawn one crashsite ________________
//for "_x" from  1 to (1) do {

//________________ The position of the Traders will be random ________________
	_GF_random_pos = [] call BIS_fnc_randomPos; 	//    For random location
//	_GF_random_pos = getmarkerPos "MarkerName";    	//    Create a Marker if you want a certain location -

/*
//	or select a random marker
_Marker_array =selectRandom[    
            "Marker_1",        
            "Marker_2",
			"Marker_3"			
            ];
_GF_random_pos = getmarkerPos _Marker_array;
*/

//	_GF_random_pos = getPos player;    //    for test purpose



//________________ Objects at the Traders ________________

GF_Trader_gear_Building_array = [
// = selectRandom [
"Land_TentA_F",
"Land_TentDome_F",
"Land_TentDome_F",
"CamoNet_INDP_F",
"CamoNet_BLUFOR_open_F",
"CamoNet_INDP_big_F",
"Land_ClothShelter_01_F",
"Land_ClothShelter_02_F",
"Land_CanvasCover_01_F",
"Land_CanvasCover_02_F"
]; 

_Building = selectRandom GF_Trader_gear_Building_array;
_Building_Pos = _Building createVehicle _GF_random_pos;
_Building_Pos setDir (random 360);


//________________ Positions of objects  ________________
_Trader_Pos = _Building_Pos getRelPos [0, 12];
_Flag_Pos = _Building_Pos getRelPos [6, 12];
_Object_1_Pos = _Building_Pos getRelPos [3, 6];
_Object_2_Pos = _Building_Pos getRelPos [1, 3];
_Object_3_Pos = _Building_Pos getRelPos [5, 8];


//________________ Create _Object_1 ________________
_Object_1_array = selectRandom [
"Campfire_burning_F",
"FirePlace_burning_F",
"Land_Camping_Light_F"
]; 
_Object_1 = createVehicle [_Object_1_array, _Object_1_Pos, [], 0, "CAN_COLLIDE"];
_Object_1 setDir (random 360);


//________________ Create _Object_2 ________________
_Object_2_array = selectRandom [
"Land_WoodenLog_F",
"Land_WoodPile_F"
]; 
_Object_2 = createVehicle [_Object_2_array, _Object_2_Pos, [], 0, "CAN_COLLIDE"];
_Object_2 setDir (random 360);


//________________ Create _Object_3 ________________
_Object_3_array = selectRandom [
"Land_Sleeping_bag_F",
"Land_Ground_sheet_OPFOR_F",
"Land_Ground_sheet_khaki_F",
"Land_Ground_sheet_blue_F",
"Land_Sleeping_bag_brown_F",
"Land_Sleeping_bag_blue_F"
]; 
_Object_3 = createVehicle [_Object_3_array, _Object_3_Pos, [], 0, "CAN_COLLIDE"];
_Object_3 setDir (random 360);


//________________ Create a Flag with your pic 256x256 ________________
_Flag = "FlagPole_F" createVehicle _Flag_Pos;
_Flag setFlagTexture "GF_Ravage_Static_Traders\images\GF_Spartan_Flag.jpg";	//	Set your image for the flag
_Flag setDir (random 360);


//________________ Spawn the trader	________________

_Trader_gear_group = createGroup civilian;
_Trader_gear = _Trader_gear_group createUnit ["C_Orestes", _Trader_Pos, [], 0, "FORM"];

//________________ Dress the trader with Ravage selections	________________
0 = [_Trader_gear] call rvg_fnc_equip; 
_Trader_gear setDir (random 360);

_Trader_gear setVariable ["isTrader", "rvg_gear_s", true];
_Trader_gear setVariable ["GF_rvg_gear_s", true];

//________________ Set a random animation to the trader	________________
_ambient_Anim_array  = selectRandom [
"STAND_U1",
"STAND_U2",
"STAND_U3",
"SIT_LOW",
"SIT_LOW_U"
];
[[_Trader_gear,_ambient_Anim_array, "NONE"],BIS_fnc_ambientAnim ] remoteExec ["call"];
_Trader_gear allowDamage false;
_Trader_gear disableAI "MOVE";



_Flag allowDamage false;
_Building_Pos allowDamage false;

};



//________________ Create a Marker for the Trader ________________
if (_1_Create_Markers) then {

//	systemchat "_1_Create_Markers";

//	Select your marker here:	
//	https://community.bistudio.com/wiki/cfgMarkers
{
		if (
		((_x getVariable ["GF_rvg_gear_s",false]))		
		) then {
		_marker = createMarker ["GF_Trader_gear" + str(_forEachIndex), getPos _x];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_marker";	
		_marker setMarkerColor "ColorOrange";
		_marker setMarkerSize [1,1];
		_marker setMarkerText "Gear Trader"; 
	}; 
} 
forEach allMissionObjects "All";
};

systemchat "G e a r   T r a d e r s   S p a w n e d";