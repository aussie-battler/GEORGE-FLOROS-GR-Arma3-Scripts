//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_PolyPos      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_basePos","_distX","_distY","_i","_posArray","_newPos","_action","_oArray","_uArray","_oFix","_uFix","_p1","_p2","_yDiff"];
		
_basePos = _this select 0;_distX = _this select 1;_distY = _this select 2;
_polySegment = _this select 3;_posArray = [];_i = 0;_newPos = [];_action = true;
_oArray = 0;_uArray = 0;_oFix = true;_uFix = true;_p1 = 0;_p2 = 0;_yDiff = 0;

while{_action} do
{
	_newPos = [((_basePos select 0) + random _distX),((_basePos select 1) + random _distY)];_i = 0;
	while{_i < count _polySegment} do
	{
		if(_i == (count _polySegment - 1)) then
		{
			_p1 = (_polySegment select _i);_p2 = (_polySegment select 0);
		}
		else
		{
			_p1 = (_polySegment select _i);_p2 = (_polySegment select (_i + 1));
		};
		if((((_p1 select 0) < (_newPos select 0)) && ((_p2 select 0) > (_newPos select 0))) || (((_p2 select 0) < (_newPos select 0)) && ((_p1 select 0) > (_newPos select 0)))) then
		{
			_yDiff = ((((_p1 select 1) - (_p2 select 1)) / ((_p1 select 0) - (_p2 select 0))) * ((_newPos select 0) - (_p1 select 0))) + (_p1 select 1);
			if(_yDiff < (_newPos select 1)) then
			{
				_uArray = _uArray + 1;if(_uFix) then {_uFix = false} else {_uFix = true};
			}
			else
			{
				_oArray = _oArray + 1;if(_oFix) then {_oFix = false} else {_oFix = true};
			};
		};
		_i = _i + 1;
	};
	if((_oArray > 0) && (_uArray > 0)) then
	{
		if((!(_oFix)) && (!(_uFix))) then {_action = false};
	};
};
_newPos