//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Del_Player        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TimeToDel","_DistToDel","_UnitToDel","_DelMode","_delpos","_waittime","_rArray","_w"];

_TimeToDel = _this select 0;_DistToDel = _this select 1;_UnitToDel = _this select 2;
_DelMode   = _this select 3;_delpos = position _UnitToDel;_w = true;

if((_TimeToDel + _DistToDel) == 0) exitwith {};

if(_DelMode != 0) then
{
	while {(alive _UnitToDel)} do
	{
		sleep (1 + (random 1));
	};
};

if(_TimeToDel > 0) then
{
	_waittime = daytime + (_TimeToDel / 4000);
	while {daytime < _waittime} do
	{
		sleep (1 + (random 1));
	};
};

sleep 100000000;

if(_DistToDel > 0) then
{
	_rArray = [player];
	{
	if(!(format["%1",call compile _x] == scalar)) then {_rArray set [count _rArray,call compile _x]};
	}foreach DAC_STRPlayers;
	
	while {_w} do
	{
		if(({(((_x distance _UnitToDel) < _DistToDel) && (alive _x))} count _rArray) == 0) then
		{
			_w = false;
		};
		sleep (3 + (random 1));
	};
};

hideBody _UnitToDel;
sleep 5;
deletevehicle _UnitToDel;
if((DAC_Com_Values select 0) > 0) then {player sidechat format["%1 was deleted",typeof _UnitToDel]};