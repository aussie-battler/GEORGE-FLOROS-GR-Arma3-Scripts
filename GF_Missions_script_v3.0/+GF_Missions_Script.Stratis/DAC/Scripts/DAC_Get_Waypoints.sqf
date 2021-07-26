//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Get_Waypoints     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_wpCount","_wpArray","_i","_wpPos","_wpBeh","_wpScr","_wpCom","_wpFor","_wpSpe","_wpTim","_wpTyp"];
		
_group = _this select 0;_wpArray = [];_i = 0;
_wpPos = [];_wpBeh = "";_wpScr = "";_wpCom = "";_wpFor = "";_wpSpe = "";_wpTim = [];_wpTyp = "";

_wpCount = waypoints _group;

if(count _wpCount > 0) then
{
	_wpArray set [count _wpArray,(currentWaypoint _group)];
	while{_i < count _wpCount} do
	{
		_wpPos = getWPPos [_group,_i];
		_wpBeh = waypointBehaviour [_group,_i];
		_wpScr = waypointScript [_group,_i];
		_wpCom = waypointCombatMode [_group,_i];
		_wpFor = waypointFormation [_group,_i];
		_wpSpe = waypointSpeed [_group,_i];
		_wpTim = waypointTimeout [_group,_i];
		_wpTyp = waypointType [_group,_i];
		_wpArray set [count _wpArray,[_wpPos,_wpBeh,_wpScr,_wpCom,_wpFor,_wpSpe,_wpTim,_wpTyp]];
		_i = _i + 1;
	};
};
_wpArray