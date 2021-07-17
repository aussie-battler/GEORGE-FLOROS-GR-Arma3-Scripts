


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
	systemchat "GF_ZS_Spawner_List Script - Mod initializing";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_ZS_Spawner_List Script - Mod initializing	________________";
};


GF_ZS_Spawner_List = {
	
	_Unit = selectRandom [
	
		//	GF_ZS_Stalk_Unit,	//	Might not work with Max Mod
		GF_ZS_No_WP_Unit,
		GF_ZS_Garrison_Unit
	];
	
	_Group = selectRandom [

		//	GF_ZS_Stalk_Group,	//	Might not work with Max Mod
		GF_ZS_No_WP_Group
	];
	
	if(random 10 < 1)then{
		[]spawn _Group;
	}else{
		[]spawn _Unit;
	};
};


if(GF_ZS_Systemchat_info)then{
	systemchat "GF_ZS_Spawner_List Script - Mod initialized";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_ZS_Spawner_List Script - Mod initialized	________________";
};