//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Command_Unit      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_i","_group","_unit","_veh"];

_group = _this select 0;_i = 0;_unit = objNull;_veh = [];

if(!(_group in DAC_Min_Groups)) then
{
	{if(_x != vehicle _x) then {if(!((vehicle _x) in _veh)) then {_veh set [count _veh,vehicle _x]}}} foreach units _group;
	if(count _veh > 0) then
	{
		while {_i < count _veh} do
		{
			_unit = (_veh select _i);
			if(!((leader _group) in (crew _unit))) then
			{
				if((_unit distance (leader _group)) > 100) then
				{
					_unit commandmove position (leader _group);
				};
			};
			_i = _i + 1;
		};
	};
};