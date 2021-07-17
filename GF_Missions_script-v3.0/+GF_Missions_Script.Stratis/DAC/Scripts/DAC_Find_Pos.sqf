//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_Pos          //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_DAC_WP_Typ","_CheckRadius1","_CheckRadius2","_checkObjH1","_checkObjH2","_checkCount","_DAC_Zone",
			"_XValue","_XValue","_DAC_RadX","_DAC_RadY","_chnr","_relObjects","_allObjects","_Dummy","_wpCNr",
			"_RandomX","_RandomY","_pos","_checkMaxH","_checkMinH","_Null","_wpConfig","_check"
		];
		
			_DAC_WP_Typ = _this select 0;_DAC_Zone = _this select 1;_DAC_RadX = ((_this select 2) select 0);
			_DAC_RadY = ((_this select 2) select 1);_wpCNr = _this select 3;_wpConfig = [_DAC_WP_Typ,_wpCNr] call DAC_fConfigWP;
			_CheckRadius1 = ((_wpConfig select 0) select 0);_CheckRadius2 = ((_wpConfig select 0) select 1);
			_checkObjH1 = ((_wpConfig select 3) select 0);_checkObjH2 = ((_wpConfig select 3) select 1);
			_checkMaxH = _wpConfig select 4;_checkMinH = _wpConfig select 5;_check = 0;_checkCount = _wpConfig select 6;
			_chnr = 0;_relObjects = [];_allObjects = [];_XValue = ((_DAC_Zone select 0) - _DAC_RadX);
			_YValue = ((_DAC_Zone select 1) - _DAC_RadY);_pos = [];
			_Null = "EmptyDetector" createvehiclelocal [0,0,0];
			_Dummy = "logic" createvehiclelocal [0,0,0];

while {_chnr < _checkCount} do
{
	_RandomX = _XValue + random (_DAC_RadX * 2);
	_RandomY = _YValue + random (_DAC_RadY * 2);
	if(surfaceIsWater [_RandomX, _RandomY]) then
	{
		_chnr = _chnr + 1;
	}
	else
	{
		_Dummy setpos [_RandomX,_RandomY,0];_Null setpos [_RandomX,_RandomY,0];
		if((getPosASL _Null select 2 < _checkminh) || (getPosASL _Null select 2 > _checkmaxh)) then
		{
			_chnr = _chnr + 1;
		}
		else
		{
			_allObjects = nearestObjects [[_RandomX,_RandomY], [], _CheckRadius2];_relObjects = [];_check = 0;
			{
				if(((format["%1",typeOf _x]) != "LOGIC")
				&& ((format["%1",typeOf _x]) != "EmptyDetector")
				&& (speed _x == 0)) then
				{
					if(canmove _x) then
					{
						if(((boundingBox _x select 1) select 2) > _checkObjH1) then
						{
							_relObjects set [count _relObjects,_x];
						};
					}
					else
					{
						if(((position _x) select 2) > _checkObjH1) then
						{
							_relObjects set [count _relObjects,_x];
						};
					};
				};
			} 	foreach _allObjects;
			if(count _relObjects > 0) then
			{
				if(({((([_RandomX,_RandomY] distance _x) - ((((boundingBox _x select 1) select 0) + ((boundingBox _x select 1) select 1)) / 4)) < _CheckRadius1)} count _relObjects) > 0) then
				{
					_check = 0;
				}
				else
				{
					_check = 1;
				};
			}
			else
			{
				_check = 1;
			};
			if(_check == 0) then
			{
				_chnr = _chnr + 1;
			}
			else
			{
				_allObjects = nearestObjects [[_RandomX,_RandomY], [], _CheckRadius2];_relObjects = [];
				if(count _allObjects > 0) then
				{
					{
						if(((format["%1",typeOf _x]) != "LOGIC")
						&& ((format["%1",typeOf _x]) != "EmptyDetector")
						&& (speed _x == 0)) then
						{
							if(canmove _x) then
							{
								if((((position _x) select 2) > _checkObjH2) && ((_x distance _Dummy) < _CheckRadius2)) then
								{
									_relObjects set [count _relObjects,_x];
								};
							}
							else
							{
								if((((boundingBox _x select 1) select 2) > _checkObjH2) && ((_x distance _Dummy) < _CheckRadius2)) then
								{
									_relObjects set [count _relObjects,_x];
								};
							};
						};
					}	foreach _allObjects;
					if(count _relObjects > 0) then
					{
						_chnr = _chnr + 1;
					}
					else
					{
						_pos = [_RandomX,_RandomY];_chnr = _checkCount;
					};
				}
				else
				{
					_pos = [_RandomX,_RandomY];_chnr = _checkCount;
				};
			};
		};
	};
};
deletevehicle _Dummy;deletevehicle _Null;
if(count _pos == 0) then
{
	_pos = _DAC_Zone;
};
_pos