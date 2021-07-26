//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Group_Air         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_unitcount","_vehcount","_wparray","_groupid","_groupside","_groupstart","_groupende","_maxwps","_heloarray",
			"_unit_skill","_groupvar","_marker","_groupzone","_unitsel","_DAC_Z_Set","_delval0","_delval1","_sidearray",
			"_rankarray","_vehcargo","_sj","_m","_run","_go","_randomcount","_newgroup","_grouppara","_mp","_TempList","_posarray",
			"_EventList1","_TempUnitsA","_TempUnitsB","_ma","_ep","_group","_crewtyp","_unittyp","_wpstart","_startpos","_numarray","_tcfg","_tc","_crewA",
			"_setSkill","_setFleeing","_setrank","_vehicle","_vehc","_ldriver","_lgunner1","_lgonner","_lcommander1","_EventList2","_delval2","_soldierT","_WeapList"
		];
		
			_unitcount = _this select 0;_vehcount = _this select 1;_posarray = _this select 2;_wparray = (_posarray select 0);_numarray = (_posarray select 1);
			_ldriver = objNull;_lgunner1 = objNull;_lcommander1 = objNull;_lgonner = objNull;_crewA = [];
			_groupid = _this select 3;_groupside = _this select 4;_groupstart = _this select 5;_groupende = _this select 6;_maxwps = _this select 7;
			_heloarray = _this select 8;_unit_skill = _this select 9;_groupvar = _this select 10;_marker = _this select 11;_tc = 0;_tcfg = [];
			_groupzone = _this select 12;_unitsel = _this select 13;_DAC_Z_Set = _this select 14;_delval0 = ((DAC_Delete_Value select 1) select 0);
			_delval1 = ((DAC_Delete_Value select 1) select 1);_sidearray = [["EAST","WEST","RESISTANCE","CIVILIAN"],["E","W","R","C"]];
			_rankarray = ["private","corporal","sergeant","lieutenant","captain","major"];_vehcargo = 0;_sj = 0;_vehc = objNull;
			_m = "";_run = 1;_go = 1;_randomcount = random 999;_newgroup = group player;_vehicle = "";_startpos = [0,0,0];_soldierT = "";
			_EventList1 = [];_EventList2 = [];_setFleeing = 0;_setrank = "";_delval2 = (DAC_Delete_Value select 2);_WeapList = 0;
			_setSkill = [[0,"aimingAccuracy"],[1,"aimingShake"],[2,"aimingSpeed"],[3,"Endurance"],[4,"spotDistance"],[5,"spotTime"],[6,"courage"],[7,"reloadSpeed"],[8,"commanding"],[9,"general"]];
			_grouppara = [_unitcount,_vehcount,_posarray,_groupid,_groupside,_groupstart,_groupende,_maxwps,_heloarray,_unit_skill,_groupvar,_marker,_groupzone,_unitsel,"Null"];

