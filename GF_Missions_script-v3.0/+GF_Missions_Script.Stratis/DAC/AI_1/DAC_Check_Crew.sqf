//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Check_Crew        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_i","_unit","_veh","_crew","_vehArray"];

_vehArray = _this select 0;_i = 0;_unit = objNull;_veh = [];_crew = [];

while {_i < count _vehArray} do
{
	_unit = (_vehArray select _i);
	if(((_unit emptyPositions "Driver") > 0) || (!(canmove _unit)) || (format["%1",typeof _unit] in DAC_VehNotAllowed)) then
	{
		_crew = crew _unit;
		{unassignvehicle _x;[_x] ordergetin false}foreach _crew;
		_vehArray = _vehArray - [_unit];[2,(_crew select 0)] spawn DAC_fAIRadio;
		if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_unit]};
	}
	else
	{
		_i = _i + 1;
	};
};
_vehArray



