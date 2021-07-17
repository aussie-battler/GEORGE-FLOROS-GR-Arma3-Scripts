//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Set_Waypoints     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_wpCount","_wpArray","_i","_wpPos","_wpBeh","_wpScr","_wpCom","_wpFor","_wpSpe","_wpTim","_wpTyp","_newWp"];
		
_group = _this select 0;_wpArray = call compile (_this select 1);_i = 1;_newWp = [];
_wpPos = [];_wpBeh = "";_wpScr = "";_wpCom = "";_wpFor = "";_wpSpe = "";_wpTim = [];_wpTyp = "";

while{_i < count _wpArray} do
{
	_wpPos = ((_wpArray select _i) select 0);_newWp = _group addWaypoint [_wpPos, 0];
	_wpBeh = ((_wpArray select _i) select 1);[_group,(_i - 1)] setWaypointBehaviour _wpBeh;
	_wpScr = ((_wpArray select _i) select 2);[_group,(_i - 1)] setWaypointScript _wpScr;
	_wpCom = ((_wpArray select _i) select 3);[_group,(_i - 1)] setWaypointCombatMode _wpCom;
	_wpFor = ((_wpArray select _i) select 4);[_group,(_i - 1)] setWaypointFormation _wpFor;
	_wpSpe = ((_wpArray select _i) select 5);[_group,(_i - 1)] setWaypointSpeed _wpSpe;
	_wpTim = ((_wpArray select _i) select 6);[_group,(_i - 1)] setWaypointTimeout _wpTim;
	_wpTyp = ((_wpArray select _i) select 7);[_group,(_i - 1)] setWaypointType _wpTyp;
	_i = _i + 1;
};
_group setCurrentWaypoint [_group,(_wpArray select 0)];