


//________________  Author : GEORGE FLOROS [GR] ___________ 16.12.18 _____________

/*
________________ GF Missions Script ________________

https://forums.bohemia.net/forums/topic/219080-gf-missions-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/

//	enableSaving [ false, false ]; // Saving disabled without autosave.

//__________________________ ***  C O P Y   T H I S  *** __________________________

[]execVM "GF_Missions\Missions_Array.sqf";
[]execVM "GF_Missions\Missions_init.sqf";

//__________________________ ***  C O P Y   E N D  *** __________________________


[] execVM "GF_Missions\Credits.sqf";	//	Please keep the Credits or add them to your Diary
[] execVM "GF_Set_Custom_Loadout\Credits.sqf";	// Please keep the Credits or add them to your Diary


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
  sleep 10;
  };
};