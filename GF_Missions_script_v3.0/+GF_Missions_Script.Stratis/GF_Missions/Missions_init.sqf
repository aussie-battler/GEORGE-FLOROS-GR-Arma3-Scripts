


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


//	https://community.bistudio.com/wiki/Arma_3_Task_Framework
//	https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul
//	http://www.2createawebsite.com/build/hex-colors.html	//	Hex Color Code Chart & Generator , good for addaction


diag_log "//________________ GF Missions init _____________";


GF_Missions_allPlayers = allUnits select {isPlayer _x && {!(_x isKindOf "HeadlessClient_F")}};
GF_Missions_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");


//________________ This is for EOS	_____________

_createCenter = createCenter sideLogic;
_sideLogic = createGroup _createCenter;
_Server_sideLogic = _sideLogic createUnit ["Logic", [0,0,0], [], 0, "NONE"];
_Server_sideLogic setVehicleVarName "server";
missionNamespace setVariable ["server", _Server_sideLogic, true];


//________________ EOS	_____________

[]execVM "eos\OpenMe.sqf";

//________________ DAC _____________

DAC_Basic_Value = 0;
execVM "DAC\DAC_Config_Creator.sqf";


[] execVM "GF_Missions\Custom_Units_Array.sqf";
[] execVM "GF_Missions\Spawn_Enemies\Enemies_init.sqf";
[] execVM "GF_Missions\Addactions.sqf";
[] execVM "GF_Missions\Mission_Custom\Mission_Custom_init.sqf";




//________________ Settings _____________
//________________ Set true or false  _____________

//________________ Debug Settings _____________

GF_Missions_Debug_Markers				= true;					//	This script is reconfigured for debug porposes for the GF missions
GF_Missions_Show_Server_info			= true;					//	Show Server Systemchat information
GF_Missions_Systemchat_info				= true;					//	Show Systemchat information
GF_Missions_Hintsilent_info				= true;					//	Show Hint information
GF_Missions_Diag_Log_info				= true;					//	Log information

GF_Missions_Pos_Spawn_Test				= false;				//	Position Spawn Test


//________________ EOS Settings _____________

VictoryColor							= "colorGreen";			// Colour of marker after completion
hostileColor							= "colorRed";			// Default colour when enemies active
bastionColor							= "colorOrange";		// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER					= 1;					// 1 is default
EOS_KILLCOUNTER							= false;				// Counts killed units

GF_Missions_Debug_EOS					= false;				//	Show EOS Debug
GF_Missions_EOS_Marker_Type 			= 2;					//	Marker Type , 0 = Highlight , 1 = Invinsible , 2 Normal 
GF_Missions_EOS_Faction					= 6;					//	6 is the Custom_Units_Array.sqf else , select from the eos UnitPools
GF_Missions_EOS_Spawn_Distance			= 1500;					//	Spawn Distance
GF_Missions_EOS_HEIGHTLIMIT				= false;				//	A height limit will prevent flying units from activating EOS zones.
//	The Enemy Side for EOS can be changed below in Enemies Settings


//________________ Missions Settings _____________
//________________ Set true or false  _____________

GF_Missions_EOS_Spawn 					= true;					//	It can be disabled , this is the main option , you can select also inside the mission
GF_Missions_DAC_Spawn 					= true;					//	It can be disabled , this is the main option , you can select also inside the mission
GF_Missions_Custom_Spawn 				= true;					//	It can be disabled , this is the main option , you can select also inside the mission

GF_Missions_saveGame					= true;					//	Save Game
GF_Missions_Repeat_Missions				= false;				//	Change this for Non stop. Set this to false , if you are using the DAC missions
GF_Missions_Mission_End					= true;					//	When all the misions are complete , end the mission ( server )
GF_Missions_Wait_Time					= 5;					// 	The time to move to the next mission	
GF_Missions_Time_out_mission_fail		= true;					//	The mission will fail if the time pass
GF_Missions_Set_the_sec_for_fail		= 3600;					// 	The time to fail the mission , 1 hour = 3600 seconds
GF_Missions_Find_pos_Attempts 			= 20;					//	Attempts to find the selected spawn position


//________________ Cleanup Settings _____________

GF_Missions_Delete_Objects				= true;					//	Delete the objects with the mission end
GF_Missions_Delete_Objects_Distance		= 2000;					// 	The Distance to Delete the mission's Objects


//________________ Enemies Settings _____________
//________________ Set true or false  _____________

GF_Missions_Safe_Zone_distance			= 1000;					//	Add here the distance for the Safe Zones and players
GF_Missions_DAC_Area_Spawn_Meters 		= 600 + random 400;		//	The size of the area	
GF_Missions_Enemy_Side					= east;					//	This is for Normal Spawn and EOS , NOT for the DAC units
GF_Missions_Squad_Members				= 6 + floor random 6;
GF_Missions_set_AiSkill					= random 0.75 + 0.25 ;
GF_Missions_BIS_fnc_taskPatrol_distance = random 250 + 100;		//	The distance for BIS_fnc_taskPatrol
GF_Missions_Air_Patrol_distance			= random 500 + 500;		//	The distance for BIS_fnc_taskPatrol
GF_Missions_Attack_Distance 			= GF_Missions_EOS_Spawn_Distance;	//	1500 The distance for the attack spawn units

