


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


diag_log "//____________________________ GF Auto Population Spawn Settings initializing  _________________________";


/*
	//____________________________ GF_AP_Spawn_List  _________________________

	
	//____________________________	Units	____________________________
	
	//____________________________	Infantry_Man	____________________________
	[] spawn GF_AP_Spawn_Infantry_Man_Stalk;
	[] spawn GF_AP_Spawn_Infantry_Man_Patrol;
	[] spawn GF_AP_Spawn_Infantry_Man_Defend;
	[] spawn GF_AP_Spawn_Infantry_Man_Attack;
	[] spawn  GF_AP_Garrison_Area_Buildings_Infantry_Man;
	
	//____________________________	Infantry	____________________________
	[] spawn GF_AP_Spawn_Infantry_Stalk;
	[] spawn GF_AP_Spawn_Infantry_Patrol;
	[] spawn GF_AP_Spawn_Infantry_Defend;
	[] spawn GF_AP_Spawn_Infantry_Attack;
	[] spawn GF_AP_Garrison_Area_Buildings_Infantry;
	
	//____________________________	Infantry_Paratroopers	____________________________
	[] spawn GF_AP_Spawn_Infantry_Paratroopers_Stalk;
	[] spawn GF_AP_Spawn_Infantry_Paratroopers_Patrol;
	[] spawn GF_AP_Spawn_Infantry_Paratroopers_Defend;
	[] spawn GF_AP_Spawn_Infantry_Paratroopers_Attack;
	[] spawn GF_AP_Garrison_Area_Buildings_Infantry_Paratroopers;
	
	//____________________________	Infantry_Recon	____________________________
	[] spawn GF_AP_Spawn_Infantry_Recon_Stalk;
	[] spawn GF_AP_Spawn_Infantry_Recon_Patrol;
	[] spawn GF_AP_Spawn_Infantry_Recon_Defend;
	[] spawn GF_AP_Spawn_Infantry_Recon_Attack;
	[] spawn GF_AP_Garrison_Area_Buildings_Infantry_Recon;

	//____________________________	Infantry_Recon_SF	____________________________
	[] spawn GF_AP_Spawn_Infantry_Recon_SF_Stalk;
	[] spawn GF_AP_Spawn_Infantry_Recon_SF_Patrol;
	[] spawn GF_AP_Spawn_Infantry_Recon_SF_Defend;
	[] spawn GF_AP_Spawn_Infantry_Recon_SF_Attack;
	[] spawn GF_AP_Garrison_Area_Buildings_Infantry_Recon_SF;

	//____________________________	Infantry_SF	____________________________
	[] spawn GF_AP_Spawn_Infantry_SF_Stalk;
	[] spawn GF_AP_Spawn_Infantry_SF_Patrol;
	[] spawn GF_AP_Spawn_Infantry_SF_Defend;
	[] spawn GF_AP_Spawn_Infantry_SF_Attack;
	[] spawn GF_AP_Garrison_Area_Buildings_Infantry_SF;

	//____________________________	Infantry_SF_Urban	____________________________
	[] spawn GF_AP_Spawn_Infantry_SF_Urban_Stalk;
	[] spawn GF_AP_Spawn_Infantry_SF_Urban_Patrol;
	[] spawn GF_AP_Spawn_Infantry_SF_Urban_Defend;
	[] spawn GF_AP_Spawn_Infantry_SF_Urban_Attack;
	[] spawn GF_AP_Garrison_Area_Buildings_Infantry_SF_Urban;
	
	//____________________________	Infantry_Snipers	____________________________
	[] spawn GF_AP_Spawn_Infantry_Snipers_Stalk;
	[] spawn GF_AP_Spawn_Infantry_Snipers_Patrol;
	[] spawn GF_AP_Spawn_Infantry_Snipers_Defend;
	[] spawn GF_AP_Spawn_Infantry_Snipers_Attack;
	[] spawn GF_AP_Garrison_Area_Buildings_Infantry_Snipers;

	
	
	
	//____________________________	Vehicles	____________________________
	
	//____________________________	Vehicles_Armoured	____________________________
	[] spawn GF_AP_Spawn_Vehicles_Armoured_Stalk;
	[] spawn GF_AP_Spawn_Vehicles_Armoured_Patrol;
	[] spawn GF_AP_Spawn_Vehicles_Armoured_Defend;
	[] spawn GF_AP_Spawn_Vehicles_Armoured_Attack;

	//_________________________	Vehicles_Land	_________________________
	[] spawn GF_AP_Spawn_Vehicles_Land_Stalk;
	[] spawn GF_AP_Spawn_Vehicles_Land_Patrol;
	[] spawn GF_AP_Spawn_Vehicles_Land_Defend;
	[] spawn GF_AP_Spawn_Vehicles_Land_Attack;
	
	//_________________________	Vehicles_Land_Transport	_________________________
	[] spawn GF_AP_Spawn_Vehicles_Land_Transport_Stalk;
	[] spawn GF_AP_Spawn_Vehicles_Land_Transport_Patrol;
	[] spawn GF_AP_Spawn_Vehicles_Land_Transport_Defend;
	[] spawn GF_AP_Spawn_Vehicles_Land_Transport_Attack;
	
	//_________________________	Helicopters	_________________________
	[] spawn GF_AP_Spawn_Helicopters_Stalk;
	[] spawn GF_AP_Spawn_Helicopters_Patrol;
	[] spawn GF_AP_Spawn_Helicopters_Defend;
	[] spawn GF_AP_Spawn_Helicopters_Attack;
	
	//_________________________	Helicopters_Transport_	_________________________
	[] spawn GF_AP_Spawn_Helicopters_Transport_Stalk;
	[] spawn GF_AP_Spawn_Helicopters_Transport_Patrol;
	[] spawn GF_AP_Spawn_Helicopters_Transport_Defend;
	[] spawn GF_AP_Spawn_Helicopters_Transport_Attack;
	
	//_________________________	Helicopters_Attack_	_________________________
	[] spawn GF_AP_Spawn_Helicopters_Attack_Stalk;
	[] spawn GF_AP_Spawn_Helicopters_Attack_Patrol;
	[] spawn GF_AP_Spawn_Helicopters_Attack_Defend;
	[] spawn GF_AP_Spawn_Helicopters_Attack_Attack;
	
	//_________________________	Planes	_________________________
	[] spawn GF_AP_Spawn_Planes_Stalk;
	[] spawn GF_AP_Spawn_Planes_Patrol;
	[] spawn GF_AP_Spawn_Planes_Defend;
	[] spawn GF_AP_Spawn_Planes_Attack;

	//____________________________	Static_Weapons	____________________________
	[] spawn GF_AP_Spawn_Static_Weapons;
	
	//____________________________	Uav and Drones	____________________________
	[] spawn GF_AP_Spawn_Uav_Stalk;
	[] spawn GF_AP_Spawn_Uav_Patrol;
	[] spawn GF_AP_Spawn_Uav_Defend;
	[] spawn GF_AP_Spawn_Uav_Attack;

	//____________________________	Ugv	____________________________
	[] spawn GF_AP_Spawn_Ugv_Stalk;
	[] spawn GF_AP_Spawn_Ugv_Patrol;
	[] spawn GF_AP_Spawn_Ugv_Defend;
	[] spawn GF_AP_Spawn_Ugv_Attack;
	
	
	
	
	//____________________________	For Water Maps 	____________________________
	
	//____________________________	Infantry_Divers	____________________________
	[] spawn GF_AP_Spawn_Infantry_Divers_Stalk;
	[] spawn GF_AP_Spawn_Infantry_Divers_Patrol;
	[] spawn GF_AP_Spawn_Infantry_Divers_Defend;
	[] spawn GF_AP_Spawn_Infantry_Divers_Attack;
	[] spawn GF_AP_Garrison_Area_Buildings_Infantry_Divers;
	
	//____________________________	Boats	____________________________
	[] spawn GF_AP_Spawn_Boats_Patrol;
	[] spawn GF_AP_Spawn_Boats_Defend;
	[] spawn GF_AP_Spawn_Boats_Attack;
	
	
	//____________________________	END of Spawn List	____________________________
*/

	
	
