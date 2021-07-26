


//________________  Author : GEORGE FLOROS [GR] ___________ 09.12.18 _____________

/*
________________ GF Ambient Environment Sounds Script ________________

https://forums.bohemia.net/forums/topic/219857-gf-ambient-environment-sounds-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/
	

diag_log "//________________ GF_AES_Sounds_3D_SFX_Forest initialized ________________";


if (GF_AES_Systemchat_info) then {
systemchat "GF_AES_3D_Sounds_Birds initialized";			
};	


//________________ GF_AES_Sounds_3D_SFX_Forest ________________

GF_AES_Sounds_3D_SFX_Forest_Spawn = {


if (GF_AES_Systemchat_info) then {
systemchat "GF_AES_Sounds_3D_SFX_Forest";			
};	

[] spawn {
	while {true} do {
	
	//________________	daytime and nighttime	________________
	
	if ((date select 3) < 6 or (date select 3) > 19) then {
	
if (GF_AES_hintsilent_info) then {
hintsilent "nightime";		
};	

	sleep GF_AES_Sounds_SFX_Forest_Loop;
		
	//________________	nighttime	________________
	
	if ((!(surfaceIsWater getPos player)) && (!(vehicle player != player))) then {
	
	_Player_Pos = getpos player;	
	_Pos = [[[_Player_Pos, (20)],[]],[]] call BIS_fnc_randomPos;	
	_Sound = "#particlesource" createVehicleLocal _Pos;	
			
	_array = selectRandom[	
	"Wood_1",
	"Wood_2",
	"Wood_3",
	"Wood_4",
	"Wood_5",
	"Wood_6",
	"Wood_7"
	];
	
	_Sound say3D [_array, 100, 1];	
			
if (GF_AES_hintsilent_info) then {
hintsilent "loop";	
};	

	sleep GF_AES_Sounds_SFX_Forest_Loop;
	
	}else{

	//________________	surfaceIsWater	________________
	
if (GF_AES_hintsilent_info) then {
hintsilent "surfaceIsWater or inside vehicle";		
};	

	sleep 3;
	};	

	} else {

if (GF_AES_hintsilent_info) then {
hintsilent "daytime";	
};	

	sleep GF_AES_Sounds_SFX_Forest_Loop;
		
	//________________	daytime	________________
	
	if ((!(surfaceIsWater getPos player)) && (!(vehicle player != player))) then {
	
	_Player_Pos = getpos player;	
	_Pos = [[[_Player_Pos, (20)],[]],[]] call BIS_fnc_randomPos;	
	_Sound = "#particlesource" createVehicleLocal _Pos;	
	
	
	_array = selectRandom[	
	"Wood_1",
	"Wood_2",
	"Wood_3",
	"Wood_4",
	"Wood_5",
	"Wood_6",
	"Wood_7"
	];
	
	_Sound say3D [_array, 100, 1];	
			
if (GF_AES_hintsilent_info) then {
hintsilent "loop";	
};	

	sleep GF_AES_Sounds_SFX_Forest_Loop;

	}else{

if (GF_AES_hintsilent_info) then {
hintsilent "surfaceIsWater or inside vehicle";	
};	
	sleep 3;
	};		
};	
};
};
};


//________________ Change the number of Spawned loops at the same time in GF_Ambient_Environment_Sounds_init.sqf	 ________________
_x = 0;

for "_x" from 0 to GF_AES_Sounds_SFX_Forest_Spawn_x_Number do {
[]spawn GF_AES_Sounds_3D_SFX_Forest_Spawn;
};