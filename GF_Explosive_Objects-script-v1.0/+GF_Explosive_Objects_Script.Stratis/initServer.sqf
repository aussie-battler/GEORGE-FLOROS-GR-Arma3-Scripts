


//________________	Author : GEORGE FLOROS [GR]	___________	09.04.19	___________


/*
________________	GF Explosive Objects Script - Mod	________________

https://forums.bohemia.net/forums/topic/222789-gf-explosive-objects-script-mod/

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


[] execVM "GF_Explosive_Objects\Credits.sqf";	// Please keep the Credits or add them to your Diary
[] execVM "GF_Explosive_Objects\GF_Explosive_Objects.sqf";




//________________ This is EXTRA	________________
//	This is to add everything in zeus. if you don't have the zeus enabled you can delete this.

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