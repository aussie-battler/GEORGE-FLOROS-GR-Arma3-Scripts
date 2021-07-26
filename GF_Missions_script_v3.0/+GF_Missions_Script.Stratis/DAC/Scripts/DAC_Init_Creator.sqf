//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Init_Creator      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_start","_pa","_pn","_a","_sum","_end"];

	if((DAC_Com_Values select 1) > 0) then
	{
		if((DAC_Com_Values select 1) == 2) then
		{
			_text1 = "<t color='#FFFF66' size='1.0' shadow='1' shadowColor='#333333' align='center'>DAC v3.1b</t>";
			_text2 = "<t color='#CCCCCC' size='0.9' shadow='0' shadowColor='#666666' align='center'> is initialized ...</t><br/>";
			DAC_InitText = (_text1 + _text2);
			if(DAC_Basic_Value != 10) then {hintSilent parseText DAC_InitText};
		}
		else
		{
			if(DAC_InitText == "") then
			{
				_text1 = "<t color='#FFFF66' size='1.0' shadow='1' shadowColor='#333333' align='left'>DAC v3.1b</t>";
				_text2 = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#666666' align='left'> ... searching for DAC zones</t><br/>";
				DAC_InitText = (_text1 + _text2);
				if(DAC_Basic_Value != 10) then {hintSilent parseText DAC_InitText};
			};
		}
	};

	_start = time;DAC_SpawnDummy = "logic" createvehiclelocal [0,0,0];
	DAC_Trigger = createTrigger ["EmptyDetector",getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition")];
	DAC_Trigger setTriggerActivation ["Any", "PRESENT", true];
	DAC_Trigger setTriggerArea [25000, 25000, 0, true ];
	DAC_Trigger setTriggerStatements ["this", "", ""];

// DAC Arrays & Vars;

	DAC_Zone_Values = 640;DAC_InSpawn = false;DAC_All_Groups = [];DAC_Camp_Zones = [];
	DAC_AI_Behaviour = [];DAC_Spawn_CampsE = [];DAC_Spawn_CampsW = [];DAC_Camps_InUse = [];
	DAC_Min_Groups = [];DAC_West_Units = [];DAC_East_Units = [];DAC_Camp_Pool = [];
	DAC_Init_Values = [0,0];DAC_Arti_Player = [0];DAC_Player_Arti = "";DAC_Player_SupGroup = "";
	DAC_Init_Group = [];DAC_Init_WP = [];DAC_Init_Unit = [1,0,0,0,0];DAC_Zones = [];DAC_Group_Null = [];
	DAC_WP_Pool_S = [];DAC_WP_Pool_V = [];DAC_WP_Pool_T = [];DAC_WP_Pool_A = [];DAC_Check_Radio = [];
	DAC_WP_Pool_H = [];DAC_WP_Pool_C = [];DAC_WP_Pool_B = [];DAC_Unit_Pool_S = [];DAC_Marker_Array = [];
	DAC_Unit_Pool_V = [];DAC_Unit_Pool_T = [];DAC_Unit_Pool_A = [];DAC_Unit_Pool_C = [];DAC_Release_Action = 0;
	DAC_Unit_Pool_O = [];DAC_Unit_Pool_H = [];DAC_Unit_Pool_B = [];DAC_Unit_Pool_D = [];DAC_Inactive_Zones = [];
	DAC_GroupPoolE  = [];DAC_GroupPoolW  = [];DAC_GroupPoolR  = [];DAC_GroupPoolC  = [];DAC_Join_Array = [];
	DAC_Buildg_InUse = [];DAC_Arti_West = [0];DAC_Arti_East = [0];DAC_Arti_Array = [];xCam_Debug_Group = [];DAC_In_Building = [];
	DAC_Master_Init = 0;DAC_WPCount_Init = 0;DAC_AI_Path = format["DAC\AI_%1\",DAC_AI_AddOn];DAC_NewZone = 0;
	DAC_CheckZones = [];DAC_VehicleInUse = [];DAC_Arti_Veh = [];DAC_Static = [];

{_x = _x + [DAC_StartDummy]} foreach [DAC_Init_Zone,DAC_Init_WP,DAC_Init_Group,DAC_East_Units,DAC_West_Units];
[]execVM format["%1DAC_AI_Init.sqf",DAC_AI_Path];
_pa = 0;_pn = DAC_StartDummy;DAC_Players = [];

{
	if(!(isNil _x)) then 
	{
		DAC_Players set [count DAC_Players,call compile _x];
	};
}	foreach DAC_STRPlayers;

if((count DAC_Players) == 0) then
{
	hintc format["Attention . . .\n\nthe Array DAC_STRPlayers contains none, or invalid names of units.\n\nPerhaps, you have forgotten to name	your player.\n\nPlease, name all editor placed units on your side. Then add these names	to the Array DAC_STRPlayers.\n\nThe AI will not react properly."];
	DAC_Basic_Value = 3;publicvariable "DAC_Basic_Value";
}
else
{
	While {_pa < count DAC_Players} do 
	{
		_pn = group (DAC_Players select _pa);
		if((!(format["%1",DAC_Players select _pa] == scalar))) then
		{
			{if(!(_x in DAC_Players)) then {DAC_Players set [count DAC_Players,_x]}} foreach units _pn;
		};
		_pa = _pa + 1;
	};
};

if(count DAC_SaveDistance > 1) then
{
	if((typeName (DAC_SaveDistance select 1)) == "ARRAY") then
	{
		if(count (DAC_SaveDistance select 1) > 0) then
		{
			{if((format["%1",isNil call compile "((DAC_SaveDistance select 1) select 0)"]) == "TRUE") then {DAC_SaveDistance set[0,-1]}}foreach (DAC_SaveDistance select 1);
			if((DAC_SaveDistance select 0) < 0) then {DAC_SaveDistance = []};
		}
		else
		{
			DAC_SaveDistance = [];
		};
	}
	else
	{
		DAC_SaveDistance = [];
	};
}
else
{
	if(count DAC_SaveDistance > 0) then {DAC_SaveDistance = []};
};
	
DAC_InCreate = false;

	if(DAC_AI_Level > 4) then
	{
		DAC_AI_Level = 4;
	}
	else
	{
		if(DAC_AI_Level < 1) then
		{
			DAC_AI_Level = 1;
		};
	};

if(DAC_Direct_Start) then
{
	DAC_Init_Counter = [0,0,0,0,0];
	if(isNil "DAC_GroupNull") then {DAC_GroupNull = call compile format["createGroup %1","Civilian"]};
}
else
{
	sleep 2;
	[1]execVM "DAC\Scripts\DAC_Init_Waypoint.sqf";
};

sleep 0.1;

DAC_StartDummy setpos [10,10,0];
if(!(DAC_Direct_Start)) then {sleep 3};

waituntil {(({_x == 0} count DAC_Init_Counter) == 5)};

if(!(DAC_Direct_Start)) then {sleep 1};
_end = time;_sum = _end - _start;

if((DAC_Com_Values select 1) > 0) then
{
	if(!(DAC_Direct_Start)) then
	{
		if((DAC_Com_Values select 1) == 1) then
		{
			_text1 = "<t color='#FFFF66' size='1.0' shadow='1' shadowColor='#333333' align='left'>DAC v3.1b</t>";
			_text2 = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#666666' align='left'> init successfully.</t><br/>";
			_text3 = "<t color='#CCCCCC' size='0.9' align='left'>";
			_text4 = "<t color='#FFFF66' size='0.9' align='left'>";
			DAC_InitText = (_text1 + _text2 + _text3 + "Required time: " + _text4 + format["%1",_sum]);
			if(DAC_Basic_Value != 10) then {hintSilent parseText DAC_InitText};
		}
		else
		{
			if((DAC_Com_Values select 1) == 2) then
			{
				_string = "<t color='#FFFF99' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium' align='left'><br/><br/>";
				DAC_InitText = (DAC_InitText + _string + "========== Result ===========" + "<br/><br/></t>" + "<t color='#FF9933' size='0.9' shadow='1' shadowColor='#333333'>");
				_string = "<t color='#FFFF66' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium'>";
				DAC_InitText = (DAC_InitText + _string + format["%1 ",DAC_WPCount_Init]);
				_string = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium'>";
				DAC_InitText = (DAC_InitText + _string + "Waypoints created");
				_string = "<t color='#FFFF66' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium'><br/>";
				DAC_InitText = (DAC_InitText + _string + format["%1 ",(DAC_Init_Values select 1)]);
				_string = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium'>";
				DAC_InitText = (DAC_InitText + _string + "Units in");
				_string = "<t color='#FFFF66' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium'><br/>";
				DAC_InitText = (DAC_InitText + _string + format["%1 ",(DAC_Init_Values select 0)]);
				_string = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium'>";
				DAC_InitText = (DAC_InitText + _string + "Group(s) created.");
				_string = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium'><br/>";
				DAC_InitText = (DAC_InitText + _string + "Required time: ");
				_string = "<t color='#FFFF66' size='0.9' shadow='1' shadowColor='#333333' font='PuristaMedium'>";
				DAC_InitText = (DAC_InitText + _string + format["%1",_sum] + "<br/><br/></t>");
				if(DAC_Basic_Value != 10) then {hintSilent parseText DAC_InitText};
			}
			else
			{
					hint "Wrong Value -> DAC_Com_Values";
			};
		};
	}
	else
	{
		if((DAC_Com_Values select 1) > 0) then
		{
			_text1 = "<t color='#FFFF66' size='1.0' shadow='1' shadowColor='#333333' align='left'>DAC v3.1b init successfully.</t>";
			_text2 = "<t color='#CCCCCC' size='0.9' shadow='1' shadowColor='#333333' align='left' font='PuristaMedium'><br/>";
			_hint = (_text1 + _text2 + format["Required time: %1 sec.",_sum]);
			hintSilent parseText _hint;
		};
	};
};

DAC_West_Units = DAC_West_Units - [DAC_StartDummy];DAC_East_Units = DAC_East_Units - [DAC_StartDummy];
sleep 1;
DAC_StartDummy setdir 180;DAC_Basic_Value = 1;publicvariable "DAC_Basic_Value";
DAC_Players set [count DAC_Players,DAC_StartDummy];
[]execVM "DAC\Scripts\DAC_Clean_Arrays.sqf";