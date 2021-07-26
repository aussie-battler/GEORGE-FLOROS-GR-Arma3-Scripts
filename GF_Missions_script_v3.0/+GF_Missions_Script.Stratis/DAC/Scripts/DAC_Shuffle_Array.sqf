private ["_this","_newarray","_coun","_value","_entry"];
_newarray = [];_temparray = [] + _this;
while {count _temparray > 0} do 
{
	_coun = (count _temparray);
	_value = random _coun;
	_value = _value - (_value mod 1);
	_entry = _temparray select _value;
	_newarray set [count _newarray,_entry];
	_temparray set [_value, ""];
	_temparray = _temparray - [""];
};
_newarray