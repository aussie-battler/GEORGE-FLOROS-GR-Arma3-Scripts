//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Server_Check      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_val0","_val1","_val2","_val3","_val4","_val5","_sc","_i","_a"];

_val0 = [];_val1 = objNull;_val2 = [];_val3 = 0;_val4 = 0;_val5 = objNull;_sc = [];_i = 0;_a = 0;

waituntil {(DAC_Basic_Value == 1)};

if(local player) then
{
	if((typename (DAC_Com_Values select 3)) == "STRING") then
	{
		if((DAC_Com_Values select 3) == format["%1",(name player)]) then {[0] execVM "DAC\Scripts\DAC_Show_Data.sqf"};
	}
	else
	{
		if((DAC_Com_Values select 3) == 1) then {[0] execVM "DAC\Scripts\DAC_Show_Data.sqf"};
	};
}
else
{
	if((typename (DAC_Com_Values select 3)) == "STRING") then
	{
		[0] execVM "DAC\Scripts\DAC_Show_Data.sqf";
	}
	else
	{
		if((DAC_Com_Values select 3) == 1) then {[0] execVM "DAC\Scripts\DAC_Show_Data.sqf"};
	};
};
sleep 3;

DAC_Zone_Values = 0;
publicvariable "DAC_Zone_Values";
sleep 1;

while{time > 0} do
{
	{
		if(!(isNil _x)) then
		{
			if(!((call compile _x) in DAC_Players)) then
			{
				DAC_Players set [count DAC_Players,call compile _x];
			};
			switch (side (call compile _x)) do
			{
				case "WEST":{if(!((call compile _x) in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,(call compile _x)]}};
				case "EAST":{if(!((call compile _x) in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,(call compile _x)]}};
				case "GUER":{
								if(DAC_Res_Side == 0) then
								{
									if(!((call compile _x) in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,(call compile _x)]}
								}
								else
								{
									if(!((call compile _x) in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,(call compile _x)]}
								};
							};
				Default {};
			};
		};
	}	foreach DAC_STRPlayers;
	_i = 0;_a = 0;
	while{_i < count DAC_Players} do
	{
		if((format["%1",(DAC_Players select _i)]) == "<NULL-object>") then {DAC_Players set[_i, 0];_a = _a + 1};
		_i = _i + 1;
	};
	if(_a > 0) then {DAC_Players = DAC_Players - [0]};
	sleep 1;
};