


//________________	Author : GEORGE FLOROS [GR]	___________	09.04.19	___________


/*
________________	GF Explosive Objects Script - Mod	________________

https://forums.bohemia.net/forums/topic/222789-gf-explosive-objects-script-mod/

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


GF_EXO_Distance_Check_Loaded = false;

//________________	GF_Distance_Check.sqf	________________
[] execVM "GF_Explosive_Objects\GF_Distance_Check.sqf";

waituntil{GF_EXO_Distance_Check_Loaded};

	
	
	
//________________ Settings ________________
//________________ Set true or false  ________________

GF_EXO_Systemchat_info					= true;		
GF_EXO_Hintsilent_info					= true;
GF_EXO_diag_log_info					= true;
GF_EXO_Debug 							= true;

GF_EXO_Systemchat_info_count_items		= true;
GF_EXO_diag_log_info_count_items		= true;

GF_EXO_items_number 					= 100;		//	Number of the spawned items
GF_EXO_buildingPositions				= 2;		//	This way it will spawn to the buildings with >2 buildingPositions

GF_EXO_Blacklist_Zone_distance			= 1000;		//	Add here the distance from the Blacklist Zones
GF_EXO_Distance							= 200;		//	Add here the distance from players

GF_EXO_Cleaner_Spawn_Enabled			= true;		//	If true , it will clean the items and spawn them again
GF_EXO_Cleaner_Spawn_Loop				= 14400;	//	ex : every 4 hours = 14400 sec

//	There are 3 arrays with explosions , adjust below	( GF_EXO_Ammo )


//________________	GF_EXO_Exclude_List 	________________

GF_EXO_Exclude_List = [
"Land_Pier_F",
"Land_Pier_small_F",
"Land_NavigLight",
"Land_LampHarbour_F"
];




if (GF_EXO_Systemchat_info) then {
systemchat "GF Explosive Objects Script initializing";			
};	

if (GF_EXO_diag_log_info) then {
diag_log "//________________ GF Explosive Objects Script initializing ________________";
};


GF_EXO_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
GF_EXO_size = worldsize;




//________________	Array 	________________

//	add your objects in the cleaner script below 

GF_EXO_Array = [

	"Box_IND_AmmoOrd_F",
	"FlexibleTank_01_forest_F",
	"FlexibleTank_01_sand_F",
	"Land_MetalBarrel_F",
	"Land_CanisterFuel_F",
	"Land_CanisterFuel_Blue_F",
	"Land_CanisterFuel_Red_F",
	"Land_CanisterFuel_White_F",
	"Land_CanisterPlastic_F",
	"Land_GasTank_01_blue_F",
	"Land_GasTank_01_khaki_F",
	"Land_GasTank_01_yellow_F",
	"Land_GasTank_02_F",
	"Land_WeldingTrolley_01_F"
];


//	https://community.bistudio.com/wiki/Arma_3_CfgMagazines

//________________	GF_EXO_Ammo_Large	________________ 

GF_EXO_Ammo_Large = [
	
	//	Large
	"Bo_Mk82",
	"Bo_GBU12_LGB",
	"Bomb_03_F",
	"Bomb_04_F",
	"BombCluster_01_Ammo_F",
	"BombCluster_02_Ammo_F",
	"BombCluster_03_Ammo_F"
];
	

//________________	GF_EXO_Ammo_Medium	________________ 
	
GF_EXO_Ammo_Medium = [

	//	Medium
	"ATMine_Range_Ammo",
	"SatchelCharge_Remote_Ammo",
	"IEDLandBig_Remote_Ammo",
	"IEDLandSmall_Remote_Ammo",
	"IEDUrbanBig_Remote_Ammo",
	"IEDUrbanSmall_Remote_Ammo",
	"M_NLAW_AT_F",
	"M_Scalpel_AT",
	"M_AT",
	"M_PG_AT",
	"M_Air_AA",
	"M_SPG9_HE"
];


//________________	GF_EXO_Ammo_Small	________________ 

GF_EXO_Ammo_Small = [	

	//	Small
	"APERSBoundingMine_Range_Ammo",
	"APERSMine_Range_Ammo",
	"APERSTripMine_Wire_Ammo",
	"DemoCharge_Remote_Ammo"
];




//________________	3 arrays with explosions	________________ 
/*
	There are 3 arrays with explosions , adjust below	( GF_EXO_Ammo )
	GF_EXO_Ammo = ["M_NLAW_AT_F"];	//	Test

	ex :	GF_EXO_Ammo = GF_EXO_Ammo_Small;
	ex :	GF_EXO_Ammo = GF_EXO_Ammo_Large + GF_EXO_Ammo_Medium + GF_EXO_Ammo_Small;
*/

