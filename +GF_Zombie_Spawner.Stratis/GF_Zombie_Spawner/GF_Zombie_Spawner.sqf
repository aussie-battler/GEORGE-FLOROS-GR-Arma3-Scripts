


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
	systemchat "GF_Zombie_Spawner Script - Mod initializing";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_Zombie_Spawner Script - Mod initializing	________________";
};


[]spawn{
	while{true}do{
		
		waitUntil{uisleep 0.5; count allUnits < GF_ZS_Enemy_Max_Number};
		
		_ok = false;		
		private ["_player"];
		
		if(isMultiplayer)then{
			_player = selectrandom GF_ZS_allPlayers;
		}else{		
			_player = player;
		};
		
		_nearbyLocations = nearestLocations [position _player,["NameCityCapital","NameCity","NameVillage"],GF_ZS_Distance_Location];
		if!(_nearbyLocations isEqualTo "")then{
			_location = selectrandom _nearbyLocations;
			_locationPos = locationPosition _location;
			GF_ZS_pos = [[[_locationPos, GF_ZS_Distance_Spawn + GF_ZS_Distance_Spawn_random]],[]] call BIS_fnc_randomPos;
			_overLand = !(GF_ZS_pos isFlatEmpty [-1, -1, -1, -1, 0, false]isEqualTo []);
				if(_overLand)then{
					_ok = true;
				};
		};
		
		waitUntil{_ok};
		[]call GF_ZS_Spawner_List;
		
		if(GF_ZS_Diag_Log_info) then {
			diag_log format ["Units : %1",count allUnits,{count _x;}];	
		};
		
		if(GF_ZS_Systemchat_info) then {
			systemchat format ["Units : %1",count allUnits,{count _x;}];
		};
	};
};



if(GF_ZS_Systemchat_info)then{
	systemchat "GF_Zombie_Spawner Script - Mod initialized";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_Zombie_Spawner Script - Mod initialized	________________";
};