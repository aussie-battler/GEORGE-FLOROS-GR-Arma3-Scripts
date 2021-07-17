//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Write_Position    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_oldArray","_newArray","_i","_n","_entry","_val"];

_oldArray = _this;_newArray = [];_i = 0;_n = 0;_entry = [];_val = [];

while {_n < count _oldArray} do
{
	_entry = call compile (_oldArray select _n);
	if(format["%1",_entry] != "<null>") then
	{
		if(count _entry == 2) then
		{
			_newArray set [count _newArray,[format["%1",_entry select 0],format["%1",_entry select 1]]];
			_n = _n + 1;
		};
	};
};
_newArray
