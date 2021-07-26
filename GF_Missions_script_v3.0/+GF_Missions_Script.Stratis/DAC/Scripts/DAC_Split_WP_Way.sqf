//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Get_Waypoints     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_startPos","_endPos","_leader","_nextPos","_dist","_dir","_i","_count","_array"];
		
_startPos = _this select 0;_endPos = _this select 1;_leader = _this select 2;
_dist = (_startPos distance _endPos);_count = (_dist / 1000);
_i = 1;_array = [];_nextPos = [];_dir = 0;

if(_count < 1) then
{
	_array = [_endPos];
}
else
{
	while{_i < _count} do
	{
		_dir = ((_endPos select 0) - (_startPos select 0)) atan2 ((_endPos select 1) - (_startPos select 1));
		_nextPos = [(_startPos select 0) + (Sin (_dir) * (_i * 1000)),(_startPos select 1) + (Cos (_dir) * (_i * 1000)),0] findEmptyPosition [5,50,format["%1",(typeof (vehicle _leader))]];
		if(count _nextPos > 0) then
		{
			if(!(surfaceIsWater _nextPos)) then
			{
				_array set[(count _array),_nextPos];
			};
		};
		_i = _i + 1;
	};
	_array set[(count _array),_endPos];
};
_array