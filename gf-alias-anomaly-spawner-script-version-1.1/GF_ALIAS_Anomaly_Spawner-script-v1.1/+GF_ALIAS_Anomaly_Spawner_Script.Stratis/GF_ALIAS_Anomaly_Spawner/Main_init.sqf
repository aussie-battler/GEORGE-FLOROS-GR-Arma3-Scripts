


//________________	Author : GEORGE FLOROS [GR]	___________	06.04.19	___________


/*
________________	GF ALIAS Anomaly Spawner Script	________________

https://forums.bohemia.net/forums/topic/222715-gf-alias-anomaly-spawner-script/

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


GF_ALIAS_AS_Distance_Check_Loaded = false;

//________________	GF_Distance_Check.sqf	________________
[] execVM "GF_ALIAS_Anomaly_Spawner\GF_Distance_Check.sqf";

waituntil{GF_ALIAS_AS_Distance_Check_Loaded};


//________________ Settings ________________
//________________ Set true or false  ________________

GF_ALIAS_AS_Systemchat_info					= true;		
GF_ALIAS_AS_Hintsilent_info					= true;
GF_ALIAS_AS_diag_log_info					= true;
GF_ALIAS_AS_Debug 							= true;

GF_ALIAS_AS_Systemchat_count				= true;
GF_ALIAS_AS_diag_log_count					= true;

GF_ALIAS_AS_Max_number 						= 20;		//	Max Number of the spawned scripts

GF_ALIAS_AS_Blacklist_Zone_distance			= 1000;		//	Add here the distance from the Blacklist Zones
GF_ALIAS_AS_Distance						= 200;		//	Add here the Safe distance spawn from players


//________________	Select the scripts 	________________ 

GF_ALIAS_AS_Select = [

//	comment if you dont want a script

	1,	//	Burper
	2,	//	Farty
	3,	//	Flamer
	4,	//	Screamer
	5,	//	Smuggler
	6,	//	Sparky
	7,	//	Steamer
	8,	//	Strigoi
	9	//	Worm
];



GF_ALIAS_AS_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
GF_ALIAS_AS_size = worldsize;


if (GF_ALIAS_AS_Systemchat_info) then {
systemchat "GF Auto Loot Script initializing";			
};	

if (GF_ALIAS_AS_diag_log_info) then {
diag_log "//________________ GF Auto Loot Script initializing ________________";
};


//________________	GF_ALIAS_AS	________________ 

GF_ALIAS_AS = {

_ok = false;
while {!(_ok)} do{
GF_ALIAS_AS_allPlayers = [];
{if(alive _x && isPlayer _x) then{GF_ALIAS_AS_allPlayers pushBack _x;};}forEach allUnits;

if(count GF_ALIAS_AS_allPlayers > 0)then{
	_ok = true;
	}else{
	if (GF_ALIAS_AS_Systemchat_info) then {
	//	systemchat "Waiting a Player to enter";			
	};	

	if (GF_ALIAS_AS_diag_log_info) then {
	//	diag_log "//________________ Waiting a Player to enter ________________";
	};
	uisleep 1;
	};
};


waituntil{_ok};

if (GF_ALIAS_AS_Systemchat_info) then {
//	systemchat "a Player entered";			
};	

if (GF_ALIAS_AS_diag_log_info) then {
//	diag_log "//________________ a Player entered ________________";
};

_a = 0;
	
while {(_a < GF_ALIAS_AS_Max_number) && (count GF_ALIAS_AS_allPlayers > 0)} do {
	
	GF_ALIAS_AS_allPlayers = [];
	{if(alive _x && isPlayer _x) then{GF_ALIAS_AS_allPlayers pushBack _x;};}forEach allUnits;


	_pos = [] call BIS_fnc_randomPos;
	if !(_pos isEqualTo [0,0,0]) then {

		GF_ALIAS_AS_Distance_Check_initialized = false;
		GF_ALIAS_AS_Distance_Check_Ok = false;

		[_pos] call GF_ALIAS_AS_Distance_Check;	
		waituntil{GF_ALIAS_AS_Distance_Check_initialized};
		
		if (GF_ALIAS_AS_Distance_Check_Ok isEqualTo true)then {
		
			_Marker_Number = format ["GF_ALIAS_AS_%1",_pos];
			_Marker = createMarker [_Marker_Number,_pos];
			_Color = "Default";	//	https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
			_Text =  "Empty";
			
			//________________	Select the scripts 	________________ 
			_random = selectrandom GF_ALIAS_AS_Select;
			
			
			//________________	Burper	________________ 
			if(_random isEqualTo 1)then {
			_a = _a + 1;
			null = [_Marker_Number,true,"MineDetector","B_AssaultPack_blk","O_Truck_03_device_F"] execVM "AL_burpy\alias_burper.sqf";
			_Text = "Burper";
			_Color = "ColorGUER";
			};
			
			
			//________________	Farty	________________ 
			if(_random isEqualTo 2)then {
			_a = _a + 1;
			[_Marker_Number,"H_PilotHelmetFighter_B",true,30,0.01,true,7] execVM "AL_farty\area_toxic_ini.sqf";
			_Text = "Farty";
			_Color = "ColorYellow";
			};			
			
			
			//________________	Flamer	________________
			if(_random isEqualTo 3)then {
			_a = _a + 1;
			[_Marker_Number,600,0.1,500] execvm "AL_flamer\al_flamer.sqf";
			_Text = "Flamer";
			_Color = "ColorEAST";
			};	
			
			//________________	Screamer	________________
			if(_random isEqualTo 4)then {
			_a = _a + 1;
			null=[_Marker_Number] execvm "AL_screamer\screamer.sqf";
			_Text = "Screamer";
			_Color = "ColorBrown";
			};	
			
			//________________	Smuggler	________________
			if(_random isEqualTo 5)then {
			_a = _a + 1;
			null = [_Marker_Number,true,"",[],0,""] execVM "AL_smuggler\alias_smugg.sqf";
			_Text = "Smuggler";
			_Color = "ColorOrange";
			};	
			
			//________________	Sparky	________________
			if(_random isEqualTo 6)then {
			_a = _a + 1;
			null = [_Marker_Number,"B_AssaultPack_blk",false] execvm "AL_spark\al_sparky.sqf";	//AI will not avoid the anomaly
			_Text = "Sparky";
			_Color = "ColorBlue";
			};	
			
			//________________	Steamer	________________
			if(_random isEqualTo 7)then {
			_a = _a + 1;
			[_Marker_Number,600,0.1,10] execvm "AL_steamer\al_steamer.sqf";
			_Text = "Steamer";
			_Color = "ColorEAST";
			};	
			
			//________________	Strigoi	________________
			if(_random isEqualTo 8)then {
			_a = _a + 1;
			[_Marker_Number,600,true,0.1,2000] execvm "AL_strigoi\strigoi.sqf";	// ACTIVE DURING NIGHT AND DAY
			_Text = "Strigoi";
			_Color = "ColorCIV";
			};	
			
			//________________	Worm	________________
			if(_random isEqualTo 9)then {
			_a = _a + 1;
			null=[_Marker_Number] execvm "AL_worm\worm.sqf";
			_Text = "Worm";
			_Color = "ColorPink";
			};	

			
			
			//________________	GF_ALIAS_AS_Debug	________________
			
		if (GF_ALIAS_AS_Debug) then {

			_Marker setMarkerShape "ICON"; 
			_Marker setMarkerType "mil_dot"; 
			_Marker setMarkerColor _Color; 
			_Marker setMarkerText _Text;	
			_Marker setMarkerSize [1,1]; 
			};		


			if (GF_ALIAS_AS_Systemchat_count) then {
			systemchat format ["Spawned : %1",_a];
			};

			if (GF_ALIAS_AS_diag_log_count) then {
			diag_log format ["Spawned : %1",_a];
			};

			};
		};
	};
};


[] spawn GF_ALIAS_AS;