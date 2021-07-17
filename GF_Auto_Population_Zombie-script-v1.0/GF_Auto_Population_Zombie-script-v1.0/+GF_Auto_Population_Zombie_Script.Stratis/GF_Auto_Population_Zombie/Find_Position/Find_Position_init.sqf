


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


GF_APZ_nearbyLocations = nearestLocations [GF_APZ_centerPosition, [
	//"NameLocal",
	"NameCityCapital",
	"NameCity",
	"NameVillage"
	], worldsize];
//	copytoclipboard str GF_APZ_nearbyLocations;

GF_APZ_nearbyLocations_Sea = nearestLocations [GF_APZ_centerPosition, ["NameMarine"], worldsize];
//	copytoclipboard str GF_APZ_nearbyLocations;


diag_log "//______________________ Find Position init initializing  ___________________";


diag_log "//______________________ loading GF_Pos_AnyNearestLocation.sqf  ___________________";
#include "GF_Pos_AnyNearestLocation.sqf";

diag_log "//______________________ loading GF_Pos_isEmpty.sqf  ___________________";
#include "GF_Pos_isEmpty.sqf";

diag_log "//______________________ loading GF_Pos_isFlat.sqf  ___________________";
#include "GF_Pos_isFlat.sqf";

diag_log "//______________________ loading GF_Pos_isFlatEmpty.sqf  ___________________";
#include "GF_Pos_isFlatEmpty.sqf";

diag_log "//______________________ loading GF_Pos_NearestLocation.sqf  ___________________";
#include "GF_Pos_NearestLocation.sqf";

diag_log "//______________________ loading GF_Pos_Airport_Tanoa_Only.sqf  ___________________";
#include "GF_Pos_Airport_Tanoa_Only.sqf";

diag_log "//______________________ loading GF_Pos_Hill.sqf  ___________________";
#include "GF_Pos_Hill.sqf";

diag_log "//______________________ loading GF_Pos_Mount.sqf  ___________________";
#include "GF_Pos_Mount.sqf";

diag_log "//______________________ loading GF_Pos_NameCity.sqf  ___________________";
#include "GF_Pos_NameCity.sqf";

diag_log "//______________________ loading GF_Pos_NameCityCapital.sqf  ___________________";
#include "GF_Pos_NameCityCapital.sqf";

diag_log "//______________________ loading GF_Pos_NameLocal.sqf  ___________________";
#include "GF_Pos_NameLocal.sqf";

diag_log "//______________________ loading GF_Pos_NameMarine.sqf  ___________________";
#include "GF_Pos_NameMarine.sqf";

diag_log "//______________________ loading GF_Pos_NameVillage.sqf  ___________________";
#include "GF_Pos_NameVillage.sqf";

diag_log "//______________________ loading GF_Pos_ShoreLine_Shore.sqf  ___________________";
#include "GF_Pos_ShoreLine_Shore.sqf";

diag_log "//______________________ loading GF_Pos_ShoreLine_Water.sqf  ___________________";
#include "GF_Pos_ShoreLine_Water.sqf";

diag_log "//______________________ loading GF_Pos_Random_Water.sqf  ___________________";
#include "GF_Pos_Random_Water.sqf";

diag_log "//______________________ loading GF_Pos_Random_No_Water.sqf  ___________________";
#include "GF_Pos_Random_No_Water.sqf";


diag_log "//______________________ Find Position init initialized  ___________________";