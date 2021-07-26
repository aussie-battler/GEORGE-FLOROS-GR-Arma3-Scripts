//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_InitMarker        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_i","_s","_v","_z","_u","_r","_l","_g","_MSides","_MUSide","_MCM","_gM","_gT"];

sleep 1;

if(isDedicated) exitwith {};

_MSides  = ["EAST","WEST","GUER","CIV"];_MUSide = [];_u = "";_l = [];
_MCM     = (DAC_Marker_Val select 2);_gT = 0;_i = 0;

sleep 0.5;

while{_i < count _MSides} do
{
	_u = _MCM select _i;
	if(_u == 0) then {_MUSide set [count _MUSide,(_MSides select _i)]};
	_i = _i + 1;
};

sleep 1;

_i = 0;_s = [];_v = [];_z = objNull;_u = objNull;_r = [];_g = [];_gM = DAC_Marker;

while {true} do
{
	if((_gM != DAC_Marker) || (DAC_Marker == 0)) then
	{
		if(DAC_Marker == 0) then
		{
			_i = 0;_s = [];_v = [];_z = objNull;_u = objNull;_r = [];_g = [];
			while {DAC_Marker == 0} do
			{
				sleep 1;
			};
			DAC_Marker_Val = [DAC_Marker] call DAC_fConfigMarker;_gM = DAC_Marker;
		}
		else
		{
			_i = 0;_s = [];_v = [];_z = objNull;_u = objNull;_r = [];_g = [];
			DAC_Marker_Val = [DAC_Marker] call DAC_fConfigMarker;_gM = DAC_Marker;
		};
	}
	else
	{
		if(({_x > 0} count (DAC_Marker_Val select 2)) == 0) then
		{
			sleep 0.5;
		}
		else
		{
			if((DAC_Marker_Val select 3) == 1) then
			{
				_l = (allUnits + vehicles);
				sleep 0.1;
				while {_i < count _l} do
				{
					_u = _l select _i;
					if(format["%1",side (driver _u)] in _MUSide) then
					{
						_i = _i + 1;
					}
					else
					{
						if(_u iskindof "Man") then
						{
							if(format["%1",(side _u)] in ["EAST","WEST","GUER","CIV"]) then
							{
								if(!(_u in _s)) then
								{
									_s set [count _s,_u];
									[_u,1] spawn DAC_fUnitMarker;
								};
							};
						}
						else
						{
							if((count (crew _u)) == 0) then
							{
								if(({_u iskindof _x} count ["STATICWEAPON","SHIP","CAR","TANK","HELICOPTER"]) > 0) then
								{
									if(!(_u in _v)) then
									{
										_v set [count _v,_u];
										[_u,2] spawn DAC_fUnitMarker;
									};
								};
							}
							else
							{
								_r = crew _u;
								if(!(_u in _v)) then
								{
									_v set [count _v,_u];
									[_u,2] spawn DAC_fUnitMarker;
								};
								{if(!(_x in _s)) then {_s set [count _s,_x];[_x,1] spawn DAC_fUnitMarker}}foreach _r;
							};
						};
						_i = _i + 1;
						sleep 0.01;
					};
				};
				if((!(DAC_InSpawn)) && (DAC_NewZone > 0)) then
				{
					_si = 0;_vi = 0;_i = 0;
					while{_si < count _s} do
					{
						_u = _s select _si;
						if(format["%1",_u] == "<NULL-object>") then	{_s = _s - [_u]} else {_si = _si + 1};
					};
					while{_vi < count _v} do
					{
						_u = _v select _vi;
						if(format["%1",_u] == "<NULL-object>") then	{_v = _v - [_u]} else {_vi = _vi + 1};
					};
				};
				_i = 0;
			}
			else
			{
				_l = allgroups;
				sleep 0.1;
				while {_i < count _l} do
				{
					_u = _l select _i;
					if(!(_u == DAC_GroupNull)) then
					{
						if(({alive _x} count units _u) > 0) then
						{
							if(!(format["%1",side (leader _u)] in _MUSide)) then
							{
								if(format["%1",(side (leader _u))] in ["EAST","WEST","GUER","CIV"]) then
								{
									if(!(_u in _s)) then
									{
										_s set [count _s,_u];
										[(leader _u),1,_u] spawn DAC_fGroupMarker;
									};
								};
								sleep 0.01;
							};
						};
					};
					_i = _i + 1;
				};
				_si = 0;
				while{_si < count _s} do
				{
					_u = _s select _si;
					if(format["%1",_u] != "<NULL-group>") then {if((count (units _u)) == 0) then {_s set[_si, 0]} else {if(({alive _x} count units _u) == 0) then {_s set[_si, 0]}}} else {_s set[_si, 0]};
					_si = _si + 1;
				};
				_s = _s - [0];
				_i = 0;
			};
		};
	};
};