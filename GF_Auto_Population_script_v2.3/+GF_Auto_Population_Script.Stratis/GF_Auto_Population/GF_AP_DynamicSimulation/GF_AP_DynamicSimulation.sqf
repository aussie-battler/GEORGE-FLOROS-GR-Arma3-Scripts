


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


//___________________	GF_AP_DynamicSimulation	___________________
//	https://community.bistudio.com/wiki/Arma_3_Dynamic_Simulation#Advanced_settings_-_wake-up_ability
//	to work it needs to add in the spawned group : _Group enableDynamicSimulation true;	
//	this is included at the spawn codes of enemy


enableDynamicSimulationSystem true;

//	hintsilent str dynamicSimulationSystemEnabled;
//	systemchat str canTriggerDynamicSimulation player;


if(GF_AP_DynamicSimulation_auto_distance) then {

//____________________________	code by Demellion	____________________________
//	https://community.bistudio.com/wiki/setDynamicSimulationDistance

[] spawn {
	while {true} do {
		waituntil{uiSleep 0.25;
		if (cameraView isEqualTo "GUNNER") then {
			"Group" setDynamicSimulationDistance (viewDistance - (viewDistance * fog));	// Scoped 	
			
			
		} else {
		
			"Group" setDynamicSimulationDistance ((viewDistance * 0.8) - (viewDistance * fog));	// Not scoped 
		};
		};
	};
};

	}else{

	"Group" setDynamicSimulationDistance GF_AP_DynamicSimulation_manual_distance;
	};