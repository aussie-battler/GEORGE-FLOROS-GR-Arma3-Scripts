


//________________	Author : GEORGE FLOROS [GR]	___________	19.06.19	_____________ 


/*
________________ GF Zombie Spawner Script - Mod	________________

Not Published yet	SOON !

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


if(GF_ZS_Systemchat_info)then{
	systemchat "GF_ZS_Cleaner initializing";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_ZS_Cleaner initializing	________________";
};


GF_ZS_Cleaner = {

	while{alive _this}do{
		if(isMultiplayer)then{	

			if({_x distance _this > GF_ZS_Cleaner_Distance}count GF_ZS_allPlayers > 0)then{
				deleteVehicle _this;
				uisleep 1;
			};
		}else{

			if((_this distance player) > GF_ZS_Cleaner_Distance)then{
				deleteVehicle _this;
				uisleep 1;
			};
		};
		uisleep 2;
	};
};


if(GF_ZS_Systemchat_info)then{
	systemchat "GF_ZS_Cleaner initialized";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_ZS_Cleaner initialized	________________";
};