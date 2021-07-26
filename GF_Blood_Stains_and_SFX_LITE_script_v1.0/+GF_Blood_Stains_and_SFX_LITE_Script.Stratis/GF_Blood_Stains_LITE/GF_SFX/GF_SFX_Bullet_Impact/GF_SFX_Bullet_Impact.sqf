


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


diag_log "//________________ GF_SFX_Bullet_Impact Script _____________";

systemchat "GF_SFX_Bullet_Impact Script    I n i t i a l i z e d";

GF_SFX_Bullet_Impact = { 
_this addEventHandler ["hitPart", {
			
		_target    = (_this select 0) select 0;
		_shooter   = (_this select 0) select 1;

		//	systemchat "GF_SFX_Bullet_Impact";

		
//________________ Settings _____________
//________________ Set true or false  _____________

_1_BIS_Impact_SFX					= false; 	
_2_Custom_Impact_SFX  				= true; 
	
//________________ _1_BIS_Impact_SFX _____________		
if (_1_BIS_Impact_SFX) then {	

_BIS_Impact_SFX =selectRandom[	
		"A3\sounds_f\characters\movements\bodyfalls\bodyfall_concrete_1.wss",			//1
		"A3\sounds_f\characters\movements\bodyfalls\bodyfall_concrete_2.wss",			//2
		"A3\sounds_f\characters\movements\bodyfalls\bodyfall_concrete_3.wss",			//3
		"A3\sounds_f\characters\movements\bodyfalls\bodyfall_grass_1.wss",				//4
		"A3\sounds_f\characters\movements\bodyfalls\bodyfall_grass_2.wss",				//5
		"A3\sounds_f\characters\movements\bodyfalls\bodyfall_grass_3.wss"				//6
		];
			
		//	systemchat "_1_BIS_Impact_SFX";
		
		[playSound3D [_BIS_Impact_SFX,_target]] call BIS_fnc_MP;
		
};
		

//________________ _2_Custom_Impact_SFX _____________		
if (_2_Custom_Impact_SFX) then {		

_Custom_Impact_SFX =selectRandom[	
		"Bullet_Impact_1",
		"Bullet_Impact_2",
		"Bullet_Impact_3",
		"Bullet_Impact_4",
		"Bullet_Impact_5",
		"Bullet_Impact_6",
		"Bullet_Impact_7",
		"Bullet_Impact_8",
		"Bullet_Impact_9",
		"Bullet_Impact_10",
		"Bullet_Impact_11",
		"Bullet_Impact_12",
		"Bullet_Impact_13",
		"Bullet_Impact_14",
		"Bullet_Impact_15"
		];
	
		//	systemchat "_2_Custom_Impact_SFX";
		
		_Custom_Impact_SFX_pos = "#particlesource" createVehicleLocal ASLToAGL getPosWorld _target;
		_Custom_Impact_SFX_pos say3D _Custom_Impact_SFX;
		
};		
		
}];};


[] spawn {
	while {true} do {
    _time = diag_tickTime + 1;
    _i = 0;
    waitUntil {
	sleep 2;
        _i = _i + 1;		
        diag_tickTime >= _time
    };	
    //	hint format ["Code executed %1 times per second", _i];
	
	{	
		if (((alive _x)) && (!(_x getVariable ["EΗ_GF_SFX_Bullet_Impact",false]))) then {
			_x call GF_SFX_Bullet_Impact};						
			_x setVariable ["EΗ_GF_SFX_Bullet_Impact",true];	

			{waitUntil {!alive _x};
			_x setVariable ["EΗ_GF_SFX_Bullet_Impact",false];		 
		};
	}forEach allUnits;
	
	};
};