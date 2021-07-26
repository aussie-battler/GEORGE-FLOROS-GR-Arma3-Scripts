


//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Holster Script - Mod	________________

https://forums.bohemia.net/forums/topic/215826-gf-holster-script-mod/

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


/*
https://forums.bohemia.net/forums/topic/215798-weapon-holster-by-key-pressed/?tab=comments#comment-3281031

You can search here for key bindings
https://community.bistudio.com/wiki/DIK_KeyCodes

DIK_5               0x06
DIK_TAB             0x0F


//________________	Place this code in the init.sqf	________________

[] execVM "GF_Holster\Credits.sqf";	// Please keep the Credits or add them to your Diary

addMissionEventHandler ["Loaded", {
	params ["_saveType"];
	
	If(_saveType isEqualto "continue") then{
		[] execVM "GF_Holster\GF_Holster.sqf";
	};
}];

[] execVM "GF_Holster\GF_Holster.sqf";
*/




waitUntil {!isNull player};

//________________ Settings ________________
//________________ Set true or false  ________________

GF_Holster_hintSilent_info					= true;
GF_Holster_systemchat_info 					= true;
GF_Holster_diag_log_info 					= true;

GF_Holster_key								= 0x06;	//	key 5
GF_Holster_Disable_Throw 					= true;




if (GF_Holster_systemchat_info) then{
systemchat "GF Holster Script - Mod initializing";			
};	

if (GF_Holster_diag_log_info) then{
diag_log "//________________	GF Holster Script - Mod initializing	________________";
};




[player] spawn {

	disableSerialization;
	waitUntil {!(isNull (findDisplay 46))};
	_display = findDisplay 46;
	_display displayAddEventHandler["KeyDown", {
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
	
	if(_key isEqualto GF_Holster_key) then {
		if (currentWeapon player != "" )then{
			player setVariable ["Var_HazJ_Holstered", true];
			player action ["SWITCHWEAPON",player,player,-1];
			waitUntil {currentWeapon player isEqualto "" or {primaryWeapon player isEqualto "" && handgunWeapon player isEqualto ""}};
			
			if (GF_Holster_hintSilent_info) then{
			hintSilent"Weapon on the back";
			};
			
			}else{
			player setVariable ["Var_HazJ_Holstered", false];
			player action ["SWITCHWEAPON",player,player,0];
			
			if (GF_Holster_hintSilent_info) then{
			hintSilent"Weapon in front";
			};
       };
    };
  }];
};


if(GF_Holster_Disable_Throw)then {

	[player] spawn{

		HazJ_throwKeyEH = (findDisplay 46) displayAddEventHandler ["KeyDown",
		{
			if (param [1] == (actionKeys "Throw" select 0) && player getVariable "Var_HazJ_Holstered") then{
				
				if(GF_Holster_hintSilent_info)then{
				hintSilent "Throw is blocked when your weapon is holstered.";
				};
				
				true
			}else{false};
		}];
	};
};


if (GF_Holster_systemchat_info) then{
systemchat "GF Holster Script - Mod initialized";
systemchat "H o l s t e r    y o u r    W e a p o n    w i t h    k e y    5";			
};	

if (GF_Holster_diag_log_info) then{
diag_log "//________________	GF Holster Script - Mod initialized	________________";
};