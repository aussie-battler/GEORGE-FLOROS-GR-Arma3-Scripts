//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Some_Conditions   //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_run","_marker","_leader","_group","_target","_timestep","_array","_go","_temp","_knowsabout","_groupid","_veh","_i","_unit","_crew","_isLeave"];

_run = 1;_group = _this select 0;_leader = _this select 1;_go = 0;_veh = [];_i = 0;_isLeave = false;
_marker = _this select 2;_timestep = _this select 3;_groupid = _this select 4;_crew = [];
_array = [];_temp = DAC_StartDummy;_target = objNull;_unit = objNull;
_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));

{if(_x != vehicle _x) then {if(!((vehicle _x) in _veh)) then {_veh set [count _veh,vehicle _x]}}} foreach units _group;

if((count _veh > 0) && (_groupid < 5) && (count _this == 5)) then
{
	if(({alive _x} count units _group) > 0) then
	{
		while {_i < count _veh} do
		{
			_unit = (_veh select _i);_crew = crew _unit;
			if((count _crew == 1) && (_unit isKindOf "StaticWeapon")) then
			{
				if((!(canfire _unit)) || (getdammage _unit >= 0.7)) then
				{
					{unassignvehicle _x;[_x] ordergetin false} foreach _crew;
					if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_unit]};
				};
			}
			else
			{
				if((!(canmove _unit)) || (getdammage _unit >= 0.7) || (!(alive (driver _unit))) || (fuel _unit <= 0)) then
				{
					{unassignvehicle _x;[_x] ordergetin false} foreach _crew;
					if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_unit]};
				}
				else
				{
					if(!(format["%1",gunner _unit] == "<NULL-object>")) then
					{
						if((!(canfire _unit)) || (!(alive (gunner _unit)))) then
						{
							{unassignvehicle _x;[_x] ordergetin false} foreach _crew;
							if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_unit]};
						};
					};
					
				};
			};
			_i = _i + 1;
		};
		if(_isLeave) then {[2,(leader _group)] spawn DAC_fAIRadio};
	};
};

if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 1;_run = 0};
if((({alive _x} count units _group) == 0) && (_go == 0)) then {_go = 1;_run = 21};
if((format["%1",_group getVariable "getout_dac"] in ["<NULL>","any"]) && (_go == 0)) then {if((_group getVariable "getout_dac") == 1) then {_go = 1;_run = 0}};
if((not alive _leader) && (_go == 0)) then {_go = 1;_run = 20};
if((_group in DAC_Hit_Groups) && (_go == 0)) then {_go = 1;_run = 17};

if((!(isNull(_leader findNearestEnemy (position _leader)))) && (_go == 0) && (time > _timestep)) then
{
	_temp = (_leader findNearestEnemy (position _leader));
	if((alive _temp) && (!(format["%1",behaviour _temp] == "ERROR")) && (format["%1",typeof _temp] != "")) then
	{
		if(({(((_x knowsabout _temp) > _knowsabout) && ((_x distance _temp) < (call compile DAC_Alert_Dist))) && (alive _x)} count units _group) > 0) then
		{
			if(((position (vehicle _temp)) select 2) < 5) then
			{
				_run = 13;_target = _temp;(units _group) commandTarget _target;
			};
		};
	};
};

if(_run != 1) then {_array = [_run,_target]};
_array;