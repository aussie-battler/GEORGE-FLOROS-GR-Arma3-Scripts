//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Show_Data         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private	["_mode","_c","_ce","_cw","_array","_isShowing"];

_mode = _this select 0;_c = 0;_ce = 0;_cw = 0;_array = [];_isShowing = true;

sleep 5;

if(_mode == 0) then
{
	while{true} do
	{
		if(!(format["%1",(DAC_Com_Values select 3)] == "0")) then
		{
			if(!(_isShowing)) then {_isShowing = true};
			_c = 0;_ce = 0;_array = [];
			DAC_Data_Array set[22, 1];DAC_Data_Array set[24, 0];DAC_Data_Array set[23, 1];DAC_Data_Array set[25, 0];
			While {_c < count DAC_Spawn_CampsE} do
			{
				_ce = _ce + (((DAC_Spawn_CampsE select _c) select 5) select 0);
				_c = _c + 1;
			};
			_c = 0;_cw = 0;
			While {_c < count DAC_Spawn_CampsW} do
			{
				_cw = _cw + (((DAC_Spawn_CampsW select _c) select 5) select 0);
				_c = _c + 1;
			};
			{if(!(isPlayer _x)) then {if((skill _x) < (DAC_Data_Array select 22)) then {if((skill _x) > 0) then {DAC_Data_Array set[22, ((round ((skill _x) * 100)) / 100)]}};if((skill _x) > (DAC_Data_Array select 24)) then {DAC_Data_Array set[24, ((round ((skill _x) * 100)) / 100)]}}} foreach DAC_East_Units;
			{if(!(isPlayer _x)) then {if((skill _x) < (DAC_Data_Array select 23)) then {if((skill _x) > 0) then {DAC_Data_Array set[23, ((round ((skill _x) * 100)) / 100)]}};if((skill _x) > (DAC_Data_Array select 25)) then {DAC_Data_Array set[25, ((round ((skill _x) * 100)) / 100)]}}} foreach DAC_West_Units;
			DAC_Data_Array set[5, _ce];
			DAC_Data_Array set[13, _cw];
			DAC_Data_Array set[0, count DAC_East_Units];
			DAC_Data_Array set[8, count DAC_West_Units];
			publicvariable "DAC_Data_Array";
			if(local player) then
			{
				_text1 = "<t color='#FFFF66' size='1.2' shadow='1' shadowColor='#333333' font='PuristaMedium' align='right'>DAC v3.1b Monitor</t>";
				_text2 = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'><br/>";
				_text3 = "<t color='#FF0033' size='1.0' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'>EAST</t>";
				_text4 = "<t color='#66CCFF' size='1.0' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'>WEST</t>";
				_text5 = "<t color='#FFFF66' size='1.2' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'>Time: ";
				DAC_InitText =	(
									_text1 + _text2 + _text3 +
									_text2 + format["%1 Units in action",(DAC_Data_Array select 0)] +
									_text2 + format["%1 Units reduced",(DAC_Data_Array select 1)] +
									_text2 + format["%1 Units killed",(DAC_Data_Array select 2)] +
									_text2 + format["%1 Units deleted",(DAC_Data_Array select 3)] +
									_text2 + format["%1 Units respawned",(DAC_Data_Array select 4)] +
									_text2 + format["%1 Vehicles in action",(DAC_Data_Array select 6)] +
									_text2 + format["%1 Vehicles destroyed",(DAC_Data_Array select 7)] +
									_text2 + format["%1 Vehicles deleted",(DAC_Data_Array select 16)] +
									_text2 + format["%1 Vehicles respawned",(DAC_Data_Array select 18)] +
									_text2 + format["%1 Arti shells fired",(DAC_Data_Array select 20)] +
									_text2 + format["%1 Unit skill Min",(DAC_Data_Array select 22)] +
									_text2 + format["%1 Unit skill Max",(DAC_Data_Array select 24)] +
									_text2 + format["%1 Respawns left",(DAC_Data_Array select 5)] +
									_text2 + _text2 + _text4 +
									_text2 + format["%1 Units in action",(DAC_Data_Array select 8)] +
									_text2 + format["%1 Units reduced",(DAC_Data_Array select 9)] +
									_text2 + format["%1 Units killed",(DAC_Data_Array select 10)] +
									_text2 + format["%1 Units deleted",(DAC_Data_Array select 11)] +
									_text2 + format["%1 Units respawned",(DAC_Data_Array select 12)] +
									_text2 + format["%1 Vehicles in action",(DAC_Data_Array select 14)] +
									_text2 + format["%1 Vehicles destroyed",(DAC_Data_Array select 15)] +
									_text2 + format["%1 Vehicles deleted",(DAC_Data_Array select 17)] +
									_text2 + format["%1 Vehicles respawned",(DAC_Data_Array select 19)] +
									_text2 + format["%1 Arti shells fired",(DAC_Data_Array select 21)] +
									_text2 + format["%1 Unit skill Min",(DAC_Data_Array select 23)] +
									_text2 + format["%1 Unit skill Max",(DAC_Data_Array select 25)] +
									_text2 + format["%1 Respawns left",(DAC_Data_Array select 13)] + _text2
								);
				hintSilent parseText DAC_InitText;
			};
			sleep (0.5 + (random 0.5));
		}
		else
		{
			if(_isShowing) then {hintSilent "";_isShowing = false};
			sleep 1;
		};
	};
}
else
{
	while{true} do
	{
		if(!(format["%1",(DAC_Com_Values select 3)] == "0")) then
		{
			if(!(_isShowing)) then {_isShowing = true};
			_text1 = "<t color='#FFFF66' size='1.2' shadow='1' shadowColor='#333333' font='PuristaMedium' align='right'>DAC v3.1b Monitor</t>";
			_text2 = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'><br/>";
			_text3 = "<t color='#FF0033' size='1.0' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'>EAST</t>";
			_text4 = "<t color='#66CCFF' size='1.0' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'>WEST</t>";
			_text5 = "<t color='#FFFF66' size='1.2' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'>FPS: ";
			DAC_InitText =	(
								_text1 + _text2 + _text3 +
								_text2 + format["%1 Units in action",(DAC_Data_Array select 0)] +
								_text2 + format["%1 Units reduced",(DAC_Data_Array select 1)] +
								_text2 + format["%1 Units killed",(DAC_Data_Array select 2)] +
								_text2 + format["%1 Units deleted",(DAC_Data_Array select 3)] +
								_text2 + format["%1 Units respawned",(DAC_Data_Array select 4)] +
								_text2 + format["%1 Vehicles in action",(DAC_Data_Array select 6)] +
								_text2 + format["%1 Vehicles destroyed",(DAC_Data_Array select 7)] +
								_text2 + format["%1 Vehicles deleted",(DAC_Data_Array select 16)] +
								_text2 + format["%1 Vehicles respawned",(DAC_Data_Array select 18)] +
								_text2 + format["%1 Arti shells fired",(DAC_Data_Array select 20)] +
								_text2 + format["%1 Unit skill Min",(DAC_Data_Array select 22)] +
								_text2 + format["%1 Unit skill Max",(DAC_Data_Array select 24)] +
								_text2 + format["%1 Respawns left",(DAC_Data_Array select 5)] +
								_text2 + _text2 + _text4 +
								_text2 + format["%1 Units in action",(DAC_Data_Array select 8)] +
								_text2 + format["%1 Units reduced",(DAC_Data_Array select 9)] +
								_text2 + format["%1 Units killed",(DAC_Data_Array select 10)] +
								_text2 + format["%1 Units deleted",(DAC_Data_Array select 11)] +
								_text2 + format["%1 Units respawned",(DAC_Data_Array select 12)] +
								_text2 + format["%1 Vehicles in action",(DAC_Data_Array select 14)] +
								_text2 + format["%1 Vehicles destroyed",(DAC_Data_Array select 15)] +
								_text2 + format["%1 Vehicles deleted",(DAC_Data_Array select 17)] +
								_text2 + format["%1 Vehicles respawned",(DAC_Data_Array select 19)] +
								_text2 + format["%1 Arti shells fired",(DAC_Data_Array select 21)] +
								_text2 + format["%1 Unit skill Min",(DAC_Data_Array select 23)] +
								_text2 + format["%1 Unit skill Max",(DAC_Data_Array select 25)] +
								_text2 + format["%1 Respawns left",(DAC_Data_Array select 13)] + _text2
							);
			hintSilent parseText DAC_InitText;
			sleep (0.5 + (random 0.5));
		}
		else
		{
			if(_isShowing) then {hintSilent "";_isShowing = false};
			sleep 1;
		};
	};
};