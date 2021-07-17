//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_AIRadio           //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_man","_val1","_val2","_val3","_val4","_val5","_val6","_val7","_action","_radioIndex","_string","_array","_dist","_i","_r","_sayer","_manSide"];

_val1 = _this select 0;_man = 0;_val5 = 0;_val6 = "";_val7 = [];_action = true;DacRadioString = "";_manSide = "";_array = [];
_val3 = "DAC_RadioArrayW";_val2 = [];_val4 = "";_radioIndex = "";_string = "";_dist = 0;_i = 0;_r = [];_sayer = objNull;

if((count _this > 1) && (DAC_Basic_Value == 1)) then
{
	_man = _this select 1;
	if((!(isNil "_man")) && (!(isNil "DAC_AI_RadioDummy1"))) then
	{
		if(DAC_Activate_Sound) then
		{
			if((typeName _man) == "OBJECT") then
			{
				switch (format["%1",side (driver (vehicle _man))]) do
				{
					case "WEST":{_val3 = "DAC_RadioArrayW";_string = "DAC_AI_RadioDummy1";_manSide = "WEST"};
					case "EAST":{_val3 = "DAC_RadioArrayE";_string = "DAC_AI_RadioDummy2";_manSide = "EAST"};
					case "GUER":{
									if(DAC_Res_Side == 0) then
									{
										_val3 = "DAC_RadioArrayE";_string = "DAC_AI_RadioDummy2";_manSide = "EAST"
									}
									else
									{
										_val3 = "DAC_RadioArrayW";_string = "DAC_AI_RadioDummy1";_manSide = "WEST"
									};
								};
					Default 	{_val3 = "[0]";_manSide = ""};
				};
				if(!(isNull (DAC_Radio_Settings select 4))) then {_man = (DAC_Radio_Settings select 4)};
				if((count (call compile _val3)) > 1) then
				{
					if(!(format["%1",((call compile _string) getVariable "radio_array")] in ["<null>","any"])) then
					{
						_array = ((call compile _string) getVariable "radio_array");
						if(count _array < (DAC_Radio_Settings select 2)) then
						{
							if(count _this > 2) then {sleep (_this select 2)};
							if((DAC_Radio_Settings select 0) == 0) then
							{
								_dist = 0.2 + ((DAC_Radio_Settings select 1) select 0) + random ((DAC_Radio_Settings select 1) select 1);
							}
							else
							{
								if(local player) then
								{
									if(((player distance _man) < (DAC_Radio_Settings select 0)) || ((DAC_Radio_Settings select 0) == 0)) then
									{
										if((player distance _man) < 3) then
										{
											_dist = ((10 / ((DAC_Radio_Settings select 0) / 800)) + round(random 10));
										}
										else
										{
											_dist = (((player distance _man) / ((DAC_Radio_Settings select 0) / 800)) + round(random 10));
										};
									}
									else
									{
										_action = false;
									};
								}
								else
								{
									_dist = (position _man);
								};
							};
							if(_action) then
							{
								if(((call compile _string) getVariable "old_string") == (_array select 0)) then
								{
									_array = _array - [((call compile _string) getVariable "old_string")];
								};
								sleep 0.1;
								_array set [count _array,format["%1_%2",_val1,_dist]];
								(call compile _string) setVariable ["radio_array", _array, false];
								if(local player) then {_sayer = "logic" createvehiclelocal [0,0,0]};
								
								while{_action} do
								{
									if(!(DAC_AI_Radio)) then
									{
										DAC_AI_Radio = true;
										_action = false;
									}
									else
									{
										sleep (0.2 + random 0.3);
									};
								};
								
								sleep 0.1;
								if(!(format["%1",((call compile _string) getVariable "radio_array")] in ["<null>","any"])) then
								{
									_array = ((call compile _string) getVariable "radio_array");
									if(count _array > 0) then
									{
										_val6 = (_array select 0);_val7 = toArray(_val6);						
										if((_val7 select 1) == 95) then
										{
											_val1 = call compile (toString[(_val7 select 0)]);
											if((typeName _dist) != "ARRAY") then
											{
												_r = [];_i = 2;while{(_i < count _val7)} do {_r set [count _r,(_val7 select _i)];_i = _i + 1};
												_dist = call compile (toString _r);
											};
										}
										else
										{
											_val1 = call compile format["%1%2",(toString[(_val7 select 0)]),(toString[(_val7 select 1)])];
											if((typeName _dist) != "ARRAY") then
											{
												_r = [];_i = 3;while{(_i < count _val7)} do {_r set [count _r,(_val7 select _i)];_i = _i + 1};
												_dist = call compile (toString _r);
											};
										};
										
										_val2 = ((call compile _val3) select _val1);
										_val5 = (_val2 select 0);
										_val4 = (_val2 select (1 + random ((count _val2) - 2)));
										
										if((random 100) <= _val5) then
										{
											if((_val4 != ((call compile _string) getVariable "old_string")) && (format["%1",_val4] != "")) then
											{
												DacRadioString = _val4;
												(call compile _string) setVariable ["radio_dist", _dist, true];
												(call compile _string) setVariable ["radio_string", _val4, true];
												(call compile _string) setVariable ["old_string", _val4, false];
												if(local player) then
												{
													if(format["%1",side player] == _manSide) then
													{
														if(isNull (DAC_Radio_Settings select 4)) then
														{
															_sayer setpos [(position player select 0),(position player select 1),- _dist];
															sleep 0.1;
															if(format["%1",DacRadioString] != "") then {_sayer say DacRadioString};
														}
														else
														{
															_sayer setpos [(position (DAC_Radio_Settings select 4) select 0),(position (DAC_Radio_Settings select 4) select 1),- _dist];
															sleep 0.1;
															if(format["%1",DacRadioString] != "") then {(DAC_Radio_Settings select 4) say DacRadioString};
														};
													};
												};
												sleep (DAC_Radio_Settings select 3);
											};
										};
									};
									if(!(format["%1",((call compile _string) getVariable "radio_array")] in ["<null>","any"])) then
									{
										_array = ((call compile _string) getVariable "radio_array");
										_array = _array - [_val6];
										(call compile _string) setVariable ["radio_array", _array, false];
										sleep 2;
									};
								};
								DAC_AI_Radio = false;
								sleep 4;
								if(local player) then {deletevehicle _sayer};
							};
						};
					};
				};
			};
		};
	};
};