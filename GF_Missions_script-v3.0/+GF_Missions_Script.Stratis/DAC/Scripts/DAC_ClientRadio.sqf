//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_ClientRadio       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_string","_radio","_rDist","_action","_man","_range"];

_string = "";_radio = "";_rDist = 0;_man = objNull;_range = 0;_action = true;
DAC_AI_RadioDummy1 = objNull;DAC_AI_RadioDummy2 = objNull;

waituntil{(!isNull DAC_AI_RadioDummy1)};
sleep 1;
DAC_AI_RadioDummy1 setVariable ["radio_string","",true];
DAC_AI_RadioDummy1 setVariable ["old_string","",false];
DAC_AI_RadioDummy1 setVariable ["radio_array",[],false];
DAC_AI_RadioDummy1 setVariable ["radio_dist",0,true];
DAC_AI_RadioDummy2 setVariable ["radio_string","",true];
DAC_AI_RadioDummy2 setVariable ["old_string","",false];
DAC_AI_RadioDummy2 setVariable ["radio_array",[],false];
DAC_AI_RadioDummy2 setVariable ["radio_dist",0,true];

switch (format["%1",side player]) do
{
	case "WEST":{_string = "DAC_AI_RadioDummy1"};
	case "EAST":{_string = "DAC_AI_RadioDummy2"};
	case "GUER":{
					if(DAC_Res_Side == 0) then
					{
						_string = "DAC_AI_RadioDummy2";
					}
					else
					{
						_string = "DAC_AI_RadioDummy1";
					};
				};
	Default 	{_action = false};
};

if(!(isNull (DAC_Radio_Settings select 4))) then {_man = (DAC_Radio_Settings select 4)};

while{_action} do
{
	if(!DAC_Activate_Sound) then
	{
		sleep 1;
	}
	else
	{
		waituntil{((_radio != ((call compile _string) getVariable "radio_string")) || (!DAC_Activate_Sound))};
		if(DAC_Activate_Sound) then
		{
			_radio = ((call compile _string) getVariable "radio_string");
			_rDist = ((call compile _string) getVariable "radio_dist");
			if((DAC_Radio_Settings select 0) == 0) then
			{
				[_radio,_rDist,_man] spawn DAC_fClientSayer;
			}
			else
			{
				_range = ((player distance _rDist) / ((DAC_Radio_Settings select 0) / 800));
				if((player distance _rDist) < (DAC_Radio_Settings select 0)) then
				{
					[_radio,_range,_man] spawn DAC_fClientSayer;
				};
			};
			sleep 0.1;
		};
	};
};