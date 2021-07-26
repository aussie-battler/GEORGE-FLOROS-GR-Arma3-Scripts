//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Check_Target      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_target","_group","_newtarget","_id","_unit"];

_group = _this select 0;_target = _this select 1;_newtarget = _target;_id = 1;_unit = objNull;

if([_group,_target] call DAC_fCheckTarget) then
{
	_unit = [(leader _group),_group,_target] call DAC_fEnemyCond;
	if((_unit == _target) || (isNull _unit) || (format["%1",typeof _unit] == "")) then
	{
		if(_unit == _target) then
		{
			_newtarget = _target;
		}
		else
		{
			_newtarget = objNull;
		};
	}
	else
	{
		_newtarget = _unit;(units _group) commandTarget _newtarget;
	};
}
else
{
	_unit = [(leader _group),_group,_target,0] call DAC_fEnemyCond;
	if((_unit != _target) && (!(isNull _unit)) && (format["%1",typeof _unit] != "")) then
	{
		_newtarget = _unit;(units _group) commandTarget _newtarget;
	}
	else
	{
		if(_unit == _target) then
		{
			_newtarget = _target;
		}
		else
		{
			_newtarget = objNull;
		};
	};
};
_newtarget