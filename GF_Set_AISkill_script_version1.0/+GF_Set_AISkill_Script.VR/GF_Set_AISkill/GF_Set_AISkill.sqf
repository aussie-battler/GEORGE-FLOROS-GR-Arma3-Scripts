


//________________  Author : GEORGE FLOROS [GR] ___________ 16.09.18 _____________

/*
________________ GF Set AISkill Script ________________

https://forums.bohemia.net/forums/topic/219363-gf-set-aiskill-script/?tab=comments#comment-3314767

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
	

diag_log "//________________ GF Set AISkill Script _____________";


//________________ Settings _____________
//________________ Set true or false  _____________

GF_Set_AISkill_Systemchat_info			= true;					//	Show Systemchat information
_Show_AISkill							= true;					//	Show AI Skill


if(_Show_AISkill) then {
onEachFrame {
	if (cursorTarget isKindOf "Man" && !(side cursorTarget isEqualTo side player)) then {
	hintsilent format
        [
        "aimingAccuracy %1\n  aimingShake %2\n  commanding %3\n  courage %4\n  general %5\n  reloadSpeed %6\n  spotDistance %7\n  spotTime %8\n",
        cursortarget skillfinal "aimingAccuracy",
        cursortarget skillfinal "aimingShake",
        cursortarget skillfinal "commanding",
        cursortarget skillfinal "courage",
        cursortarget skillfinal "general",
        cursortarget skillfinal "reloadSpeed",
        cursortarget skillfinal "spotDistance",
        cursortarget skillfinal "spotTime"
        ];
	};
};
};	
	
	
waitUntil {time > 1};

if (GF_Set_AISkill_Systemchat_info) then {
systemchat "GF Set AISkill Script initialized";			
};	

GF_Set_AISkill = "GF_Set_AISkill" call BIS_fnc_getParamValue;


switch (GF_Set_AISkill) do  {


//________________	Novice	________________

case 0:	{	
[] spawn {
	while {true} do {

if (GF_Set_AISkill_Systemchat_info) then {
systemchat "GF_Set_AISkill Novice < 0.25";			
};			
		{		
		if (((alive _x)) && (!(_x getVariable ["GF_AISkill",false]))) then {
			_x setSkill ["aimingAccuracy", 0.05 + (random 0.05)];
			_x setSkill ["aimingShake", 0.05 + (random 0.05)];
			_x setSkill ["aimingSpeed", 0.05 + (random 0.05)];
			_x setSkill ["commanding", 0.05 + (random 0.05)];
			_x setSkill ["courage", 0.05 + (random 0.05)];
			_x setSkill ["general", 0.05 + (random 0.05)];
			_x setSkill ["reloadSpeed", 0.05 + (random 0.05)];
			_x setSkill ["spotDistance", 0.05 + (random 0.05)];
			_x setSkill ["spotTime", 0.05+ (random 0.05)];
			};						
			_x setVariable ["GF_AISkill",true];
			{waitUntil {!alive _x};
			_x setVariable ["GF_AISkill",false];		 
			};
		}forEach allUnits;
		sleep 10;
	};
};	
};
	
	
//________________	Rookie	________________

case 1: {
[] spawn {
	while {true} do {

if (GF_Set_AISkill_Systemchat_info) then {
systemchat "GF_Set_AISkill Rookie >= 0.25 and <= 0.45";			
};			
		{		
		if (((alive _x)) && (!(_x getVariable ["GF_AISkill",false]))) then {
			_x setSkill ["aimingAccuracy", 0.1 + (random 0.05)];
			_x setSkill ["aimingShake", 0.1 + (random 0.05)];
			_x setSkill ["aimingSpeed", 0.1 + (random 0.05)];
			_x setSkill ["commanding", 0.1 + (random 0.05)];
			_x setSkill ["courage", 0.1 + (random 0.05)];
			_x setSkill ["general", 0.1 + (random 0.05)];
			_x setSkill ["reloadSpeed", 0.1 + (random 0.05)];
			_x setSkill ["spotDistance", 0.1 + (random 0.05)];
			_x setSkill ["spotTime", 0.1+ (random 0.05)];
			};						
			_x setVariable ["GF_AISkill",true];
			{waitUntil {!alive _x};
			_x setVariable ["GF_AISkill",false];		 
			};
		}forEach allUnits;
		sleep 10;
	};
};	
};

	
//________________	Recruit	________________

case 2: {
[] spawn {
	while {true} do {

if (GF_Set_AISkill_Systemchat_info) then {
systemchat "GF_Set_AISkill Recruit > 0.45 and <= 0.65";		
};			
		{		
		if (((alive _x)) && (!(_x getVariable ["GF_AISkill",false]))) then {
			_x setSkill ["aimingAccuracy", 0.2 + (random 0.05)];
			_x setSkill ["aimingShake", 0.2 + (random 0.05)];
			_x setSkill ["aimingSpeed", 0.2 + (random 0.05)];
			_x setSkill ["commanding", 0.2 + (random 0.05)];
			_x setSkill ["courage", 0.2 + (random 0.05)];
			_x setSkill ["general", 0.2 + (random 0.05)];
			_x setSkill ["reloadSpeed", 0.2 + (random 0.05)];
			_x setSkill ["spotDistance", 0.2 + (random 0.05)];
			_x setSkill ["spotTime", 0.2+ (random 0.05)];
			};						
			_x setVariable ["GF_AISkill",true];
			{waitUntil {!alive _x};
			_x setVariable ["GF_AISkill",false];		 
			};
		}forEach allUnits;
		sleep 10;
	};
};	
};


//________________	Veteran	________________

case 3: {	
[] spawn {
	while {true} do {

if (GF_Set_AISkill_Systemchat_info) then {
systemchat "GF_Set_AISkill Veteran > 0.65 and <= 0.85";		
};			
		{		
		if (((alive _x)) && (!(_x getVariable ["GF_AISkill",false]))) then {		
			_x setSkill ["aimingAccuracy", 0.5 + (random 0.20)];
			_x setSkill ["aimingShake", 0.5 + (random 0.20)];
			_x setSkill ["aimingSpeed", 0.5 + (random 0.20)];
			_x setSkill ["commanding", 0.5 + (random 0.20)];
			_x setSkill ["courage", 0.5 + (random 0.20)];
			_x setSkill ["general", 0.5 + (random 0.20)];
			_x setSkill ["reloadSpeed", 0.5 + (random 0.20)];
			_x setSkill ["spotDistance", 0.5 + (random 0.20)];
			_x setSkill ["spotTime", 0.5 + (random 0.20)];
			};						
			_x setVariable ["GF_AISkill",true];
			{waitUntil {!alive _x};
			_x setVariable ["GF_AISkill",false];		 
			};
		}forEach allUnits;
		sleep 10;
	};
};	
};
	

//________________	Expert	________________

case 4: {		
[] spawn {
	while {true} do {

if (GF_Set_AISkill_Systemchat_info) then {
systemchat "GF_Set_AISkill Expert > 0.85";
};			
		{		
		if (((alive _x)) && (!(_x getVariable ["GF_AISkill",false]))) then {	
			_x setSkill ["aimingAccuracy", 0.75 + (random 0.25)];
			_x setSkill ["aimingShake", 0.75 + (random 0.25)];
			_x setSkill ["aimingSpeed", 0.75 + (random 0.25)];
			_x setSkill ["commanding", 0.75 + (random 0.25)];
			_x setSkill ["courage", 0.75 + (random 0.25)];
			_x setSkill ["general", 0.75 + (random 0.25)];
			_x setSkill ["reloadSpeed", 0.75 + (random 0.25)];
			_x setSkill ["spotDistance", 0.75 + (random 0.25)];
			_x setSkill ["spotTime", 0.75 + (random 0.25)];
			};						
			_x setVariable ["GF_AISkill",true];
			{waitUntil {!alive _x};
			_x setVariable ["GF_AISkill",false];		 
			};
		}forEach allUnits;
		sleep 10;
	};
};	
};

  
//________________	Random	________________	

case 5:	{		
[] spawn {
	while {true} do {

if (GF_Set_AISkill_Systemchat_info) then {
systemchat "GF_Set_AISkill Random";	
};			
		{		
		if (((alive _x)) && (!(_x getVariable ["GF_AISkill",false]))) then {
			_x setSkill ["aimingAccuracy", 0.25 + (random 0.75)];
			_x setSkill ["aimingShake", 0.25 + (random 0.75)];
			_x setSkill ["aimingSpeed", 0.25 + (random 0.75)];
			_x setSkill ["commanding", 0.25 + (random 0.75)];
			_x setSkill ["courage", 0.25 + (random 0.75)];
			_x setSkill ["general", 0.25 + (random 0.75)];
			_x setSkill ["reloadSpeed", 0.25 + (random 0.75)];
			_x setSkill ["spotDistance", 0.25 + (random 0.75)];
			_x setSkill ["spotTime", 0.25+ (random 0.75)];
			};						
			_x setVariable ["GF_AISkill",true];
			{waitUntil {!alive _x};
			_x setVariable ["GF_AISkill",false];		 
			};
		}forEach allUnits;
		sleep 10;
	};
};	
};

};