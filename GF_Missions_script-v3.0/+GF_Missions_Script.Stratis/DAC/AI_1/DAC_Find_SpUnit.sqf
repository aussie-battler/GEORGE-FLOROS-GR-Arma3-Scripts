//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_SpUnit       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_spval","_i","_weap","_unit","_c"];

_group = _this select 0;_spval = _this select 1;_i = 0;_c = 0;_weap = [];_unit = objNull;

while {_i < count units _group} do
{
	_unit = ((units _group) select _i);
	if((!(alive _unit)) || (_unit != vehicle _unit) || (!((format["%1",typeof _unit]) in DAC_SP_Soldiers))) then
	{
		_i = _i + 1;
	}
	else
	{
		[_unit,_spval] execVM format["DAC\AI_%1\DAC_Unit_SpFire.sqf",DAC_AI_AddOn];_i = _i + 1;_c = _c + 1;
	};
};
if(_c > 0) then {[2,1,(group _unit),"P",_unit distance player] spawn DAC_fShowRadio};