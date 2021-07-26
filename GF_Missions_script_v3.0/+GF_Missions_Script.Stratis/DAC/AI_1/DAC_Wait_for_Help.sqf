//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Wait_for_Help     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_waittime","_cg","_sg","_skillgroup","_sc"];

_group = _this select 0;_cg = 0;_sg = 0;_waittime = 0;_skillgroup = 0;_sc = [];

{if(alive _x) then {_cg = _cg + 1;_sg = _sg + skill _x}} foreach units _group;

if(_cg > 0) then
{
	_skillgroup = _sg / _cg;_waittime = (((_cg / _skillgroup) * (DAC_Intern select 1)) / DAC_AI_Level);
	sleep _waittime;
	if(({alive _x} count units _group) == 0) then
	{
		if(!(isNil "DAC_Support_Logic")) then
		{
			_sc = (DAC_Support_Logic getVariable "support_groups");
			if(_group in _sc) then
			{
				_sc = _sc - [_group];
				DAC_Support_Logic setVariable ["support_groups", _sc, true];
			};
		};
	}
	else
	{
		if(!(_group in DAC_Cover_Groups)) then {DAC_Cover_Groups set [count DAC_Cover_Groups,_group]};
	};
}
else
{
	if(!(isNil "DAC_Support_Logic")) then
	{
		_sc = (DAC_Support_Logic getVariable "support_groups");
		if(_group in _sc) then
		{
			_sc = _sc - [_group];
			DAC_Support_Logic setVariable ["support_groups", _sc, true];
		};
	};
};