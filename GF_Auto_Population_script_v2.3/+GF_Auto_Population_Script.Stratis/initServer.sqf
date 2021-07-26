


//________________	Author : GEORGE FLOROS [GR]	___________	01.03.19	___________


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

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


[] execVM "GF_Auto_Population\Credits.sqf";	// Please keep the Credits or add them to your Diary
[] execVM "GF_Auto_Population\GF_Auto_Population_init.sqf";


//________________ This is EXTRA	________________

//________________	add to Zeus	________________

[] spawn {
	while {true} do {
		waituntil{uisleep 1;
			if (isServer) then {
				{
					_x addCuratorEditableObjects [allUnits,true];
					_x addCuratorEditableObjects [vehicles,true];
					_x addCuratorEditableObjects [allMissionObjects "All",true];
				}forEach allCurators;            
			};
		};
	};
};