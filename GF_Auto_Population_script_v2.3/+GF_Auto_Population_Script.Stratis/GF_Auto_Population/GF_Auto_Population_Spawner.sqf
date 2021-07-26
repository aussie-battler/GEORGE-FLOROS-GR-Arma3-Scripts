


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


diag_log "//______________________ GF Auto Population Spawner initializing  ___________________";


[] spawn {
	while {true} do {
		
		/*
		To get the number for GF_AP_Enemy_Max_Number , 
		use : count allUnits; or countSide allUnits; 
		in order to count only the enemy Side Max ai
		examples :
		
		1.waitUntil{uisleep GF_AP_Spawn_Loop; GF_AP_Enemy_Side countSide allUnits < GF_AP_Enemy_Max_Number};
		2.waitUntil{uisleep GF_AP_Spawn_Loop; count allUnits < GF_AP_Enemy_Max_Number};
		*/
		
		
		waitUntil{uisleep GF_AP_Spawn_Loop; count allUnits < GF_AP_Enemy_Max_Number};
		
		GF_AP_Pos_initialized = false;
		
		//______________________ Locations List  ___________________
		
		[] spawn GF_AP_Spawn_Locations;
		
		waitUntil{uisleep 1;GF_AP_Pos_initialized};

		if (count allUnits < GF_AP_Enemy_Max_Number) then {
		[] spawn GF_AP_Spawn;
		};
		
		if(GF_AP_Diag_Log_info) then {
		diag_log "Spawning Units";
		};
		
		if (GF_AP_Systemchat_info) then {
		systemchat "Spawning Units";
		};
		
		uisleep 0.5;
		
		if(GF_AP_Diag_Log_info) then {
		diag_log format ["Units : %1",count allUnits,{count _x;}];	
		};
		
		if(GF_AP_Systemchat_info) then {
		systemchat format ["Units : %1",count allUnits,{count _x;}];	
		};
		
	};
};


diag_log "//______________________ GF Auto Population Spawner initialized  ___________________";