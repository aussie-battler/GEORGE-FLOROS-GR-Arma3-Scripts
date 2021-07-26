//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_ClientSpeak       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_oldString","_val0","_val1","_val2","_val3","_val4","_pos","_radio"];

DAC_AI_SayDummy = "NULL";DacSpeakString = "";_oldString  = "";_radio = "";
_val0 = "[]";_val1 = "[]";_val2 = "[]";_val3 = "[]";_pos = [];_val4 = [];

waituntil{(DAC_Basic_Value > 0)};
sleep 1;

while {time > 0} do
{
	if(!DAC_Activate_Sound) then
	{
		sleep 1;
	}
	else
	{
		waituntil {((!(format["%1",DAC_AI_SayDummy] == "NULL")) || (!DAC_Activate_Sound))};
		if(DAC_Activate_Sound) then
		{
			if(_oldString == DacSpeakString) then
			{
				DAC_AI_SayDummy = "NULL";
			}
			else
			{
				_oldString = DacSpeakString;
				_val0 = call compile format["%1",DacSpeakString];
				_val1 = _val0 select 0;_val2 = _val0 select 1;_val3 = _val0 select 2;_pos = _val0 select 3;
				if(!(dialog)) then
				{
					if(_val1 > 0) then
					{
						DAC_AI_SayDummy say3D (((call compile _val3) select (_val1 - 1)) select _val2);
					}
					else
					{
						_radio = ((call compile _val3) select _val2);
						[_radio,-1,_pos] spawn DAC_fClientSayer;
					};
				};
				sleep 0.1;
				DAC_AI_SayDummy = "NULL";
			};
		};
	};
};