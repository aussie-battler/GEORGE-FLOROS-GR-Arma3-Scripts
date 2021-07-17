


//________________  Author : GEORGE FLOROS [GR] ___________ 23.09.18 _____________

/*
________________ GF Killfeed Script ________________

https://forums.bohemia.net/forums/topic/206593-headshot-killfeed-script/

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


diag_log "//________________ GF Headshot Script _____________";


/*
3 different type of notification available , 3 now is selected . 
To enable the others remove the  // comments 
*/


GF_Killfeed_Headshot = { 

_this addEventHandler ["hitpart", {
if ("head" in (_this select 0 select 5)) then {
((_this select 0) select 0) RemoveEventHandler ["HitPart",0];


/*
//________________	1. BIS_fnc_typeText	________________
//________________	Letters appear gradually, upper part of the screen, center	________________
any=[
	[
		["Headshot","<t align = 'center' size = '1.5'>%1</t>"]
	]
] spawn BIS_fnc_typeText; 

*/

//________________	or	________________

/*
//________________	2. BIS_fnc_infoText	________________

	//Individual letters appear quickly in random order, then disappear. Bottom right corner.
any= [
"Headshot"
] spawn BIS_fnc_infoText;

*/

//________________	or	________________

//________________	3. BIS_fnc_textTiles	________________

[parseText format  
//["img size='20' image='02.paa'/>" ], 
["<t align='center' font='PuristaBold' size='2.8'>""HEADSHOT""</t>" ], 
true, nil,  1, 0.7, 0] spawn BIS_fnc_textTiles; 

/*
https://community.bistudio.com/wiki/BIS_fnc_textTiles
https://community.bistudio.com/wiki/parseText

Description:
	Show animated text

	Parameter(s):
	0: Content
		STRING - Picture
		STRUCTURED TEXT - Text
	1 (Optional):
		ARRAY - Position in format [x,y,w,h]
		BOOL - Use "Mission" area position (customizable in Layout options menu)
	2 (Optional): ARRAY - Tile size in format [w,h]
	3 (Optional): NUMBER - Duration in seconds (default: 5)
	4 (Optional): NUMBER - Fade in/out time (default: 0.5)
	5 (Optional): NUMBER - Tile transparency (default: 0.3)

	Returns:
	BOOL - true	
*/
	//_____________________________________________________________________________

//SOUNDS
		
_sounds = [
"Headshot_Blow_it_out_your_ass","Headshot_Come_get_some","Headshot_Come_on","Headshot_Damn_i_m_good","Headshot_Eat_shit_and_die",
"Headshot_Game_over","Headshot_Gotta_hurt","Headshot_Holy_shit","Headshot_It_hurts_to_be_you","Headshot_lets_rock",
"Headshot_Make_day","Headshot_Mess","Headshot_Ooooh_thats_gotta_hurt","Headshot_See_you_in_hell","Headshot_Shake_it_baby",
"Headshot_Shit_happens","Headshot_Terminated","Headshot_Ugly","Headshot_Wasted","Headshot_Yippie_kaiay"
]call BIS_fnc_selectRandom;
	
[[_this select 0,_sounds] remoteExec ["say3D"]];



};
}];
};

	
[] spawn {
	while {true} do {
    _time = diag_tickTime + 3;	//	every % second
    _i = 0;
    waitUntil {
	sleep 1;
    _i = _i + 1;		
    diag_tickTime >= _time
    };	
    	hint format ["Code executed %1 times per second", _i];	
	{	
		if (!(_x getVariable ["Var_GF_Killfeed_Headshot",false])) then {
			  _x spawn GF_Killfeed_Headshot};						
			  _x setVariable ["Var_GF_Killfeed_Headshot",true];	

			 {waitUntil {!alive _x};
			 _x setVariable ["Var_GF_Killfeed_Headshot",false];							
		};
	}forEach allUnits;		
	};
};