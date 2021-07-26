//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Other_Conditions  //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_run","_marker","_leader","_group","_target","_helo","_array","_go","_temp","_knowsabout","_para"];

_run = 1;_group = _this select 0;_leader = _this select 1;_go = 0;
_marker = _this select 2;_helo = _this select 3;_array = [];_para = _this select 4;
_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));_temp = DAC_StartDummy;_target = objNull;

if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 1;_run = 0};
if((({alive _x} count units _group) == 0) && (_go == 0)) then {_run = 0;_go = 1};
if((((getdammage _helo) > 0.7) || (!(canmove _helo))) && (_go == 0)) then {_run = 15;_go = 1};
if((((position _helo) select 2) > 5) && (!(alive (driver _helo))) && (_go == 0)) then {_run = 15;_go = 1};
if((_group in DAC_Hit_Groups) && (_go == 0)) then {if(_leader == (vehicle _leader)) then {_run = 16} else {_run = 10};_go = 1};

if((!(isNull(_leader findNearestEnemy (position _leader)))) && (_go == 0)) then
{
	_temp = (_leader findNearestEnemy (position _leader));
	if((alive _temp) && (!(format["%1",behaviour _temp] == "ERROR"))) then
	{
		if(({(((_x knowsabout _temp) > _knowsabout) && ((_x distance _temp) < (call compile DAC_Alert_Dist)) && (alive _x))} count units _group) > 0) then
		{
			if(((position (vehicle _temp)) select 2) < 5) then
			{
				_run = 10;_target = _temp;
			};
		};
	};
};

if(_run != 1) then {_array = [_run,_target]};
_array;