//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Sum_Waypoints     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private	[
			"_wpString","_wpNumeric","_zones","_array","_val","_i","_sum","_e","_test","_wpTypes","_c",
			"_temp","_insert","_newID","_check","_wpTemp","_ZV","_h","_zData","_g","_wpVal","_mz"
		];

_array = _this select 0;_val = ((_this select 1) - 1);_i = 0;_sum = 0;_e = [];_c = 0;_temp = [];_insert = false;_newID = 0;_check = [];
_wpString = _array select 0;_wpNumeric = _array select 1;_zones = _array select 2;_ZV = false;_h = 0;_zData = [];_g = 0;_wpVal = [];_mz = 0;
_wpTypes = ["DAC_WP_Pool_S","DAC_WP_Pool_V","DAC_WP_Pool_T","DAC_WP_Pool_A","","DAC_WP_Pool_A"];_wpTemp = (call compile (_wpTypes select _val));
if(count _array == 4) then {_mz = _array select 3};

if(count _zones != count DAC_Zones) then
{
	_ZV = true;while{_h < count DAC_Zones} do {_zData set [count _zData,((DAC_Zones select _h) select 0)];_h = _h + 1};
}
else
{
	while{_h < count DAC_Zones} do {_zData set [count _zData,((DAC_Zones select _h) select 0)];if(((DAC_Zones select _h) select 0) != (_zones select _h)) then {_g = _g + 1};_h = _h + 1};
	if(_g > 0) then {_ZV = true} else {_zData = _zones};
};
if(_ZV) then
{
	while{_i < count _wpString} do
	{
		_check = (_wpNumeric select _i);
		if((typeName _check) == "ARRAY") then
		{
			_e = [call compile (_check select 0),call compile (_check select 1)];_c = 0;_insert = false;
			while{_c < count _wpTemp} do
			{
				if((count (_wpTemp select _c)) == 2) then
				{
					if((round((_wpTemp select _c) select 0) == round(_e select 0))
					&& (round((_wpTemp select _c) select 1) == round(_e select 1))) then
					{
						if(format["%1",(_wpString select _i)] != format["%1 select %2",(_wpTypes select _val),_c]) then
						{
							_newID = _newID + 1;_wpString set[_i, format["%1 select %2",(_wpTypes select _val),_c]];
						};
						_wpVal = call compile (_wpString select _i);
						_sum = _sum + ((_wpVal select 0) + (_wpVal select 1));_insert = true;
						_c = (count _wpTemp);
					}
					else
					{
						_c = _c + 1;
					};
				}
				else
				{
					_c = _c + 1;
				};
			};
			if(!(_insert)) then {_wpString set[_i, 0];_wpNumeric set[_i, 0]};
			_i = _i + 1;
		}
		else
		{
			_i = _i + 1;_newID = _newID + 1;
		};
	};
	_wpString = _wpString - [0];_wpNumeric = _wpNumeric - [0];
}
else
{
	while {_i < count _wpString} do
	{
		_check = call compile (_wpString select _i);
		{_sum = _sum + _x} foreach _check;
		_i = _i + 1;
	};
};
if(count _array == 4) then
{
	_temp = _temp + [[_wpString,_wpNumeric,_zData,_mz],_sum,_newID];
}
else
{
	_temp = _temp + [[_wpString,_wpNumeric,_zData],_sum,_newID];
};
_temp