GF_EXO_Ammo = GF_EXO_Ammo_Medium + GF_EXO_Ammo_Small;




//________________	GF_EXO_Delete	________________ 

GF_EXO_Delete = {	
	uisleep 1;
	deleteVehicle _this;
};


//________________	GF_EXO_Hit	________________ 
	
GF_EXO_Hit = {	

	_this addEventHandler ["HitPart", {
	(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
	
	_target removeEventHandler ["HitPart",_thisEventHandler];
	_Ammo = selectrandom GF_EXO_Ammo createVehicle (_target modelToWorld [0,0,0]);
	_Ammo setDamage 1;
	_target spawn GF_EXO_Delete;
	}];
};	


//________________	GF_EXO_Explosion	________________ 

GF_EXO_Explosion = {	

	_this addEventHandler ["Explosion", {
	params ["_vehicle", "_damage"];
	
	_vehicle removeEventHandler ["Explosion",_thisEventHandler];
	_Ammo = selectrandom GF_EXO_Ammo createVehicle (_vehicle modelToWorld [0,0,0]);
	_Ammo setDamage 1;
	_vehicle spawn GF_EXO_Delete;
	}];
};




//________________	GF_EXO	________________ 

GF_EXO = {


_ok = false;
while {!(_ok)} do{
GF_EXO_allPlayers = [];
{if(alive _x && isPlayer _x) then{GF_EXO_allPlayers pushBack _x;};}forEach allUnits;

if(count GF_EXO_allPlayers > 0)then{
	_ok = true;
	}else{
	if (GF_EXO_Systemchat_info) then {
	//	systemchat "Waiting a Player to enter";			
	};	

	if (GF_EXO_diag_log_info) then {
	//	diag_log "//________________ Waiting a Player to enter ________________";
	};
	uisleep 1;
	};
};


waituntil{_ok};

if (GF_EXO_Systemchat_info) then {
//	systemchat "a Player entered";			
};	

if (GF_EXO_diag_log_info) then {
//	diag_log "//________________ a Player entered ________________";
};

GF_EXO_allPlayers = [];
{if(alive _x && isPlayer _x) then{GF_EXO_allPlayers pushBack _x;};}forEach allUnits;

_Buildings = nearestObjects [GF_EXO_centerPosition, ["House", "Building"], GF_EXO_size];
_a = 0;
	
while {(_a < GF_EXO_items_number) && (count GF_EXO_allPlayers > 0)} do {
	
GF_EXO_allPlayers = [];
{if(alive _x && isPlayer _x) then{GF_EXO_allPlayers pushBack _x;};}forEach allUnits;


if (typeName _Buildings != "ARRAY") exitWith {};
if (count _Buildings > 0) then {

_Building = selectRandom _Buildings;

if (!(typeOf _Building in GF_EXO_Exclude_List)) then {

	_buildingPositions = [_Building] call BIS_fnc_buildingPositions;
	_count = count _buildingPositions;
	
	if (_count > GF_EXO_buildingPositions) then {
	_buildingpos = selectRandom _buildingPositions;

	if !(_buildingpos isEqualTo [0,0,0]) then {

	_Pos = getPos _Building;

	GF_EXO_Distance_Check_initialized = false;
	GF_EXO_Distance_Check_Ok = false;

	[_Pos] call GF_EXO_Distance_Check;	
	waituntil{GF_EXO_Distance_Check_initialized};
	
	if (GF_EXO_Distance_Check_Ok isEqualTo true)then {

	
	//________________	_Loot	________________

	private ["_Loot","_Item","_Color","_Marker","_Text"];
	
	_Item = selectrandom GF_EXO_Array;
	_Text = getText (configFile >> "cfgVehicles" >> _Item >> "vehicleClass");	
	
	_Loot = createVehicle [_Item, [_buildingpos select 0, _buildingpos select 1,_buildingpos select 2], [], 0, "CAN_COLLIDE"];

	_Loot setDir (random 360);	
	_Color = "ColorEAST";	//	https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
	
	_Loot setVariable ["Var_GF_EXO_Loot",true];
	
	_Loot call GF_EXO_Hit;
	_Loot call GF_EXO_Explosion;
	
	_a = _a + 1;

	
//________________	GF_EXO_Debug	________________
	
if (GF_EXO_Debug && {!(isNull _Loot)}) then {

	_Marker_Number = format ["GF_EXO_%1",_buildingpos];
	_Marker = createMarker [_Marker_Number,getpos _Loot];		
	_Marker setMarkerShape "ICON"; 
	_Marker setMarkerType "mil_dot"; 
	_Marker setMarkerColor _Color; 
	_Marker setMarkerText _Text;	
	_Marker setMarkerSize [0.6,0.6]; 
	};		


	if (GF_EXO_Systemchat_info_count_items) then {
	systemchat format ["Items : %1",_a];
	};

	if (GF_EXO_diag_log_info_count_items) then {
	diag_log format ["Items : %1",_a];
	};

	};
};
};
};
};
};
};




if (GF_EXO_Cleaner_Spawn_Enabled) then {

[] spawn GF_EXO;


if (GF_EXO_Systemchat_info) then {
systemchat "Cleaner and Spawn Enabled";			
};	

if (GF_EXO_diag_log_info) then {
diag_log "//________________ Cleaner and Spawn Enabled ________________";
};


[]spawn	{
	while {true} do {


		//___________________	MP	___________________
		
		if (isMultiplayer) then {
		
		waitUntil{uisleep GF_EXO_Cleaner_Spawn_Loop;

		if (GF_EXO_Hintsilent_info) then {
		hintsilent "Deleting and Spawning";			
		};	

		if (GF_EXO_diag_log_info) then {
		diag_log "//________________ Deleting and Spawning ________________";
		};
		
		//___________________	cleaner script	___________________
		
		_list = nearestObjects [GF_EXO_centerPosition, [
		
			"Box_IND_AmmoOrd_F",
			"FlexibleTank_01_forest_F",
			"FlexibleTank_01_sand_F",
			"Land_MetalBarrel_F",
			"Land_CanisterFuel_F",
			"Land_CanisterFuel_Blue_F",
			"Land_CanisterFuel_Red_F",
			"Land_CanisterFuel_White_F",
			"Land_CanisterPlastic_F",
			"Land_GasTank_01_blue_F",
			"Land_GasTank_01_khaki_F",
			"Land_GasTank_01_yellow_F",
			"Land_GasTank_02_F",
			"Land_WeldingTrolley_01_F"
		], worldSize];	

		{	
		_object = _x;
		if (
	
			(isNull(attachedTo _object)) 
			&& (_x getVariable ["Var_GF_EXO_Loot",false])
			&& ({_x distance _object > GF_EXO_Distance}count GF_EXO_allPlayers > 0)
			
		)then{
		_list = _list - [_x];	
		deleteVehicle _x;	
		};
		}forEach _list;
		
		
		if (GF_EXO_Debug) then {
		{deleteMarker _x;}forEach allMapMarkers;
		};
		
		uisleep 2;
		[] call GF_EXO;
		
		
		};
		
		}else{

		//___________________	SP	___________________
		
		waitUntil{uisleep GF_EXO_Cleaner_Spawn_Loop;

		if (GF_EXO_Hintsilent_info) then {
		hintsilent "Deleting and Spawning";			
		};	

		if (GF_EXO_diag_log_info) then {
		diag_log "//________________ Deleting and Spawning ________________";
		};
		
		//___________________	cleaner script	___________________
		
		_list = nearestObjects [GF_EXO_centerPosition, [
		
			"Box_IND_AmmoOrd_F",
			"FlexibleTank_01_forest_F",
			"FlexibleTank_01_sand_F",
			"Land_MetalBarrel_F",
			"Land_CanisterFuel_F",
			"Land_CanisterFuel_Blue_F",
			"Land_CanisterFuel_Red_F",
			"Land_CanisterFuel_White_F",
			"Land_CanisterPlastic_F",
			"Land_GasTank_01_blue_F",
			"Land_GasTank_01_khaki_F",
			"Land_GasTank_01_yellow_F",
			"Land_GasTank_02_F",
			"Land_WeldingTrolley_01_F"
		], worldSize];	
		
		{	
		_object = _x;
		if (
	
			(isNull(attachedTo _object))  
			&& (_x getVariable ["Var_GF_EXO_Loot",false])
			&& ((_x distance player) > GF_EXO_Distance)
			
		) then {
		_list = _list - [_x];		
		deleteVehicle _x;	
		};
		}forEach _list;
		
		
		if (GF_EXO_Debug) then {
		{deleteMarker _x;}forEach allMapMarkers;
		};
		
		uisleep 3;
		[] call GF_EXO;
		};
		
		};
	};	
};

}else{

[] spawn GF_EXO;
};




if (GF_EXO_Systemchat_info) then {
systemchat "GF Explosive Objects Script initialized";			
};	

if (GF_EXO_diag_log_info) then {
diag_log "//________________ GF Explosive Objects Script initialized ________________";
};