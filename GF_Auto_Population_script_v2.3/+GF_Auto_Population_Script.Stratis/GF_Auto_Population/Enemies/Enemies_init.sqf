


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


diag_log "//______________________ Enemies init initializing  ___________________";


//___________________	Enemies	___________________

GF_AP_Garrison_Excluded_Buildings = [
"Land_Pier_F",
"Land_Pier_small_F",
"Land_NavigLight",
"Land_LampHarbour_F"
];


//___________________	Infantry	___________________


diag_log "//______________________ loading Infantry.sqf  ___________________";
#include "Infantry\Infantry.sqf";

diag_log "//______________________ loading Infantry_Divers.sqf  ___________________";
#include "Infantry\Infantry_Divers.sqf";

diag_log "//______________________ loading Infantry_Man.sqf  ___________________";
#include "Infantry\Infantry_Man.sqf";

diag_log "//______________________ loading Infantry_Paratroopers.sqf  ___________________";
#include "Infantry\Infantry_Paratroopers.sqf";

diag_log "//______________________ loading Infantry_Recon.sqf  ___________________";
#include "Infantry\Infantry_Recon.sqf";

diag_log "//______________________ loading Infantry_Recon_SF.sqf  ___________________";
#include "Infantry\Infantry_Recon_SF.sqf";

diag_log "//______________________ loading Infantry_SF.sqf  ___________________";
#include "Infantry\Infantry_SF.sqf";

diag_log "//______________________ loading Infantry_SF_Urban.sqf  ___________________";
#include "Infantry\Infantry_SF_Urban.sqf";

diag_log "//______________________ loading Infantry_Snipers.sqf  ___________________";
#include "Infantry\Infantry_Snipers.sqf";



//___________________	Vehicles	___________________

diag_log "//______________________ loading Boats.sqf  ___________________";
#include "Vehicles\Boats.sqf";

diag_log "//______________________ loading Helicopters.sqf  ___________________";
#include "Vehicles\Helicopters.sqf";

diag_log "//______________________ loading Helicopters_Attack.sqf  ___________________";
#include "Vehicles\Helicopters_Attack.sqf";

diag_log "//______________________ loading Helicopters_Transport.sqf  ___________________";
#include "Vehicles\Helicopters_Transport.sqf";

diag_log "//______________________ loading Planes.sqf  ___________________";
#include "Vehicles\Planes.sqf";

diag_log "//______________________ loading Static_Weapons.sqf  ___________________";
#include "Vehicles\Static_Weapons.sqf";

diag_log "//______________________ loading Vehicles_Land.sqf  ___________________";
#include "Vehicles\Vehicles_Land.sqf";

diag_log "//______________________ loading Vehicles_Land_Transport.sqf  ___________________";
#include "Vehicles\Vehicles_Land_Transport.sqf";

diag_log "//______________________ loading Vehicles_Armoured.sqf  ___________________";
#include "Vehicles\Vehicles_Armoured.sqf";

diag_log "//______________________ loading Uav.sqf  ___________________";
#include "Vehicles\Uav.sqf";

diag_log "//______________________ loading Ugv.sqf  ___________________";
#include "Vehicles\Ugv.sqf";



diag_log "//______________________ Enemies init initialized  ___________________";