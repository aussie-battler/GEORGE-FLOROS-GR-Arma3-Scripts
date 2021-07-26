


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



diag_log "//______________________ GF Auto Population Locations List initializing  ___________________";


//______________________ Create here your Locations List  ___________________

GF_AP_Spawn_Locations = {


/*
//______________________ List  ___________________
	
//______________________	To use this add	______________________
GF_AP_Pos = [] call GF_AP_Pos_isFlatEmpty;	


GF_AP_Pos_isEmpty
GF_AP_Pos_isFlat
GF_AP_Pos_isFlatEmpty
GF_AP_Pos_Airport_Tanoa_Only
GF_AP_Pos_Hill
GF_AP_Pos_Mount
GF_AP_Pos_NameCity
GF_AP_Pos_NameCityCapital
GF_AP_Pos_NameLocal
GF_AP_Pos_NameMarine
GF_AP_Pos_NameVillage
GF_AP_Pos_AnyNearestLocation
GF_AP_Pos_NearestLocation
GF_AP_Pos_ShoreLine_Shore
GF_AP_Pos_ShoreLine_Water
GF_AP_Pos_Random_Water
GF_AP_Pos_Random_No_water
*/


//______________________	a Certain , suggested	______________________
/*
	These are the best all aroun options	
	GF_AP_Pos = [] call GF_AP_Pos_Random_No_water;		//	This option will work in every map even in VR
	GF_AP_Pos = [] call GF_AP_Pos_AnyNearestLocation;		//	This option will have a safer spawn distance
	GF_AP_Pos = [] call GF_AP_Pos_NearestLocation;		//	This option will select the NearestLocation with buildings
*/


	//	GF_AP_Pos = [] call GF_AP_Pos_Random_No_water;		
	
	
//______________________	or on Random	______________________

_selectRandom = selectRandom [

//	GF_AP_Pos_NameCityCapital,		//	Not existing in Stratis 
	GF_AP_Pos_NameCity,
	GF_AP_Pos_NameVillage,
	GF_AP_Pos_NameLocal
	
];	

GF_AP_Pos = [] call _selectRandom;

//______________________	or on Random	______________________



	
};


diag_log "//______________________ GF Auto Population Locations List initialized  ______________________";