//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Enter_Vehicle     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_garray","_marker","_group","_veh","_dummy","_i","_vehPos","_enterPos","_unit","_c","_s","_run","_fP"];

_garray = _this select 0;_veh = _this select 1;_i = 0;_c = 0;_vehPos = [0,0,0,0];
_enterPos = ["Driver","Gunner","Commander","Cargo"];_s = 0;_run = true;_fP = 0;
_group = _garray select 0;_marker = _garray select 1;

while {_i < count _enterPos} do
{
	_fP = _veh emptyPositions (_enterPos select _i);
	_vehPos set [_i,_fP];
	_i = _i + 1;
};

_i = count units _group;_ci = _i;
sleep (random 1);

if(({alive _x} count crew _veh) > 0) exitwith {};

while {_i > 0} do
{
	if(_ci != count units _group) then
	{
		_i = count units _group;_ci = _i;
		sleep 1;
	}
	else
	{
		sleep 0.1;
		_i = _i - 1;_c = 0;_run = true;
		_unit = (units _group) select _i;
		if((alive _unit) && (_unit == vehicle _unit)) then
		{
			while {_run} do
			{
				if(_c >= count _vehPos) then
				{
					_run = false;_c = 0;
				}
				else
				{
					if((_vehPos select _c) == 0) then
					{
						_c = _c + 1;
					}
					else
					{
						call compile format["_unit assignas%1 _veh",(_enterPos select _c)];
						[_unit] ordergetin true;[_unit] allowgetin true;_run = false;_vehPos set [_c,0];
						if(({_x == 0} count _vehPos) == count _vehPos) then {_i = -1;_run = false};
					};
				};	
			};
		};
	};
};
