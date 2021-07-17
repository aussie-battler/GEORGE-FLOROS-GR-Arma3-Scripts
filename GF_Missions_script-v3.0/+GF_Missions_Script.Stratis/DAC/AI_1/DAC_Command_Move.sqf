//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Command_Move      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_unit","_pos"];

_unit = _this select 0;_group = group _unit;
_pos = [(((position _unit) select 0) + (Sin (random 360) * (random 30))),(((position _unit) select 1) + (Cos (random 360) * (random 30))),0];
unassignvehicle _unit;[_unit] ordergetin false;[2,_unit] spawn DAC_fAIRadio;
sleep 3 + (random 3);
waituntil{(_unit == vehicle _unit) || (not alive _unit) || (isNull _unit)};
sleep 2;
if(_unit == vehicle _unit) then {_unit domove (position (leader _group))};