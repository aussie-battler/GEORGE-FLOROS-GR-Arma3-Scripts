//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Hit_by_Enemy      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_target","_fireman","_egroup"];

_target = _this select 0;_fireman = _this select 1;_egroup = group _target;

if((!(_fireman == _target)) && (!(isNull _fireman)))  then
{
	if((({alive _x} count units _egroup) == 0) || (_egroup in DAC_Radio_Groups) || (format["%1",side _target] == "civ") || ((side _fireman) == (side _target))) exitwith {};
	if(!(_fireman in DAC_Fire_Pos)) then {DAC_Fire_Pos set [count DAC_Fire_Pos,_fireman]};
	if(!(_egroup in DAC_Hit_Groups)) then {DAC_Hit_Groups set [count DAC_Hit_Groups,_egroup]};
	if(_egroup in DAC_Fire_Groups) then {DAC_Fire_Groups = DAC_Fire_Groups - [_egroup]};
	if(_egroup in DAC_Help_Groups) then {DAC_Help_Groups = DAC_Help_Groups - [_egroup]};
	if(({alive _x} count units _egroup) >= (DAC_AI_Level * 2)) exitwith {};
	if(!(_egroup in DAC_Radio_Groups)) then {DAC_Radio_Groups set [count DAC_Radio_Groups,_egroup]};
	[_target,_egroup,_fireman] spawn DAC_fCallHelp;
};