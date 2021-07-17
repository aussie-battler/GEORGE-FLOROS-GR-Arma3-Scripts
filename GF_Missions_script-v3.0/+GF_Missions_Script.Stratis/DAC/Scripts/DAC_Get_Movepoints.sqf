//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Get_Movepoints    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_zone","_gtyp","_wparray","_i","_typArray","_wpPool","_wpstr","_c","_a","_action","_entry","_go"];

_zone = _this select 0;_gtyp = _this select 1;_wparray = [];_c = 0;_a = objNull;_action = true;_entry = [];
_typArray = ["S","V","T"];_wpPool = format["DAC_WP_Pool_%1",(_typArray select (_gtyp - 1))];_wpstr = "";_go = true;

while{_action} do
{
	if(_c >= count (call compile _wpPool)) then
	{
		_action = false;
	}
	else
	{
		_entry = (call compile _wpPool) select _c;
		if(count _entry == 2) then
		{
			_c = _c + 1;
		}
		else
		{
			if((_entry select 0) != _zone) then
			{
				_c = _c + 1;
			}
			else
			{
				_c = _c + 1;
				while {_go} do
				{
					if(_c >= count (call compile _wpPool)) then
					{
						_go = false;_action = false;
					}
					else
					{
						if(count ((call compile _wpPool) select _c) > 2) then
						{
							_go = false;_action = false;
						}
						else
						{
							_wpstr = call compile format["%1 select %2",_wpPool,_c];
							_wparray set [count _wparray,format["%1",_wpstr]];
							_c = _c + 1;
						};
					};
				};
			};
		};
	};
};
_wparray
