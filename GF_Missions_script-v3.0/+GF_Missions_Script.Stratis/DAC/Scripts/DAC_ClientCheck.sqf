//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_ClientCheck       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_PLUnit","_i","_nObj","_u","_newUnits","_oldUnits","_sCount","_mode"];

_mode = _this select 0;DAC_Players = [];_i = 0;_u = objNull;_nObj = [];_PLUnit = objNull;_newUnit = objNull;_oldUnits = [];_sCount = 0;

if(_mode == 1) then
{
	if((typename (DAC_Com_Values select 3)) == "STRING") then
	{
		if((DAC_Com_Values select 3) == format["%1",(name player)]) then {[1] execVM "DAC\Scripts\DAC_Show_Data.sqf"};
	}
	else
	{
		if((DAC_Com_Values select 3) == 1) then {[1] execVM "DAC\Scripts\DAC_Show_Data.sqf"};
	};
};

{
	if(!(isNil _x)) then 
	{
		DAC_Players set [count DAC_Players,call compile _x];
	};
}	foreach DAC_STRPlayers;

if(((DAC_Del_PlayerBody select 0) + (DAC_Del_PlayerBody select 1)) == 0) then
{
	if(!(isServer)) then
	{
		if(!(isNil "DAC_Support_Logic")) then
		{
			if((DAC_Com_Values select 0) > 0) then
			{
				_sCount = (count (DAC_Support_Logic getVariable "support_groups"));
				while{true} do
				{
					waituntil{(format["%1",(DAC_Support_Logic getVariable "arti_error")] != "-1") || (_sCount != (count (DAC_Support_Logic getVariable "support_groups")))};
					if(format["%1",(DAC_Support_Logic getVariable "arti_error")] != "-1") then
					{
						if(format["%1",(DAC_Support_Logic getVariable "arti_error")] == "0") then
						{
							player sidechat "Call arti support succesfully.";
						}
						else
						{
							player sidechat format["Call arti support aborted - reason %1",(DAC_Support_Logic getVariable "arti_error")];
						};
						waituntil{(format["%1",(DAC_Support_Logic getVariable "arti_error")] == "-1")};
					}
					else
					{
						_sCount = (count (DAC_Support_Logic getVariable "support_groups"));
						player sidechat "Call ground support succesfully.";
					};
				};
			};
		};
	};
}
else
{
	while {true} do
	{
		_PLUnit = objNull;
		while{(isNull _PLUnit)} do
		{
			_i = 0;
			_nObj = (position player) nearEntities 5;
			while {_i < count _nObj} do
			{
				_u = _nObj select _i;
				if((_u == player) && (alive _u)) then {_PLUnit = _u};
				_i = _i + 1;
			};
			sleep 0.2;
		};
		while{(alive player)} do
		{
			sleep 0.5;
			_newUnit = nearestObject [player, "CAManBase"];
			if(!(isNull _newUnit)) then
			{
				if((!(_newUnit in DAC_Players)) && (!(_newUnit in _oldUnits)) && ((group _newUnit) != (group player)) && ((side _newUnit) == (side player)) && (alive _newUnit)) then
				{
					if((DAC_Com_Values select 0) > 0) then {hint format["NewUnit = %1",name _newUnit]};
				};
			};
		};
		sleep (random 1);
		while{(!(alive player))} do {sleep 2};
		[(DAC_Del_PlayerBody select 0),(DAC_Del_PlayerBody select 1),_PLUnit,0] spawn DAC_fDelPlayer;
	};
};