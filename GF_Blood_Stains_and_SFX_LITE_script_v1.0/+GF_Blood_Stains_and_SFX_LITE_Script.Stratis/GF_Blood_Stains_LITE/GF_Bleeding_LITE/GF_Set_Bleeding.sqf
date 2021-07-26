


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


diag_log "//________________ GF_Bleeding Script _____________";

systemchat "GF_Bleeding Script    I n i t i a l i z e d";
	  
GF_Set_Bleeding = { 
_this addEventHandler ["Hit",{
           
	_target = _this select 0;
	_target setBleedingRemaining 0;   
	if ((damage _target > 0.20		//	the code will run in 80% Life (0.20) , 1 is dead
	) && (damage _target < 0.99 )	//	don't run the code if dead
	)then {
	_target execVM "GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding.sqf";
		
	//	systemchat "GF_Set_Bleeding";	
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
		if (((alive _x)) && (!(_x getVariable ["EΗ_GF_Set_Bleeding",false]))) then {
			_x call GF_Set_Bleeding};						
			_x setVariable ["EΗ_GF_Set_Bleeding",true];	

			{waitUntil {!alive _x};
			_x setVariable ["EΗ_GF_Set_Bleeding",false];		 
		};
	}forEach allUnits;	
	
	};
};