_ma = (_DAC_Z_Set select 0);
if(((getMarkerSize _ma) select 0) == 4) then
{
	//disabled
}
else
{
	DAC_Master_Init = DAC_Master_Init + 1;
	while {_go > 0} do
	{
		sleep 0.2;
		if(!(DAC_InCreate)) then
		{
			DAC_InCreate = true;_go = 0;
		};
	};

	while {_run > 0} do
	{
		switch (_run) do
		{
			case 1:	{
						//-----------------------------
						//#firstcheck
						//-----------------------------
						_mp = getmarkerpos (_DAC_Z_Set select 2);_TempList = [(_mp select 0),0] call DAC_fConfigUnits;
						if(_groupende > 0) then
						{
							_EventList1 = ((([_groupende] call DAC_fConfigEvents) select 3) select 0);
							_EventList2 = ((([_groupende] call DAC_fConfigEvents) select 6) select 2);
						};
						_TempUnitsA = (_TempList select 0);_TempUnitsB = (_TempList select 3);
						_unit_skill = [((getMarkerPos (_DAC_Z_Set select 2)) select 1)] call DAC_fConfigBehav;
						_grouppara set [9, _unit_skill];
						_run = 2;
					};
			case 2:	{
						//-----------------------------
						//#startcreate
						//-----------------------------
						if(count _TempUnitsA < 3) then
						{
							hintc format["Attention, in an Unit Config for Infantry,\nnot all required entries exist.\n\nAt least 3 entries must be\n contained. The first entry should\nbe always a pilot,\nthe second entry should be\nalways a driver, the third entry\nshould be always a group leader.\nFrom the fourth entry\nall Units can be taken."];
							DAC_Basic_Value = 4;publicvariable "DAC_Basic_Value";_run = 0;
						}
						else
						{
							if(count _TempUnitsB < 1) then
							{
								hintc format["Attention,\nin an Unit Config for Helicopter,\nno entry exists."];
								DAC_Basic_Value = 4;publicvariable "DAC_Basic_Value";_run = 0;
							}
							else
							{
								if(DAC_StartDummy in DAC_Init_Group) then {DAC_Init_Group = DAC_Init_Group - [DAC_StartDummy]};
								DAC_Init_Group set [count DAC_Init_Group,_randomcount];DAC_Init_Values set [0,(DAC_Init_Values select 0) + 1];
								DAC_Init_Unit set [3,(DAC_Init_Unit select 3) + 1];
								_crewtyp = _TempUnitsA select 1;_unittyp = _TempUnitsB;_wpstart = call compile (_wparray select (random ((count _wparray) - 1)));
								if((count (call compile format["DAC_GroupPool%1",((_sidearray select 1) select _groupside)])) == 0) then
								{
									_newgroup = call compile format["createGroup %1",((_sidearray select 0) select _groupside)];
								}
								else
								{
									_newgroup = ((call compile format["DAC_GroupPool%1",((_sidearray select 1) select _groupside)]) select 0);
									call compile format["DAC_GroupPool%1 = DAC_GroupPool%1 - [_newgroup]",((_sidearray select 1) select _groupside)];
								};
								if(DAC_InSpawn) then
								{
									_startpos = position DAC_SpawnDummy;
								}
								else
								{
									_startpos = [(_wpstart select 0),(_wpstart select 1),0];
								};
								_newgroup setVariable ["DAC_Excluded", False];
								_run = 3;
							};
						};
					};
			case 3:	{
						//-----------------------------
						//#creategroup
						//-----------------------------
						_setFleeing = ((_unit_skill select 5) select 0);_setrank = _rankarray select (random ((count _rankarray) - 1));_vehicle = "";
						if(count _unittyp > 1) then {_vehicle = _unittyp select (random ((count _unittyp) - 1))} else {_vehicle = _unittyp select 0};
						_vehc = _vehicle createvehicle _startpos;[_vehc,_delval0,_delval1,2,_ma,_newgroup,_delval2,_groupside] spawn DAC_fDeleteUnit;_vehc setfuel 0;
						DAC_VehicleInUse set [count DAC_VehicleInUse,_vehc];
						switch (_groupside) do
						{
							case 0:	{DAC_Data_Array set[6, ((DAC_Data_Array select 6) + 1)]};
							case 1:	{DAC_Data_Array set[14, ((DAC_Data_Array select 14) + 1)]};
							Default {};
						};
						_tcfg = configFile >> "CfgVehicles" >> typeof _vehc >> "turrets";_tc = count _tcfg;
						if((typeName _crewtyp) == "ARRAY") then {_soldierT = (_crewtyp select 0);_WeapList = (_crewtyp select 1)} else {_soldierT = _crewtyp};
						_ldriver = _newgroup createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];[_ldriver] join _newgroup;
						_lgunner1 = (group _ldriver) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
						_lcommander1 = (group _ldriver) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
						_crewA = _crewA + [_ldriver,_lgunner1,_lcommander1];
						if(count (_unit_skill select 0) > 2) then
						{
							if(_tc > 1) then
							{
								_lgonner = (group _ldriver) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
								{_lgonner setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
								_crewA = _crewA + [_lgonner];
							};
							{_ldriver setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
							{_lgunner1 setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
							{_lcommander1 setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
						}
						else
						{
							if(_tc > 1) then
							{
								_lgonner = (group _ldriver) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
								_crewA = _crewA + [_lgonner];
							};
							{_setSkill = ((_unit_skill select 0) select 0) + random (((_unit_skill select 0) select 1) - ((_unit_skill select 0) select 0));_x setSkill _setskill} foreach _crewA;
						};
						{_x allowFleeing _setFleeing;_x setRank _setrank} foreach _crewA;
						if(_WeapList > 0) then
						{
							{[_x,format["%1",_WeapList]] spawn DAC_Weapons} foreach [_ldriver,_lgunner1,_lcommander1];
							_WeapList = 0;
						};
						DAC_Init_Values set [1,(DAC_Init_Values select 1) + (count _crewA)];
						if(((DAC_Com_Values select 1) == 2) && (!(DAC_InSpawn)) && ((getdir DAC_StartDummy) < 170)) then
						{
							DAC_InitText = (DAC_InitText + "|");
							_countu = DAC_Init_Values select 1;_countg = DAC_Init_Values select 0;
							if(DAC_Basic_Value != 10) then {hintSilent parseText (DAC_InitText + format["%1(%2)",_countu,_countg])};
						};
						
						{
						removeBackpack _x;
						_x addBackpack "B_Parachute"
						} foreach _crewA;
						_ldriver assignasdriver _vehc;_ldriver moveindriver _vehc;
						_lgunner1 assignasgunner _vehc;_lgunner1 moveingunner _vehc;
						_lcommander1 assignascommander _vehc;_lcommander1 moveincommander _vehc;
						if(_tc > 1) then {_lgonner assignAsTurret [_vehc, [2]];_lgonner MoveInTurret [_vehc,[2]]};
						sleep 0.01;
						{if(!(_x in _vehc)) then {DAC_Init_Values set [1,(DAC_Init_Values select 1) - 1];deletevehicle _x}} foreach _crewA;
						_run = 4;
					};
			case 4:	{
						//-----------------------------
						//#groupready
						//-----------------------------
						_group = group _ldriver;_group setbehaviour "AWARE";
						if(getNumber (configFile >> "CfgVehicles" >> (typeof _vehc) >> "transportSoldier") > 1) then {_vehcargo = 1} else {if(!(_group in DAC_All_Groups)) then {DAC_All_Groups set [count DAC_All_Groups,_group]}};
						if(!(_group in DAC_All_Groups)) then {DAC_All_Groups set [count DAC_All_Groups,_group]};
						[[_group,_DAC_Z_Set,_groupende],_posarray,4,_heloArray,_vehcargo,_vehc,_groupzone] spawn DAC_fMoveRandom;
						[_group,4,_groupende,_groupside,_grouppara,_ma] spawn DAC_fWaitingForEnd;
						if((count _EventList1) > 0) then {call compile (_EventList1 select 0)};
						if((count _EventList2) > 0) then {call compile (_EventList2 select 0)};
						if((_vehcargo == 1) && (_groupside < 3)) then
						{
							[
								_unitcount,[format["%1",_startpos]],6,_groupside,_groupstart,_groupende,1,
								_unit_skill,_groupvar,_m,_groupzone,_unitsel,"Null",[0,0,0,0,_DAC_Z_Set,0],
								[_vehc,_group,_heloArray,_posarray],_TempUnitsA
							]	execVM "DAC\Scripts\DAC_Group_Soldier.sqf";
						};
						{_x setTargetAge "30 MIN"} foreach units _group;_run = 5;
						[_group,_groupside] spawn DAC_fRouteMarker;
						if(_groupside == 0) then
						{
							{DAC_East_Units set [count DAC_East_Units,_x]} foreach units _group;
						}
						else
						{
							if(_groupside == 1) then
							{
								{DAC_West_Units set [count DAC_West_Units,_x]} foreach units _group;
							}
							else
							{
								if(_groupside == 2) then
								{
									if(DAC_Res_Side == 0) then
									{
										{DAC_East_Units set [count DAC_East_Units,_x]} foreach units _group;
									}
									else
									{
										{DAC_West_Units set [count DAC_West_Units,_x]} foreach units _group;
									};
								};
							};
						};
					};
			case 5:	{
						//-----------------------------
						//#aftercreate
						//-----------------------------
						sleep 0.01;
						DAC_InCreate = false;
						sleep 0.5;
						DAC_Init_Group = DAC_Init_Group - [_randomcount];DAC_Init_Unit set [3,(DAC_Init_Unit select 3) - 1];
						DAC_Master_Init = DAC_Master_Init - 1;
						if(!(format["%1",_groupvar] == "")) then {call compile format["%1 set [count %1,_group]",_groupvar]};
						if((((getMarkerSize _ma) select 0) == 6) && (!(DAC_InSpawn)) && ((DAC_Com_Values select 0) > 0) && ((getdir DAC_StartDummy) > 170)) then {player groupchat format["%1 was activated",_group]};
						DAC_InSpawn = false;_run = 0;
					};
			Default{};
		};
	};
};