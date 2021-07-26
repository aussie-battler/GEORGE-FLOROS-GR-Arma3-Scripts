private ["_pad","_getToMarker","_cargoGrp","_vehicle"];
_mkr=(_this select 0);
_veh=(_this select 1);
_counter=(_this select 2);

_debug=false;
					_vehicle = _veh select 0;
					_grp = _veh select 2;					
					_cargoGrp= _veh select 3;
	_pos = [_mkr,false] call SHK_pos;									
	_pad = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "NONE"]; 
		if (_debug) then {0= [_mkr,_counter,"Unload Pad",(getpos _pad)] call EOS_debug;};
		
{_x allowFleeing 0} forEach units _grp;		
{_x allowFleeing 0} forEach units _cargoGrp;
 

_wp1 = _grp addWaypoint [_pos, 0];  
_wp1 setWaypointSpeed "FULL";  
_wp1 setWaypointType "UNLOAD";
_wp1 setWaypointStatements ["true", "(vehicle this) LAND 'GET IN';"]; 

 waituntil {_vehicle distance _pad < 30};
		_cargoGrp leaveVehicle _vehicle;	
		
		waitUntil{sleep 0.2; {_x in _vehicle} count units _cargoGrp == 0};				
						if (_debug) then {hint "Transport unloaded";};	
						0 = [_cargoGrp,_mkr] call eos_fnc_taskpatrol;
						
_wp2 = _grp addWaypoint [[0,0,0], 0];  
_wp2 setWaypointSpeed "FULL";  
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle this) + [vehicle this];"];  

deletevehicle _pad;