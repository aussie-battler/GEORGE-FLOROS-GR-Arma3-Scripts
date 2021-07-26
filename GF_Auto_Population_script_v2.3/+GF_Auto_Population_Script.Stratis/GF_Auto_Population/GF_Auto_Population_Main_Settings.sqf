


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


diag_log "//______________________	GF Auto Population Main Settings initializing	___________________";


//______________________ Settings ___________________
//______________________ Set true or false  ___________________

//______________________ Debug Settings ___________________

//______________________	GF_Units_Map_Markers_and_Symbols Settings	______________________
//	This script is reconfigured for debug porposes for the GF Auto Population
GF_AP_Units_Map_Markers						= true;		//	Enable the Script and filter the options

GF_AP_Units_Map_diag_log					= true;
GF_AP_Units_Map_systemchat					= true;
GF_AP_Units_Map_Markers_Enabled				= true;
GF_AP_Units_Map_Symbols_Enabled				= true;
GF_AP_Units_Map_Symbols_Remove_Text 		= true;	//	If you are using the symbols , set this to true

//______________________ Debug Settings ___________________
//______________________ Set true or false  ___________________

GF_AP_Show_Server_info						= true;		//	Show Server Systemchat information
GF_AP_Systemchat_info						= true;		//	Show Systemchat information
GF_AP_Hintsilent_info						= true;		//	Show Hint information
GF_AP_Diag_Log_info							= true;		//	Log information

//______________________ Spawn pos Settings ___________________

GF_AP_Find_pos_Attempts 					= 20;		//	Attempts to find the selected spawn position
GF_AP_Pos_Spawn_Test						= false;	//	Spawn Test for Debug , to check the selected positions scripts

//______________________ GF_AP_DynamicSimulation Settings ___________________
//______________________ Set true or false  ___________________

GF_AP_DynamicSimulation						= true;		//	Enable DynamicSimulation
GF_AP_DynamicSimulation_auto_distance		= true;		//	suggested , auto distance based on viewDistance and fog 
GF_AP_DynamicSimulation_manual_distance		= 2000;		//	if above is false , add the distance


//______________________ GF_Auto_Population_Cleaner Settings ___________________

GF_AP_Cleaner_Distance 						= 3000;		// 	The Distance to delete spawned Units
GF_AP_Cleaner_Loop							= 10;		//	The sec to loop


//______________________ Enemies Settings ___________________
//______________________ Set true or false  ___________________

GF_AP_Spawn_Loop							= 1;		//	Spawn new units every % sec
GF_AP_Units_Spawn_Safe_distance				= 1500;		//	Add here the distance for the Units Spawn Safe distance from players	
GF_AP_Blacklist_Zone_distance				= 1500;		//	Add here the distance for the Blacklist Zones

GF_AP_Enemy_Side							= east;		//	Select enemy side
GF_AP_Enemy_Max_Number						= 100;		//	Enemy Max Number , check also for more details in: GF_Auto_Population_Spawner.sqf

GF_AP_Squad_Members 						= 2;		//	The number of the Squad
GF_AP_Squad_Members_random					= 10;		//	+ random 

GF_AP_set_AiSkill_leader					= 0.75;		//	set_AiSkill for leader
GF_AP_set_AiSkill_leader_random				= 0.25;		//	+ random 

GF_AP_set_AiSkill							= 0.50;		//	set_AiSkill
GF_AP_set_AiSkill_random					= 0.50;		//	+ random 

GF_AP_Patrol_distance_Land					= 250;		//	The distance for infantry BIS_fnc_taskPatrol
GF_AP_Patrol_distance_Land_random			= 100;		//	+ random 

GF_AP_Patrol_distance_Sea					= 250;		//	The distance for divers BIS_fnc_taskPatrol
GF_AP_Patrol_distance_Sea_random			= 100;		//	+ random 

GF_AP_Patrol_distance_Land_Vehicles			= 300;		//	The distance for Land Vehicles BIS_fnc_taskPatrol
GF_AP_Patrol_distance_Land_Vehicles_random	= 150;		//	+ random 

GF_AP_Patrol_distance_Sea_Vehicles			= 300;		//	The distance for Sea Vehicles BIS_fnc_taskPatrol
GF_AP_Patrol_distance_Sea_Vehicles_random	= 150;		//	+ random 

GF_AP_Patrol_distance_Air_Vehicles 			= 500;		//	The distance for Air Vehicles BIS_fnc_taskPatrol
GF_AP_Patrol_distance_Air_Vehicles_random	= 500;		//	+ random 

GF_AP_Attack_Distance 						= 1500;		//	1500 The distance from the spawn position , for the attack spawn units

GF_AP_Garrison_Area_Distance 				= 600; 		//	Garrison Area in meters


//______________________	GF Auto Random Loadout Script	___________________
//______________________ Set true or false  ___________________
//	For any other settings , change them from the script
GF_AP_Auto_Random_Loadout_Enabled			= false;		//	GF_Auto_Random_Loadout Script
//GF_AP_ARL_Select	-->	1 = Load every Mod + Bohemia Items , 2 = Load every Mod - No Bohemia Items , 3 = Load Bohemia Items Only , 4 = Custom items only
GF_AP_ARL_Select 							= 1;


//______________________ End of Settings ___________________




/*
___________________ GF Auto Random Loadout Script ___________________
https://forums.bohemia.net/forums/topic/220873-gf-auto-random-loadout-script/
*/
[] execVM "GF_Auto_Population\GF_AP_Auto_Random_Loadout\Credits.sqf";	// Please keep the Credits or add them to your Diary
if(GF_AP_Auto_Random_Loadout_Enabled) then {
[] execVM "GF_Auto_Population\GF_AP_Auto_Random_Loadout\GF_AP_Auto_Random_Loadout.sqf";
};


/*
______________________	GF Units Map Markers and Symbols Script - Mod	______________________
https://forums.bohemia.net/forums/topic/219763-gf-units-map-markers-and-symbols-script/
//	This script is reconfigured for debug porposes for the GF missions
*/
[] execVM "GF_Auto_Population\GF_AP_Units_Map_Markers\Credits.sqf";	// Please keep the Credits or add them to your Diary
if (GF_AP_Units_Map_Markers) then {
if (GF_AP_Hintsilent_info) then {
hintsilent "Debug Markers Enabled";
};
[] execVM "GF_Auto_Population\GF_AP_Units_Map_Markers\GF_AP_Units_Map_Markers.sqf";
};	


//______________________ GF_AP_DynamicSimulation	______________________
if (GF_AP_DynamicSimulation) then {
[] execVM "GF_Auto_Population\GF_AP_DynamicSimulation\GF_AP_DynamicSimulation.sqf";
};	


//______________________ Show Server Systemchat information	______________________
if (GF_AP_Show_Server_info) then {
[] execVM "GF_Auto_Population\Server_info.sqf";
};	


//______________________ Start Spawner	______________________

[] execVM "GF_Auto_Population\GF_Auto_Population_Spawner.sqf";


diag_log "//______________________	GF Auto Population Main Settings initialized	___________________";
diag_log "//______________________	GF Auto Population Start Spawner	___________________";