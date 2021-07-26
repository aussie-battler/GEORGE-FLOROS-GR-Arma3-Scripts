//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Insert_Veh        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_vehicles","_i","_veh"];

_vehicles = _this select 0;_i = 1;

while {_i < count _vehicles} do
{
	_veh = _vehicles select _i;
	if(!(format["%1",_veh] == scalar)) then
	{
		if(_veh in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_veh]};
	};
	_i = _i + 1;
};