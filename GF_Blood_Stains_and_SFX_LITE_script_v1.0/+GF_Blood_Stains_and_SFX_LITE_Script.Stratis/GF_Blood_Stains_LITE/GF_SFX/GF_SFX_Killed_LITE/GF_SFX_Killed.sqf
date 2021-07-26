


//________________  Author : GEORGE FLOROS [GR] ___________ 06.08.18 _____________

/*
________________ GF Blood Stains and SFX LITE Script ________________

https://forums.bohemia.net/forums/topic/218538-gf-blood-stains-and-sfx-lite-script/

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

WARNING!!!
This AddOn increases seriously the gore factor in ArmA.
It is not recommended for use by children under the age of 15 years.
*/


diag_log "//________________ GF_SFX_Killed Script _____________";

systemchat "GF_SFX_Killed Script    I n i t i a l i z e d";

addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];
	if (_killed isKindOf "CAManBase"  
) then
	{
			
	_killed = _this select 0;
	
	
	//	systemchat "GF_SFX_Killed";

	
//________________ Settings _____________
//________________ Set true or false  _____________

_1_BIS_Killed_SFX				= false; 	
_2_Custom_Killed_SFX  			= true; 
	
	
	
//________________ _1_BIS_Killed_SFX _____________		
if (_1_BIS_Killed_SFX) then {	

//________________ playSound3D ________________
//Sounds
//https://forums.bohemia.net/forums/topic/213322-where-are-ingame-sounds-for-pain-grunt/?tab=comments#comment-3264409
//playSound3D ["a3\sounds_f\characters\human-sfx\Person0\P0_hit_05.wss",_this];

_BIS_Killed_SFX = format ["A3\sounds_f\characters\human-sfx\P0%1\Hit_Max_%2.wss", selectRandom [4,5,6,7,8,9], selectRandom [1,2,3,4,5]];

//Sounds
//https://forums.bohemia.net/forums/topic/213322-where-are-ingame-sounds-for-pain-grunt/?tab=comments#comment-3264409
//playSound3D ["a3\sounds_f\characters\human-sfx\Person0\P0_hit_05.wss",_this];

//	OR You can add your desired game sfx here
//________________ playSound3D on random ________________		
_BIS_Killed_SFX_2 =selectRandom[
			
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_01.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_02.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_03.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_04.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_05.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_06.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_07.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_08.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_09.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_10.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_11.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_12.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_hit_13.wss"
		];
		
		//	systemchat "_1_BIS_Killed_SFX";
		
		[playSound3D [_BIS_Killed_SFX,_killed]] call BIS_fnc_MP;

};


//________________ _2_Custom_Killed_SFX _____________		
if (_2_Custom_Killed_SFX) then {		

_Custom_Killed_SFX =selectRandom[	

		"Killed_3",
		"Killed_5",
		"Killed_6",
		"Killed_8",
		"Killed_9",
		"Killed_10",
		"Killed_11",
		"Killed_12",
		"Killed_13",
		"Killed_14",
		"Killed_15"
		];
			
		//	systemchat "_2_Custom_Killed_SFX";
		
		_Custom_Killed_SFX_pos = "#particlesource" createVehicleLocal ASLToAGL getPosWorld _killed;
		_Custom_Killed_SFX_pos say3D _Custom_Killed_SFX;		
};		

};}];