//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Init_Sector       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_i","_z","_s","_zones","_eS","_fS"];

_zones = _this;_i = 0;_z = objNull;_eS = [];_fS = [];_s = "";

waituntil {(DAC_Basic_Value > 0)};

sleep 3;

DAC_Sectors = [];

if(local player) then
{
	switch(format["%1",side player]) do 
	{
		case "WEST":	{
							switch (DAC_Res_Side) do
							{
								case 0:	{_eS = ["EAST","GUER"];_fS = ["WEST"]};
								case 1:	{_eS = ["EAST"];_fS = ["WEST","GUER"]};
								case 2:	{_eS = ["EAST","WEST"];_fS = ["GUER"]};
								default	{_eS = ["EAST"];_fS = ["WEST"]};
							};
						};
		case "EAST":	{
							switch (DAC_Res_Side) do
							{
								case 0:	{_fS = ["EAST","GUER"];_eS = ["WEST"]};
								case 1:	{_fS = ["EAST"];_eS = ["WEST","GUER"]};
								case 2:	{_fS = ["EAST","WEST"];_eS = ["GUER"]};
								default	{_eS = ["EAST"];_fS = ["WEST"]};
							};
						};
		case "GUER":	{
							switch (DAC_Res_Side) do
							{
								case 0:	{_fS = ["EAST","GUER"];_eS = ["WEST"]};
								case 1:	{_fS = ["WEST","GUER"];_eS = ["EAST"]};
								case 2:	{_fS = ["GUER"];_eS = ["EAST","WEST"]};
								default	{_fS = ["GUER"];_eS = ["EAST","WEST"]};
							};
						};
		default			{
							switch (DAC_Res_Side) do
							{
								case 0:	{_fS = ["CIVL"];_eS = ["WEST","EAST","GUER"]};
								case 1:	{_fS = ["CIVL"];_eS = ["WEST","EAST","GUER"]};
								case 2:	{_fS = ["CIVL"];_eS = ["WEST","EAST","GUER"]};
								default	{_fS = ["CIVL"];_eS = ["WEST","EAST","GUER"]};
							};
						};
	};

	while {_i < count _zones} do
	{
		DAC_Sectors set [_i, 0];_z = (_zones select _i);
		[_z,_i] spawn DAC_fSectorCheck;_i = _i + 1;
	};

	{DAC_Sector_Values set [count DAC_Sector_Values,_x]} foreach [_eS,_fS];
	if(local player) then {if(DAC_Sector_Values select 6) then {execVM "DAC\Scripts\DAC_Hint_Sectors.sqf"}};
};