


//________________  Author : [GR]GEORGE F ___________ 01.08.18 _____________

/*
________________ GF Cleanup Script ________________

https://forums.bohemia.net/forums/topic/216359-gf-cleanup-script/

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


/*
You can exclude certain objects , by adding in the init of the object , in the editor or include in the scripted spawn

this setVariable ["GF_Excude_from_cleanup",true];

It is possible to create an Exclude Zone , by creating a marker.
There are already 5 created in the editor as a working example , that you can just copy paste them in your mission.
*/


//________________	Set true or false for Debug , you can add this also to an initServer.sqf	_____________

_Debug_info = false;


if (_Debug_info) then {
[] spawn {
	while {true} do {
    _time = diag_tickTime + 5;	//	every  50 second
    _i = 0;
    waitUntil {
	sleep 1;
    _i = _i + 1;		
    diag_tickTime >= _time
    };	
	
diag_log format ["FPS : %1    ||    Objects : %2    ||    allUnits : %3",round diag_fps,count allMissionObjects "All",count allUnits,{count _x;}];
systemchat format ["FPS : %1    ||    Objects : %2    ||    allUnits : %3",round diag_fps,count allMissionObjects "All",count allUnits,{count _x;}];	

	};
};
};




//	If you want the script to run only in the server use the code below
if(!isServer) exitWith {};

diag_log "//________________ GF Cleanup Script _____________";

systemchat "GF Cleanup Script    I n i t i a l i z e d";

//________________ GF Cleanup Script _____________



//________________	Add here your Exclude Zone ( for more )	________________

GF_Exclude_Zone_1 = getMarkerPos "GF_Exclude_Zone_1";
GF_Exclude_Zone_2 = getMarkerPos "GF_Exclude_Zone_2";
GF_Exclude_Zone_3 = getMarkerPos "GF_Exclude_Zone_3";
GF_Exclude_Zone_4 = getMarkerPos "GF_Exclude_Zone_4";
GF_Exclude_Zone_5 = getMarkerPos "GF_Exclude_Zone_5";

//________________	Add here the distance for the Exclude Zone or add your desired	________________
//	ex:	((_x distance GF_Exclude_Zone_1) > 50) 	//meters

GF_Exclude_Zone_distance	= 30;	//	meters for the test mission



