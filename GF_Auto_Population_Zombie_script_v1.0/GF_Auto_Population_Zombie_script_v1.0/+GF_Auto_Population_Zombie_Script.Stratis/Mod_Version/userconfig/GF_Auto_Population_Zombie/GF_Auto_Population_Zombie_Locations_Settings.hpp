


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



diag_log "//______________________ GF Auto Population Locations List initializing  ___________________";


//______________________ Create here your Locations List  ___________________

GF_APZ_Spawn_Locations = {


/*
//______________________ List  ___________________
	
//______________________	To use this add	______________________
GF_APZ_Pos = [] call GF_APZ_Pos_isFlatEmpty;	


GF_APZ_Pos_isEmpty
GF_APZ_Pos_isFlat
GF_APZ_Pos_isFlatEmpty
GF_APZ_Pos_Airport_Tanoa_Only
GF_APZ_Pos_Hill
GF_APZ_Pos_Mount
GF_APZ_Pos_NameCity
GF_APZ_Pos_NameCityCapital
GF_APZ_Pos_NameLocal
GF_APZ_Pos_NameMarine
GF_APZ_Pos_NameVillage
GF_APZ_Pos_AnyNearestLocation
GF_APZ_Pos_NearestLocation
GF_APZ_Pos_ShoreLine_Shore
GF_APZ_Pos_ShoreLine_Water
GF_APZ_Pos_Random_Water
GF_APZ_Pos_Random_No_water
*/


//______________________	a Certain , suggested	______________________
/*
	These are the best all aroun options	
	GF_APZ_Pos = [] call GF_APZ_Pos_Random_No_water;		//	This option will work in every map even in VR
	GF_APZ_Pos = [] call GF_APZ_Pos_AnyNearestLocation;		//	This option will have a safer spawn distance
	GF_APZ_Pos = [] call GF_APZ_Pos_NearestLocation;		//	This option will select the NearestLocation with buildings
*/


	//	GF_APZ_Pos = [] call GF_APZ_Pos_Random_No_water;		
	
	
//______________________	or on Random	______________________

_selectRandom = selectRandom [

//	GF_APZ_Pos_NameCityCapital,		//	Not existing in Stratis 
	GF_APZ_Pos_NameCity,
	GF_APZ_Pos_NameVillage,
	GF_APZ_Pos_NameLocal
	
];	

GF_APZ_Pos = [] call _selectRandom;

//______________________	or on Random	______________________



	
};


diag_log "//______________________ GF Auto Population Locations List initialized  ______________________";