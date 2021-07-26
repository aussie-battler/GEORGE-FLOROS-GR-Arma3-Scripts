


//________________  Author : GEORGE FLOROS [GR] ___________ 06.08.18 _____________

/*
________________ GF Blood Stains and SFX LITE Script ________________

https://forums.bohemia.net/forums/topic/218538-gf-blood-stains-and-sfx-lite-script/

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

WARNING!!!
This AddOn increases seriously the gore factor in ArmA.
It is not recommended for use by children under the age of 15 years.
*/


// Please keep the Credits or add them to your Diary
[] execVM "GF_Blood_Stains_LITE\Credits.sqf";	


//________________	1.	GF_Bleeding Scipt	________________
[] execVM "GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Set_Bleeding.sqf";	
	
	
//________________	2.	GF_Blood_Pool Scipt	________________
[] execVM "GF_Blood_Stains_LITE\GF_Blood_Pool_LITE\GF_Set_Blood_Pool.sqf";


//________________	3.	GF_Blood_Pool_BIS_Blood Scipt	________________	
//	[] execVM "GF_Blood_Stains_LITE\GF_Blood_Pool_BIS_Blood\GF_Set_Blood_Pool_BIS_Blood.sqf";	


//________________	4.	GF_Blood_Shot Scipt	________________
[] execVM "GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Set_Blood_Shot.sqf";


//________________	5.	GF_Particles Scipts	________________
//[] execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Blood_Particle_Killed\GF_Set_Blood_Particle_Killed.sqf";
[] execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Blood_Particle_Bleeding\GF_Set_Blood_Particle_Bleeding.sqf";


//________________	6.	GF_SFX Scipts	________________
[] execVM "GF_Blood_Stains_LITE\GF_SFX\GF_SFX_Bullet_Impact\GF_SFX_Bullet_Impact.sqf";
[] execVM "GF_Blood_Stains_LITE\GF_SFX\GF_SFX_Killed_LITE\GF_SFX_Killed.sqf";
[] execVM "GF_Blood_Stains_LITE\GF_SFX\GF_SFX_Screaming\GF_Set_SFX_Screaming.sqf";


//////////////////////////////////////////////////////////////////////////////////////////////////


/*
________________ GF Cleanup Script ________________

https://forums.bohemia.net/forums/topic/216359-gf-cleanup-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /* 
means that it is disabled , so there is no need to delete the extra lines. 

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain collours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


[] execVM "GF_Cleanup\Credits.sqf";	// Please keep the Credits or add them to your Diary
[] execVM "GF_Cleanup\GF_Cleanup.sqf";


//	GF Cleanup script , Call with radio alpha , hit in game 0,0,1 
_radio_1 = createTrigger["EmptyDetector",[0,0]];
_radio_1 setTriggerActivation["Alpha","PRESENT",true];
_radio_1 setTriggerStatements["this","execVM 'GF_Cleanup\GF_Cleanup.sqf'",""];
1 setRadioMsg "GF Cleanup script";

//	OR

//	GF Cleanup script , add an action to player
//	player addAction ["GF Cleanup script", "GF_Cleanup\GF_Cleanup.sqf"];