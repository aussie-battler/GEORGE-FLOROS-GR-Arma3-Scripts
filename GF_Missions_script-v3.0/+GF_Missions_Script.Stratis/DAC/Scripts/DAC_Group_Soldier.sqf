//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Group_Soldier     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_unitcount","_wparray","_groupid","_groupside","_groupstart","_groupende","_maxrad","_unit_skill","_numarray",
			"_groupvar","_marker","_groupzone","_unitsel","_groupname","_groupcount","_vehicleval","_crewval","_startpos",
			"_sj","_randomcount","_leadertyp","_sidearray","_sidearray","_newgroup","_rankarray","_startid","_homezone",
			"_vehiclepara","_groupvehicle","_Temp_Unit_Pool","_mp","_TempList","_EventList","_TempUnits","_ma","_harray",
			"_countmax","_countmin","_sx","_sy","_unittyp","_wpstart","_setSkill","_setFleeing","_setrank","_soldier","_eman",
			"_leaderman","_countu","_countg","_grouppara","_group","_res","_run","_go","_WeapList","_soldierT","_posarray"
		];
		
			_unitcount = _this select 0;_posarray = _this select 1;_wparray = (_posarray select 0);_numarray = (_posarray select 1);
			_groupid = _this select 2;_groupside = _this select 3;
			_groupstart = _this select 4;_groupende = _this select 5;_maxrad = _this select 6;_unit_skill = _this select 7;
			_groupvar = _this select 8;_marker = _this select 9;_groupzone = _this select 10;_unitsel = _this select 11;
			_groupname = _this select 12;_groupcount = _this select 13;_vehicleval = false;_crewval = false;_startpos = [0,0,0];
			_sj = 0;_randomcount = random 999;_leadertyp = "";_sidearray = [["EAST","WEST","RESISTANCE","CIVILIAN"],["E","W","R","C"]];
			_newgroup = group player;_rankarray = ["private","corporal","sergeant","lieutenant","captain","major","colonel"];
			_startid = 0;_homezone = position (call compile _groupzone);_run = 1;_go = 1;_vehiclepara = [];_groupvehicle = objNull;
			_Temp_Unit_Pool = [];_mp = [];_TempList = [];_EventList = [];_TempUnits = [];_ma = [];_countmax = 1;_countmin = 1;_sx = 0;
			_sy = 0;_unittyp = "";_wpstart = [];_leaderman = objNull;_setFleeing = 0;_setrank = "";_soldier = "";
			_eman = objNull;_countu = 0;_countg = 0;_grouppara = [];_group = objNull;_res = 1;_harray = [];_WeapList = 0;_soldierT = "";
			_setSkill = [[0,"aimingAccuracy"],[1,"aimingShake"],[2,"aimingSpeed"],[3,"Endurance"],[4,"spotDistance"],[5,"spotTime"],[6,"courage"],[7,"reloadSpeed"],[8,"commanding"],[9,"general"]];
			
