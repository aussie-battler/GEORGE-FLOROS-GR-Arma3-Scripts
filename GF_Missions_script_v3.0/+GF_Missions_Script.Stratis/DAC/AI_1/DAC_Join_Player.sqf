//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Join_Player       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_unit","_caller","_id"];

_unit = _this select 0;_caller = _this select 1;_id = _this select 2;

if(((crew _unit) select 0) != vehicle ((crew _unit) select 0)) then
{
	{[_x] join (group player)}	foreach crew _unit;
	DAC_Join_Array = DAC_Join_Array - [_unit];
	_unit removeAction _id;
}
else
{
	[_unit] join (group player);
	DAC_Join_Array = DAC_Join_Array - [_unit];
	_unit removeAction _id;
};