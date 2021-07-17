//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Clear_Zone        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_name","_i","_zone","_wpArray","_c","_action","_curWpArray","_zoneLoc","_KiZone"];

_name = _this select 0;_i = 0;_zone = "";_c = 0;_action = true;_curWpArray = [];_KiZone = objNull;_zoneLoc = objNull;
_wpArray = ["DAC_WP_Pool_S","DAC_WP_Pool_V","DAC_WP_Pool_T","DAC_WP_Pool_A","DAC_WP_Pool_H","DAC_WP_Pool_C","DAC_WP_Pool_B"];

while {_i < count DAC_Zones} do
{
	_zone = ((DAC_Zones select _i) select 0);
	if(format["%1",_zone] == _name) then
	{
		{deletemarker _x}foreach ((DAC_Zones select _i) select 9);
		DAC_Zones set [_i, 0];_KiZone = call compile _name;
		DAC_Zones = DAC_Zones - [0];_i = count DAC_Zones;
	}
	else
	{
		_i = _i + 1;
	};
};
_i = 0;
while{_c < count _wpArray} do
{
	_curWpArray = call compile (_wpArray select _c);
	while{_i < count _curWpArray} do
	{
		if(format["%1",((_curWpArray select _i) select 0)] == format["%1",call compile _name]) then
		{
			_action = true;
			call compile format["%1 set [_i, 0]",(_wpArray select _c)];
			while{_action} do
			{
				_i = _i + 1;
				if(_i < count _curWpArray) then
				{
					if((count (_curWpArray select _i)) == 2) then
					{
						call compile format["%1 set [_i, 0]",(_wpArray select _c)];
					}
					else
					{
						_action = false;
					};
				}
				else
				{
					_action = false;
				};
			};
			call compile format["%1 = %1 - [0]",(_wpArray select _c)];
			_i = count _curWpArray;
		}
		else
		{
			_i = _i + 1;
		};
	};
	_c = _c + 1;_i = 0;
};
if(format["%1",_KiZone getVariable "DAC_ZoneLoc"] != "<NULL>") then
{
	_zoneLoc = _KiZone getVariable "DAC_ZoneLoc";
	deletelocation _zoneLoc;
};
call compile format["deleteVehicle %1",_name];