//____________________________ Create here your Spawn List  _________________________


GF_AP_Spawn = {


_Spawn_List = selectrandom[


	//____________________________	Units	____________________________
	
	//____________________________	Infantry_Man	____________________________
	GF_AP_Spawn_Infantry_Man_Stalk,
	GF_AP_Spawn_Infantry_Man_Patrol,
	GF_AP_Spawn_Infantry_Man_Defend,
	GF_AP_Spawn_Infantry_Man_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry_Man,

	//____________________________	Infantry	____________________________
	GF_AP_Spawn_Infantry_Stalk,
	GF_AP_Spawn_Infantry_Patrol,
	GF_AP_Spawn_Infantry_Defend,
	GF_AP_Spawn_Infantry_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry,
	
	//____________________________	Infantry_Paratroopers	____________________________
	GF_AP_Spawn_Infantry_Paratroopers_Stalk,
	GF_AP_Spawn_Infantry_Paratroopers_Patrol,
	GF_AP_Spawn_Infantry_Paratroopers_Defend,
	GF_AP_Spawn_Infantry_Paratroopers_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry_Paratroopers,
	
	//____________________________	Infantry_Recon	____________________________
	GF_AP_Spawn_Infantry_Recon_Stalk,
	GF_AP_Spawn_Infantry_Recon_Patrol,
	GF_AP_Spawn_Infantry_Recon_Defend,
	GF_AP_Spawn_Infantry_Recon_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry_Recon,

	//____________________________	Infantry_Recon_SF	____________________________
	GF_AP_Spawn_Infantry_Recon_SF_Stalk,
	GF_AP_Spawn_Infantry_Recon_SF_Patrol,
	GF_AP_Spawn_Infantry_Recon_SF_Defend,
	GF_AP_Spawn_Infantry_Recon_SF_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry_Recon_SF,

	//____________________________	Infantry_SF	____________________________
	GF_AP_Spawn_Infantry_SF_Stalk,
	GF_AP_Spawn_Infantry_SF_Patrol,
	GF_AP_Spawn_Infantry_SF_Defend,
	GF_AP_Spawn_Infantry_SF_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry_SF,

	//____________________________	Infantry_SF_Urban	____________________________
	GF_AP_Spawn_Infantry_SF_Urban_Stalk,
	GF_AP_Spawn_Infantry_SF_Urban_Patrol,
	GF_AP_Spawn_Infantry_SF_Urban_Defend,
	GF_AP_Spawn_Infantry_SF_Urban_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry_SF_Urban,
	
	//____________________________	Infantry_Snipers	____________________________
	GF_AP_Spawn_Infantry_Snipers_Stalk,
	GF_AP_Spawn_Infantry_Snipers_Patrol,
	GF_AP_Spawn_Infantry_Snipers_Defend,
	GF_AP_Spawn_Infantry_Snipers_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry_Snipers,

	
	
	
	//____________________________	Vehicles	____________________________
	
	//____________________________	Vehicles_Armoured	____________________________
	GF_AP_Spawn_Vehicles_Armoured_Stalk,
	GF_AP_Spawn_Vehicles_Armoured_Patrol,
	GF_AP_Spawn_Vehicles_Armoured_Defend,
	GF_AP_Spawn_Vehicles_Armoured_Attack,

	//_________________________	Vehicles_Land	_________________________
	GF_AP_Spawn_Vehicles_Land_Stalk,
	GF_AP_Spawn_Vehicles_Land_Patrol,
	GF_AP_Spawn_Vehicles_Land_Defend,
	GF_AP_Spawn_Vehicles_Land_Attack,
	
	//_________________________	Vehicles_Land_Transport	_________________________
	GF_AP_Spawn_Vehicles_Land_Transport_Stalk,
	GF_AP_Spawn_Vehicles_Land_Transport_Patrol,
	GF_AP_Spawn_Vehicles_Land_Transport_Defend,
	GF_AP_Spawn_Vehicles_Land_Transport_Attack,
	
	//_________________________	Helicopters	_________________________
	GF_AP_Spawn_Helicopters_Stalk,
	GF_AP_Spawn_Helicopters_Patrol,
	GF_AP_Spawn_Helicopters_Defend,
	GF_AP_Spawn_Helicopters_Attack,
	
	//_________________________	Helicopters_Transport_	_________________________
	GF_AP_Spawn_Helicopters_Transport_Stalk,
	GF_AP_Spawn_Helicopters_Transport_Patrol,
	GF_AP_Spawn_Helicopters_Transport_Defend,
	GF_AP_Spawn_Helicopters_Transport_Attack,
	
	//_________________________	Helicopters_Attack_	_________________________
	GF_AP_Spawn_Helicopters_Attack_Stalk,
	GF_AP_Spawn_Helicopters_Attack_Patrol,
	GF_AP_Spawn_Helicopters_Attack_Defend,
	GF_AP_Spawn_Helicopters_Attack_Attack,
	
	//_________________________	Planes	_________________________
	GF_AP_Spawn_Planes_Stalk,
	GF_AP_Spawn_Planes_Patrol,
	GF_AP_Spawn_Planes_Defend,
	GF_AP_Spawn_Planes_Attack,

	//____________________________	Static_Weapons	____________________________
	GF_AP_Spawn_Static_Weapons,
	
	//____________________________	Uav and Drones	____________________________
	GF_AP_Spawn_Uav_Stalk,
	GF_AP_Spawn_Uav_Patrol,
	GF_AP_Spawn_Uav_Defend,
	GF_AP_Spawn_Uav_Attack,

	//____________________________	Ugv	____________________________
	GF_AP_Spawn_Ugv_Stalk,
	GF_AP_Spawn_Ugv_Patrol,
	GF_AP_Spawn_Ugv_Defend,
	GF_AP_Spawn_Ugv_Attack,
	
	
	
	
	//____________________________	For Water Maps 	____________________________
	
	//____________________________	Infantry_Divers	____________________________
	GF_AP_Spawn_Infantry_Divers_Stalk,
	GF_AP_Spawn_Infantry_Divers_Patrol,
	GF_AP_Spawn_Infantry_Divers_Defend,
	GF_AP_Spawn_Infantry_Divers_Attack,
	GF_AP_Garrison_Area_Buildings_Infantry_Divers,
	
	//____________________________	Boats	____________________________
	GF_AP_Spawn_Boats_Patrol,
	GF_AP_Spawn_Boats_Defend,
	GF_AP_Spawn_Boats_Attack
	];

	
	//____________________________	Spawn _Spawn_List	____________________________

	if (count allUnits < GF_AP_Enemy_Max_Number) then {	
	[] spawn _Spawn_List;
	};	
	
	
	//____________________________	You can add also + extra spawn in every spawn loop	____________________________
	/* example : 
	
	if (count allUnits < GF_AP_Enemy_Max_Number) then {	
	[] spawn  GF_AP_Garrison_Area_Buildings_Infantry_Man;
	};	
	
	*/
	
	//____________________________	END	____________________________
	
	
};	
	

diag_log "//____________________________ GF Auto Population Spawn Settings initialized  _________________________";