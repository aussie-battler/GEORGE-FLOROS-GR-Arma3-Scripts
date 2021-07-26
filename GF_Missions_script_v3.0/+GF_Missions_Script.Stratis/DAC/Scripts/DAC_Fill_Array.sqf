//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Fill_Array        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_oldArray","_newArray","_i","_n","_entry","_c"];

_oldArray = _this select 0;_newArray = [(_oldArray select 0)];_i = 0;_n = 1;_c = 0;_entry = [];

while {_n < count _oldArray} do
{
	_entry = (_oldArray select _n);_c = (_entry select 1);
	while{_c > 0} do
	{
		_newArray set [count _newArray,_entry];_c = _c - 1;
	};
	_n = _n + 1;
};
_newArray
