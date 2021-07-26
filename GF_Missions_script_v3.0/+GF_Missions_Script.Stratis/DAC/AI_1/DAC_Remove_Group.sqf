//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Remove_Group      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_groupA","_sidearray","_groupside","_sideUnit","_typ","_para","_s","_unit","_dummy","_temp","_varSup"];

_groupA = _this select 0;_para = _this select 1;_typ = _this select 2;_s = -1;_dummy = objNull;_varSup = [];
_sidearray = ["E","W","R","C"];_sideunit = ["EAST","WEST","GUER","CIV"];_unit = ((units _groupA) select 0);
_temp = ["DAC_All_Groups","DAC_Help_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Cover_Groups","DAC_Call_Groups","DAC_Hit_Groups","DAC_No_Support","DAC_Min_Groups","DAC_Arti_Array","DAC_Camp_Groups"];

{call compile format["if(_groupA in %1) then {%1 = %1 - [_groupA]}",_x]}foreach _temp;

if(!(isNil "DAC_Support_Logic")) then
{
	_varSup = DAC_Support_Logic getVariable "support_groups";
	if(_groupA in _varSup) then
	{
		_varSup = _varSup - [_groupA];
		DAC_Support_Logic setVariable ["support_groups", _varSup, true];
	};
};

switch (_typ) do
{
	case 0:	{
				if(format["%1",_groupA] != "<NULL-group>") then
				{
					if(!(call compile format["_groupA in DAC_GroupPool%1",(_sidearray select _para)])) then
					{
						call compile format["DAC_GroupPool%1 set [count DAC_GroupPool%1,_groupA]",(_sidearray select _para)];
						{deleteWaypoint [_groupA, _x]} foreach [0,1,2,3];
					};
				};
			};
	case 1:	{
				if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 joining %2",_groupA,_para]};
				sleep 0.1;
				_dummy = _groupA createUnit ["B_Soldier_F",[100,100,0],[], 0, "NONE"];
				{
					if((alive _x) && (_x != _dummy)) then
					{
						[_x] joinsilent _para;
						[_x,_para] spawn DAC_fLeaderMarker;
						_x commandmove (position (leader _para));
					}
				} 	foreach units _groupA;
				sleep 1;
				_dummy setdamage 1;
				sleep 3;
				deletevehicle _dummy;
			};
	Default {};
};