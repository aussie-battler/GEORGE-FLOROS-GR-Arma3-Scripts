


//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Building Replacement Script - Mod	________________

https://forums.bohemia.net/forums/topic/221761-gf-building-replacement-script-mod/

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


//________________	GF_Distance_Check.sqf	________________
[] execVM "GF_Building_Replacement\GF_Distance_Check.sqf";


//________________ Settings _____________
//________________ Set true or false  _____________

GF_BR_Debug_Markers							= true;

GF_BR_Debug_info							= true;
GF_BR_Systemchat_info						= true;		
GF_BR_diag_log_info							= true;

GF_BR_buildingPositions						= 4;		//	Only the buildings with >4 buildingPositions will change
GF_BR_Blacklist_Zone_distance				= 1000;		//	Add here the distance from the Blacklist Zones
GF_BR_Distance								= 200;		//	Add here the distance from players
GF_Building_Disable_Simulation 				= false;




if (GF_BR_diag_log_info) then {
diag_log "//________________ GF_BR_init.sqf ________________";
};


GF_BR_allPlayers = [];
{if(alive _x && isPlayer _x) then{GF_BR_allPlayers pushBack _x;};}forEach playableUnits;
GF_BR_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
GF_BR_array = nearestObjects [GF_BR_centerPosition, ["House"], worldsize];
//	GF_BR_array = nearestObjects [GF_BR_centerPosition, ["House", "Building"], worldsize];
//copyToClipboard str GF_BR_array;

[] execVM "GF_Building_Replacement\GF_Building_Replacement.sqf";