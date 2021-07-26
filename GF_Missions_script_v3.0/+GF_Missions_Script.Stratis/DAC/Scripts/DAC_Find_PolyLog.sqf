//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_PolyLog      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_zone","_tempList","_posArray","_ln","_log","_checkwp","_wn","_action","_dist","_wn"];
		
_zone = _this select 0;_posArray = [];_ln = 0;_log = objNull;_checkwp = [];_wn = 1;_action = true;_dist = 100000;_wn = 1;

_tempList = List _zone;

if(count _tempList > 0) then
{
	{
		if((format["%1",typeof _x] == "Logic")
		&& (format["%1",direction _x] == "180")
		&& ((count waypoints _x) > 2)) then
		{
			if(format["%1",_x getVariable "Link"] != "<NULL>") then
			{
				if((_x getVariable "Link") == _zone) then
				{
					_log = _x;_dist = 0;
				};
			}
			else
			{
				if((getwppos[_x,0] distance _zone) < _dist) then
				{
					_log = _x;_dist = (getwppos[_x,0] distance _zone);
				};
			};
		};
	}foreach _tempList;
	if(!(isNull _log)) then
	{
		while{(((getwppos[_log,_wn]) select 0)+((getwppos[_log,_wn]) select 1) != 0)} do
		{
			_checkwp = getwppos[_log,_wn];
			_posArray set [count _posArray,[_checkwp select 0,_checkwp select 1]];
			_wn = _wn + 1;
		};
	};
};	
_posArray