//________________	For continuous run (loop the script) use :	________________
while {true} do {

//________________	For one run only , with a radio trigger or addaction use :	________________
//	[]spawn	{	


//________________ Settings _____________
//________________ Set true to delete or false  _____________

_Systemchat_Enabled				= false;	//	Show notifications
_Show_info 						= false;	//	Show notification , counting all the list

_Time_to_next_category			= 10;	// 	The time to move to the next clean category 

_Delete_distance				= 2000;	//	Meters distance from Players to delete the items

_1_Blood_Stains					= true; //	This is for my Blood Stains script  https://forums.bohemia.net/forums/topic/217136-gf-blood-stains-and-sfx-script/
_2_Particlesource  				= true; 
_3_Dead_Men	 					= true;            
_4_Mines 						= false;           
_5_Ruins 						= false;           
_6_Craters 						= false; 		  
_7_Dropped_Items 				= false;
_8_Static_Weapon				= false;
_9_Empty_Groups 				= false;             
_10_Empty_Vehicles				= false;
_11_Destructed_Vehicles			= false;
_12_EmptyDetector_MP_triggers 	= false;
_13_Plane_Parts					= false; 
_14_Destruction_Crater			= false; 

//________________ set the time to run / loop _____________

sleep 900;	//	set the time , in how many second to delete again , if you select to be on continuous (loop)



//________________ Cleanup Start ________________

_allPlayers = allUnits select {isPlayer _x && {!(_x isKindOf "HeadlessClient_F")}};
_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");


if (_Show_info) then {
oneachframe {hintsilent format ["FPS : %1    ||    Objects : %2    ||    allUnits : %3",round diag_fps,count allMissionObjects "All",count allUnits,{count _x;}]}
//systemchat format ["FPS : %1    ||    Objects : %2    ||    allUnits : %3",round diag_fps,count allMissionObjects "All",count allUnits,{count _x;}];	
};



if (_Systemchat_Enabled) then {
systemchat "Cleanup Start";
};	

	
//________________ _1_Blood_Stains _____________		
if (_1_Blood_Stains) then {
		
//	This is for my Blood Stains script , you can add here any item that you want to be deleted

if (_Systemchat_Enabled) then {
systemchat "_1_Blood_Stains";
};	
	
	_BloodSplatter = nearestObjects [_centerPosition, [
	"BloodSplatter_01_Large_New_F",
	"BloodSplatter_01_Medium_New_F",
	"BloodSplatter_01_Small_New_F",
	"BloodSpray_01_New_F",
	"BloodPool_01_Large_New_F",
	"BloodPool_01_Medium_New_F",
	"BloodTrail_01_New_F",
	"UserTexture1m_F",
	"UserTexture_1x2_F"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {		
	_BloodSplatter = _BloodSplatter - [_x];  		
	deleteVehicle _x};
	} forEach _BloodSplatter;
	sleep _Time_to_next_category;
};
	

//________________ _2_Particlesource _____________	
if (_2_Particlesource) then {

if (_Systemchat_Enabled) then {
systemchat "_2_Particlesource";
};		
	
	_Particlesource	= nearestObjects [_centerPosition, [
	"#particlesource"
	]
	, worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {	
	_Particlesource = _Particlesource - [_x];  		
	deleteVehicle _x};
	} forEach _Particlesource;
	sleep _Time_to_next_category;
};
	

//________________ _3_Dead_Men _____________				
if (_3_Dead_Men) then { 

if (_Systemchat_Enabled) then {
systemchat "_3_Dead_Men";
};		
	
	_Dead_Men = nearestObjects [_centerPosition, [
	"CAManBase"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	(!(alive _x)) && {(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {	
	_Dead_Men = _Dead_Men - [_x];  		
	deleteVehicle _x};
	} forEach _Dead_Men;
	sleep _Time_to_next_category;
};
	 
	
//________________ _4_Mines _____________	
if (_4_Mines) then { 

if (_Systemchat_Enabled) then {
systemchat "_4_Mines";
};		
	
	//	https://forums.bohemia.net/forums/topic/186418-returning-nearest-mine-reliably-around-player/?tab=comments#comment-2946819
	
	_Mines = nearestObjects [_centerPosition, [
	"timebombcore",
	"mineBase",
	"MineGeneric"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {	
	_Mines = _Mines - [_x];  		
	deleteVehicle _x};
	} forEach _Mines;
	sleep _Time_to_next_category;
};
	
	
//________________ _5_Ruins _____________	
if (_5_Ruins) then { 

if (_Systemchat_Enabled) then {
systemchat "_5_Ruins";
};		
	
	_Ruins	= nearestObjects [_centerPosition, [
	"ruins"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {			
	_Ruins = _Ruins - [_x];  		
	deleteVehicle _x};
	} forEach _Ruins;
	sleep _Time_to_next_category;
};
	
	
//________________ _6_Craters _____________	
if (_6_Craters) then {

if (_Systemchat_Enabled) then {
systemchat "_6_Craters";
};		
	
	_Craters	= nearestObjects [_centerPosition, [
	"Crater",
	"CraterLong",
	"CraterLong_small"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {	
	_Craters = _Craters - [_x];  		
	deleteVehicle _x};
	} forEach _Craters;
	sleep _Time_to_next_category;
};
	
	
//________________ _7_Dropped_Items _____________		
if (_7_Dropped_Items) then { 

if (_Systemchat_Enabled) then {
systemchat "_7_Dropped_Items";
};		
	
	_Dropped_Items	= nearestObjects [_centerPosition, [
	"WeaponHolder"
	//	"groundWeaponHolder",
	//	"WeaponHolderSimulated"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {				
	_Dropped_Items = _Dropped_Items - [_x];  		
	deleteVehicle _x};
	} forEach _Dropped_Items;
	sleep _Time_to_next_category;
};
	
	
//________________ _8_Static_Weapon _____________		
if (_8_Static_Weapon) then { 

if (_Systemchat_Enabled) then {
systemchat "_8_Static_Weapon";
};	
	
	_Static_Weapon	= nearestObjects [_centerPosition, [
	"staticWeapon"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {		
	_Static_Weapon = _Static_Weapon - [_x];  		
	deleteVehicle _x};
	} forEach _Static_Weapon;
	sleep _Time_to_next_category;
};
	
	
//________________ _9_Empty_Groups _____________	
if (_9_Empty_Groups) then { 

if (_Systemchat_Enabled) then {
systemchat "_9_Empty_Groups";
};	
	
	{if ((count units _x) isEqualTo 0) then {deleteGroup _x}} forEach allGroups;
	sleep _Time_to_next_category;
};
	
	
//________________ _10_Empty_Vehicles _____________	
if (_10_Empty_Vehicles) then { 
	
if (_Systemchat_Enabled) then {
systemchat "_10_Empty_Vehicles";
};			
	
	_vehicles = nearestObjects [_centerPosition, ["Car","Tank","Air","Ship"], worldSize];				
		
	_Exclude_Vehicles_List = [
	//"B_MRAP_01_F",
	"B_Heli_Light_01_dynamicLoadout_F"
	]; 
		
	{	
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!((typeOf _x) in _Exclude_Vehicles_List))  && 
	(!(_x getVariable ["GF_Excude_from_cleanup",false])) && {(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)} 
	&& ((count (crew _Delete_this)) isEqualTo 0)
	
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
		
	) then {
	_vehicles = _vehicles - [_x];
	deleteVehicle _x};
	} forEach _vehicles;
	sleep _Time_to_next_category;
};


//________________ _11_Destructed_Vehicles _____________	
if (_11_Destructed_Vehicles) then { 

if (_Systemchat_Enabled) then {
systemchat "_11_Destructed_Vehicles";
};			
	
	_Destructed_Vehicles = nearestObjects [_centerPosition, ["Car","Tank","Air","Ship"], worldSize];				
		
	_Exclude_Destructed_Vehicles_List = [
	//"B_MRAP_01_F",
	"B_Heli_Light_01_dynamicLoadout_F"
	]; 
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!((typeOf _x) in _Exclude_Destructed_Vehicles_List)) && 
	(damage _x == 1 || {!canMove _x}) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
	&& ((count (crew _Delete_this)) isEqualTo 0)
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {	
	_Destructed_Vehicles = _Destructed_Vehicles - [_x];   
	deleteVehicle _x};
	} forEach _Destructed_Vehicles;
	sleep _Time_to_next_category;
};
	
	
//________________ _12_EmptyDetector_MP_triggers _____________	
if (_12_EmptyDetector_MP_triggers) then { 

if (_Systemchat_Enabled) then {
systemchat "_12_EmptyDetector_MP_triggers";
};		

	_EmptyDetector_MP_triggers	= nearestObjects [_centerPosition, [
	"emptyDetector"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {		
	_EmptyDetector_MP_triggers = _EmptyDetector_MP_triggers - [_x];  		
	deleteVehicle _x};
	} forEach _EmptyDetector_MP_triggers;
	sleep _Time_to_next_category;
};
			
	
//________________ _13_Plane_Parts _____________	
if (_13_Plane_Parts) then {

if (_Systemchat_Enabled) then {
systemchat "_13_Plane_Parts";
};				
	
	_Plane_Parts	= nearestObjects [_centerPosition, [
	"I_Ejection_Seat_Plane_Fighter_03_F",
	"B_Ejection_Seat_Plane_CAS_01_F",
	"O_Ejection_Seat_Plane_CAS_02_F",
	"O_Ejection_Seat_Plane_Fighter_02_F",
	"I_Ejection_Seat_Plane_Fighter_04_F",
	"B_Ejection_Seat_Plane_Fighter_01_F",
	"Plane_Canopy_Base_F",
	"Ejection_Seat_Base_F"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {	
	_Plane_Parts = _Plane_Parts - [_x];  		
	deleteVehicle _x};
	} forEach _Plane_Parts;
	sleep _Time_to_next_category;
};
	
	
//________________ _14_Destruction_Crater _____________	it's not working!
if (_14_Destruction_Crater) then { 

if (_Systemchat_Enabled) then {
systemchat "_14_Destruction_Crater";
};		
	
	_Destruction_Crater	= nearestObjects [_centerPosition, [
	"explosion",
	"Crater"
	], worldSize];
	
	{
	_Delete_this = _x;
    if ((isNull (attachedTo _Delete_this)) && (!(_x getVariable ["GF_Excude_from_cleanup",false])) && 
	{(({((_x distance _Delete_this) <= _Delete_distance)} count _allPlayers) isEqualTo 0)}
		
	//________________	Add here your Exclude Zone ( for more )	________________
	&& ((_x distance GF_Exclude_Zone_1) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_2) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_3) > GF_Exclude_Zone_distance) 
	&& ((_x distance GF_Exclude_Zone_4) > GF_Exclude_Zone_distance)
	&& ((_x distance GF_Exclude_Zone_5) > GF_Exclude_Zone_distance)
	
	) then {			
	_Destruction_Crater = _Destruction_Crater - [_x];  		
	deleteVehicle _x};
	} forEach _Destruction_Crater;
	sleep _Time_to_next_category;
};
	
	
if (_Systemchat_Enabled) then {
systemchat "Cleanup C O M P L E T E";
};			


};