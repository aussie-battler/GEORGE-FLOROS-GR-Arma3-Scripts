//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Enter_Gun         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_gun","_i","_unit","_group","_go","_marker","_rd","_leavedist"];

_unit = _this select 0;_gun = _this select 1;_marker = _this select 2;_leavedist = _this select 3;_i = 0;_go = 1;_rd = 0;

if((format["%1",_unit] != "<NULL-object>") && (format["%1",_unit] != scalar)) then
{
	if(format["%1",group _unit] != "<NULL-group>") then
	{
		if(!(_gun in DAC_Static)) then
		{
			DAC_Static set [count DAC_Static,_gun];
			_group = group _unit;_unit assignasgunner _gun;[_unit] ordergetin true;[_unit] allowgetin true;_unit setspeedmode "Full";_unit commandmove position _gun;
			while {_go == 1} do
			{
				sleep (1 + (random 1));
				_unit commandmove position _gun;
				if((((getMarkerSize (_marker select 0)) select 0) <= 4) || (not alive _unit)) then {DAC_Static = DAC_Static - [_gun];_go = 0};
				if(_go == 1) then {if(((getdammage _gun) == 1) || (((count crew _gun) > 0) && (_unit != gunner _gun))) then {_go = 2}};
				if(_go == 1) then {if(_unit == (gunner _gun)) then {_go = 3}};
			};
			if(_go > 0) then
			{
				if(_go == 2) then
				{
					[_unit] ordergetin false;_unit commandmove position (leader _group);
					DAC_Static = DAC_Static - [_gun];[2,_unit] spawn DAC_fAIRadio;
				}
				else
				{
					while {_go == 3} do
					{
						sleep (5 + (random 3));
						if((((getMarkerSize (_marker select 0)) select 0) <= 4) || (not alive _unit)) then {_go = 0};
						if(_go == 3) then {if(((getdammage _gun) == 1) || (!(canfire _gun))) then {_go = 4}};
						if(_go == 3) then {if((_unit == leader _group) && (!(_group in DAC_Fire_Groups))) then {_go = 4}};
						if(_go == 3) then {if((_unit distance (leader _group)) > _leavedist) then {_go = 4}};
						if(_go == 3) then {_rd = random 360;_unit lookat [(position _unit Select 0) + (Sin (_rd) * 500),(position _unit Select 1) + (Cos (_rd) * 500),50]};
					};
				};
			};
			if(_go == 4) then {if(alive _unit) then {unassignvehicle _unit;[_unit] ordergetin false;_unit commandmove position (leader _group);DAC_Static = DAC_Static - [_gun];[2,(leader _group)] spawn DAC_fAIRadio;}};
		};
	};
};