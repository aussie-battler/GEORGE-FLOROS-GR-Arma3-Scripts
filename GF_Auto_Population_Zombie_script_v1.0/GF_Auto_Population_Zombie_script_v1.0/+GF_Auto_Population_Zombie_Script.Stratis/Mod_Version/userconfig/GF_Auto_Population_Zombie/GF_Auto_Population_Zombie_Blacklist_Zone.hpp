


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


diag_log "//______________________ GF Auto Population Blacklist Zones List initializing	___________________";


//______________________	Blacklist Zones	______________________	
/*
Add here and below , your Blacklist Zones ( if you want more ) , 
these are included in the 3D editor to copy paste to your mission.
If you don't want them , dont copy them in your mission.
*/

GF_APZ_Blacklist_Zone_1 = getMarkerPos "GF_APZ_Blacklist_Zone_1";	
GF_APZ_Blacklist_Zone_2 = getMarkerPos "GF_APZ_Blacklist_Zone_2";
GF_APZ_Blacklist_Zone_3 = getMarkerPos "GF_APZ_Blacklist_Zone_3";
GF_APZ_Blacklist_Zone_4 = getMarkerPos "GF_APZ_Blacklist_Zone_4";
GF_APZ_Blacklist_Zone_5 = getMarkerPos "GF_APZ_Blacklist_Zone_5";




//______________________	GF_APZ_Safe_distance_Check	______________________	

GF_APZ_Safe_distance_Check = {


_Pos = _this select 0;
GF_APZ_Safe_distance_Check_initialized = false;

if (isMultiplayer) then {	
		

if (		
	//___________________	Add Safe Distance from all Players	___________________
	({_x distance _Pos < GF_APZ_Units_Spawn_Safe_distance}count playableUnits isEqualTo 0)
	
	//___________________	Add here your Blacklist Zones	___________________
	&& ((_Pos distance GF_APZ_Blacklist_Zone_1) > GF_APZ_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_APZ_Blacklist_Zone_2) > GF_APZ_Blacklist_Zone_distance)
	&& ((_Pos distance GF_APZ_Blacklist_Zone_3) > GF_APZ_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_APZ_Blacklist_Zone_4) > GF_APZ_Blacklist_Zone_distance)
	&& ((_Pos distance GF_APZ_Blacklist_Zone_5) > GF_APZ_Blacklist_Zone_distance)
	
	) then {
	GF_APZ_Safe_distance_Check_Ok = true;
	GF_APZ_Safe_distance_Check_initialized = true;
	
	if(GF_APZ_Hintsilent_info) then {
	hintsilent "Safe_distance true";
	};
	
	}else{
	
	GF_APZ_Safe_distance_Check_Ok = false;
	GF_APZ_Safe_distance_Check_initialized = true;
	
	if(GF_APZ_Hintsilent_info) then {
	hintsilent "Safe_distance false";
	};
		
	};
	
	
	
		}else{


	//___________________	SP	___________________
	
	
	if (		
	//___________________	Add Safe Distance from all Players	___________________
	((_Pos distance player) > GF_APZ_Units_Spawn_Safe_distance)
	
	//___________________	Add here your Blacklist Zones	___________________
	&& ((_Pos distance GF_APZ_Blacklist_Zone_1) > GF_APZ_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_APZ_Blacklist_Zone_2) > GF_APZ_Blacklist_Zone_distance)
	&& ((_Pos distance GF_APZ_Blacklist_Zone_3) > GF_APZ_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_APZ_Blacklist_Zone_4) > GF_APZ_Blacklist_Zone_distance)
	&& ((_Pos distance GF_APZ_Blacklist_Zone_5) > GF_APZ_Blacklist_Zone_distance)
	
	) then {
	GF_APZ_Safe_distance_Check_Ok = true;
	GF_APZ_Safe_distance_Check_initialized = true;
	
	if(GF_APZ_Hintsilent_info) then {
	hintsilent "Safe_distance true";
	};
	
	}else{
	
	GF_APZ_Safe_distance_Check_Ok = false;
	GF_APZ_Safe_distance_Check_initialized = true;
	
	if(GF_APZ_Hintsilent_info) then {
	hintsilent "Safe_distance false";
	};
	};
	
	};
	
};


diag_log "//______________________ GF Auto Population Blacklist Zones List initialized	___________________";