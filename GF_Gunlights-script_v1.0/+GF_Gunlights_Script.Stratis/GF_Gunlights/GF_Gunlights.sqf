


//________________  Author : GEORGE FLOROS [GR] ___________ 12.11.18 _____________

/*
________________ GF Gunlights Script Script ________________

https://forums.bohemia.net/forums/topic/220278-gf-gunlights-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


diag_log "//________________	GF Gunlights Script Initializing	_____________";
systemchat "GF Gunlights Script Initializing";


//________________	Thanks to Killzone Kid for his tutorials	________________
//	http://killzonekid.com/category/tutorials/

KK_fnc_inHouse = {
    private ["_house"];
    _house = "";
	lineIntersectsSurfaces [
		getPosWorld _this, 
		getPosWorld _this vectorAdd [0, 0, 50], 
		_this, objNull, true, 1, "GEOM", "NONE"
	] select 0 params ["","","","_house"];
	if (_house isKindOf "House") exitWith {true};
	false
};
//	onEachFrame {hintSilent str (player call KK_fnc_inHouse)};


GF_Gunlights = {

	//________________	add _possibility	________________

	_possibility				= floor (random 10) < 5;

	if (_possibility) then {

	_this setVariable ["Var_GF_Gunlights",true];
    		
	_this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setVariable ["Var_GF_Gunlights",false];
	
	//_unit unassignItem "NVGoggles";
	//_unit removeItem "NVGoggles";
	_unit removePrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "acc_flashlight";

	}];	
	
	//_this unassignItem "NVGoggles";	//	Remove NVG
	//_this removeItem "NVGoggles";
	_this removePrimaryWeaponItem "acc_pointer_IR";
	_this addPrimaryWeaponItem "acc_flashlight";
	
	while {true} do {
	
	if ((date select 3) < 6 or (date select 3) > 19 ) then {
	
	if (
	(alive _this) 
	&& (!(underwater _this) or ((getPosASLW _this select 2) > -1.5))
	) then {	
					
		//________________	_inHouse	________________
			
		_inHouse = _this call KK_fnc_inHouse;
			
		if (_inHouse) then {
		_this enablegunlights "forceOn";
		sleep 3;
		}else{
				
		//________________	CARELESS	________________
		
		if((!(_inHouse)) && (behaviour _this == "CARELESS")) then {
			sleep 10 + random 40;
			_this enablegunlights "forceOn";
			
			sleep 120 + random 60;				
			_this  enablegunlights "forceOff";};
			
		
		//________________	SAFE	________________
		
		if((!(_inHouse)) && (behaviour _this == "SAFE")) then {
			sleep 10 + random 40;
			_this enablegunlights "forceOn";
			
			sleep 60 + random 60;				
			_this  enablegunlights "forceOff";};
			
		
		//________________	STEALTH	________________
		
		if((!(_inHouse)) && (behaviour _this == "STEALTH")) then {
			_this  enablegunlights "forceOff";
			sleep 5;};
			
		//________________	AWARE	________________
		
		if((!(_inHouse)) && (behaviour _this == "AWARE")) then {
			sleep 10 + random 30;
			_this enablegunlights "forceOn";
			
			sleep random 10;			
			_this  enablegunlights "forceOff";};
		
		//________________	COMBAT	________________
		
		if((!(_inHouse)) && (behaviour _this == "COMBAT")) then {
			_this  enablegunlights "forceOff";
			sleep 5;};
		
		};
			
		};			
		}else{
		_this  enablegunlights "forceOff";
		sleep 10;	
		};
	};
	};
};


//________________	spawn	_____________

[] spawn {
	while {true} do {
    _time = diag_tickTime + 15;	//	% sec
    _i = 0;
    waitUntil {
		sleep 1;
        _i = _i + 1;		
        diag_tickTime >= _time
    };
	   //	hint format ["Code executed %1 times per second", _i];	
	{	
		if (
		((alive _x))
		&& (!(_x getVariable ["Var_GF_Gunlights",false]))		
		&& (!isPlayer _x)
		
		/*
		//________________	You can filter the side here	________________	
		&& {((side group _x) == west || 
			(side group _x) == east || 
			(side group _x) == independent || 
			(side group _x) == civilian || 
			(side group _x) == sideUnknown)}
		
		//	&& (side _x == playerSide)	// only for the Player side
		*/
				
		) then {
		//________________	You can filter here	________________

		_x spawn GF_Gunlights;
		};								
		_x setVariable ["Var_GF_Gunlights",true];

		{waitUntil {!alive _x};
		_x setVariable ["Var_GF_Gunlights",false];
		};
	}forEach allUnits;
	};
};


diag_log "//________________	GF Gunlights Script Initialized	_____________";
systemchat "GF Gunlights Script Initialized";