//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_AISpeak           //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_man","_val1","_val2","_val3","_val4","_val5","_string","_pos","_radio"];

_man = _this select 0;_val1 = _this select 1;_pos = [];_val4 = 0;_val5 = position _man;
DacSpeakString = "";_val3 = "DAC_SayArrayW";_val2 = "";_string = "";_radio = "";

if(DAC_Activate_Sound) then
{
	if(_val1 > 0) then
	{
		if(_man in DAC_West_Units) then
		{
			_val3 = "DAC_SayArrayW";
		}
		else
		{
			if(_man in DAC_East_Units) then	{_val3 = "DAC_SayArrayE"} else {if(true) exitwith{}};
		};
		if((count (call compile _val3)) > 0) then
		{
			if(count ((call compile _val3) select (_val1 - 1)) > 0) then
			{
				if((((call compile _val3) select (_val1 - 1)) select 0) > 0) then
				{
					if((random 100) <= (((call compile _val3) select (_val1 - 1)) select 0)) then
					{
						_val2 = (round (1 + random ((count ((call compile _val3) select (_val1 - 1))) - 2)));
						someArray = [_val1,_val2,_val3,_val5];

						while{DAC_AI_Speak} do
						{
							sleep (0.1 + (random 0.2));
						};
						if(str(somearray) == DAC_Old_String) exitwith{};
						DAC_AI_Speak = true;
						DAC_Old_String = str(somearray);
						DAC_AI_SayDummy = _man;publicvariable "DAC_AI_SayDummy";
						DacSpeakString = str (somearray);publicvariable "DacSpeakString";
						if(alive _man) then
						{
							DAC_AI_SayDummy say3D (((call compile _val3) select (_val1 - 1)) select _val2);
						};
						sleep 0.1;
					};
				};
			};
		};
	}
	else
	{
		_val3 = "DAC_SayArrayD";
		if((count (call compile _val3)) > 0) then
		{
			if(((call compile _val3) select 0) > 0) then
			{
				if((random 100) <= ((call compile _val3) select 0)) then
				{
					_val2 = round (1 + random (count (call compile _val3) - 2));
					someArray = [_val1,_val2,_val3,_val5];_val4 = ((call compile _val3) select 0);
					if((random 100) <= _val4) then
					{
						if(str(somearray) == DAC_Old_String) exitwith{};
						DAC_AI_Speak = true;
						DAC_Old_String = str(somearray);
						DAC_AI_SayDummy = _man;publicvariable "DAC_AI_SayDummy";
						DacSpeakString = str (somearray);publicvariable "DacSpeakString";
						if(local player) then
						{
							_radio = ((call compile _val3) select _val2);
							[_radio,-1,_val5] spawn DAC_fClientSayer;
						};
						sleep 0.1;
					};
				};
			};
		};
		
	};
	DAC_AI_Speak = false;
};