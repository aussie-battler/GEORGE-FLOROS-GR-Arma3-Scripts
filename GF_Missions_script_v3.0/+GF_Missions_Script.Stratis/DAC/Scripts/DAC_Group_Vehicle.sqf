//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Group_Vehicle     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_unitcount","_wparray","_groupid","_groupside","_groupstart","_groupende","_maxrad","_unit_skill",
			"_groupvar","_marker","_groupzone","_unitsel","_groupname","_groupcount","_vehicleval","_crewval","_startpos",
			"_sj","_randomcount","_leadertyp","_sidearray","_sidearray","_newgroup","_rankarray","_startid","_homezone",
			"_vehiclepara","_groupvehicle","_Temp_Unit_Pool","_mp","_TempList","_EventList1","_TempUnitsA","_TempUnitsB","_ma",
			"_countmax","_countmin","_sx","_sy","_unittyp","_wpstart","_setSkill","_setFleeing","_setrank","_soldier","_eman",
			"_leaderman","_countu","_countg","_grouppara","_group","_res","_run","_go","_EventList2","_numarray","_WeapList",
			"_vehicle","_vehc","_waitpos","_delval0","_delval1","_vehtyp","_delval2","_soldierT","_posarray"
		];
		
			_unitcount = _this select 0;_posarray = _this select 1;_wparray = (_posarray select 0);_numarray = (_posarray select 1);
			_groupid = _this select 2;_groupside = _this select 3;
			_groupstart = _this select 4;_groupende = _this select 5;_maxrad = _this select 6;_unit_skill = _this select 7;
			_groupvar = _this select 8;_marker = _this select 9;_groupzone = _this select 10;_unitsel = _this select 11;_WeapList = 0;
			_groupname = _this select 12;_groupcount = _this select 13;_vehicleval = false;_crewval = false;_startpos = [0,0,0];
			_sj = 0;_randomcount = random 999;_leadertyp = "";_sidearray = [["EAST","WEST","RESISTANCE","CIVILIAN"],["E","W","R","C"]];
			_newgroup = group player;_rankarray = ["private","corporal","sergeant","lieutenant","captain","major","colonel"];
			_startid = 0;_homezone = position (call compile _groupzone);_run = 1;_go = 1;_vehiclepara = [];_groupvehicle = objNull;
			_Temp_Unit_Pool = [];_mp = [];_TempList = [];_EventList1 = [];_TempUnitsA = [];_TempUnitsB = [];_ma = [];_countmax = 1;
			_countmin = 1;_sx = 0;_sy = 0;_unittyp = "";_wpstart = [];_leaderman = objNull;_setFleeing = 0;_setrank = "";
			_soldier = "";_eman = objNull;_countu = 0;_countg = 0;_grouppara = [];_group = objNull;_res = 1;_vehtyp = [];_EventList2 = [];
			_vehicle = "";_vehc = objNull;_waitpos = [0,0,0];_delval0 = ((DAC_Delete_Value select 1) select 0);_soldierT = "";
			_delval1 = ((DAC_Delete_Value select 1) select 1);_delval2 = (DAC_Delete_Value select 2);
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
						_TempList = [((getMarkerPos ((_groupcount select 4) select 2)) select 0),0] call DAC_fConfigUnits;
						_unit_skill = [((getMarkerPos ((_groupcount select 4) select 2)) select 1)] call DAC_fConfigBehav;
						if(_groupende > 0) then
						{
							_EventList1 = ((([_groupende] call DAC_fConfigEvents) select 1) select 0);
							_EventList2 = ((([_groupende] call DAC_fConfigEvents) select 6) select 0);
						};
						_TempUnitsA = (_TempList select 0);_TempUnitsB = (_TempList select 1);
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
								_countmax = _groupcount select 0;_countmin = _groupcount select 1;_run = 2;
								if(_countmax == 0) then {_unitcount = _countmin} else {_unitcount = _countmin + random (_countmax - _countmin)};
							};
						};
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
								DAC_Init_Unit set [1,(DAC_Init_Unit select 1) + 1];_unittyp = _TempUnitsA;_leadertyp = _TempUnitsA select 2;_vehtyp = _TempUnitsB;
								if(!(DAC_InSpawn)) then
								{
									_wpstart  = call compile (_wparray select ((count _wparray) - 1));
									_startpos = [(_wpstart select 0),(_wpstart select 1),0];
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
								_run = 3;
							};
						};
					};
			case 3:	{
						//-----------------------------
						//#creategroup
						//-----------------------------
						if(((getMarkerSize _ma) select 0) <= 4) then
						{
							_run = 7;
						}
						else
						{
							if(_unitcount < 0.5) then
							{
								_run = 6;
							}
							else
							{
								_unitcount = _unitcount - 1;_setFleeing = ((_unit_skill select 5) select 0);
								_setrank = _rankarray select (random ((count _rankarray) - 1));_vehicle = "";
								if(_sj != 1) then
								{
									if(count _vehtyp > 1) then {_vehicle = _vehtyp select (random ((count _vehtyp) - 1))} else {_vehicle = _vehtyp select 0};
									_vehc = _vehicle createvehicle _startpos;[_vehc,_delval0,_delval1,2,_ma,group _leaderman,_delval2,_groupside] spawn DAC_fDeleteUnit;
									DAC_VehicleInUse set [count DAC_VehicleInUse,_vehc];
									clearWeaponCargo _vehc;clearMagazineCargo _vehc;
									switch (_groupside) do
									{
										case 0:	{DAC_Data_Array set[6, ((DAC_Data_Array select 6) + 1)]};
										case 1:	{DAC_Data_Array set[14, ((DAC_Data_Array select 14) + 1)]};
										Default {};
									};
									if(DAC_InSpawn) then
									{
										switch (_groupside) do
										{
											case 0:	{DAC_Data_Array set[18, ((DAC_Data_Array select 18) + 1)]};
											case 1:	{DAC_Data_Array set[19, ((DAC_Data_Array select 19) + 1)]};
											Default {};
										};
									};
									if((count _EventList2) > 0) then {call compile (_EventList2 select 0)};
								};
								_soldier = _unittyp select (3 + (random ((count _unittyp) - 4)));
								if(_sj == 0) then {_run = 4} else {_run = 5};
							};
						};
					};
			case 4:	{
						//-----------------------------
						//#createunit0
						//-----------------------------
						if((typeName _leadertyp) == "ARRAY") then {_soldierT = (_leadertyp select 0);_WeapList = (_leadertyp select 1)} else {_soldierT = _leadertyp};
						_leaderman = _newgroup createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];[_leaderman] join _newgroup;
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
						_leaderman assignasdriver _vehc;_leaderman moveindriver _vehc;
						sleep 0.01;
						_vehc = vehicle _leaderman;_sj = 1;_run = 3;
					};
			case 5:	{
						//-----------------------------
						//#createunit1
						//-----------------------------
						if((typeName _soldier) == "ARRAY") then {_soldierT = (_soldier select 0);_WeapList = (_soldier select 1)} else {_soldierT = _soldier};
						_eman = (group _leaderman) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
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
						DAC_Init_Values set [1,(DAC_Init_Values select 1) + 1];
						if(((DAC_Com_Values select 1) == 2) && (!(DAC_InSpawn)) && ((getdir DAC_StartDummy) < 170)) then
						{
							DAC_InitText = (DAC_InitText + "|");
							_countu = DAC_Init_Values select 1;_countg = DAC_Init_Values select 0;
							if(DAC_Basic_Value != 10) then {hintSilent parseText (DAC_InitText + format["%1(%2)",_countu,_countg])};
						};
						if(count crew _vehc == 0) then
						{
							_eman assignasdriver _vehc;_eman moveindriver _vehc;
						}
						else
						{
							if((_vehc emptyPositions "gunner") > 0) then
							{
								_eman assignasgunner _vehc;_eman moveingunner _vehc;
							}
							else
							{
								_eman assignascargo _vehc;_eman moveincargo _vehc;
							};
						};
						sleep 0.01;
						if(_eman in _vehc) then
						{
							_run = 3;
						}
						else
						{
							_unitcount = 0;deletevehicle _eman;
							_run = 3;
						};
					};
			case 6:	{
						//-----------------------------
						//#endcreate
						//-----------------------------
						_grouppara = [_unitcount,_posarray,_groupid,_groupside,_groupstart,_groupende,_maxrad,_unit_skill,_groupvar,_marker,_groupzone,_unitsel,_groupname,_groupcount];
						_group = group _leaderman;_group setbehaviour "AWARE";
						[[_group,(_groupcount select 4),_groupende],_posarray,2,_maxrad,_startid] spawn DAC_fMoveWithVH;
						[_group,2,_groupende,_groupside,_grouppara,_ma] spawn DAC_fWaitingForEnd;
						if((count _EventList1) > 0) then {call compile (_EventList1 select 0)};
						{if(not alive _x) then {[_x] join DAC_GroupNull}}foreach units _group;
						_group selectLeader (units _group select 0);
						if(!(_group in DAC_All_Groups)) then {DAC_All_Groups set [count DAC_All_Groups,_group]};{_x setTargetAge "30 MIN"} foreach units _group;
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
						sleep 0.01;
						DAC_InCreate = false;
						sleep 0.5;
						if((DAC_Reduce_Value select 2) > 0) then {[_group,_groupside,2,(_groupcount select 4),_groupende] spawn DAC_fReduceGroup};
						[_group,_groupside] spawn DAC_fRouteMarker;
						DAC_Init_Group = DAC_Init_Group - [_randomcount];
						DAC_Init_Unit set [1,(DAC_Init_Unit select 1) - 1];DAC_Master_Init = DAC_Master_Init - 1;
						if(!(format["%1",_groupvar] == "")) then {call compile format["%1 set [count %1,_group]",_groupvar]};
						if((((getMarkerSize _ma) select 0) == 6) && (!(DAC_InSpawn)) && ((DAC_Com_Values select 0) > 0) && ((getdir DAC_StartDummy) > 170)) then {player groupchat format["%1 was activated",_group]};
						if(((getMarkerSize _ma) select 0) <= 4) then
						{
							_run = 7;
						}
						else
						{
							if(_group in DAC_Marker_Array) then { DAC_Marker_Array = DAC_Marker_Array - [_group]};
							DAC_InSpawn = false;_run = 0;
						};
					};
			case 7:	{
						//-----------------------------
						//#deleterest
						//-----------------------------
						{deletevehicle _x}foreach [_leaderman,_eman];
						if(count units _newgroup > 0) then
						{
							_sj = 0;_crewtyp = objNull;
							while{_sj < count units _newgroup} do
							{
								_crewtyp = units _newgroup select _sj;
								if(_crewtyp != vehicle _crewtyp) then {deletevehicle vehicle _crewtyp;sleep 0.2};
								deletevehicle _crewtyp;_sj = _sj + 1;
							};
							call compile format["DAC_GroupPool%1 set [count DAC_GroupPool%1,_newgroup]",((_sidearray select 1) select _groupside)];
						};
						sleep 0.5;
						if(count units _group > 0) then
						{
							_sj = 0;_crewtyp = objNull;
							while{_sj < count units _group} do
							{
								_crewtyp = units _group select _sj;
								if(_crewtyp != vehicle _crewtyp) then {deletevehicle vehicle _crewtyp;sleep 0.2};
								deletevehicle _crewtyp;_sj = _sj + 1;
							};
							call compile format["DAC_GroupPool%1 set [count DAC_GroupPool%1,_group]",((_sidearray select 1) select _groupside)];
						};
						DAC_InCreate = false;DAC_InSpawn = false;DAC_Master_Init = DAC_Master_Init - 1;_run = 0;
					};
			Default{};
		};
	};
};