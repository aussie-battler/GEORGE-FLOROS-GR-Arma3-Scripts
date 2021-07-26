//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Smoke_Gren        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_leader","_target","_i","_gr","_sg","_sd", "_DMSS", "_DMScript"];

_leader = _this select 0;_target = _this select 1;_i = 0;_gr = 0;_sg = objNull;_sd = call compile (DAC_Smoke select 3);

if(call compile (DAC_Smoke select 4)) then
{
	[14,(_leader)] spawn DAC_fAIRadio;
	while {_i < count (DAC_Smoke select 2)} do
	{
		_gr = (((position _target select 0) - (position _leader select 0)) atan2 ((position _target select 1) - (position _leader select 1)));
		_DMSS = [(position _leader Select 0) + (Sin (_gr + ((DAC_Smoke select 2) select _i)) * _sd),(position _leader Select 1) + (Cos (_gr + ((DAC_Smoke select 2) select _i)) * _sd),0];
		_sg = (DAC_Smoke select 1) createVehicle _DMSS;
		_i = _i + 1;
	};
};