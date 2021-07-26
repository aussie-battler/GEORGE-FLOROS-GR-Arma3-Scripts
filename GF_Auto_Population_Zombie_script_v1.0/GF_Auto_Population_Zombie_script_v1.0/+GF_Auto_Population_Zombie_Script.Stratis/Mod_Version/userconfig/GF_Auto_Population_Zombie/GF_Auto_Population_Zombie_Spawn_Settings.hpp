


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


diag_log "//____________________________ GF Auto Population Spawn Settings initializing  _________________________";


//____________________________	Spawn List	____________________________
/*	
//____________________________	Zombie	____________________________
[] spawn GF_APZ_Spawn_Zombie_Stalk;
[] spawn GF_APZ_Spawn_Zombie_Patrol;
[] spawn GF_APZ_Garrison_Area_Buildings_Zombie;
	
//____________________________	Zombie_Group	____________________________
[] spawn GF_APZ_Spawn_Zombie_Group_Stalk_Small;
[] spawn GF_APZ_Spawn_Zombie_Group_Stalk_Medium;
[] spawn GF_APZ_Spawn_Zombie_Group_Stalk_Large;
[] spawn GF_APZ_Spawn_Zombie_Group_Patrol;
[] spawn GF_APZ_Garrison_Area_Buildings_Units;	


It is suggested to randomize the Staker Groups

GF_APZ_Spawn_Zombie_Group_Stalk = selectrandom[
	GF_APZ_Spawn_Zombie_Group_Stalk_Small,GF_APZ_Spawn_Zombie_Group_Stalk_Medium,GF_APZ_Spawn_Zombie_Group_Stalk_Large];
*/	


GF_APZ_Spawn = {


//____________________________	randomize the Staker Groups	____________________________

GF_APZ_Spawn_Zombie_Group_Stalk = selectrandom[
	GF_APZ_Spawn_Zombie_Group_Stalk_Small,
	GF_APZ_Spawn_Zombie_Group_Stalk_Medium,
	GF_APZ_Spawn_Zombie_Group_Stalk_Large
	];



	//____________________________ GF_APZ_Spawn_List , Create here your Spawn List  _________________________

	_Spawn_List = selectrandom[
	
	//____________________________	Zombie	____________________________
	
	GF_APZ_Spawn_Zombie_Stalk,
	GF_APZ_Spawn_Zombie_Patrol,
	GF_APZ_Garrison_Area_Buildings_Zombie,
	
	
	//____________________________	Zombie_Group	____________________________
	
	GF_APZ_Spawn_Zombie_Group_Stalk,	//	randomized
	GF_APZ_Spawn_Zombie_Group_Patrol,
	GF_APZ_Garrison_Area_Buildings_Zombie_Group
	];
	
	
	//____________________________	END of Spawn List	____________________________

	if (count allUnits < GF_APZ_Enemy_Max_Number) then {	
	[] spawn _Spawn_List;
	};	
	
	
	//____________________________	+ extra spawn in every spawn loop	____________________________
	
	if (count allUnits < GF_APZ_Enemy_Max_Number) then {
	[] spawn GF_APZ_Spawn_Zombie_Patrol;
	};
	
	if (count allUnits < GF_APZ_Enemy_Max_Number) then {
	[] spawn GF_APZ_Spawn_Zombie_Stalk;
	};
	
	for "_x" from 0 to (4 + random 4) do {
	if (count allUnits < GF_APZ_Enemy_Max_Number) then {
	[] spawn GF_APZ_Garrison_Area_Buildings_Zombie;
	};
	};


	
};		


diag_log "//____________________________ GF Auto Population Spawn Settings initialized  _________________________";