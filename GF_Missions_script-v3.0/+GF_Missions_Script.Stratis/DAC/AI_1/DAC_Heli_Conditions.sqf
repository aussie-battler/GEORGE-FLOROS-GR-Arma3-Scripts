//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Some_Conditions   //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_run","_marker","_leader","_group","_target","_vehicle","_exgroup","_array","_go","_temp","_knowsabout"];

_run = 1;_group = _this select 0;_leader = _this select 1;_go = 0;
_marker = _this select 2;_vehicle = _this select 3;_array = [];_temp = DAC_StartDummy;_target = objNull;
_exgroup = _this select 4;_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));

if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 1;_run = 0};
if((not alive _leader) && (_go == 0)) then {_go = 1;_run = 11};
if((_group in DAC_Hit_Groups) && (_go == 0)) then {_go = 1;_run = 10};
if(((getdammage _vehicle) > 0.7) && (_go == 0)) then {_run = 12;_go = 1};
if((({alive _x} count units _exgroup) == 0) && (_go == 0)) then {_run = 12;_go = 1};

if((!(isNull(_leader findNearestEnemy (position _leader)))) && (_go == 0)) then
{
	_temp = (_leader findNearestEnemy (position _leader));
	if((alive _temp) && (!(format["%1",behaviour _temp] == "ERROR"))) then
	{
		if(({(((_x knowsabout _temp) > _knowsabout) && ((_x distance _temp) < (call compile DAC_Alert_Dist)) && (alive _x))} count units _group) > 0) then
		{
			if(((position (vehicle _temp)) select 2) < 5) then
			{
				_run = 7;_target = _temp;
			};
		};
	};
};
if(_run != 1) then {_array = [_run,_target]};
_array;