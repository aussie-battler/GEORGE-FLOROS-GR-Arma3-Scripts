


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


//________________ Missions Settings _____________
//________________ Set true or false  _____________

//________________ You can disable them completly in the Missions_init _____________

_EOS_Spawn 					= false;					
_DAC_Spawn 					= false;					
_Custom_Spawn 				= false;					




sleep GF_Missions_Wait_Time;

diag_log "//________________	12_Find_Intel.sqf	Initializing	_____________";
diag_log "________________	taskSetState	12_Find_Intel_1	________________";
diag_log "________________	taskSetState	12_Find_Intel_2	________________";


if (GF_Missions_Systemchat_info) then {
systemchat "12_Find_Intel Initializing";
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Select the spawn Position	________________
/*
//________________	To use this add	________________
GF_Missions_pos = [] call GF_Missions_Pos_isFlatEmpty;	

//________________	There is a test spawn inside the script	________________
//________________	uncomment and use ex : 	________________ 
[]spawn GF_Missions_Pos_isFlatEmpty;

GF_Missions_Pos_isEmpty
GF_Missions_Pos_isFlat
GF_Missions_Pos_isFlatEmpty

GF_Missions_Pos_Random_Building
GF_Missions_Pos_Residential

GF_Missions_Pos_Airport_Tanoa_Only
GF_Missions_Pos_Hill
GF_Missions_Pos_Mount
GF_Missions_Pos_NameCity
GF_Missions_Pos_NameCityCapital
GF_Missions_Pos_NameLocal
GF_Missions_Pos_NameMarine
GF_Missions_Pos_NameVillage

GF_Missions_Pos_ShoreLine_Shore
GF_Missions_Pos_ShoreLine_Water
GF_Missions_Pos_Found
*/


//________________	Select the spawn Position	________________

GF_Missions_pos = [] call GF_Missions_Pos_Residential;


waitUntil {GF_Missions_pos_initialized};
waitUntil {time >5};

//________________	This will be used for DAC and any other position will be as	 _2 , _3 , etc	________________
_Pos_1 = GF_Missions_pos;



//________________	Spawn Objects	________________

//________________	GF_Missions_Police_Offroad	________________

_Offroad = "C_Offroad_01_white_F" createVehicle _Pos_1;

GF_Missions_Police_Offroad_Pos = _Pos_1;
_Offroad spawn GF_Missions_Police_Offroad;




///////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//________________	Enemies spawn commands	________________
/*
//________________	Examples :	________________
//________________	add this to Spawn one	________________
[] spawn GF_Missions_Spawn_Infantry_Patrol;

//________________ add this to Spawn the Number  ________________
for "_i" from 0 to 3 do {
[] spawn GF_Missions_Spawn_Infantry_Patrol;
sleep 3;
};
//________________	Examples :	________________


//________________	Infantry spawn commands	________________

//________________	Infantry	________________
[] spawn GF_Missions_Spawn_Infantry_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Defend;
[] spawn GF_Missions_Spawn_Infantry_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry;

//________________	Infantry_Divers	________________
[] spawn GF_Missions_Spawn_Infantry_Divers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Divers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Divers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Divers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Divers;

//________________	Infantry_Paratroopers	________________
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Paratroopers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Paratroopers;

//________________	Infantry_Recon	________________
[] spawn GF_Missions_Spawn_Infantry_Recon_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Recon_Defend;
[] spawn GF_Missions_Spawn_Infantry_Recon_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Recon;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Recon;

//________________	Infantry_Recon_SF	________________
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Defend;
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Recon_SF;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Recon_SF;

//________________	Infantry_SF	________________
[] spawn GF_Missions_Spawn_Infantry_SF_Patrol;
[] spawn GF_Missions_Spawn_Infantry_SF_Defend;
[] spawn GF_Missions_Spawn_Infantry_SF_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_SF;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_SF;

//________________	Infantry_SF_Urban	________________
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Patrol;
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Defend;
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_SF_Urban;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_SF_Urban;

//________________	Infantry_Snipers	________________
[] spawn GF_Missions_Spawn_Infantry_Snipers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Snipers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Snipers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Snipers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Snipers;


//________________	Vehicles spawn commands	________________

//________________	Armoured_Vehicles	________________
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Patrol;
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Defend;
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Attack;

//________________	Boats	________________
[] spawn GF_Missions_Spawn_Boats_Patrol;
[] spawn GF_Missions_Spawn_Boats_Defend;
[] spawn GF_Missions_Spawn_Boats_Attack;

//________________	Helicopters	________________
[] spawn GF_Missions_Spawn_Helicopters_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Attack;

//________________	Helicopters_Attack	________________
[] spawn GF_Missions_Spawn_Helicopters_Attack_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Attack_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Attack_Attack;

//________________	Helicopters_Transport_	________________
[] spawn GF_Missions_Spawn_Helicopters_Transport_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Transport_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Transport_Attack;

//________________	Land_Vehicles	________________
[] spawn GF_Missions_Spawn_Land_Vehicles_Patrol;
[] spawn GF_Missions_Spawn_Land_Vehicles_Defend;
[] spawn GF_Missions_Spawn_Land_Vehicles_Attack;

//________________	Planes	________________
[] spawn GF_Missions_Spawn_Planes_Patrol;
[] spawn GF_Missions_Spawn_Planes_Defend;
[] spawn GF_Missions_Spawn_Planes_Attack;

//________________	Static_Weapons	________________
[] spawn GF_Missions_Spawn_Static_Weapons;

//________________	END of examples	________________
*/




if (GF_Missions_Custom_Spawn) then {

//________________	GF_Missions_Custom_Spawn	________________

if (_Custom_Spawn) then {

//________________	add _possibility	________________

_possibility			= floor (random 10) < 3;


if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Infantry_Defend;
sleep 3;
};
};

if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Infantry_Snipers_Patrol;
sleep 3;
};
};

