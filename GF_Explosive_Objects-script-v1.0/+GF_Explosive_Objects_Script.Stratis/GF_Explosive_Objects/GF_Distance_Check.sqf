


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


diag_log "//________________ GF_EXO_Distance_Check initializing ________________";


GF_EXO_Distance_Check_Loaded = false;


//______________________	Blacklist Zones	______________________	
/*
Add here and below , your Blacklist Zones ( if you want more ) , 
these are included in the 3D editor to copy paste to your mission.
If you don't want them , dont copy them in your mission.
*/


GF_EXO_Blacklist_Zone_1 = getMarkerPos "GF_EXO_Blacklist_Zone_1";	
GF_EXO_Blacklist_Zone_2 = getMarkerPos "GF_EXO_Blacklist_Zone_2";
GF_EXO_Blacklist_Zone_3 = getMarkerPos "GF_EXO_Blacklist_Zone_3";
GF_EXO_Blacklist_Zone_4 = getMarkerPos "GF_EXO_Blacklist_Zone_4";
GF_EXO_Blacklist_Zone_5 = getMarkerPos "GF_EXO_Blacklist_Zone_5";




//______________________	GF_EXO_Distance_Check	______________________	

GF_EXO_Distance_Check = {


_Pos = _this select 0;
GF_EXO_Distance_Check_initialized = false;

if (isMultiplayer) then {	

diag_log "//______________________ ******* isMultiplayer *******	___________________";

if (		
	//________________	Add Blacklist Distance from all Players	________________
	({_x distance _Pos > GF_EXO_Distance}count GF_EXO_allPlayers > 0)
	
	//________________	Add here your Blacklist Zones ( for more )	________________
	&& ((_Pos distance GF_EXO_Blacklist_Zone_1) > GF_EXO_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_EXO_Blacklist_Zone_2) > GF_EXO_Blacklist_Zone_distance)
	&& ((_Pos distance GF_EXO_Blacklist_Zone_3) > GF_EXO_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_EXO_Blacklist_Zone_4) > GF_EXO_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_EXO_Blacklist_Zone_5) > GF_EXO_Blacklist_Zone_distance) 
	
	) then {
	GF_EXO_Distance_Check_Ok = true;
	GF_EXO_Distance_Check_initialized = true;
	
	}else{	
	GF_EXO_Distance_Check_Ok = false;
	GF_EXO_Distance_Check_initialized = true;	
	};


		}else{

	//___________________	SP	___________________
	
	if (		
	//________________	Add Blacklist Distance from all Players	________________
	((_Pos distance player) > GF_EXO_Distance)
	
	//________________	Add here your Blacklist Zones ( for more )	________________
	&& ((_Pos distance GF_EXO_Blacklist_Zone_1) > GF_EXO_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_EXO_Blacklist_Zone_2) > GF_EXO_Blacklist_Zone_distance)
	&& ((_Pos distance GF_EXO_Blacklist_Zone_3) > GF_EXO_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_EXO_Blacklist_Zone_4) > GF_EXO_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_EXO_Blacklist_Zone_5) > GF_EXO_Blacklist_Zone_distance) 
	
	) then {
	GF_EXO_Distance_Check_Ok = true;
	GF_EXO_Distance_Check_initialized = true;

	}else{
	GF_EXO_Distance_Check_Ok = false;
	GF_EXO_Distance_Check_initialized = true;
	};
	
	};	
};


GF_EXO_Distance_Check_Loaded = true;

diag_log "//______________________ GF_EXO_Distance_Check initialized	___________________";