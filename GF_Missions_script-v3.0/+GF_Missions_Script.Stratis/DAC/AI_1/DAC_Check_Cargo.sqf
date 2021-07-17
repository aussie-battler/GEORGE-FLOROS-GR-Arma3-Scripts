//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Check_Cargo       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_i","_unit","_vehArray","_countP","_c","_enterPos"];

_vehArray = _this select 0;_i = 0;_c = 0;_unit = objNull;_countP = 0;
_enterPos = ["Driver","Gunner","Commander","Cargo"];_c = 0;

while {_i < count _vehArray} do
{
	_unit = (_vehArray select _i);
	if((canmove _unit) && ((getdammage _unit) < 1)) then
	{
		while {_c < count _enterPos} do
		{
			_countP = _countP + (_unit emptyPositions (_enterPos select _c));_c = _c + 1;
		};
	};
	_i = _i + 1;
};
_countP