GF_Missions_Garrison_Area_Possibility    = 25;					//	up to 100 %
GF_Missions_Garrison_Area_Distance 		= GF_Missions_EOS_Spawn_Distance / 2; 


//________________	This is in the GF_Set_Custom_Loadout folder and it's configured for the GF Missions	________________

GF_Missions_Change_Equipment			= false;					//	Change Enemy Equipment to non Dac missions Enemies# it is possible with this script to change everyone 


//________________	Safe Zones	________________	
/*
Add here your Safe Zones ( if you want more ) , 
these are included in the 3D editor to copy paste to your mission.
If you don't want them , dont copy them.
*/

GF_Missions_Safe_Zone_1 = getMarkerPos "GF_Missions_Safe_Zone_1";	
GF_Missions_Safe_Zone_2 = getMarkerPos "GF_Missions_Safe_Zone_2";
GF_Missions_Safe_Zone_3 = getMarkerPos "GF_Missions_Safe_Zone_3";
GF_Missions_Safe_Zone_4 = getMarkerPos "GF_Missions_Safe_Zone_4";
GF_Missions_Safe_Zone_5 = getMarkerPos "GF_Missions_Safe_Zone_5";


/*
//________________	ADDED By lordfrith	________________
//	https://forums.bohemia.net/profile/1079222-lordfrith/
//	How to start the Missions when the player requests it i.e. by addaction from an officer/satellite phone at a base.
//	INFO here: 
//	https://forums.bohemia.net/forums/topic/219080-gf-missions-script/?page=2&tab=comments#comment-3313618

GF_Missions_Rolling                     = false;                //  Choose wether to have rolling or triggered missions 																//	( edit also the code , that you will find below )															
*/


//________________ Find_Position	________________
//	This is used to find your desired spawn position in a Safe Distance from all the players and the add Safe Zones.

[] execVM "GF_Missions\Find_Position\Find_Position_init.sqf";


/*
________________ GF Set Custom Loadout Script ________________
https://forums.bohemia.net/forums/topic/219669-gf-set-custom-loadout-script/
*/

[] execVM "GF_Set_Custom_Loadout\GF_SCL_GF_Missions.sqf";


/*
________________ GF Units Map Markers and Symbols Script ________________
https://forums.bohemia.net/forums/topic/219763-gf-units-map-markers-and-symbols-script/
//	This script is reconfigured for debug porposes for the GF missions
*/

[] execVM "GF_Units_Map_Markers_and_Symbols\Credits.sqf";	// Please keep the Credits or add them to your Diary
if (GF_Missions_Debug_Markers) then {
hintsilent "Debug Markers Enabled";
[] execVM "GF_Units_Map_Markers_and_Symbols\GF_Units_Map_Markers_and_Symbols.sqf";
};	


//________________ Show Server Systemchat information	________________
if (GF_Missions_Show_Server_info) then {
[] execVM "GF_Missions\Server_info.sqf";
};	


//________________ End of init	________________

		
waitUntil {time >2};

/*
	________________	ADDED By lordfrith	________________
	https://forums.bohemia.net/profile/1079222-lordfrith/
	
	How to start the Missions when the player requests it i.e. by addaction from an officer/satellite phone at a base.
	https://forums.bohemia.net/forums/topic/219080-gf-missions-script/?page=2&tab=comments#comment-3313618

	create an object or unit in 3D editor and add this:
	 
	this addAction ["<t color='#0099FF'>Request Mission</t>","GF_Missions\Missions_call.sqf",[],10,true,true,"","true", 3];

	
	ADDED if() then{}; to mission start script to check if GF_Missions_Rolling = true;
	
	Copy below:
	if (GF_Missions_Rolling) then {
	
	. . . the Code below
	
	} else {
	};
	
*/


//	hintc "GF_Missions initializing.\n Have a good Game !\n George Floros";


[GF_Missions_allPlayers,["GF_Missions"],["The missions will be running , until they are all complete , Have a good Game ! ","GF_Missions",""], objNull,1,1,true,"whiteboard"] call BIS_fnc_taskCreate;
["GF_Missions","ASSIGNED",true] spawn BIS_fnc_taskSetState;


if (count GF_Missions_Array > 0) 
	then {
	
_Random_Missions = floor (random count GF_Missions_Array);
_Random_Script = GF_Missions_Array select _Random_Missions;

null = [] execVM _Random_Script;
	
if (!GF_Missions_Repeat_Missions)  then {				
GF_Missions_Array = GF_Missions_Array - [_Random_Script];
	
if (GF_Missions_Systemchat_info) then {
systemchat "Next mission is generating";
};

diag_log "//________________ Next GF_Missions is generating	_____________";
		
	};
	}else{	

["GF_Missions","SUCCEEDED",true] spawn BIS_fnc_taskSetState;

hintc "Well done! \n All the GF_Missions are Complete. \n Thanks for playing !	\n George Floros";

if (GF_Missions_Systemchat_info) then {
systemchat "Well done! All the GF_Missions are Complete";
};	

diag_log "//________________ All the GF_Missions are Complete _____________";

sleep 3;

	if (GF_Missions_saveGame) then {
	saveGame;
	};	
	
	if (GF_Missions_Mission_End) then {
	"Mission_Succeded" call BIS_fnc_endMission;
	};
};