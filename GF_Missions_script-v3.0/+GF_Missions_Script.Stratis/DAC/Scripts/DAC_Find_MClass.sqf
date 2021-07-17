//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_MClass       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_array","_unit","_i","_n","_markerSet","_entry"];

_array = _this select 0;_unit = _this select 1;_i = 0;_n = 0;_entry = "";_markerSet = [];

while {_i < count _array} do
{
	_entry = (((_array select _i) select 0) select 0);
	if(_unit isKindOf _entry) then
	{
		_markerSet = ((_array select _i) select _n);
		_n = _n + 1;
		while {_n < count (_array select _i)} do
		{
			_entry = (((_array select _i) select _n) select 0);
			if(_unit isKindOf _entry) then
			{
				_markerSet = ((_array select _i) select _n);
			};
			_n = _n + 1;
		};
	};
	_i = _i + 1;
};
if(count _markerSet == 0) then
{
	_markerSet = ((_array select ((count _array) - 1)) select 0);
};

_markerSet