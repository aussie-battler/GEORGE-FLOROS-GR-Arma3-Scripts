//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Dyn_Weather       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_weatherDistanceTime","_weatherChangeTime","_weatherMaxCas","_weatherMaxFog","_oldWeather",
			"_weatherMaxWind","_oldwind","_oldfog","_run","_timefact","_waittime","_code","_go"
		];

waituntil {(DAC_Basic_Value > 0)};

sleep 10;

_weatherDistanceTime = _this select 0;_weatherChangeTime = _this select 1;_weatherMaxCas = _this select 2;
_weatherMaxFog = _this select 3;_weatherMaxWind = _this select 4;DAC_ChangeWeather = 0;DAC_Weather = overcast;DAC_Fog = fog;DAC_Rain = rain;DAC_Wind = (wind select 0);
_oldWeather = DAC_Weather;_oldfog = DAC_Fog;_oldwind = DAC_Wind;_run = 1;_waittime = 0;
_code = _this select 4;_go = 1;

if((_weatherDistanceTime == 0) || (_weatherChangeTime == 0)) then {_run = 0};

if(_code == 3) then {_run = 5};

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					if(!(isServer)) then
					{
						_go = 1;
						while {_go > 0} do
						{
							sleep (1 + (random 1));
							if(DAC_ChangeWeather == 1) then
							{
								sleep 3;
								_go = 0;_run = 3;
							};
						};
					}
					else
					{
						sleep (_weatherDistanceTime + 3);
						_run = 2;
					};
				};
		case 2:	{
					DAC_ChangeWeather = 1;
					DAC_Weather = random _weatherMaxCas;DAC_Fog = [(random (_weatherMaxFog select 0)),(random (_weatherMaxFog select 1)),(random (_weatherMaxFog select 2))];DAC_Wind = random (- _weatherMaxWind + (2 * _weatherMaxWind));
					publicvariable "DAC_ChangeWeather";publicvariable "DAC_Weather";publicvariable "DAC_Fog";publicvariable "DAC_Wind";
					sleep 1;
					_run = 3;
				};
		case 3:	{
					setWind [DAC_Wind,DAC_Wind,true];
					_weatherChangeTime setovercast DAC_Weather;
					sleep (_weatherChangeTime + 3);
					_go = 0;_run = 4;
				};
		case 4:	{
					if(isServer) then
					{
						(_weatherChangeTime / 2) setfog DAC_Fog;
						DAC_ChangeWeather = 2;
						publicvariable "DAC_ChangeWeather";
						sleep ((_weatherChangeTime / 2) + 3);
						_run = 2;
					}
					else
					{
						_go = 1;
						while {_go > 0} do
						{
							sleep (1 + (random 1));
							if(DAC_ChangeWeather == 2) then
							{
								(_weatherChangeTime / 2) setfog DAC_Fog;
								sleep ((_weatherChangeTime / 2) + 3);
								_run = 1;
							};
						};
					};
				};
		case 5:	{
					waituntil {(DAC_ChangeWeather == 1)};
					_run = 3;
				};
		Default{};
	};
};