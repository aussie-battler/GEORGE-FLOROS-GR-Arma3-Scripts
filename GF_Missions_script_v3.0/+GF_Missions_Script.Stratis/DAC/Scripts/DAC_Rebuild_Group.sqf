//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Rebuild_Group     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_GroupTyp","_GroupArray","_ma","_zo","_ScriptTyp","_run","_wait"];

_GroupTyp = _this select 0;_GroupArray = _this select 1;_ma = "";_zo = objNull;
_ScriptTyp = ["Soldier","Vehicle","Tank","Air","Camp"];_run = 1;_wait = true;

waituntil {(getdir DAC_StartDummy) > 170};

if(_GroupTyp <= 3) then
{
	_ma = (((_GroupArray select 13) select 4) select 0);_zo = _GroupArray select 10;
}
else
{
	if(_GroupTyp == 4) then
	{
		_ma = ((_GroupArray select 14) select 0);
	}
	else
	{
		_ma = ((_GroupArray select 15) select 0);
	};
	_zo = _GroupArray select 12;
};

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					_wait = true;
					while {_wait} do
					{
						sleep 0.5 + (random 0.5);
						if(((getMarkerSize _ma) select 0) <= 4) then {_run = 2;_wait = false};
					};
				};
		case 2:	{
					_wait = true;
					if(_GroupTyp == 5) then {call compile format["z_%1 = z_%1 + 1",_zo]};
					if(((getMarkerSize _ma) select 0) == 4) then
					{
						while {_wait} do
						{
							sleep 0.5 + (random 0.5);
							if(((getMarkerSize _ma) select 0) == 6) then
							{
								while {_run == 2} do
								{
									sleep 0.5 + (random 0.5);
									if(_GroupTyp < 5) then
									{
										if(call compile format["z_%1",_zo] == 0) then
										{
											_GroupArray execVM format["DAC\Scripts\DAC_Group_%1.sqf",(_ScriptTyp select (_GroupTyp - 1))];
											_run = 1;_wait = false;
										};
									}
									else
									{
										_GroupArray execVM format["DAC\Scripts\DAC_Group_%1.sqf",(_ScriptTyp select (_GroupTyp - 1))];
										_run = 1;_wait = false;
									};
								};
							};
						};
					}
					else
					{
						_run = 0;
					};
				};
		default	{};
	};
};