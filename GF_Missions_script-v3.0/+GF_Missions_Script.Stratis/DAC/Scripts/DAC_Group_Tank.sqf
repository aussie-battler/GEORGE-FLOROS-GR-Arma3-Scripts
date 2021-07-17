//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Group_Tank        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_unitcount","_vehcount","_wparray","_groupid","_groupside","_groupstart","_groupende","_maxrad","_unit_skill",
			"_groupvar","_marker","_groupzone","_unitsel","_groupname","_groupcount","_vehicleval","_crewval","_startpos",
			"_sj","_randomcount","_sidearray","_sidearray","_newgroup","_rankarray","_startid","_homezone","_crewtyp","_vehicle",
			"_unittyp","_crewcount","_ldriver","_lgunner","_lcommander","_lcargo","_vehiclepara","_groupvehicle","_mp","_WeapList",
			"_TempList","_EventList1","_TempUnitsA","_TempUnitsB","_ma","_countmax","_countmin","_la","_lb","_unittyp","_vehc","_numarray",
			"_wpstart","_setSkill","_setFleeing","_setrank","_countu","_countg","_grouppara","_group","_res","_run","_go","_delval2","_posarray",
			"_delval0","_delval1","_waitpos","_EventList2","_extraUnit","_extraCount","_lsoldier","_lgonner","_lganner","_tcfg","_tc","_crewA","_soldierT"
		];
		
			_vehcount = _this select 0;_posarray = _this select 1;_wparray = (_posarray select 0);_numarray = (_posarray select 1);
			_groupid = _this select 2;_groupside = _this select 3;
			_groupstart = _this select 4;_groupende = _this select 5;_maxrad = _this select 6;_unit_skill = _this select 7;
			_groupvar = _this select 8;_marker = _this select 9;_groupzone = _this select 10;_unitsel = _this select 11;_WeapList = 0;
			_groupname = _this select 12;_groupcount = _this select 13;_vehicleval = false;_crewval = true;_startpos = [0,0,0];
			_sj = 0;_randomcount = random 999;_sidearray = [["EAST","WEST","RESISTANCE","CIVILIAN"],["E","W","R","C"]];_lsoldier = objNull;
			_newgroup = group player;_rankarray = ["private","corporal","sergeant","lieutenant","captain","major","colonel"];
			_startid = 0;_homezone = position (call compile _groupzone);_run = 1;_go = 1;_crewtyp = "";_unittyp = "";
			_crewcount = 0;_ldriver = objNull;_lgunner = objNull;_lcommander = objNull;_lgonner = objNull;_lganner = objNull;_lcargo = objNull;_vehiclepara = [];
			_mp = [];_TempList = [];_EventList1 = [];_TempUnits = [];_ma = [];_countmax = 1;_countmin = 1;_la = "";_lb = objNull;_groupvehicle = objNull;
			_unittyp = "";_wpstart = [];_setFleeing = 0;_setrank = "";_countu = 0;_countg = 0;_grouppara = [];
			_unitcount = 0;_group = objNull;_res = 1;_vehicle = "";_vehc = objNull;_waitpos = [0,0,0];_extraUnit = [];_tcfg = [];
			_delval0 = ((DAC_Delete_Value select 1) select 0);_delval1 = ((DAC_Delete_Value select 1) select 1);_EventList2 = [];
			_delval2 = (DAC_Delete_Value select 2);_extraCount = 0;_tc = 0;_crewA = [];_soldierT = "";
			_setSkill = [[0,"aimingAccuracy"],[1,"aimingShake"],[2,"aimingSpeed"],[3,"Endurance"],[4,"spotDistance"],[5,"spotTime"],[6,"courage"],[7,"reloadSpeed"],[8,"commanding"],[9,"general"]];
			if((count _unit_skill > 0) && (count _unit_skill < 3)) then 
			{
				_extraUnit = _unit_skill;
			}
			else
			{
				if(count _this == 15) then {_extraUnit = (_this select 14)};
			};

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
							_EventList1 = ((([_groupende] call DAC_fConfigEvents) select 2) select 0);
							_EventList2 = ((([_groupende] call DAC_fConfigEvents) select 6) select 1);
						};
						_TempUnitsA = (_TempList select 0);_TempUnitsB = (_TempList select 2);
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
								DAC_Init_Unit set [2,(DAC_Init_Unit select 2) + 1];_unitcount = _vehcount / 3;
								_crewtyp = _TempUnitsA select 0;_unittyp = _TempUnitsB;
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
									call compile format["DAC_GroupPool%1 set[0,0]",((_sidearray select 1) select _groupside)];
									call compile format["DAC_GroupPool%1 = DAC_GroupPool%1 - [0]",((_sidearray select 1) select _groupside)];
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
								if(count _extraUnit > 0) then 
								{
									_extraCount = ((_extraUnit select 0) + random (_extraUnit select 1));
									while{_extraCount > 0} do
									{
										_crewtyp = _TempUnitsA select (3 + random ((count _TempUnitsA) - 4));
										if((typeName _crewtyp) == "ARRAY") then {_soldierT = (_crewtyp select 0);_WeapList = (_crewtyp select 1)} else {_soldierT = _crewtyp};
										_lsoldier = (group _ldriver) createUnit [_soldierT,[(_startpos select 0) - 10,(_startpos select 1)-10,0],[], 0, "NONE"];
										_setrank = _rankarray select (random ((count _rankarray) - 1));
										_lsoldier allowFleeing _setFleeing;_lsoldier setRank _setrank;
										if(count (_unit_skill select 0) > 2) then
										{
											{_lsoldier setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
										}
										else
										{
											_setSkill = ((_unit_skill select 0) select 0) + random (((_unit_skill select 0) select 1) - ((_unit_skill select 0) select 0));
											_lsoldier setskill _setSkill;
										};
										if(_WeapList > 0) then {[_lsoldier,format["%1",_WeapList]] spawn DAC_Weapons;_WeapList = 0};
										DAC_Init_Values set [1,(DAC_Init_Values select 1) + 1];
										_extraCount = _extraCount - 1;
										if(((DAC_Com_Values select 1) == 2) && (!(DAC_InSpawn)) && ((getdir DAC_StartDummy) < 170)) then
										{
											DAC_InitText = (DAC_InitText + "|");
											_countu = DAC_Init_Values select 1;_countg = DAC_Init_Values select 0;
											if(DAC_Basic_Value != 10) then {hintSilent parseText (DAC_InitText + format["%1(%2)",_countu,_countg])};
										};
									};
								};
								_run = 6;
							}
							else
							{
								_unitcount = _unitcount - 1;_crewcount = 3;_setFleeing = ((_unit_skill select 5) select 0);_crewA = [];
								_setrank = _rankarray select (random ((count _rankarray) - 1));_vehicle = "";
								if(count _unittyp > 1) then {_vehicle = _unittyp select (random ((count _unittyp) - 1))} else {_vehicle = _unittyp select 0};
								_vehc = _vehicle createvehicle _startpos;[_vehc,_delval0,_delval1,2,_ma,_newgroup,_delval2,_groupside] spawn DAC_fDeleteUnit;
								DAC_VehicleInUse set [count DAC_VehicleInUse,_vehc];
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
								_tcfg = configFile >> "CfgVehicles" >> typeof _vehc >> "turrets";_tc = count _tcfg;
								if((typeName _crewtyp) == "ARRAY") then {_soldierT = (_crewtyp select 0);_WeapList = (_crewtyp select 1)} else {_soldierT = _crewtyp};
								_ldriver = _newgroup createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];[_ldriver] join _newgroup;
								_lgunner = (group _ldriver) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
								_lcommander = (group _ldriver) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
								_crewA = _crewA + [_ldriver,_lgunner,_lcommander];
								if(count (_unit_skill select 0) > 2) then
								{
									if(_tc > 1) then
									{
										_lgonner = (group _ldriver) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
										{_lgonner setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
										_crewA = _crewA + [_lgonner];
									};
									{_ldriver setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
									{_lgunner setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
									{_lcommander setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
								}
								else
								{
									_setSkill = ((_unit_skill select 0) select 0) + random (((_unit_skill select 0) select 1) - ((_unit_skill select 0) select 0));
									if(_tc > 1) then
									{
										_lgonner = (group _ldriver) createUnit [_soldierT,[(_startpos select 0)-5,(_startpos select 1),0],[], 0, "NONE"];
										_crewA = _crewA + [_lgonner];
									};
								};
								{_x allowFleeing _setFleeing;_x setRank _setrank}foreach _crewA;
								if(_WeapList > 0) then {{[_x,format["%1",_WeapList]] execVM "DAC\Scripts\DAC_Change_Weapons.sqf"}foreach _crewA;_WeapList = 0};
								DAC_Init_Values set [1,(DAC_Init_Values select 1) + 3];_run = 4;
								if(((DAC_Com_Values select 1) == 2) && (!(DAC_InSpawn)) && ((getdir DAC_StartDummy) < 170)) then
								{
									DAC_InitText = (DAC_InitText + "|");
									_countu = DAC_Init_Values select 1;_countg = DAC_Init_Values select 0;
									if(DAC_Basic_Value != 10) then {hintSilent parseText (DAC_InitText + format["%1(%2)",_countu,_countg])};
								};
							};
						};
					};
			case 4:	{
						//-----------------------------
						//#moveinvehicle
						//-----------------------------
						_lcommander assignascommander _vehc;_lcommander moveincommander _vehc;_lgunner assignasgunner _vehc;
						_lgunner moveingunner _vehc;_ldriver assignasdriver _vehc;_ldriver moveindriver _vehc;
						if(_tc > 1) then {_lgonner assignAsTurret [_vehc, [2]];_lgonner MoveInTurret [_vehc,[2]]};
						sleep 0.01;
						{if(!(_x in _vehc)) then {DAC_Init_Values set [1,(DAC_Init_Values select 1) - 1];deletevehicle _x}}	foreach _crewA;
						if((count (crew _vehc)) == 0) then
						{
							deletevehicle _vehc;_run = 6;
						}
						else
						{
							if((count _EventList2) > 0) then {call compile (_EventList2 select 0)};
							if(DAC_InSpawn) then
							{
								_run = 5;
							}
							else
							{
								_run = 3;
							};
						};
					};
			case 5:	{
						//-----------------------------
						//#shortbreak
						//-----------------------------
						if(!(_vehc iskindof "Ship")) then
						{
							_go = 1;
							_waitpos = [(position DAC_SpawnDummy Select 0),(position DAC_SpawnDummy Select 1) + 50,0];
							if(((getMarkerSize _ma) select 0) <= 4) then
							{
								_run = 7;
							}
							else
							{
								(driver _vehc) move _waitpos;
							};
						};
						sleep 5;
						_run = 3;
					};
			case 6:	{
						//-----------------------------
						//#groupready
						//-----------------------------
						_grouppara = [_vehcount,_posarray,_groupid,_groupside,_groupstart,_groupende,_maxrad,_unit_skill,_groupvar,_marker,_groupzone,_unitsel,_groupname,_groupcount,_extraUnit];
						_group = _newgroup;_group setbehaviour "AWARE";
						if((count (units _group)) == 0) then
						{
							DAC_InCreate = false;
						}
						else
						{
							[[_group,(_groupcount select 4),_groupende],_posarray,3,_maxrad,_startid] spawn DAC_fMoveWithTank;
							[_group,3,_groupende,_groupside,_grouppara,_ma] spawn DAC_fWaitingForEnd;
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
							if((DAC_Reduce_Value select 2) > 0) then {[_group,_groupside,3,(_groupcount select 4),0] spawn DAC_fReduceGroup};
							[_group,_groupside] spawn DAC_fRouteMarker;
						};
						DAC_Init_Group = DAC_Init_Group - [_randomcount];DAC_Init_Unit set [2,(DAC_Init_Unit select 2) - 1];DAC_Master_Init = DAC_Master_Init - 1;
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
						deletevehicle _vehc;
						sleep 0.2;
						{deletevehicle _x}foreach _crewA;
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