//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Add_Group         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_art","_sea"];

_group = _this select 0;_art = _this select 1;_sea = _this select 2;

waituntil{(DAC_Basic_Value > 0)};

if(!(_group in DAC_All_Groups)) then {DAC_All_Groups set [count DAC_All_Groups,_group]};
if(format["%1",side (leader _group)] == "WEST") then {{DAC_West_Units set [count DAC_West_Units,_x]} foreach units _group};
if(format["%1",side (leader _group)] == "EAST") then {{DAC_East_Units set [count DAC_East_Units_x]} foreach units _group};
if(format["%1",side (leader _group)] == "GUER") then
{
	if(DAC_Res_Side == 0) then
	{
		{DAC_East_Units set [count DAC_East_Units,_x]} foreach units _group;
	}
	else
	{
		{DAC_West_Units set [count DAC_West_Units,_x]} foreach units _group;
	};
};
DAC_No_Support set [count DAC_No_Support,_group];
{_x addeventhandler ["hit",{_this spawn DAC_fHitByEnemy}]} foreach units _group;
[_group,_art,_sea] spawn DAC_fAddBehaviour;
if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 was added to the DAC system",_group]};