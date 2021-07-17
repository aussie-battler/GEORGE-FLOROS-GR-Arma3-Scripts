//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Check_Target      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_target","_group","_knowsabout"];

_group = _this select 0;_target = _this select 1;
_knowsabout = ((DAC_KnowsAbout + 2) - ((skill (leader _group) * 2) + 0.01));

if((format["%1",_target] == "<NULL-object>") || (format["%1",typeof _target] == "")) then
{
	true;
}
else
{
	if((not alive _target) || ((getdammage _target) == 1) || (format["%1",behaviour _target] == "ERROR")) then
	{
		true;
	}
	else
	{
		if(({(((_x knowsabout _target) > _knowsabout) && ((_x distance _target) < (call compile DAC_Alert_Dist)) && (alive _x))} count units _group) > 0) then
		{
			false;
		}
		else
		{
			true;
		};
	};
};