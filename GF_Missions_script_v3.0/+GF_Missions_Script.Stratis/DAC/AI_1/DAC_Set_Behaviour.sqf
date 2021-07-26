//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Set_Behaviour     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_target"];

_group = _this select 0;_target = _this select 1;

if(skill leader _group <= 0.3) then
{
	{vehicle _x setcombatmode "white"} foreach units _group;
	{vehicle _x setbehaviour "aware"} foreach units _group;
	{vehicle _x setspeedmode "limited"} foreach units _group;
}
else
{
	if((skill leader _group > 0.3) && (skill leader _group <= 0.7)) then
	{
		{vehicle _x setcombatmode "yellow"} foreach units _group;
		{vehicle _x setbehaviour "combat"} foreach units _group;
		{vehicle _x setspeedmode "normal"} foreach units _group;
	}
	else
	{
		{vehicle _x setcombatmode "red"} foreach units _group;
		{vehicle _x setbehaviour "stealth"} foreach units _group;
		{vehicle _x setspeedmode "full"} foreach units _group;
	};
};
if(!(isNull _target)) then
{
	(units _group) commandTarget _target;
};