_ma = ((_groupcount select 4) select 0);
if((((getMarkerSize _ma) select 0) == 4) && (!(DAC_InSpawn))) then
{
	//disabled
}
else
{
	DAC_Master_Init = DAC_Master_Init + 1;	
	while {_go > 0} do
	{
		sleep (random 0.2);
		if(((getMarkerSize _ma) select 0) <= 4) then
		{
			_go = 0;DAC_Master_Init = DAC_Master_Init - 1;_run = 0;DAC_InSpawn = false;
		}
		else
		{
			if(!(DAC_InCreate)) then
			{
				DAC_InCreate = true;_go = 0;
			};
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
						if(count _this > 14) then
						{
							_vehiclepara = _this select 14;_vehicleval = true;_groupvehicle = _vehiclepara select 0;
							_crewval = true;_Temp_Unit_Pool = _this select 15;_harray = _vehiclepara select 3;
						};
						_TempList = [((getMarkerPos ((_groupcount select 4) select 2)) select 0),0] call DAC_fConfigUnits;
						_unit_skill = [((getMarkerPos ((_groupcount select 4) select 2)) select 1)] call DAC_fConfigBehav;
						if(_groupende > 0) then
						{
							if(!(_vehicleval)) then
							{
								_EventList = ((([_groupende] call DAC_fConfigEvents) select 0) select 0);
							}
							else
							{
								_EventList = ((([_groupende] call DAC_fConfigEvents) select 5) select 0);
							};
						};
						_TempUnits = (_TempList select 0);
						if(!(DAC_InSpawn)) then
						{
							_run = 2;
						}
						else
						{
							if(((getMarkerSize _ma) select 0) <= 4) then
							{
								_run = 0;DAC_InCreate = false;DAC_InSpawn = false;DAC_Master_Init = DAC_Master_Init - 1;
							}
							else
							{
								_countmax = _groupcount select 0;_countmin = _groupcount select 1;_sx = _groupcount select 2;_sy = _groupcount select 3;
								if(_countmax == 0) then {_unitcount = _countmin} else {_unitcount = _countmin + random (_countmax - _countmin)};_run = 2;
							};
						};
					};
			case 2:	{
						//-----------------------------
						//#startcreate
						//-----------------------------
						if((count _TempUnits < 3) && (count _this < 15)) then
						{
							hintc format["Attention, in an Unit Config for Infantry,\nnot all required entries exist.\n\nAt least 3 entries must be\n contained. The first entry should\nbe always a pilot,\nthe second entry should be\nalways a driver, the third entry\nshould be always a group leader.\nFrom the fourth entry\nall Units can be taken."];
							DAC_Basic_Value = 4;publicvariable "DAC_Basic_Value";_run = 0;
						}
						else
						{
							if((count _this > 14) && (count _Temp_Unit_Pool < 3)) then
							{
								hintc format["Attention,\nin an Unit Config for Infantry,\nno entry exists."];
								DAC_Basic_Value = 4;publicvariable "DAC_Basic_Value";_run = 0;
							}
							else
							{
								if(DAC_StartDummy in DAC_Init_Group) then {DAC_Init_Group = DAC_Init_Group - [DAC_StartDummy]};
								DAC_Init_Group set [count DAC_Init_Group,_randomcount];DAC_Init_Values set [0,(DAC_Init_Values select 0) + 1];
								DAC_Init_Unit set [3,(DAC_Init_Unit select 3) + 1];
								if(_vehicleval) then {DAC_Init_Unit set [3,(DAC_Init_Unit select 3) + 1]} else {DAC_Init_Unit set [0,(DAC_Init_Unit select 0) + 1]};
								if(_groupside < 3) then
								{
									if(_unitcount == 1) then
									{
										_leadertyp = _TempUnits select (3 + random ((count _TempUnits) - 4));
									}
									else
									{
										_leadertyp = _TempUnits select 2;
									};
								}
								else
								{
									_leadertyp = _TempUnits select (random ((count _TempUnits) - 1));
								};
								_unittyp = _TempUnits;_run = 3;
							};
						};
					};
			case 3:	{
						//-----------------------------
						//#dynamicstart
						//-----------------------------
						_run = 4;
						if(!(DAC_InSpawn)) then
						{
							if(_vehicleval) then
							{
								_startpos = [(getPosATL _groupvehicle select 0) + 10,(getPosATL _groupvehicle select 0),0];
							}
							else
							{
								_wpstart  = call compile (_wparray select ((count _wparray) - 1));
								_startpos = [(_wpstart select 0),(_wpstart select 1),0];
							};
						}
						else
						{
							_startpos = getPosATL DAC_SpawnDummy;
						};
						if((count (call compile format["DAC_GroupPool%1",((_sidearray select 1) select _groupside)])) == 0) then
						{
							_newgroup = call compile format["createGroup %1",((_sidearray select 0) select _groupside)];
						}
						else
						{
							_newgroup = ((call compile format["DAC_GroupPool%1",((_sidearray select 1) select _groupside)]) select 0);
							call compile format["DAC_GroupPool%1 = DAC_GroupPool%1 - [_newgroup]",((_sidearray select 1) select _groupside)];
						};
						_newgroup setVariable ["DAC_Excluded", False];
					};
			case 4:	{
						//-----------------------------
						//#creategroup
						//-----------------------------						
						if(((getMarkerSize _ma) select 0) <= 4) then
						{
							_run = 10;
						}
						else
						{
							if(_unitcount < 0.5) then
							{
								_run = 8;
							}
							else
							{
								_setFleeing = ((_unit_skill select 5) select 0);_setrank = _rankarray select (random ((count _rankarray) - 1));
								_soldier = _unittyp select (3 + random ((count _unittyp) - 4));_unitcount = _unitcount - 1;
								if(_sj == 0) then {_run = 5} else {_run = 6};
							};
						};
					};
			case 5:	{
						//-----------------------------
						//#createunit0
						//-----------------------------
						if((typeName _leadertyp) == "ARRAY") then {_soldierT = (_leadertyp select 0);_WeapList = (_leadertyp select 1)} else {_soldierT = _leadertyp};
						_leaderman = _newgroup createUnit [_soldierT,_startpos,[], 0, "NONE"];[_leaderman] join _newgroup;
						_leaderman allowFleeing _setFleeing;_leaderman setRank _setrank;
						if(count (_unit_skill select 0) > 2) then
						{
							{_leaderman setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
						}
						else
						{
							_setSkill = ((_unit_skill select 0) select 0) + random (((_unit_skill select 0) select 1) - ((_unit_skill select 0) select 0));
							_leaderman setSkill _setskill;
						};
						if(_WeapList > 0) then {[_leaderman,format["%1",_WeapList]] spawn DAC_Weapons;_WeapList = 0};
						DAC_Init_Values set [1,(DAC_Init_Values select 1) + 1];
						if(((DAC_Com_Values select 1) == 2) && (!(DAC_InSpawn)) && ((getdir DAC_StartDummy) < 170)) then
						{
							DAC_InitText = (DAC_InitText + "|");
							_countu = DAC_Init_Values select 1;_countg = DAC_Init_Values select 0;
							if(DAC_Basic_Value != 10) then {hintSilent parseText (DAC_InitText + format["%1(%2)",_countu,_countg])};
						};
						if(DAC_InSpawn) then
						{
							_run = 7;
						}
						else
						{
							_sj = 1;_run = 4;
						};
					};
			case 6:	{
						//-----------------------------
						//#createunit1
						//-----------------------------
						if((typeName _soldier) == "ARRAY") then {_soldierT = (_soldier select 0);_WeapList = (_soldier select 1)} else {_soldierT = _soldier};
						_eman = (group _leaderman) createUnit [_soldierT,_startpos,[], 0, "NONE"];
						_eman allowFleeing _setFleeing;_eman setRank _setrank;
						if(count (_unit_skill select 0) > 2) then
						{
							{_eman setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
						}
						else
						{
							_setSkill = ((_unit_skill select 0) select 0) + random (((_unit_skill select 0) select 1) - ((_unit_skill select 0) select 0));
							_eman setSkill _setskill;
						};
						if(_WeapList > 0) then {[_eman,format["%1",_WeapList]] spawn DAC_Weapons;_WeapList = 0};
						if(DAC_InSpawn) then
						{
							_run = 7;
						}
						else
						{
							DAC_Init_Values set [1,(DAC_Init_Values select 1) + 1];_run = 4;
							if(((DAC_Com_Values select 1) == 2) && (!(DAC_InSpawn)) && ((getdir DAC_StartDummy) < 170)) then
							{
								DAC_InitText = (DAC_InitText + "|");
								_countu = DAC_Init_Values select 1;_countg = DAC_Init_Values select 0;
								if(DAC_Basic_Value != 10) then {hintSilent parseText (DAC_InitText + format["%1(%2)",_countu,_countg])};
							};
						};
					};
			case 7:	{
						//-----------------------------
						//#shortbreak
						//-----------------------------
						if(_sj == 0) then
						{
							_leaderman setspeedmode "full";_leaderman setbehaviour "aware";
							_leaderman setunitpos "auto";_sj = 1;_run = 4;
							sleep 1;
						}
						else
						{
							_eman setspeedmode "full";_eman setbehaviour "aware";_eman setunitpos "auto";_run = 4;
							sleep 1;
						};
					};
			case 8:	{
						//-----------------------------
						//#ausgang
						//-----------------------------
						_grouppara = [_unitcount,_posarray,_groupid,_groupside,_groupstart,_groupende,_maxrad,_unit_skill,_groupvar,_marker,_groupzone,_unitsel,_groupname,_groupcount];
						_group = group _leaderman;_res = 1;_group setbehaviour "AWARE";
						if(_vehicleval) then
						{
							{_x addBackpack "B_Parachute"} foreach units _group;
							{_x assignascargo _groupvehicle;_x moveincargo _groupvehicle;[_x] ordergetin true} foreach units _group;
							{if(!(_x in _groupvehicle)) then {deletevehicle _x}} foreach units _group;
							_res = 6;[[_group,(_groupcount select 4),_groupende],_harray,1,_maxrad,_vehiclepara,_startid] spawn DAC_fMoveToVH;
						}
						else
						{
							[[_group,(_groupcount select 4),_groupende],_posarray,1,_maxrad,_startid] spawn DAC_fMoveToWaypoint;
						};
						[_group,_res,_groupende,_groupside,_grouppara,_ma] spawn DAC_fWaitingForEnd;
						if((count _EventList) > 0) then {call compile (_EventList select 0)};_run = 9;
					};
			case 9:	{
						//-----------------------------
						//#endcreate
						//-----------------------------
						{if(not alive _x) then {[_x] join DAC_GroupNull}}foreach units _group;
						_group selectLeader (units _group select 0);if(!(_group in DAC_All_Groups)) then {DAC_All_Groups set [count DAC_All_Groups,_group]};
						sleep 0.01;
						{_x setTargetAge "30 MIN"} foreach units _group;
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
						DAC_InCreate = false;
						if(DAC_InSpawn) then
						{
							switch (_groupside) do
							{
								case 0:	{DAC_Data_Array set[4, ((DAC_Data_Array select 4) + (count (units _group)))]};
								case 1:	{DAC_Data_Array set[12, ((DAC_Data_Array select 12) + (count (units _group)))]};
								Default {};
							};
						};
						sleep 0.05;
						if(!(_vehicleval)) then {if((DAC_Reduce_Value select 2) > 0) then {[_group,_groupside,1,(_groupcount select 4),_groupende] spawn DAC_fReduceGroup}};
						[_group,_groupside] spawn DAC_fRouteMarker;
						DAC_Init_Group = DAC_Init_Group - [_randomcount];
						if(_vehicleval) then {DAC_Init_Unit set [3,(DAC_Init_Unit select 3) - 1]} else {DAC_Init_Unit set [0,(DAC_Init_Unit select 0) - 1]};
						DAC_Master_Init = DAC_Master_Init - 1;
						if(!(format["%1",_groupvar] == "")) then {call compile format["%1 set [count %1,_group]",_groupvar]};
						if((((getMarkerSize _ma) select 0) == 6) && (!(DAC_InSpawn)) && ((DAC_Com_Values select 0) > 0) && ((getdir DAC_StartDummy) > 170)) then {player groupchat format["%1 was activated",_group]};
						if(((getMarkerSize _ma) select 0) <= 4) then
						{
							_run = 10;
						}
						else
						{
							if(_group in DAC_Marker_Array) then { DAC_Marker_Array = DAC_Marker_Array - [_group]};
							DAC_InSpawn = false;_run = 0;
						};
					};
			case 10:{
						//-----------------------------
						//#deleterest
						//-----------------------------
						{deletevehicle _x}foreach [_leaderman,_eman];
						if(count units _newgroup > 0) then
						{
							{deletevehicle _x} foreach units _newgroup;
							call compile format["DAC_GroupPool%1 set [count DAC_GroupPool%1,_newgroup]",((_sidearray select 1) select _groupside)];
						};
						sleep 0.3;
						if(count units _group > 0) then
						{
							{deletevehicle _x} foreach units _group;
							call compile format["DAC_GroupPool%1 set [count DAC_GroupPool%1,_group]",((_sidearray select 1) select _groupside)];
						};
						DAC_InCreate = false;DAC_InSpawn = false;DAC_Master_Init = DAC_Master_Init - 1;_run = 0;
					};
			Default{};
		};
	};
};
