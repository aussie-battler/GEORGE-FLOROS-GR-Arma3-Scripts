


//________________	Author : GEORGE FLOROS [GR]	___________	19.06.19	_____________ 


/*
________________ GF Zombie Spawner Script - Mod	________________

Not Published yet	SOON !

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


//________________ Debug info _____________
//________________ Set true or false  _____________

GF_ZS_Systemchat_info				= true;		
GF_ZS_diag_log_info					= true;


GF_ZS_allPlayers = allUnits select {isPlayer _x && {!(_x isKindOf "HeadlessClient_F")}};

[]execvm "GF_Zombie_Spawner\Units_Array.sqf";
[]execvm "GF_Zombie_Spawner\GF_Zombie_Spawner_Loadout.sqf";
[]execvm "GF_Zombie_Spawner\GF_Zombie_Spawner_Types.sqf";
[]execvm "GF_Zombie_Spawner\GF_Zombie_Spawner_List.sqf";
[]execvm "GF_Zombie_Spawner\GF_Zombie_Spawner_Cleaner.sqf";


waituntil{time>2;};


//________________ Settings _____________
//________________ Set true or false  _____________

GF_ZS_Enemy_Max_Number				= 30;
GF_ZS_Enemy_Side					= east;
GF_ZS_Squad_Members					= 6;
GF_APZ_Squad_Members_random			= 6;
GF_ZS_Distance_Location				= 1500;

GF_ZS_Distance_Spawn				= 100;
GF_ZS_Distance_Spawn_random			= 100;
GF_ZS_Garrison_Area_Distance 		= 600;

GF_ZS_Enemy_array					= GF_ZS_Custom_1;	//	GF_ZS_Ryanzombies , GF_ZS_Max_zombies , GF_ZS_Ravage , GF_ZS_Custom_1

GF_ZS_Change_Loadout				= true;
GF_ZS_Loadout_Select 				= 2;		//	1 = No change , 2 = Random , 3 = Custom (paste from arsenal)

GF_ZS_Cleaner_Distance				= 1500;




if(GF_ZS_Systemchat_info)then{
	systemchat "GF_Zombie_Spawner_Settings initializing";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_Zombie_Spawner_Settings initializing	________________";
};


[]execvm "GF_Zombie_Spawner\GF_Zombie_Spawner.sqf";


if(GF_ZS_Systemchat_info)then{
	systemchat "GF_Zombie_Spawner_Settings initialized";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_Zombie_Spawner_Settings initialized	________________";
};