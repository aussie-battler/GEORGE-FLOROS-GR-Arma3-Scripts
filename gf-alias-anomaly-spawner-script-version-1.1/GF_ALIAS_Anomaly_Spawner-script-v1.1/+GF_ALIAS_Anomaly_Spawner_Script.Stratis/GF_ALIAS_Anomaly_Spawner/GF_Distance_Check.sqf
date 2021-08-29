


//________________	Author : GEORGE FLOROS [GR]	___________	28.03.19	___________


/*
________________	GF_Distance_Check	________________



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


diag_log "//________________ GF_ALIAS_AS_Distance_Check initializing ________________";


GF_ALIAS_AS_Distance_Check_Loaded = false;


//______________________	Blacklist Zones	______________________	
/*
Add here and below , your Blacklist Zones ( if you want more ) , 
these are included in the 3D editor to copy paste to your mission.
If you don't want them , dont copy them in your mission.
*/


GF_ALIAS_AS_Blacklist_Zone_1 = getMarkerPos "GF_ALIAS_AS_Blacklist_Zone_1";	
GF_ALIAS_AS_Blacklist_Zone_2 = getMarkerPos "GF_ALIAS_AS_Blacklist_Zone_2";
GF_ALIAS_AS_Blacklist_Zone_3 = getMarkerPos "GF_ALIAS_AS_Blacklist_Zone_3";
GF_ALIAS_AS_Blacklist_Zone_4 = getMarkerPos "GF_ALIAS_AS_Blacklist_Zone_4";
GF_ALIAS_AS_Blacklist_Zone_5 = getMarkerPos "GF_ALIAS_AS_Blacklist_Zone_5";




//______________________	GF_ALIAS_AS_Distance_Check	______________________	

GF_ALIAS_AS_Distance_Check = {


_Pos = _this select 0;
GF_ALIAS_AS_Distance_Check_initialized = false;

if (isMultiplayer) then {	

diag_log "//______________________ ******* isMultiplayer *******	___________________";

if (		
	//________________	Add Blacklist Distance from all Players	________________
	({_x distance _Pos > GF_ALIAS_AS_Distance}count GF_ALIAS_AS_allPlayers > 0)
	
	//________________	Add here your Blacklist Zones ( for more )	________________
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_1) > GF_ALIAS_AS_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_2) > GF_ALIAS_AS_Blacklist_Zone_distance)
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_3) > GF_ALIAS_AS_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_4) > GF_ALIAS_AS_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_5) > GF_ALIAS_AS_Blacklist_Zone_distance) 
	
	) then {
	GF_ALIAS_AS_Distance_Check_Ok = true;
	GF_ALIAS_AS_Distance_Check_initialized = true;
	
	}else{	
	GF_ALIAS_AS_Distance_Check_Ok = false;
	GF_ALIAS_AS_Distance_Check_initialized = true;	
	};


		}else{

	//___________________	SP	___________________
	
	if (		
	//________________	Add Blacklist Distance from all Players	________________
	((_Pos distance player) > GF_ALIAS_AS_Distance)
	
	//________________	Add here your Blacklist Zones ( for more )	________________
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_1) > GF_ALIAS_AS_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_2) > GF_ALIAS_AS_Blacklist_Zone_distance)
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_3) > GF_ALIAS_AS_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_4) > GF_ALIAS_AS_Blacklist_Zone_distance) 
	&& ((_Pos distance GF_ALIAS_AS_Blacklist_Zone_5) > GF_ALIAS_AS_Blacklist_Zone_distance) 
	
	) then {
	GF_ALIAS_AS_Distance_Check_Ok = true;
	GF_ALIAS_AS_Distance_Check_initialized = true;

	}else{
	GF_ALIAS_AS_Distance_Check_Ok = false;
	GF_ALIAS_AS_Distance_Check_initialized = true;
	};
	
	};	
};


GF_ALIAS_AS_Distance_Check_Loaded = true;

diag_log "//______________________ GF_ALIAS_AS_Distance_Check initialized	___________________";