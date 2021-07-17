//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Hold_Building     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_waitTime","_building","_group","_run","_bgs"];

_building = _this select 0;_waitTime = _this select 1;_group = _this select 2;_run = 0;_bgs = _this select 3;
		
{if((_x select 0) != _building) then {DAC_Buildg_InUse = DAC_Buildg_InUse - [(_x select 0)]}}foreach _bgs;

while {_run == 0} do
{
	if((({alive _x} count units _group) == 0)
	|| ((format["%1",(group (leader _group))] == "<NULL-group>") && (({alive _x} count units _group) == 0))
	|| (_group in DAC_Cover_Groups)
	|| (_group in DAC_Hit_Groups)
	|| (_group in DAC_Help_Groups)) then
	{
		_run = 1;
	}
	else
	{
		if(((leader _group) distance _building) < 25) then
		{
			_run = 2;
		};
	};
	sleep 1;
};

if(_run == 1) then
{
	DAC_Buildg_InUse = DAC_Buildg_InUse - [_building];
}
else
{
	_exitTime = time + _waitTime;
	while {time < _exitTime} do
	{
		sleep 1;
	};
	sleep 20;
	DAC_Buildg_InUse = DAC_Buildg_InUse - [_building];
};
{_x selectweapon (primaryweapon _x)}foreach units _group;