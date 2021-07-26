//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_Cover        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_coverval","_i","_cobj","_unit"];

_group = _this select 0;_coverval = _this select 1;_i = 0;_cobj = objNull;_unit = objNull;

while {_i < count units _group} do
{
	_unit = ((units _group) select _i);
	if((!(alive _unit)) || (_unit != vehicle _unit)) then
	{
		_i = _i + 1;
	}
	else
	{
		_cobj = (_unit findCover [position _unit, position _unit, _coverval]);
		if(!(isNull _cobj)) then
		{
			if(_unit == (leader _group)) then
			{
				_unit domove position _cobj;
			}
			else
			{
				_unit commandmove position _cobj;
			};
			_i = _i + 1;
		}
		else
		{
			_i = _i + 1;
		};
	};
};