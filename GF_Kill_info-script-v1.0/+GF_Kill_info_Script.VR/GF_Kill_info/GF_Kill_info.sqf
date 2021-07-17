


//________________  Author : GEORGE FLOROS [GR] ___________ 20.10.18 _____________

/*
________________ GF Kill info Script ________________

https://forums.bohemia.net/forums/topic/219906-gf-kill-info-script/

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
	

//diag_log "//________________ GF Kill info Script ________________";


//	TIP :	You can disable the default arma systemChat


//________________ Settings ________________
//________________ Set true or false  ________________

_parsetext_notification			= true;			//	parsetext hint notification
_BIS_fnc_dynamicText			= true;			//	BIS_fnc_dynamicText notification
_systemChat_notification		= true;			//	Show Systemchat notification

_sideChat_notification			= true;			//	Show hint notification
_side_of_sideChat				= playerside;	//	https://community.bistudio.com/wiki/Side	or	ex: west
_identity_of_sideChat			= "HQ";			//	https://community.bistudio.com/wiki/sideChat




if(!local player) exitWith {};
private _Killed = _this select 0;
private _Killer = _this select 1;

private _Distance = _Killed distance2D _Killer;	
private _Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
_Killed_Color = (side group _Killed call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML;

_Weapon = currentWeapon _Killer;
_pictureweapon = gettext (configFile >> "cfgWeapons" >> _Weapon >> "picture");
if (_pictureweapon == "") then {
_Weapon = typeOf (vehicle _Killer);
_pictureweapon = (getText (configFile >> "cfgVehicles" >> _Weapon >> "picture"));
};




diag_log format ["________________	Killed	: %1	Killer : %2	________________",_Killed,_Killer];


//________________ isNull _Killer ________________

if(isNull _Killer) then {

if (_systemChat_notification) then {
[format["%1    Team Killed", _Killed]] remoteExec ["systemChat", 0, true]; 
};

if (_sideChat_notification) then {
[[_side_of_sideChat,_identity_of_sideChat],format["%1    Team Killed", _Killed]]remoteExec ["sideChat", 0, true]; 
};

};


//________________ isPlayer _Killer ________________

if(isPlayer _Killer) then {
    if((vehicle _Killer) == _Killer) then {
		private _Killer_name = name _Killer;
	    if(name _Killed == _Killer_name) then {
		
if (_systemChat_notification) then {
[format["%1    Team Killed", _Killed]] remoteExec ["systemChat", 0, true]; 
};

if (_sideChat_notification) then {
[[_side_of_sideChat,_identity_of_sideChat],format["%1    Team Killed", _Killed]]remoteExec ["sideChat", 0, true]; 
};

	    }else{
	    private _Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
	    if(_Weapon != "") then {

if (_systemChat_notification) then {
[format["%1  Team Killed  %2  from  %3 m  with  %4", _Killer_name,_Killed,floor _Distance,_Weapon]] remoteExec ["systemChat", 0, true]; 
};

if (_sideChat_notification) then {
[[_side_of_sideChat,_identity_of_sideChat],format["%1  Team Killed  %2  from  %3 m  with  %4", _Killer_name,_Killed,floor _Distance,_Weapon]] remoteExec ["sideChat", 0, true]; 
};
	   
	   
//________________	3. 2 Different notification types	________________		
_kill_info = format["<img size='1' shadow='1' image='%1'/>  %2  Team Killed <t color='%3'>  %4  <t color='#FFD700'> from   %5 m   with  <t color='#FF0000'> %6 </t>",_pictureweapon,_Killer_name,_Killed_Color,_Killed,floor _Distance,_Weapon];	
_kill_info2 = format["<t color='#ff0000' size = '.8'>Warning!<br />%1 Team Killing will get you banned. <br />%2 Screenshot this and report in discord. <br /> press F12.</t>",_Killer_name,_Killed];	

if (_parsetext_notification) then {
//________________	1. Hint parsetext 	________________ 
	hintsilent parsetext _kill_info;
};

if (_BIS_fnc_dynamicText) then {
//________________	2. Left Corner up display	________________
_BIS_fnc_dynamicText_info=[["<t size='0.6' align='left' with  %4 >" + _kill_info + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
_BIS_fnc_dynamicText_info=[["<t size='0.6' align='right' with  %4 >" + _kill_info2 + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
};

	   
		};
	};
};

	
	if((vehicle _Killer) != _Killer) then {
		_Killer_name = name _Killer;
		_Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
		private _Vehicle_Killer = getText (configFile >> "CfgVehicles" >> typeof (vehicle _Killer) >> "Displayname");
		if(_Weapon != "") then {

		
if (_systemChat_notification) then {
[format["%1  Team Killed  %2  from  %3 m  with  %4  %5", _Killer_name,_Killed,floor _Distance,_Vehicle_Killer,_Weapon]] remoteExec ["systemChat", 0, true]; 
};

if (_sideChat_notification) then {
[[_side_of_sideChat,_identity_of_sideChat],format["%1  Team Killed  %2  from  %3 m  with  %4  %5", _Killer_name,_Killed,floor _Distance,_Vehicle_Killer,_Weapon]] remoteExec ["sideChat", 0, true]; 
};

	   
//________________	3. 2 Different notification types	________________		
_kill_info = format["<img size='1' shadow='1' image='%1'/>  %2  Team Killed <t color='%3'>  %4  <t color='#FFD700'> from   %5 m   with  <t color='#FF0000'> %6   %7 </t>",_pictureweapon,_Killer_name,_Killed_Color,_Killed,floor _Distance,_Vehicle_Killer,_Weapon];	
_kill_info2 = format["<t color='#ff0000' size = '.8'>Warning!<br />%1 Team Killing will get you banned. <br />%2 Screenshot this and report in discord. <br /> press F12.</t>",_Killer_name,_Killed];	


if (_parsetext_notification) then {
//________________	1. Hint parsetext 	________________ 
	hintsilent parsetext _kill_info;
};

if (_BIS_fnc_dynamicText) then {
//________________	2. Left Corner up display	________________
_BIS_fnc_dynamicText_info=[["<t size='0.6' align='left' with  %4 >" + _kill_info + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
_BIS_fnc_dynamicText_info=[["<t size='0.6' align='right' with  %4 >" + _kill_info2 + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
};

		};
	};
};


//________________ !(isPlayer _Killer) ________________

if!(isPlayer _Killer) then {
	if((vehicle _Killer) == _Killer) then {
		private _ubivec = name _Killer;
		_Killer_name = format ["%1(%2)",_ubivec,getText(configFile>>"CfgVehicles">>typeOf (vehicle _Killer) >>"DisplayName")];
		_Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
		if(_Weapon != "") then {

				
if (_systemChat_notification) then {
[format["%1  Team Killed  %2  from  %3 m  with  %4", _Killer_name,_Killed,floor _Distance,_Weapon]] remoteExec ["systemChat", 0, true]; 
};

if (_sideChat_notification) then {
[[_side_of_sideChat,_identity_of_sideChat],format["%1 Team Killed  %2  from  %3 m  with  %4", _Killer_name,_Killed,floor _Distance,_Weapon]] remoteExec ["sideChat", 0, true]; 
};
	
	
//________________	3. 2 Different notification types	________________		
_kill_info = format["<img size='1' shadow='1' image='%1'/>  %2 Team Killed <t color='%3'>  %4  <t color='#FFD700'> from   %5 m   with  <t color='#FF0000'> %6 </t>",_pictureweapon,_Killer_name,_Killed_Color,_Killed,floor _Distance,_Weapon];	
_kill_info2 = format["<t color='#ff0000' size = '.8'>Warning!<br />%1 Team Killing will get you banned. <br />%2 Screenshot this and report in discord. <br /> press F12.</t>",_Killer_name,_Killed];	

if (_parsetext_notification) then {
//________________	1. Hint parsetext 	________________ 
	hintsilent parsetext _kill_info;
};

if (_BIS_fnc_dynamicText) then {
//________________	2. Left Corner up display	________________
_BIS_fnc_dynamicText_info=[["<t size='0.6' align='left' with  %4 >" + _kill_info + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
_BIS_fnc_dynamicText_info=[["<t size='0.6' align='right' with  %4 >" + _kill_info2 + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
};

		};
	};


	
	if((vehicle _Killer) != _Killer) then {
		_ubivec = name _Killer;
		_Killer_name = format ["%1(%2)",_ubivec,getText(configFile>>"CfgVehicles">>typeOf (vehicle _Killer) >>"DisplayName")];
		_Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
		_Vehicle_Killer = getText (configFile >> "CfgVehicles" >> typeof (vehicle _Killer) >> "Displayname");
		if(_Weapon != "") then {
		
		
if (_systemChat_notification) then {
[format["%1 Team Killed  %2  from  %3 m  with  %4  %5", _Killer_name,_Killed,floor _Distance,_Vehicle_Killer,_Weapon]] remoteExec ["systemChat", 0, true]; 
};

if (_sideChat_notification) then {
[[_side_of_sideChat,_identity_of_sideChat],format["%1 Team Killed  %2  from  %3 m  with  %4  %5", _Killer_name,_Killed,floor _Distance,_Vehicle_Killer,_Weapon]] remoteExec ["sideChat", 0, true]; 
};

	   
//________________	3. 2 Different notification types	________________		
_kill_info = format["<img size='1' shadow='1' image='%1'/>  %2 Team Killed <t color='%3'>  %4  <t color='#FFD700'> from   %5 m   with  <t color='#FF0000'> %6   %7 </t>",_pictureweapon,_Killer_name,_Killed_Color,_Killed,floor _Distance,_Vehicle_Killer,_Weapon];	
_kill_info2 = format["<t color='#ff0000' size = '.8'>Warning!<br />%1 Team Killing will get you banned. <br />%2 Screenshot this and report in discord. <br /> press F12.</t>",_Killer_name,_Killed];	

if (_parsetext_notification) then {
//________________	1. Hint parsetext 	________________ 
	hintsilent parsetext _kill_info;
};

if (_BIS_fnc_dynamicText) then {
//________________	2. Left Corner up display	________________
_BIS_fnc_dynamicText_info=[["<t size='0.6' align='left' with  %4 >" + _kill_info + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
_BIS_fnc_dynamicText_info=[["<t size='0.6' align='right' with  %4 >" + _kill_info2 + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
};

		};
	};
};