


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


//______________________ Settings ___________________
//______________________ Set true or false  ___________________

//______________________ Debug Settings ___________________

//______________________	GF_APZ_Units_Map_Markers Settings	______________________
//	This script is reconfigured for debug porposes for the GF Auto Population
GF_APZ_Units_Map_Markers_Enabled			= true;		//	Enable the Script and filter the options

GF_APZ_Units_Map_diag_log					= true;
GF_APZ_Units_Map_systemchat					= true;
GF_APZ_Units_Map_Markers_Enabled			= true;
GF_APZ_Units_Map_Symbols_Enabled			= true;
GF_APZ_Units_Map_Symbols_Remove_Text 		= true;	//	If you are using the symbols , set this to true

//______________________ Debug Settings ___________________
//______________________ Set true or false  ___________________

GF_APZ_Show_Server_info						= true;		//	Show Server Systemchat information
GF_APZ_Systemchat_info						= true;		//	Show Systemchat information
GF_APZ_Hintsilent_info						= true;		//	Show Hint information
GF_APZ_Diag_Log_info						= true;		//	Log information

//______________________ Spawn pos Settings ___________________

GF_APZ_Find_pos_Attempts 					= 20;		//	Attempts to find the selected spawn position
GF_APZ_Pos_Spawn_Test						= false;	//	Spawn Test for Debug , to check the selected positions scripts

//______________________ GF_APZ_DynamicSimulation Settings ___________________
//______________________ Set true or false  ___________________

GF_APZ_DynamicSimulation					= true;		//	Enable DynamicSimulation
GF_APZ_DynamicSimulation_auto_distance		= true;		//	suggested , auto distance based on viewDistance and fog 
GF_APZ_DynamicSimulation_manual_distance	= 2000;		//	if above is false , add the distance


//______________________ GF_Auto_Population_Zombie_Cleaner Settings ___________________
// 	The Distance to delete spawned Units , this is depending also to the spawn selected location and the current map used
GF_APZ_Cleaner_Distance 					= 3500;		
GF_APZ_Cleaner_Loop							= 10;		//	The sec to loop


//______________________ Enemies Settings ___________________
//______________________ Set true or false  ___________________

//	Select_Zombies from the Units_Array.sqf  
//	GF_APZ_Ryanzombies , GF_APZ_Max_zombies , GF_APZ_Ravage , GF_APZ_Custom_1
GF_APZ_Select_Zombies						= GF_APZ_Ryanzombies;

GF_APZ_Spawn_Loop							= 1;		//	Spawn new units every % sec
GF_APZ_Units_Spawn_Safe_distance			= 1500;		//	Add here the distance for the Units Spawn Safe distance from players	
GF_APZ_Blacklist_Zone_distance				= 1500;		//	Add here the distance for the Blacklist Zones

GF_APZ_Enemy_Side							= east;	//	Select side
GF_APZ_Enemy_Max_Number						= 100;		//	Enemy Max Number , check also for more details in: GF_Auto_Population_Zombie_Spawner.sqf

GF_APZ_Squad_Members 						= 1;		//	The number of the Squad
GF_APZ_Squad_Members_random					= 9;		//	+ random 

GF_APZ_Squad_Members_Stalk_Small			= 5;		//	The number of the Squad - horde
GF_APZ_Squad_Members_Stalk_Small_random		= 5;		//	+ random 

GF_APZ_Squad_Members_Stalk_Medium			= 10;		//	The number of the Squad - horde
GF_APZ_Squad_Members_Stalk_Medium_random	= 10;		//	+ random 

GF_APZ_Squad_Members_Stalk_Large			= 20;		//	The number of the Squad - horde
GF_APZ_Squad_Members_Stalk_Large_random		= 20;		//	+ random 

GF_APZ_set_AiSkill_leader					= 0.75;		//	set_AiSkill for leader
GF_APZ_set_AiSkill_leader_random			= 0.25;		//	+ random 

GF_APZ_set_AiSkill							= 0.50;		//	set_AiSkill
GF_APZ_set_AiSkill_random					= 0.50;		//	+ random 

GF_APZ_Patrol_distance_Land					= 100;		//	The distance for infantry BIS_fnc_taskPatrol
GF_APZ_Patrol_distance_Land_random			= 100;		//	+ random 

GF_APZ_Garrison_Area_Distance 				= 1000; 	//	Garrison Area in meters


//______________________	GF Auto Random Loadout Script	___________________	Not working with Max zombies !
//______________________ Set true or false  ___________________
//	For any other settings , change them from the script
GF_APZ_Auto_Random_Loadout_Enabled			= false;	//	GF_Auto_Random_Loadout Script
//GF_ARL_APZ_Select	-->	1 = Load every Mod + Bohemia Items , 2 = Load every Mod - No Bohemia Items , 3 = Load Bohemia Items Only , 4 = Custom items only
GF_ARL_APZ_Select 							= 1;


//______________________ End of Settings ___________________