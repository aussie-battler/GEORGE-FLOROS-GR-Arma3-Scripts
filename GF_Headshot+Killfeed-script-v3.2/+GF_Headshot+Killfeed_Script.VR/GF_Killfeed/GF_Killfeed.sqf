


//________________  Author : GEORGE FLOROS [GR] ___________ 27.09.18 _____________

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


diag_log "//________________ GF Killfeed Script _____________";


addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer", "_instigator"];
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill
			
	if (isPlayer _killer) then { 
	
	if (_killed isKindOf "CAManBase" 			

/*	
	//________________	You can filter the side here	________________
	
	&& {((side group _killed) == west || 
		 (side group _killed) == east || 
		 (side group _killed) == independent || 
		 (side group _killed) == civilian)}
		
*/		
	)then {
	
	_killed_Name = "";
	_kill_HUD = "";
	_killed_Color = "#99D5FF";

	if (!(isplayer _killed)) then {
	_killed_Name = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _killed] >> "Displayname");
	}else{_killed_Name = name _killed};
	
	private _distance = _killer distance2D _killed; 	
	private _weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _killer) >> "displayname");
	_killed_Color = (side group _killed call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML;
	
	_weapon = currentWeapon _killer;
	_pictureweapon = gettext (configFile >> "cfgWeapons" >> _weapon >> "picture");
	if (_pictureweapon == "") then {
	_weapon = typeOf (vehicle _killer);
	_pictureweapon = (getText (configFile >> "cfgVehicles" >> _weapon >> "picture"));
	};

	//________________	1. Player HUD Notification	________________
	//	https://community.bistudio.com/wiki/BIS_fnc_dynamicText
	
	_kill_HUD = format["<t size='0.5'>Killed  <t size='0.8'> <t color='%1'>  %2  <t color='#FFD700'>  %3 m</t>",_killed_Color,_killed_Name,floor _distance];			
	[_kill_HUD,0,0.3,2,0,0,7017] spawn bis_fnc_dynamicText;
			
	//________________	2. systemChat Notification	________________
	//	runs on every PC showing kills on global , * You can disable the default arma
	[format["%1  Killed  %2  from  %3 m  with  %4", name player,_killed_Name,floor _distance,_weapon],"systemChat"] call BIS_fnc_MP;
	
	//________________	3. 2 Different notification types	________________		
	_kill_info = format["<img size='1' shadow='1' image='%1'/>  %2  Killed <t color='%3'>  %4  <t color='#FFD700'> from   %5 m   with  <t color='#FF0000'> %6 </t>",_pictureweapon,name _killer,_killed_Color,_killed_Name,floor _distance,_weapon];	
		
	//________________	1. Hint parsetext 	________________ 
	//	hintsilent parsetext _kill_info;
	

	//________________	2. Left Corner up display	________________
	_Spawn_kill_info=[["<t size='0.6' align='left' with  %4 >" + _kill_info + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];

	//________________	playSound notification 	________________ 
	playSound "Killfeed_notification";	
	};
	};				
}];