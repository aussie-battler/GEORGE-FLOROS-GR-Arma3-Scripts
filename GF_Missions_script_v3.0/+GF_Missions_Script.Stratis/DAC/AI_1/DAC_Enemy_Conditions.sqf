//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Enemy_Conditions  //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_leader","_group","_newtarget","_target","_knowsabout","_t1","_t2"];

_leader = _this select 0;_group = _this select 1;_target = _this select 2;
_newtarget = objNull;_nexttarget = objNull;_t1 = 0;_t2 = 0;
_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));

if(count _this == 3) then
{
	if(!(isNull(_leader findNearestEnemy (position _leader)))) then
	{
		_newtarget = (_leader findNearestEnemy (position _leader));
		if((alive _newtarget) && (_newtarget != _target) && (!(format["%1",behaviour _newtarget] == "ERROR"))) then
		{
			if(({(((_x knowsabout _newtarget) > _knowsabout) && ((_x distance _newtarget) < (call compile DAC_Alert_Dist)) && (alive _x))} count units _group) > 0) then
			{
				if((count crew _newtarget) > 0) then
				{
					_nexttarget = _newtarget;
				};
			};
		};
	};
}
else
{
	if(!(isNull(_leader findNearestEnemy (position _leader)))) then
	{
		_newtarget = (_leader findNearestEnemy (position _leader));
		if((alive _newtarget) && (_newtarget != _target) && (!(format["%1",behaviour _newtarget] == "ERROR"))) then
		{
			if((count crew _newtarget) > 0) then
			{
				{if(alive _x) then {_t1 = _t1 + (_x knowsabout _newtarget)}} foreach units _group;
				{if(alive _x) then {_t2 = _t2 + (_x knowsabout _target)}} foreach units _group;
				if((_t1 > _t2) && (({((_x distance _newtarget) < (call compile DAC_Alert_Dist)) && (alive _x)} count units _group) > 0)) then
				{
					_nexttarget = _newtarget;
				}
				else
				{
					_nexttarget = _target;
				};
			};
		}
		else
		{
			if((alive _newtarget) && (_newtarget == _target) && (!(format["%1",behaviour _newtarget] == "ERROR"))) then
			{
				_nexttarget = _target;
			};
		};
	};
};
(units _group) commandTarget _nexttarget;
_nexttarget