if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Patrol;
sleep 3;
};
};

if (_possibility) then {
for "_i" from 0 to random 4 do {
[] spawn GF_Missions_Spawn_Static_Weapons;
sleep 3;
};
};




if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Defend;
};
};

if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Helicopters_Attack_Defend;
};
};

if (_possibility) then {
for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Planes_Defend;
};
};


};
};
//________________	GF_Missions_Custom_Spawn End	________________




//________________	createMarker	________________
 
 if (_EOS_Spawn or _DAC_Spawn) then {
 
_EOS_Marker = createMarker ["EOS_Marker", _Pos_1];
_EOS_Marker setMarkerShape "ELLIPSE";
_EOS_Marker setMarkerSize [GF_Missions_DAC_Area_Spawn_Meters,GF_Missions_DAC_Area_Spawn_Meters];
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (GF_Missions_DAC_Spawn) then {

//________________	DAC	________________


if (_DAC_Spawn) then {

/*
	________________	DAC	________________
	http://www.armaholic.com/page.php?id=25550
	https://forums.bohemia.net/forums/topic/167033-dac-v31-dynamic-ai-creator-released/
*/

//________________	add a unique name for the DAC zone	________________

waituntil{DAC_NewZone == 0};
_DAC_Values = [
//________________	DAC Tutorial Readme	________________
//	http://www.realisticarma.com/images/Bilder/Missionsbau/Skripte/DAC%20V3.1%20Readme.pdf

//_Create_DAC_Zone = ["A",[B,C,D,E],[F],[G],[H],[I],[J,K,L,M,N]] spawn DAC_Zone;

//	A Name of the zone (Trigger), please define as string (the given name here must be the same one which has been given to the trigger)
"EOS_Marker",
//	B The ID Number of the Zone (an arbitrary number), to connect zones which each other (same ID = connect zones, unambiguous ID = zone runs local)
[1,

//	C Status of the zone when zone has been initiated. 0 = zone keeps activated, 1 = zone will be deactivated
0,

//	D Statement of a valid number out of the DAC_Config_Events, default = 0 (means that no events will be processed).
0

//	E Only specify if the groups should have zero waypoints in their master zone (the parameter can be specified as an option).
//	optional
],
//	F Array to generate Infantry [5,2,50,10] generates Infantry 5 times, size of groups 2, 50 WP altogether, 10 wp per group
[(3 + (round(random 6))),3,50,5],

//	G Array to generate Wheeled vehicles [3,2,30,5] generates vehicles 3 times, size of groups 2, 30 WP altogether, 10 wp per group
[(1 + (round(random 2))),2,30,5],

//	H Array to generate Tracked vehicles [5,1,40,8] generates tanks 5 times, size of groups 1, 40 WP altogether, 8 WP per group
[(1 + (round(random 2))),1,20,5],

//	I Array to generate Helicopters [3,2,5] generates Helicopters 3 times Size of groups 2 (if cargo is used), 5 WP per group
//	or Array to generate DAC camps [1,2,50,0,100,10] generates 1 Camp Size of group 2, radius 50 meters, Vehicles and Infantry, 100%, 10 resapwns
//	*** CAUTION Spawning Helicopters in a NON Flat position , can stop DAC from working *** you can spawn a Camp or static instead
[],		//	[(1 + (round(random 2))),4,5],

//	J Zone belongs to Site > 0 = East, 1 = West, 2 = RACS, 3 = civilian (for more see readme page 7)
[0,	

//	K Unit configuration of the zone (DAC_Config_Units) > default units = 0 for East, 1 for West, 2 for RACS, 3 for civilians
5,	//	Custom editable Units in GF_Missions\Custom_Units_Array.sqf

//	L Behaviour configuration of the zone (DAC_Config_Behaviour) > default behaviour = 0 for East, 1 for West, 2 for RACS, 3 for civilian
0,	

//	M Camp configuration of the zone (DAC_Config_Camps) > needed only if 1 camp minimum will be generated in the respective zone.
0

//	N Waypoint configuration of the zone (DAC_Config_Waypoints) > parameter is optional. Config 0 will be used if there is no value defined (default)
//	optional
]];

[_Pos_1,GF_Missions_DAC_Area_Spawn_Meters,GF_Missions_DAC_Area_Spawn_Meters,0,0,_DAC_Values] call DAC_fNewZone;
waituntil{DAC_NewZone == 0};

};
};
//________________	End of DAC	________________




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (GF_Missions_EOS_Spawn) then {

//________________	EOS	________________

if (_EOS_Spawn) then {


/*
GROUP SIZES KEY
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20
 
NOTE: FOR 100% PROBABILITY OF UNITS SPAWNING SET 3rd PARAMETER TO 100 OR LEAVE EMPTY.
House Patrol groups spawn in buildings within the marker. After spawning each group will remain inside buildings. 
To spawn 1 house patrol  groups - [1,2] 
Spawn 3 house patrol groups with 50% probability of spawning - [3,2,50] 
To spawn a group with between 2 and 4 units - [1,1]
Spawn three groups with between 16 and 20 units and a 70% probability of spawning - [3,5,70]

Patrolling Infantry spawn anywhere within the marker. After spawning each group will be given waypoints and patrol the marker. 
To spawn 1 group of infantry  - [1,2] 
Spawn 3 patrol groups with 50% probability of spawning - [3,2,50] 
To spawn a group with between 2 and 4 units - [1,1]
Spawn three groups with between 16 and 20 units and a 70% probability of spawning - [3,5,70]

Motorised Infantry spawn anywhere within the marker. After spawning each group will be given waypoints and patrol the marker. Motorised infantry are light vehicles and carry units in the free seats.
To spawn 1 motorised infantry  - [1,2] 
Spawn 3 motorised infantry  with 50% probability of spawning - [3,2,50] 
Cargo with between 2 and 4 units - [1,1]
Cargo with between 16 and 20 units - [3,5]

Armoured Vehicles spawn within the marker. Similar to Motised infantry except they do not carry cargo. 
Spawn 3 armoured vehicles with 50% probability of spawning - [3,50] 
Spawn 3 armoured vehicles with 100% probability of spawning - [3] 
Helicopters spawn outside the marker and fly towards the zone. If the helicopter cargo is 0 then an attack helicopter will spawn. If the helicopter cargo is above 0 then a transport helicopter will carry units into the marker and land.
Spawn 1 transport helicopter with cargo and 75% probability of spawning - [1,3,75] 
Spawn 1 Attack helicopter and 15% probability of spawning - [1,0,15] 
 */

 
//________________	EOS_Spawn	________________

[["EOS_Marker"],									//	Marker Names
[1 + (round(random 3)), 2 + (round(random 10))],	//	House Patrol Groups	[Number of Groups , Size of each Group]
[1 + (round(random 2)), 1 + (round(random 8))],		//	Patroling Infantry
[],													//	Motorized Infantry	[(round(random 2)),(round(random 2))]
[],													//	Armoured Vehicles
[],													//	Static Weapons
[(round(random 2)),									//	Helicopters
(round(random 6))],									//	Helicopter Cargo
[GF_Missions_EOS_Faction,							//	Faction
GF_Missions_EOS_Marker_Type,						//	Marker Type , 0 = Highlight , 1 = Invinsible , 2 Normal 
GF_Missions_EOS_Spawn_Distance,						//	Spawn Distance
GF_Missions_Enemy_Side,								//	Unit Side
GF_Missions_EOS_HEIGHTLIMIT,						// 	HEIGHTLIMIT
GF_Missions_Debug_EOS								//	DEBUG
]] call EOS_Spawn;

};
};
//________________	End of EOS	________________




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Set Task 1	________________

[GF_Missions_allPlayers,["12_Find_Intel_1","GF_Missions_Pack"],["Move to Location","Move to Location",""], _Offroad,true,1,true,"move",true] call BIS_fnc_taskCreate;
["12_Find_Intel_1","ASSIGNED",true] spawn BIS_fnc_taskSetState;


diag_log "//________________	12_Find_Intel.sqf	Initialized	_____________";

if (GF_Missions_Systemchat_info) then {
systemchat "12_Find_Intel.sqf	Initialized";
};	
	
	


///////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//________________	GF_Missions_Time_out_mission_fail	________________

if (GF_Missions_Time_out_mission_fail) then {

GF_Missions_Time_Out_Fail = false;
GF_Missions_Time_Out = false;
[] spawn {
sleep GF_Missions_Set_the_sec_for_fail;
GF_Missions_Time_Out_Fail = true;
sleep 80;
GF_Missions_Time_Out = true;
};

[] spawn {
while {!GF_Missions_Time_Out} do {

if (GF_Missions_Systemchat_info) then {
systemchat "Check for GF_Missions_Time_Out";
};

sleep 50;

if (GF_Missions_Time_Out_Fail) then { 

GF_Missions_Time_Out = true;

if (GF_Missions_Systemchat_info) then {
systemchat "GF_Missions_Time_Out";
};

//________________	Set mission_fail	________________

["12_Find_Intel_1","FAILED",true] spawn BIS_fnc_taskSetState;
["12_Find_Intel_2","FAILED",true] spawn BIS_fnc_taskSetState;
["12_Find_Intel_3","FAILED",true] spawn BIS_fnc_taskSetState;
["12_Find_Intel_4","FAILED",true] spawn BIS_fnc_taskSetState;

sleep 5;

if (GF_Missions_Systemchat_info) then {
systemchat "saving Game Wait";
systemchat "Next mission";
};	

if (GF_Missions_saveGame) then {
sleep 2;
saveGame;
};
	
null = []execVM "GF_Missions\Missions_init.sqf";
};
};
};

};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Check Task	________________

	
	waitUntil { { _x distance _Offroad < 15 } count GF_Missions_allPlayers > 0 };
	
/*
_Trigger_Present = createTrigger ["EmptyDetector", _Pos_1];
_Trigger_Present setTriggerArea [GF_Missions_Attack_Distance, GF_Missions_Attack_Distance, 0, false];
_Trigger_Present setTriggerActivation ["EAST", "PRESENT", false];
_Trigger_Present setTriggerStatements ["this","",""];

waitUntil {count list _Trigger_Present > 4};		
waitUntil {count list _Trigger_Present < 3};	
waitUntil { { _x distance _Trigger_Present < GF_Missions_Attack_Distance } count GF_Missions_allPlayers > 0 ;};
waitUntil {!alive _Target_1};

deleteVehicle _Trigger_Present;
*/


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Task SUCCEEDED	________________

["12_Find_Intel_1", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;			
sleep 5;



//________________	Select the spawn Position	________________

GF_Missions_pos = [] call GF_Missions_Pos_Random_Building;


waitUntil {GF_Missions_pos_initialized};
waitUntil {time >5};

//________________	This will be used for DAC and any other position will be as	 _2 , _3 , etc	________________
_Pos_1 = GF_Missions_pos;

GF_Missions_Intel_Pos = _Pos_1;
[] spawn GF_Missions_Intel;



///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Set Task 2	________________

_Mission_Pos =  [[[_Pos_1, 25 + random 100]],["water"]] call BIS_fnc_randomPos;

[GF_Missions_allPlayers,["12_Find_Intel_2","GF_Missions_Pack"],["Find Intel","Find Intel",""], _Mission_Pos,true,1,true,"search",true] call BIS_fnc_taskCreate;
["12_Find_Intel_2","ASSIGNED",true] spawn BIS_fnc_taskSetState;
		


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Check Task	________________
	
waitUntil { { _x distance _Pos_1 < 1.8 } count GF_Missions_allPlayers > 0 };

["12_Find_Intel_2", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;




//________________	Select the spawn Position	________________

GF_Missions_pos = [] call GF_Missions_Pos_Random_Building;


waitUntil {GF_Missions_pos_initialized};
waitUntil {time >5};

//________________	This will be used for DAC and any other position will be as	 _2 , _3 , etc	________________
_Pos_1 = GF_Missions_pos;




//________________ Spawn the HVT	________________

_HVT = createGroup civilian;
GF_Missions_HVT_12 = _HVT createunit [GF_Missions_Pool_Civilian select floor(random count GF_Missions_Pool_Civilian),_Pos_1,[],0,"None"];
[GF_Missions_HVT_12] JoinSilent _HVT;

removeAllWeapons GF_Missions_HVT_12;
removeAllItems GF_Missions_HVT_12;
removeAllAssignedItems GF_Missions_HVT_12;
removeVest GF_Missions_HVT_12;
removeBackpack GF_Missions_HVT_12;
removeGoggles GF_Missions_HVT_12;

if (GF_Missions_Change_Equipment) then {	
GF_Missions_HVT_12 spawn GF_SCL_GF_Missions_civilian;
};


_Goggles = selectRandom GF_SCL_GF_Missions_Goggles_array;
_Headgear = selectRandom GF_SCL_GF_Missions_Headgear_array;  
_Vests = selectRandom GF_SCL_GF_Missions_Vests_array; 
_Backpacks = selectRandom GF_SCL_GF_Missions_Backpacks_array;


//	add possibility 
if (floor (random 10) < 6) then {GF_Missions_HVT_12 addGoggles _Goggles;};
if (floor (random 10) < 5) then {GF_Missions_HVT_12 addHeadgear _Headgear;};
if (floor (random 10) < 4) then {GF_Missions_HVT_12 addVest _Vests;};
if (floor (random 10) < 3) then {GF_Missions_HVT_12 addBackpack _Backpacks;};



[] spawn GF_Missions_Spawn_Infantry_Civilians_Patrol;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Set Task 3	________________

_Mission_Pos =  [[[_Pos_1, 25 + random 100]],["water"]] call BIS_fnc_randomPos;

[GF_Missions_allPlayers,["12_Find_Intel_3","GF_Missions_Pack"],["We know now the location of the HVT. Eliminate the HVT","Eliminate the HVT",""], _Mission_Pos,true,1,true,"kill",true] call BIS_fnc_taskCreate;
["12_Find_Intel_3","ASSIGNED",true] spawn BIS_fnc_taskSetState;
	


	waitUntil { { _x distance GF_Missions_HVT_12 < 10 } count GF_Missions_allPlayers > 0 };
	GF_Missions_HVT_12 enableai "MOVE";
		
	
	//________________	Change Behaviour	________________
	GF_Missions_HVT_12 setBehaviour "AWARE";	//	AWARE	STEALTH	COMBAT
	GF_Missions_HVT_12 setCombatMode "RED";		//	YELLOW	RED
	
	//________________	Change Side	________________	
	_Join_East = creategroup east; 	
	units GF_Missions_HVT_12 joinSilent _Join_East; 
	[_Join_East, _Pos_1] call BIS_fnc_taskAttack;
 
 	//________________	Arm	________________
	for "_i" from 1 to 6 do {GF_Missions_HVT_12 addItemToUniform "30Rnd_65x39_caseless_green";};
	GF_Missions_HVT_12 addItemToUniform "FirstAidKit";
	GF_Missions_HVT_12 addItemToUniform "SmokeShell";
	GF_Missions_HVT_12 addItemToUniform "HandGrenade";
	GF_Missions_HVT_12 addItemToUniform "MiniGrenade";

	comment "Add weapons";
	GF_Missions_HVT_12 addWeapon "arifle_Katiba_C_F";
	GF_Missions_HVT_12 addPrimaryWeaponItem "muzzle_snds_H";
	GF_Missions_HVT_12 addPrimaryWeaponItem "optic_DMS";
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Check Task	________________
	
waitUntil {!alive GF_Missions_HVT_12;};

["12_Find_Intel_3", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
sleep 5;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Set Task 4	________________

[GF_Missions_allPlayers,["12_Find_Intel_4","GF_Missions_Pack"],["The HVT has set a Trap! , Eliminate all threats! ","It is a Trap! Eliminate all threats!",""], _Pos_1,true,1,true,"kill",true] call BIS_fnc_taskCreate;
["12_Find_Intel_4","ASSIGNED",true] spawn BIS_fnc_taskSetState;



call{
	_changing = allUnits select {(side _x isEqualTo civilian) &&  (!isPlayer _x)};
	_changing apply { 
	units _x joinSilent _Join_East;	
	[_Join_East, _Pos_1] call BIS_fnc_taskAttack;


//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom GF_SCL_GF_Missions_primaryWeapon_array;

//________________	add _Primary_Weapon's mags	________________

_Primary_Weapon_Magazines = getArray (configFile / "CfgWeapons" / _Primary_Weapon / "magazines");
_Spawn_Primary_Weapon_magazines = selectRandom _Primary_Weapon_Magazines; 
		
comment "Add weapons";
_x addWeapon _Primary_Weapon;

for "_i" from 1 to 2 do {_x addItemToUniform "FirstAidKit";};
for "_i" from 1 to 1 do {_x addItemToVest "HandGrenade";};

for "_i" from 1 to 2 do {_x addItemToVest "SmokeShell";};
for "_i" from 1 to 1 do {_x addItemToVest "HandGrenade";};
for "_i" from 1 to 1 do {_x addItemToVest "MiniGrenade";};

for "_i" from 1 to 6 do {_x addItemToUniform _Spawn_Primary_Weapon_magazines;};
for "_i" from 1 to 2 do {_x addItemToVest _Spawn_Primary_Weapon_magazines;}; 
for "_i" from 1 to 2 do {_x addItemToBackpack _Spawn_Primary_Weapon_magazines;};

//________________	reload_Primary_Weapon	________________
_x selectweapon primaryWeapon _x;
reload _x;

comment "Add items";
//	add possibility 
if (floor (random 10) < 4) then {_x linkItem "ItemMap";};
if (floor (random 10) < 4) then {_x linkItem "ItemCompass";};
if (floor (random 10) < 4) then {_x linkItem "ItemWatch";};
if (floor (random 10) < 4) then {_x linkItem "ItemGPS";};
	
};};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Check Task	________________
	
waitUntil {({alive _x} count units _Join_East) < 2;};

["12_Find_Intel_4", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
sleep 5;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	DAC_fDeleteZone , deleteMarker	________________

if (_DAC_Spawn) then {
if (GF_Missions_DAC_Spawn) then {
["EOS_Marker"] call DAC_fDeleteZone;
sleep 1;
};
};

if (_EOS_Spawn) then {
if (GF_Missions_EOS_Spawn) then {
deleteMarker "EOS_Marker";
sleep 1;
};	
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Mission End	________________

GF_Missions_Time_Out = true;


if (GF_Missions_Systemchat_info) then {
systemchat "saving Game Wait";
systemchat "Next mission";
};	

if (GF_Missions_saveGame) then {
sleep 2;
saveGame;
};
	
null = []execVM "GF_Missions\Missions_init.sqf";