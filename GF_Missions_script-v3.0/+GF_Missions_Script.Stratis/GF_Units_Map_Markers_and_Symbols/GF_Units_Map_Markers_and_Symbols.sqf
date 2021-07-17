


//________________  Author : GEORGE FLOROS [GR] ___________ 10.11.18 _____________

/*
________________ GF Units Map Markers and Symbols Script ________________

https://forums.bohemia.net/forums/topic/219763-gf-units-map-markers-and-symbols-script/

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


//________________	You can add in the init of a unit to exclude	________________	
//	this setVariable ["Var_GF_Units_Map_Markers", true];
//	this setVariable ["Var_GF_Units_Map_Symbols", true];
	
	
diag_log "//________________	GF Units Map Markers and Symbols Script	_____________";


diag_log "//________________	GF Units Map Markers and Symbols Script Initializing	_____________";
systemchat "GF Units Map Markers Initializing";


//________________	GF_Units_Map_Markers.sqf	_____________


//________________	Settings	true , false 	_____________
//________________	You can filter the side in the end of the script	________________	
GF_Units_Map_Markers_Enabled				= true;
GF_Units_Map_Symbols_Enabled				= true;
GF_Units_Map_Symbols_Remove_Text 			= true;	//	If you are using the symbols , set this to true


GF_Units_Map_Markers_Number = 0; 

GF_Units_Map_Markers = { 


_this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setVariable ["Var_GF_Units_Map_Markers",false];
}];

private ["_marker" , "_name" , "_Leader"];
	
GF_Units_Map_Markers_Number = GF_Units_Map_Markers_Number + 1;
_marker = format["GF_Units_Map_Markers_Number%1",GF_Units_Map_Markers_Number];
createMarker [_marker, getPos vehicle _this];
_marker setMarkerShape "ICON";
_Leader = isFormationLeader _this;
_groupId_name = groupId (group _this);
_side = side group _this;
_sideColor = [_side, true] call BIS_fnc_sideColor;
_sleep = 0.15;

	
if (!isPlayer _this) then {		
	_name = "[AI]";
	}else{
	_name = format ["[%1]",name _this];
	};
				
	_true = true;
	while {_true} do { 
	if (		
		((alive _this)) 
		&& ((_this getVariable ["Var_GF_Units_Map_Markers",true]))		
		) then {
				
			//	https://community.bistudio.com/wiki/cfgMarkers
			
			//________________	INCAPACITATED Marker	_____________
			
			if (
			(lifeState _this == "INCAPACITATED")
			or ((_this getVariable ["ACE_isUnconscious",false]))
			or ((_this getVariable ["BTC_need_revive",false]))
			or ((_this getVariable ["FAR_isUnconscious",false]))
			or ((_this getVariable ["unit_is_unconscious",false]))
			or ((_this getVariable ["tcb_ais_agony",false]))				
			) then {
			_Display_Text = format["%1	[%2]	INCAPACITATED", _name, getText(configFile>>"CfgVehicles">>typeOf vehicle _this>>"DisplayName")];	
			_marker setMarkerText _Display_Text; 
			_marker setMarkerColor "ColorPink";
			_marker setMarkerType "loc_Hospital";
			_marker setMarkerSize [1,1];
			_marker setMarkerPos getpos _this; 
			_marker setMarkerDir 0;			
			_true = true;
			uisleep _sleep; 				
			}else{ 
			
			
			//________________	INJURED Marker	_____________
			//________________	INJURED _Leader Marker	_____________
			
			if (
			(lifeState _this == "INJURED")
			&& (_Leader) && (count (units group _this) > 1)
			)then {					
						
			if (GF_Units_Map_Symbols_Remove_Text)then { 
			//	Remove_Text
			}else{
			_Display_Text_Leader = format["%1	[%2]	 %3", _name, getText(configFile>>"CfgVehicles">>typeOf vehicle _this>>"DisplayName") ,_groupId_name];			
			_marker setMarkerText _Display_Text_Leader; 
			};
			
			_marker setMarkerColor "ColorRed";
			_marker setMarkerType "mil_triangle";
			_marker setMarkerSize [1,1];			
			_marker setMarkerPos getpos _this; 
			_marker setMarkerDir getDir _this;
			_true = true;
			uisleep _sleep; 
			
			}else{
			
			//________________	INJURED	Man in group Marker	_____________
			
			if (
			(lifeState _this == "INJURED")
			&& (!(_Leader))
			) then {
						
			_Display_Text = format["%1	[%2]", _name, getText(configFile>>"CfgVehicles">>typeOf vehicle _this>>"DisplayName")];
			_marker setMarkerText _Display_Text; 
			_marker setMarkerColor "ColorRed";
			_marker setMarkerType "loc_ViewTower";	
			_marker setMarkerSize [2,2];
			_marker setMarkerPos getpos _this; 
			_marker setMarkerDir getDir _this;
			_true = true;
			uisleep _sleep; 
			
			}else{
			
			//________________	INJURED	Man not in group Marker	_____________
			
			if (
			(lifeState _this == "INJURED")
			&& ((_Leader)) && (count (units group _this) == 1)
			) then {
						
			_Display_Text = format["%1	[%2]", _name, getText(configFile>>"CfgVehicles">>typeOf vehicle _this>>"DisplayName")];
			_marker setMarkerText _Display_Text;
			_marker setMarkerColor "ColorRed";			
			_marker setMarkerType "loc_ViewTower";	
			_marker setMarkerSize [2,2];
			_marker setMarkerPos getpos _this; 
			_marker setMarkerDir getDir _this;
			_true = true;
			uisleep _sleep; 
			
			}else{ 
			
			//________________	_Leader Marker	_____________
			
			_Leader = isFormationLeader _this;
			if ((_Leader) && (count (units group _this) > 1))then {					
			
			if (GF_Units_Map_Symbols_Remove_Text)then { 
			//	Remove_Text
			}else{
			_Display_Text_Leader = format["%1	[%2]	 %3", _name, getText(configFile>>"CfgVehicles">>typeOf vehicle _this>>"DisplayName") ,_groupId_name];			
			_marker setMarkerText _Display_Text_Leader; 
			};
			
			_marker setMarkerColor _sideColor;
			_marker setMarkerType "mil_triangle";	
			_marker setMarkerSize [1,1];
			_marker setMarkerPos getpos _this; 
			_marker setMarkerDir getDir _this;
			_true = true;
			uisleep _sleep; 
			
			}else{
			
			//________________	Man Marker	_____________
			
			if (GF_Units_Map_Symbols_Remove_Text)then { 
			//	Remove_Text
			
			if (
			((_Leader)) && (count (units group _this) == 1)
			&& (!(vehicle _this isKindOf  "Man")) 
			) then {
			//	Remove_Text if not in vehicle			
			}else{
			_Display_Text = format["%1	[%2]", _name, getText(configFile>>"CfgVehicles">>typeOf vehicle _this>>"DisplayName")];
			_marker setMarkerText _Display_Text; 
			};
			};
			
			_marker setMarkerColor _sideColor;
			_marker setMarkerType "loc_ViewTower";	
			_marker setMarkerPos getpos _this; 
			_marker setMarkerDir getDir _this;
			_marker setMarkerSize [2,2];
			_true = true;
			uisleep _sleep; 
			};
			};	
			};
			};
			};			
	}else{
	deleteMarker _marker;
	_true = false;
	GF_Units_Map_Markers_Number = GF_Units_Map_Markers_Number + 1;
	_marker = format["GF_Units_Map_Markers_Number%1",GF_Units_Map_Markers_Number];
	};	
};
};




GF_Units_Map_Symbols = { 

_this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setVariable ["Var_GF_Units_Map_Symbols",false];
}];

_sleep = 0.2;

private ["_name" , "_groupId_name" , "_Symbol"];
	
_Leader = isFormationLeader _this;
	
if (!isPlayer _this) then {		
	_name = "[AI]";
	}else{
	_name = format ["[%1]",name _this];
};

setGroupIconsVisible [ true, true ];
				
	_true = true;
	while {_true} do { 
	if (		
		((alive _this)) 
		&& ((_this getVariable ["Var_GF_Units_Map_Symbols",true]))		
		) then {
							
			//________________	_Leader _Symbol	_____________
			
			if ((_Leader) && (count (units group _this) > 1))then {					
					
			_this setVariable ["Var_GF_Units_Map_Symbols_Leader",true];
			
			//________________	_Leader addGroupIcon	_____________
			//	https://community.bistudio.com/wiki/cfgMarkers
			//	https://forums.bohemia.net/forums/topic/202400-list-of-vehicle-base-classes/
			
			_canHeal 	= getnumber (configfile >> "cfgvehicles" >> typeof vehicle _this >> "attendant") > 0;
			_canReammo	= getnumber (configfile >> "cfgvehicles" >> typeof vehicle _this >> "transportAmmo") > 0;
			_canRefuel 	= getnumber (configfile >> "cfgvehicles" >> typeof vehicle _this >> "transportFuel") > 0;
			_canRepair 	= getnumber (configfile >> "cfgvehicles" >> typeof vehicle _this >> "transportRepair") > 0;
			
			switch true do {
			
			//________________	side west	_____________
			
			case((side group _this) == west) : {
						
			_Symbol = switch true do {
				
			case(_canHeal) 	 : {"b_med";};
			case(_canReammo) : {"b_maint";};
			case(_canRefuel) : {"b_support";};
			case(_canRepair) : {"b_service";};
			
			case(vehicle _this isKindOf "Man") : {"b_inf";};
			case(vehicle _this isKindOf "Ship") : {"b_naval";};
			case(vehicle _this isKindOf "Helicopter") : {"b_air";};
		
			case(vehicle _this isKindOf "Car") : {
				if(vehicle _this iskindof "Wheeled_APC_F") then {
				"b_motor_inf";
				}else{				
				"c_car";
					};
				};
					
			case(vehicle _this isKindOf "Tank") : {
				if (getnumber(configfile >> "cfgvehicles" >> typeof vehicle _this >> "artilleryScanner") > 0) then {
				"b_art";
				}else{	
				if(vehicle _this iskindof "APC") then {
				"b_mech_inf";
				}else{	
				"b_armor";
					};
					};
				};
			
			case(vehicle _this isKindOf "StaticWeapon") : {
				if(vehicle _this iskindof "StaticMortar") then {
				"b_mortar";
				}else{
				"b_antiair";
					};
				};
										
			case(vehicle _this isKindOf "Plane") : {
				if(vehicle _this iskindof "UAV") then {
				"b_uav";
				}else{	
				"b_plane";
					};
				};
				
			};	

			};

			
			//________________	side east	_____________
			
			case((side group _this) == east) : {
			
			_Symbol = switch true do {
				
			case(_canHeal) 	 : {"o_med";};
			case(_canReammo) : {"o_maint";};
			case(_canRefuel) : {"o_support";};
			case(_canRepair) : {"o_service";};
			
			case(vehicle _this isKindOf "Man") : {"o_inf";};
			case(vehicle _this isKindOf "Ship") : {"o_naval";};
			case(vehicle _this isKindOf "Helicopter") : {"o_air";};
		
			case(vehicle _this isKindOf "Car") : {
				if(vehicle _this iskindof "Wheeled_APC_F") then {
				"o_motor_inf";
				}else{				
				"c_car";
					};
				};
					
			case(vehicle _this isKindOf "Tank") : {
				if (getnumber(configfile >> "cfgvehicles" >> typeof vehicle _this >> "artilleryScanner") > 0) then {
				"o_art";
				}else{	
				if(vehicle _this iskindof "APC") then {
				"o_mech_inf";
				}else{	
				"o_armor";
					};
					};
				};
			
			case(vehicle _this isKindOf "StaticWeapon") : {
				if(vehicle _this iskindof "StaticMortar") then {
				"o_mortar";
				}else{
				"o_antiair";
					};
				};
										
			case(vehicle _this isKindOf "Plane") : {
				if(vehicle _this iskindof "UAV") then {
				"o_uav";
				}else{	
				"o_plane";
					};
				};
				
			};	

			};
			
			
			//________________	side independent	_____________
			
			case(((side group _this) == independent) or ((side group _this) == civilian)) : {
			
			_Symbol = switch true do {
				
			case(_canHeal) 	 : {"n_med";};
			case(_canReammo) : {"n_maint";};
			case(_canRefuel) : {"n_support";};
			case(_canRepair) : {"n_service";};
			
			case(vehicle _this isKindOf "Man") : {"n_inf";};
			case(vehicle _this isKindOf "Ship") : {"n_naval";};
			case(vehicle _this isKindOf "Helicopter") : {"n_air";};
			
			case(vehicle _this isKindOf "Car") : {
				if(vehicle _this iskindof "Wheeled_APC_F") then {
				"n_motor_inf";
				}else{				
				"c_car";
					};
				};
					
			case(vehicle _this isKindOf "Tank") : {
				if (getnumber(configfile >> "cfgvehicles" >> typeof vehicle _this >> "artilleryScanner") > 0) then {
				"n_art";
				}else{	
				if(vehicle _this iskindof "APC") then {
				"n_mech_inf";
				}else{	
				"n_armor";
					};
					};
				};
			
			case(vehicle _this isKindOf "StaticWeapon") : {
				if(vehicle _this iskindof "StaticMortar") then {
				"n_mortar";
				}else{
				"n_antiair";
					};
				};
										
			case(vehicle _this isKindOf "Plane") : {
				if(vehicle _this iskindof "UAV") then {
				"n_uav";
				}else{	
				"n_plane";
					};
				};
				
			};	

			};
			
			};
			
						
			clearGroupIcons (group _this);	
			setGroupIconsVisible [ true, true ];
			group _this addGroupIcon [_Symbol, [0,0.5]];	
			_Display_Text = format["%1	[%2]", _name, getText(configFile>>"CfgVehicles">>typeOf vehicle _this>>"DisplayName")];
			group _this setGroupIconParams [ side _this call BIS_fnc_sideColor,_Display_Text,1,true ];
			

			//________________	Group Size addGroupIcon	_____________
			
			_Size = count (units group _this);			
			if ((_Leader) && (_Size > 3))then {	
												
			_Symbol_Size = switch true do {
			case((_Size >= 3) && (_Size < 6)) : {"group_0";};		//	Fire Team
			case((_Size >= 7) && (_Size < 9)) : {"group_1";};		//	Squad 
			case((_Size >= 10) && (_Size < 19)) : {"group_2";};		//	Section 
			case((_Size >= 20) && (_Size < 100)) : {"group_3";};	//	Platoon 			
			};	
						
			group _this addGroupIcon [_Symbol_Size, [0,0.5]];
			};
					
			_true = true;
			uisleep _sleep; 			
			};
						
						
			//________________	Man not in group _Symbol	_____________
			
			if (
			((_Leader)) && (count (units group _this) == 1)
			&& (!(vehicle _this isKindOf  "Man")) 
			&& (!(_this getVariable ["Var_GF_Units_Map_Symbols_Leader",true]))
			or ((vehicle _this isKindOf  "Ship") 
			or (vehicle _this isKindOf  "LandVehicle") 
			or (vehicle _this isKindOf  "Tank") 
			or (vehicle _this isKindOf  "StaticWeapon")  
			or (vehicle _this isKindOf  "Helicopter") 
			or (vehicle _this isKindOf  "Plane"))				
			)then {	
											
			//________________	one Man vehicle _Symbol	_____________
						
			_canHeal 	= getnumber (configfile >> "cfgvehicles" >> typeof vehicle _this >> "attendant") > 0;
			_canReammo	= getnumber (configfile >> "cfgvehicles" >> typeof vehicle _this >> "transportAmmo") > 0;
			_canRefuel 	= getnumber (configfile >> "cfgvehicles" >> typeof vehicle _this >> "transportFuel") > 0;
			_canRepair 	= getnumber (configfile >> "cfgvehicles" >> typeof vehicle _this >> "transportRepair") > 0;
			
			switch true do {
			
			//________________	side west	_____________
			
			case((side group _this) == west) : {
						
			_Symbol = switch true do {
				
			case(_canHeal) 	 : {"b_med";};
			case(_canReammo) : {"b_maint";};
			case(_canRefuel) : {"b_support";};
			case(_canRepair) : {"b_service";};
			
			case(vehicle _this isKindOf "Man") : {"b_inf";};
			case(vehicle _this isKindOf "Ship") : {"b_naval";};
			case(vehicle _this isKindOf "Helicopter") : {"b_air";};
		
			case(vehicle _this isKindOf "Car") : {
				if(vehicle _this iskindof "Wheeled_APC_F") then {
				"b_motor_inf";
				}else{				
				"c_car";
					};
				};
					
			case(vehicle _this isKindOf "Tank") : {
				if (getnumber(configfile >> "cfgvehicles" >> typeof vehicle _this >> "artilleryScanner") > 0) then {
				"b_art";
				}else{	
				if(vehicle _this iskindof "APC") then {
				"b_mech_inf";
				}else{	
				"b_armor";
					};
					};
				};
			
			case(vehicle _this isKindOf "StaticWeapon") : {
				if(vehicle _this iskindof "StaticMortar") then {
				"b_mortar";
				}else{
				"b_antiair";
					};
				};
										
			case(vehicle _this isKindOf "Plane") : {
				if(vehicle _this iskindof "UAV") then {
				"b_uav";
				}else{	
				"b_plane";
					};
				};
				
			};	

			};

			
			//________________	side east	_____________
			
			case((side group _this) == east) : {
			
			_Symbol = switch true do {
				
			case(_canHeal) 	 : {"o_med";};
			case(_canReammo) : {"o_maint";};
			case(_canRefuel) : {"o_support";};
			case(_canRepair) : {"o_service";};
			
			case(vehicle _this isKindOf "Man") : {"o_inf";};
			case(vehicle _this isKindOf "Ship") : {"o_naval";};
			case(vehicle _this isKindOf "Helicopter") : {"o_air";};
		
			case(vehicle _this isKindOf "Car") : {
				if(vehicle _this iskindof "Wheeled_APC_F") then {
				"o_motor_inf";
				}else{				
				"c_car";
					};
				};
					
			case(vehicle _this isKindOf "Tank") : {
				if (getnumber(configfile >> "cfgvehicles" >> typeof vehicle _this >> "artilleryScanner") > 0) then {
				"o_art";
				}else{	
				if(vehicle _this iskindof "APC") then {
				"o_mech_inf";
				}else{	
				"o_armor";
					};
					};
				};
			
			case(vehicle _this isKindOf "StaticWeapon") : {
				if(vehicle _this iskindof "StaticMortar") then {
				"o_mortar";
				}else{
				"o_antiair";
					};
				};
										
			case(vehicle _this isKindOf "Plane") : {
				if(vehicle _this iskindof "UAV") then {
				"o_uav";
				}else{	
				"o_plane";
					};
				};
				
			};	

			};
			
			
			//________________	side independent	_____________
			
			case(((side group _this) == independent) or ((side group _this) == civilian)) : {
			
			_Symbol = switch true do {
				
			case(_canHeal) 	 : {"n_med";};
			case(_canReammo) : {"n_maint";};
			case(_canRefuel) : {"n_support";};
			case(_canRepair) : {"n_service";};
			
			case(vehicle _this isKindOf "Man") : {"n_inf";};
			case(vehicle _this isKindOf "Ship") : {"n_naval";};
			case(vehicle _this isKindOf "Helicopter") : {"n_air";};
			
			case(vehicle _this isKindOf "Car") : {
				if(vehicle _this iskindof "Wheeled_APC_F") then {
				"n_motor_inf";
				}else{				
				"c_car";
					};
				};
					
			case(vehicle _this isKindOf "Tank") : {
				if (getnumber(configfile >> "cfgvehicles" >> typeof vehicle _this >> "artilleryScanner") > 0) then {
				"n_art";
				}else{	
				if(vehicle _this iskindof "APC") then {
				"n_mech_inf";
				}else{	
				"n_armor";
					};
					};
				};
			
			case(vehicle _this isKindOf "StaticWeapon") : {
				if(vehicle _this iskindof "StaticMortar") then {
				"n_mortar";
				}else{
				"n_antiair";
					};
				};
										
			case(vehicle _this isKindOf "Plane") : {
				if(vehicle _this iskindof "UAV") then {
				"n_uav";
				}else{	
				"n_plane";
					};
				};
				
			};	

			};
			
			};
			
			
			clearGroupIcons (group _this);	
			setGroupIconsVisible [ true, true ];
			group _this addGroupIcon [_Symbol, [0,0.5]];
			_Display_Text = format["%1	[%2]", _name, getText(configFile>>"CfgVehicles">>typeOf vehicle _this>>"DisplayName")];				
			group _this setGroupIconParams [ side _this call BIS_fnc_sideColor,_Display_Text,1,true ];
			
			_true = true;
			uisleep _sleep; 
			
			}else{
										
			//________________	Man not in group remove _Symbol	_____________
			
			if (
			((_Leader)) && (count (units group _this) == 1)
			&& (vehicle _this isKindOf  "Man") 
			)then{
			
			_this setVariable ["Var_GF_Units_Map_Symbols_Leader",false];
			clearGroupIcons (group _this);		
			_true = true;
			uisleep _sleep; 
			};
			};								
	}else{
	if (!(alive _this)) then{
	_this setVariable ["Var_GF_Units_Map_Symbols_Leader",false];
	clearGroupIcons (group _this);			
	_true = false;
	uisleep _sleep;
	};	
	};
};
};




//________________	spawn	_____________

[] spawn {
	while {true} do {
    _time = diag_tickTime + 5;	//	% sec
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
		&& (!(_x getVariable ["Var_GF_Units_Map_Markers",false]))
		&& (!(_x getVariable ["Var_GF_Units_Map_Symbols",false]))		
		
		/*
		//________________	You can filter the side here	________________	
		&& {((side group _x) == west || 
			(side group _x) == east || 
			(side group _x) == independent || 
			(side group _x) == civilian || 
			(side group _x) == sideUnknown)}
		
		//	&& (side _x == playerSide)	// only for the Player side
		//	&& (isPlayer _x)			// only Players
		*/
		
		) then {
		//________________	You can filter here	________________
		if (GF_Units_Map_Markers_Enabled)then { 
		_x spawn GF_Units_Map_Markers;
		};
		if (GF_Units_Map_Symbols_Enabled)then { 
		_x spawn GF_Units_Map_Symbols;
		};
		};						
		_x setVariable ["Var_GF_Units_Map_Markers",true];
		_x setVariable ["Var_GF_Units_Map_Symbols",true];

		{waitUntil {!alive _x};
		_x setVariable ["Var_GF_Units_Map_Markers",false];
		_x setVariable ["Var_GF_Units_Map_Symbols",false];
		};
	}forEach allUnits;
	};
};


diag_log "//________________	GF Units Map Markers and Symbols Script Initialized	_____________";
systemchat "GF Units Map Markers Initialized";