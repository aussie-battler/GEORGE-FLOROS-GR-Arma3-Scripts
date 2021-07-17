//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Vehicle_Check     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_UnitList","_i","_l","_entry","_c","_TempList"];

_i = 0;_entry = DAC_StartDummy;_c = 0;_UnitList = [];_l = 0;_TempList = [];

waituntil {((getdir DAC_StartDummy) > 170)};

while {time > 0} do
{
	sleep 1;
	_c = count DAC_VehicleInUse;
	while {_i < count DAC_VehicleInUse} do
	{
		if(_c != count DAC_VehicleInUse) then
		{
			_c = count DAC_VehicleInUse;
			_i = 0;
		}
		else
		{
			_entry = DAC_VehicleInUse select _i;
			if((format["%1",_entry] == scalar)
			|| (!(canmove _entry))
			|| ((getdammage _entry) == 1)) then
			{
				DAC_VehicleInUse = DAC_VehicleInUse - [_entry];
			}
			else
			{
				_i = _i + 1;
				sleep 0.01;
			};
		};
	};
	
	_UnitList = List DAC_Trigger;_i = 0;
	
	while {_i < count _UnitList} do
	{
		_entry = _UnitList select _i;
		if((_entry in DAC_VehicleInUse)	|| ((getdammage _entry) == 1)) then
		{
			_i = _i + 1;
		}
		else
		{
			if((count (crew _entry)) > 0) then
			{
				{
					switch(format["%1",side _x]) do 
					{
						case "WEST":	{if(!(_x in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,_x]}};
						case "EAST":	{if(!(_x in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,_x]}};
						case "GUER":	{
											if(DAC_Res_Side == 0) then
											{
												if(!(_x in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,_x]};
											}
											else
											{
												if(!(_x in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,_x]};
											};
										};
						default			{};
					};
				
				}	foreach (crew _entry);
			};
			_i = _i + 1;
			sleep 0.01;
		};
	};
};