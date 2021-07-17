


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


diag_log "//______________________ GF Auto Population Zombie init initializing  ___________________";

GF_APZ_allPlayers = [];
{if (isPlayer _x) then{GF_APZ_allPlayers pushBack _x;};}forEach playableUnits;
GF_APZ_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");


diag_log "//______________________ loading Units_Array.sqf  ___________________";
#include "Units_Array.sqf";

diag_log "//______________________ loading Enemies_init.sqf  ___________________";
#include "Zombie\Zombie_init.sqf";

diag_log "//______________________ loading Find_Position_init.sqf  ___________________";
#include "Find_Position\Find_Position_init.sqf";

diag_log "//______________________ loading GF_Auto_Population_Zombie_Main_Settings.sqf  ___________________";
#include "GF_Auto_Population_Zombie_Main_Settings.sqf";

diag_log "//______________________ loading GF_Auto_Population_Zombie_Cleaner.sqf  ___________________";
#include "GF_Auto_Population_Zombie_Cleaner.sqf";

diag_log "//______________________ loading GF_Auto_Population_Zombie_Blacklist_Zone.sqf  ___________________";
#include "GF_Auto_Population_Zombie_Blacklist_Zone.sqf";

diag_log "//______________________ loading GF_Auto_Population_Zombie_Locations_Settings.sqf  ___________________";
#include "GF_Auto_Population_Zombie_Locations_Settings.sqf";

diag_log "//______________________ loading GF_Auto_Population_Zombie_Spawn_Settings.sqf  ___________________";
#include "GF_Auto_Population_Zombie_Spawn_Settings.sqf";

diag_log "//______________________ loading GF_Auto_Population_Zombie_Spawner.sqf  ___________________";
#include "GF_Auto_Population_Zombie_Spawner.sqf";


diag_log "//______________________ GF Auto Population Zombie init initialized  ___________________";