


//________________  Author : GEORGE FLOROS [GR] ___________ 24.12.18 _____________ 


/*
________________ GF Auto Loot Vehicles Script - Mod	________________

https://forums.bohemia.net/forums/topic/220981-gf-auto-loot-vehicles-script-mod/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


//copy in your init or initserver
[] execVM "GF_Auto_Loot_Vehicles\Credits.sqf";	// Please keep the Credits or add them to your Diary
[] execVM "GF_Auto_Loot_Vehicles\GF_Auto_Loot_Vehicles.sqf";


//________________ This is EXTRA	________________

//________________	add to Zeus	________________

[] spawn {
  while {true} do {
 if (isServer) then {
 {
  _x addCuratorEditableObjects [allUnits,true];
  _x addCuratorEditableObjects [vehicles,true];
  _x addCuratorEditableObjects [allMissionObjects "All",true];
 } forEach allCurators;            
};
  sleep 3;
  };
};