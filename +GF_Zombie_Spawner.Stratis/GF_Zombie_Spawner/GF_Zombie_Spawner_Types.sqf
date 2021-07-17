


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
	systemchat "GF_Zombie_Spawner_Types Script - Mod initializing";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_Zombie_Spawner_Types Script - Mod initializing	________________";
};


//___________________	GF_ZS_No_WP_Unit	___________________

GF_ZS_No_WP_Unit = {

	if(count allUnits < GF_ZS_Enemy_Max_Number)then{

		_pos = GF_ZS_pos;

		if!(_pos isEqualTo [0,0,0])then{
			_Group = createGroup GF_ZS_Enemy_Side;

			_unit = _Group createunit [selectrandom GF_ZS_Enemy_array,_pos,[],0,"Can_collide"];
			_unit setVariable["Var_GF_ZS_Spawn",true];
			if(GF_ZS_Change_Loadout)then{_unit spawn GF_ZS_Loadout;};
			_unit spawn	GF_ZS_Cleaner;
		};
	};
};


//___________________	GF_ZS_Stalk_Unit	___________________

GF_ZS_Stalk_Unit = {

	if(count allUnits < GF_ZS_Enemy_Max_Number)then{

		_pos = GF_ZS_pos;

		if!(_pos isEqualTo [0,0,0])then{
			_Group = createGroup GF_ZS_Enemy_Side;

			_unit = _Group createunit [selectrandom GF_ZS_Enemy_array,_pos,[],0,"Can_collide"];
			_unit setVariable["Var_GF_ZS_Spawn",true];
			if(GF_ZS_Change_Loadout)then{_unit spawn GF_ZS_Loadout;};
			_unit spawn	GF_ZS_Cleaner;
			
			_Group setBehaviour "AWARE";
			_Group setCombatMode "RED";

			if (isMultiplayer) then {	
				_stalked = selectrandom GF_ZS_allPlayers;
				[_Group,group _stalked] spawn BIS_fnc_stalk;
			}else{
				[_Group,group player] spawn BIS_fnc_stalk;
			};
		};
	};
};


//___________________	GF_ZS_Garrison_Unit	___________________ 

GF_ZS_Garrison_Excluded_Buildings = [
	"Building_Classname_here",
	"Building_Classname_here"
];


GF_ZS_Garrison_Unit = {

	if(count allUnits < GF_ZS_Enemy_Max_Number)then{

	_Buildings = nearestObjects [GF_ZS_Pos,["House", "Building"],GF_ZS_Garrison_Area_Distance];
	if(typeName _Buildings != "ARRAY") exitWith {};
		
		if(count _Buildings > 0)then{
		_Building = selectRandom _Buildings;

			if(!(typeOf _Building in GF_ZS_Garrison_Excluded_Buildings))then{

				_buildingPositions = [_Building]call BIS_fnc_buildingPositions;
				_count = count _buildingPositions;
				
				if(_count > 0)then{
					_buildingpos = selectRandom _buildingPositions;
					_buildingpos = [(_buildingpos select 0),(_buildingpos select 1),(_buildingpos select 2)];
				
					if !(_buildingpos isEqualTo [0,0,0])then{
						_Group = createGroup GF_ZS_Enemy_Side;
						_Unit = _Group createunit [selectrandom GF_ZS_Enemy_array,_buildingpos,[],0,"Can_collide"];
						_Unit setVariable["Var_GF_ZS_Spawn",true];
						if(GF_ZS_Change_Loadout)then{_unit spawn GF_ZS_Loadout;};
						_unit spawn	GF_ZS_Cleaner;
					};
				};
			};
		};
	};
};




//___________________	GF_ZS_No_WP_Group	___________________

GF_ZS_No_WP_Group= {

	if(count allUnits < GF_ZS_Enemy_Max_Number)then{

		_pos = GF_ZS_pos;

		if!(_pos isEqualTo [0,0,0])then{
			_Group = createGroup GF_ZS_Enemy_Side;
			
			for "_x" from 0 to(GF_ZS_Squad_Members + random GF_APZ_Squad_Members_random)do{
				_unit = _Group createunit [selectrandom GF_ZS_Enemy_array,_pos,[],0,"Can_collide"];
				_unit setVariable["Var_GF_ZS_Spawn",true];
				if(GF_ZS_Change_Loadout)then{_unit spawn GF_ZS_Loadout;};
				_unit spawn	GF_ZS_Cleaner;
			};
		};
	};
};


//___________________	GF_ZS_Stalk_Group	___________________

GF_ZS_Stalk_Group = {

	if(count allUnits < GF_ZS_Enemy_Max_Number)then{

		_pos = GF_ZS_pos;

		if!(_pos isEqualTo [0,0,0])then{
			_Group = createGroup GF_ZS_Enemy_Side;
			
			for "_x" from 0 to(GF_ZS_Squad_Members + random GF_APZ_Squad_Members_random)do{
				_unit = _Group createunit [selectrandom GF_ZS_Enemy_array,_pos,[],0,"Can_collide"];
				_unit setVariable["Var_GF_ZS_Spawn",true];
				if(GF_ZS_Change_Loadout)then{_unit spawn GF_ZS_Loadout;};
				_unit spawn	GF_ZS_Cleaner;
			};
			
			_Group setBehaviour "AWARE";
			_Group setCombatMode "RED";

			if (isMultiplayer) then {	
				_stalked = selectrandom GF_ZS_allPlayers;
				[_Group,group _stalked] spawn BIS_fnc_stalk;
			}else{
				[_Group,group player] spawn BIS_fnc_stalk;
			};
		};
	};
};




if(GF_ZS_Systemchat_info)then{
	systemchat "GF_Zombie_Spawner_Types Script - Mod initialized";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_Zombie_Spawner_Types Script - Mod initialized	________________";
};