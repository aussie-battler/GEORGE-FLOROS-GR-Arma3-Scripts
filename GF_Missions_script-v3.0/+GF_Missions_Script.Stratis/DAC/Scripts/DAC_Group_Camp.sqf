//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Group_Camp        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_unitcount","_vehcount","_wparray","_groupid","_groupside","_groupstart","_groupende","_maxwps",
			"_heloarray","_unit_skill","_groupvar","_marker","_groupzone","_unitsel","_TempUnitsB","_DAC_Z_Set",
			"_delval0","_delval1","_camparray","_cs1","_cs2","_cs5","_vehcargo","_sj","_m","_mp","_TempList","_vA",
			"_EventList","_TempUnitsA","_randomcount","_newgroup","_ammoarray","_wallArray","_homezone","_isM",
			"_objarray","_ma","_campScr","_unittyp","_leadertyp","_spawnpro","_spawntyp","_spawncount","_wpstart",
			"_flag","_wset","_setDG","_camp","_build","_fire","_startpos","_we","_ab","_ammoarray","_wd","_mf","_go",
			"_gc","_allobj","_campSet","_setSkill","_setFleeing","_setrank","_soldier","_leaderman","_eman","_run","_WeapList",
			"_solarray","_tempST","_staarray","_group","_DAC_MColor","_sidearray","_rankarray","_grouppara","_wside","_delval2","_soldierT"
		];

			_unitcount = _this select 0;_vehcount = _this select 1;_wparray = _this select 2;_groupid = _this select 3;
			_groupside = _this select 4;_groupstart = _this select 5;_groupende = _this select 6;_maxwps = _this select 7;
			_heloarray = _this select 8;_unit_skill = _this select 9;_groupvar = _this select 10;_marker = _this select 11;
			_groupzone = _this select 12;_unitsel = _this select 13;_TempUnitsB	= _this select 14;_DAC_Z_Set = _this select 15;
			_delval0 = ((DAC_Delete_Value select 1) select 0);_delval1 = ((DAC_Delete_Value select 1) select 1);_camparray = [];_cs1 = 0;_cs2 = 0;_cs5 = 0;
			_vehcargo = 0;_sj = 0;_m = "";_mp = [];_TempList = [];_EventList = [];_TempUnitsA = [];_randomcount = random 9999;_WeapList = 0;
			_newgroup = group player;_ammoarray = [];_wallArray = [];_homezone = position (call compile _groupzone);
			_isM = [];_objarray = [];_campScr = [];_unittyp = [];_leadertyp = "";_spawnpro = 0;_spawntyp = 0;_soldierT = "";
			_spawncount = 0;_wpstart = [];_flag = "";_wset = [];_setDG = [];_camp = objNull;_build = objNull;_fire = objNull;_startpos = [];
			_we = 0;_ab = "";_ammoarray = [];_wd = 0;_mf = "";_gc = 0;_allobj = [];_campSet = [];_setFleeing = 0;
			_setrank = "";_soldier = "";_leaderman = objNull;_eman = objNull;_solarray = [];_tempST = [];_staarray = [];_group = objNull;
			_rankarray = ["private","corporal","sergeant","lieutenant","captain","major","colonel"];_run = 1;_go = 1;
			_sidearray = [["EAST","WEST","RESISTANCE","CIVILIAN"],["E","W","R","C"]];_wside = 3;_vA = [];_delval2 = (DAC_Delete_Value select 2);
			_setSkill = [[0,"aimingAccuracy"],[1,"aimingShake"],[2,"aimingSpeed"],[3,"Endurance"],[4,"spotDistance"],[5,"spotTime"],[6,"courage"],[7,"reloadSpeed"],[8,"commanding"],[9,"general"]];
			_DAC_MColor = ["ColorRed","ColorBlue","ColorYellow","ColorGreen"];

			_grouppara = 	[
								_unitcount,_vehcount,_wparray,_groupid,_groupside,_groupstart,_groupende,
								_maxwps,_heloarray,_unit_skill,_groupvar,_marker,_groupzone,_unitsel
							];

_ma = (_DAC_Z_Set select 0);
if(((getMarkerSize _ma) select 0) == 4) then
{
	DAC_Init_Camps = DAC_Init_Camps - 1;
}
else
{
	DAC_Master_Init = DAC_Master_Init + 1;
	while {_go > 0} do
	{
		sleep (random 0.2);
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
						_TempList = [((getMarkerPos (_DAC_Z_Set select 2)) select 0),0] call DAC_fConfigUnits;
						_unit_skill = [((getMarkerPos (_DAC_Z_Set select 2)) select 1)] call DAC_fConfigBehav;
						if(_groupende > 0) then {_EventList = ((([_groupende] call DAC_fConfigEvents) select 4) select 0)};
						_TempUnitsA = (_TempList select 0);_run = 2;
					};
			case 2:	{
						//-----------------------------
						//#startcreate
						//-----------------------------
						if((count _TempUnitsB > 0) && (!(((_TempUnitsB select 0) select 0) == "NULL"))) then
						{
							if(count _TempUnitsA < 3) then
							{
								hintc format["Attention, in an Unit Config for Infantry,\nnot all required entries exist.\n\nAt least 3 entries must be\n contained. The first entry should\nbe always a pilot,\nthe second entry should be\nalways a driver, the third entry\nshould be always a group leader.\nFrom the fourth entry\nall Units can be taken."];
								DAC_Basic_Value = 4;publicvariable "DAC_Basic_Value";_run = 0;
							}
							else
							{
								if(count _TempUnitsB < 4) then
								{
									hintc format["Attention,\nin an Unit Config for Camps,\nnot all required entries exist."];
									DAC_Basic_Value = 4;publicvariable "DAC_Basic_Value";_run = 0;
								}
								else
								{
									_campScr = (_TempUnitsB select 7);DAC_Init_Group set [count DAC_Init_Group,_randomcount];
									DAC_Init_Values set [0,(DAC_Init_Values select 0) + 1];DAC_Init_Unit set [4,(DAC_Init_Unit select 4) + 1];
									if(DAC_StartDummy in DAC_Init_Group) then {DAC_Init_Group = DAC_Init_Group - [DAC_StartDummy]};
									_unittyp = _TempUnitsA;_leadertyp = _TempUnitsA select 2;_spawnpro = _heloarray select 3;
									_spawntyp = _heloarray select 2;_spawncount = _heloarray select 4;
									_wpstart = call compile (_wparray select (random ((count _wparray) - 1)));
									_flag = ((_TempUnitsB select 0) select 0) createvehicle [(_wpstart select 0),(_wpstart select 1),0];
									_wset = (_TempUnitsB select 1);_setDG = ((_TempUnitsB select 0) select 4);
									_camp = (((_TempUnitsB select 0) select 2) select 0) createvehicle [(_wpstart select 0) + (((_TempUnitsB select 0) select 2) select 1),(_wpstart select 1)+ (((_TempUnitsB select 0) select 2) select 2),0];
									_build = (((_TempUnitsB select 0) select 3) select 0) createvehiclelocal [(_wpstart select 0) + (((_TempUnitsB select 0) select 3) select 1),(_wpstart select 1)+ (((_TempUnitsB select 0) select 3) select 2),0];
									_fire = (((_TempUnitsB select 0) select 1) select 0) createvehicle [(_wpstart select 0) + (((_TempUnitsB select 0) select 1) select 1),(_wpstart select 1) + (((_TempUnitsB select 0) select 1) select 2),0];
									_fire inflame true;_startpos = [(getPosATL _flag select 0),(getPosATL _flag select 1)+20,0];_camp setdir (((_TempUnitsB select 0) select 2) select 3);
									_build setdir (((_TempUnitsB select 0) select 3) select 3);_we = 0;
									if((count (_TempUnitsB select 0)) > 5) then {_flag setFlagTexture ((_TempUnitsB select 0) select 5)};
									while {_we < count _wset} do
									{
										_ab = ((_wset select _we) select 0) createvehicle [(_wpstart select 0) + ((_wset select _we) select 1),(_wpstart select 1) + ((_wset select _we) select 2),0];
										_ab setdir ((_wset select _we) select 3);_ammoarray set [count _ammoarray,_ab];
										_ab setpos [(_wpstart select 0) + ((_wset select _we) select 1),(_wpstart select 1) + ((_wset select _we) select 2),0];
										_wd = _wd - 5;_we = _we + 1;
									};
									if(DAC_Marker > 0) then
									{
										if((DAC_Marker_Val select 13) > 0) then
										{
											_m = format["m%1",_flag];_mf = createmarkerlocal [_m, position _flag];_mf setMarkerTypelocal "mil_flag";
											_mf setMarkerSizelocal [0.8,0.8];_mf setMarkerColorlocal (_DAC_MColor select _groupside);_isM set [count _isM,_mf];
										};
									};
									if((count (call compile format["DAC_GroupPool%1",((_sidearray select 1) select _groupside)])) == 0) then
									{
										_newgroup = call compile format["createGroup %1",((_sidearray select 0) select _groupside)];
									}
									else
									{
										_newgroup = ((call compile format["DAC_GroupPool%1",((_sidearray select 1) select _groupside)]) select 0);
										if(format["%1",_newgroup] == "<NULL-group>") then
										{
											_newgroup = call compile format["createGroup %1",((_sidearray select 0) select _groupside)];
										};
										call compile format["DAC_GroupPool%1 = DAC_GroupPool%1 - [_newgroup]",((_sidearray select 1) select _groupside)];
									};
									_newgroup setVariable ["DAC_Excluded", False];
									{_x setVectorUp [0,0,0.2]} foreach _ammoarray + [_camp,_build];
									_startpos = [(_wpstart select 0) - 25,(_wpstart select 1),0];
									if((count (_campScr select 0)) > 0) then {{call compile ((_campScr select 0) select 0)} foreach [_flag,_camp,_build,_fire]};
									if((count (_campScr select 1)) > 0) then {{call compile ((_campScr select 1) select 0)} foreach _ammoarray};_run = 3;
								};
							};
						}
						else
						{
							if(count _TempUnitsB > 0) then
							{
								_run = 11;
							}
							else
							{
								player groupchat "Error DAC_Group_Camp: No valid Camp Config";_run = 0;
							};
						};
					};
			case 3:	{
						//-----------------------------
						//#CreateUserObj
						//-----------------------------
						if((count (_TempUnitsB select 4)) == 0) then
						{
							_run = 4;
						}
						else
						{
							_wset = (_TempUnitsB select 4);_we = 0;_run = 4;
							while {_we < count _wset} do
							{
								if(((_wset select _we) select 0) == "Logic") then
								{
									_ab = ((_wset select _we) select 0) createvehiclelocal [0,0,0];
								}
								else
								{
									_ab = ((_wset select _we) select 0) createvehicle [0,0,0];
								};
								_objarray set [count _objarray,_ab];
								_ab setdir ((_wset select _we) select 3);
								_ab setpos [(_wpstart select 0) + ((_wset select _we) select 1),(_wpstart select 1) + ((_wset select _we) select 2),0];
								_we = _we + 1;
							};
							if((count (_campScr select 4)) > 0) then {{call compile ((_campScr select 4) select 0)} foreach _objarray};
						};
					};
			case 4:	{
						//-----------------------------
						//#CreateStatic
						//-----------------------------
						if((count (_TempUnitsB select 2)) == 0) then
						{
							_run = 5;
						}
						else
						{
							_wset = (_TempUnitsB select 2);_we = 0;_tempST = [];_staarray = [];_run = 5;
							while {_we < count _wset} do
							{
								_ab = ((_wset select _we) select 0) createvehicle [(_wpstart select 0) + ((_wset select _we) select 1),(_wpstart select 1) + ((_wset select _we) select 2),0];
								_ab setdir ((_wset select _we) select 3);_objarray set [count _objarray,_ab];
								_tempST = _tempST + [_ab,((_wset select _we) select 4)];_staarray set [count _staarray,_ab];
								_ab setpos [(_wpstart select 0) + ((_wset select _we) select 1),(_wpstart select 1) + ((_wset select _we) select 2),0];
								_we = _we + 1;
							};
							if((count (_campScr select 2)) > 0) then {{call compile ((_campScr select 2) select 0)} foreach _staarray};
						};
					};
			case 5:	{
						//-----------------------------
						//#createVEG
						//-----------------------------
						{if((_x iskindof "Air") || (_x iskindof "Car") || (_x iskindof "Tank")) then {DAC_VehicleInUse set [count DAC_VehicleInUse,_x]}} foreach _objarray;
						
						DAC_Init_Camps = DAC_Init_Camps - 1;_run = 6;
					};
			case 6:	{
						//-----------------------------
						//#creategroup
						//-----------------------------
						if(_unitcount < 0.5) then
						{
							_run = 7;
						}
						else
						{
							_unitcount = _unitcount - 1;_setFleeing = ((_unit_skill select 5) select 0);
							_setrank = _rankarray select (random ((count _rankarray) - 1));_soldier = _unittyp select (3 + random ((count _unittyp) - 4));
							if(_sj == 0) then
							{
								if((typeName _leadertyp) == "ARRAY") then {_soldierT = (_leadertyp select 0);_WeapList = (_leadertyp select 1)} else {_soldierT = _leadertyp};
								_leaderman = _newgroup createUnit [_soldierT,_startpos,[], 0, "NONE"];[_leaderman] join _newgroup;
								_leaderman allowFleeing _setFleeing;;_leaderman setRank _setrank;
								if(count (_unit_skill select 0) > 2) then
								{
									{_leaderman setskill [(_x select 1),(((_unit_skill select 0) select (_x select 0)) select 0) + random ((((_unit_skill select 0) select (_x select 0)) select 1) - (((_unit_skill select 0) select (_x select 0)) select 0))]} foreach _setSkill;
								}
								else
								{
									_setSkill = ((_unit_skill select 0) select 0) + random (((_unit_skill select 0) select 1) - ((_unit_skill select 0) select 0));
									_leaderman setSkill _setskill;
								};
								_leaderman setTargetAge "UNKNOWN";
								if(_WeapList > 0) then {[_leaderman,format["%1",_WeapList]] spawn DAC_Weapons;_WeapList = 0};
								DAC_Init_Values set [1,(DAC_Init_Values select 1) + 1];_sj = 1;_run = 6;
								if(((DAC_Com_Values select 1) == 2) && (!(DAC_InSpawn)) && ((getdir DAC_StartDummy) < 170)) then
								{
									DAC_InitText = (DAC_InitText + "|");
									_countu = DAC_Init_Values select 1;_countg = DAC_Init_Values select 0;
									if(DAC_Basic_Value != 10) then {hintSilent parseText (DAC_InitText + format["%1(%2)",_countu,_countg])};
								};
							}
							else
							{
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
								_eman setTargetAge "UNKNOWN";
								DAC_Init_Values set [1,(DAC_Init_Values select 1) + 1];_run = 6;
								if(((DAC_Com_Values select 1) == 2) && (!(DAC_InSpawn)) && ((getdir DAC_StartDummy) < 170)) then
								{
									DAC_InitText = (DAC_InitText + "|");
									_countu = DAC_Init_Values select 1;_countg = DAC_Init_Values select 0;
									if(DAC_Basic_Value != 10) then {hintSilent parseText (DAC_InitText + format["%1(%2)",_countu,_countg])};
								};
							};
						};
					};
			case 7:	{
						//-----------------------------
						//#createDefense
						//-----------------------------
						if((count (_TempUnitsB select 3)) == 0) then
						{
							_run = 8;
						}
						else
						{
							_wset = (_TempUnitsB select 3);_we = 0;_solarray = [];_run = 8;
							while {_we < count _wset} do
							{
								_eman = (group _leaderman) createUnit [(_wset select _we),_startpos,[], 0, "NONE"];
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
								_eman setTargetAge "UNKNOWN";
								_solarray set [count _solarray,_eman];_we = _we + 1;
							};
							if((count (_campScr select 3)) > 0) then {{call compile ((_campScr select 3) select 0)} foreach _solarray};
						};
					};
			case 8:	{
						//-----------------------------
						//#ausgang
						//-----------------------------
						if(count _tempST > 0) then
						{
							_we = 0;
							while {_we < count _tempST} do
							{
								_eman = (group _leaderman) createUnit [(_tempST select (_we + 1)),_startpos,[], 0, "NONE"];
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
								_eman setTargetAge "UNKNOWN";
								_eman assignasgunner (_tempST select _we);_eman moveingunner (_tempST select _we);_we = _we + 2;
							};
						};
						_group = group _leaderman;_group setbehaviour "AWARE";
						sleep 0.01;
						_cs5 = ((_homezone select 0) + (_homezone select 1));
						_cs1 = 0;_cs2 = 0;_run = 9;
						if((count _EventList) > 0) then {call compile (_EventList select 0)};
						if((typeName _GroupVar) == "ARRAY") then
						{
							if(count _groupvar > 0) then
							{
								_sj = 0;
								while {_sj < count _groupvar} do
								{
									_vA set [_sj,((getPosATL (_groupvar select _sj)) select 0)];_sj = _sj + 1;
								};
							};
						};
						switch (_groupside) do
						{
							case 0:	{
										While {_cs1 < count DAC_Spawn_CampsE} do
										{
											_cs3 = DAC_Spawn_CampsE select _cs1;
											if(((((_cs3 select 0) select 0) + ((_cs3 select 0) select 1)) == _cs5)
											&& (format["%1",(_cs3 select 1)] == "<NULL-object>")
											&& (_cs2 == 0)) then
											{
												(DAC_Spawn_CampsE select _cs1) set[1,_camp];(DAC_Spawn_CampsE select _cs1) set[2,_build];
												((DAC_Spawn_CampsE select _cs1) select 5) set[0,_spawncount];((DAC_Spawn_CampsE select _cs1) select 5) set[1,0];_cs2 = 1;
											};
											_cs1 = _cs1 + 1;
										};
										sleep 0.01;
										{DAC_East_Units set [count DAC_East_Units,_x]} foreach units _group;_wside = 0;
										if(_cs2 == 0) then {DAC_Spawn_CampsE set [count DAC_Spawn_CampsE,[_homezone,_camp,_build,_spawnpro,_spawntyp,[_spawncount,0],_vA]]};
									};
							case 1:	{
										While {_cs1 < count DAC_Spawn_CampsW} do
										{
											_cs3 = DAC_Spawn_CampsW select _cs1;
											if(((((_cs3 select 0) select 0) + ((_cs3 select 0) select 1)) == _cs5)
											&& (format["%1",(_cs3 select 1)] == "<NULL-object>")
											&& (_cs2 == 0)) then
											{
												(DAC_Spawn_CampsW select _cs1) set[1,_camp];(DAC_Spawn_CampsW select _cs1) set[2,_build];
												((DAC_Spawn_CampsW select _cs1) select 5) set[0,_spawncount];((DAC_Spawn_CampsW select _cs1) select 5) set[1,0];_cs2 = 1;
											};
											_cs1 = _cs1 + 1;
										};
										sleep 0.01;
										{DAC_West_Units set [count DAC_West_Units,_x]} foreach units _group;_wside = 1;
										if(_cs2 == 0) then {DAC_Spawn_CampsW set [count DAC_Spawn_CampsW,[_homezone,_camp,_build,_spawnpro,_spawntyp,[_spawncount,0],_vA]]};
									};
							case 2:	{
										if(DAC_Res_Side == 0) then
										{
											While {_cs1 < count DAC_Spawn_CampsE} do
											{
												_cs3 = DAC_Spawn_CampsE select _cs1;_run = 9;
												if(((((_cs3 select 0) select 0) + ((_cs3 select 0) select 1)) == _cs5)
												&& (format["%1",(_cs3 select 1)] == "<NULL-object>")
												&& (_cs2 == 0)) then
												{
													(DAC_Spawn_CampsE select _cs1) set[1,_camp];(DAC_Spawn_CampsE select _cs1) set[2,_build];
													((DAC_Spawn_CampsE select _cs1) select 5) set[0,_spawncount];((DAC_Spawn_CampsE select _cs1) select 5) set[1,0];_cs2 = 1;
												};
												_cs1 = _cs1 + 1;
											};
											sleep 0.01;
											{DAC_East_Units set [count DAC_East_Units,_x]} foreach units _group;_wside = 0;
											if(_cs2 == 0) then {DAC_Spawn_CampsE set [count DAC_Spawn_CampsE,[_homezone,_camp,_build,_spawnpro,_spawntyp,[_spawncount,0],_vA]]};
										}
										else
										{
											While {_cs1 < count DAC_Spawn_CampsW} do
											{
												_cs3 = DAC_Spawn_CampsW select _cs1;_run = 9;
												if(((((_cs3 select 0) select 0) + ((_cs3 select 0) select 1)) == _cs5)
												&& (format["%1",(_cs3 select 1)] == "<NULL-object>")
												&& (_cs2 == 0)) then
												{
													(DAC_Spawn_CampsW select _cs1) set[1,_camp];(DAC_Spawn_CampsW select _cs1) set[2,_build];
													((DAC_Spawn_CampsW select _cs1) select 5) set[0,_spawncount];((DAC_Spawn_CampsW select _cs1) select 5) set[1,0];_cs2 = 1;
												};
												_cs1 = _cs1 + 1;
											};
											sleep 0.01;
											{DAC_West_Units set [count DAC_West_Units,_x]} foreach units _group;_wside = 1;
											if(_cs2 == 0) then {DAC_Spawn_CampsW set [count DAC_Spawn_CampsW,[_homezone,_camp,_build,_spawnpro,_spawntyp,[_spawncount,0],_vA]]};
										};
									};
							default	{};
						};
					};
			case 9	:{
						//-----------------------------
						//#CampEnd
						//-----------------------------
						sleep 0.01;
						DAC_InCreate = false;
						sleep 0.1;
						if((DAC_Reduce_Value select 2) > 0) then {[_group,_groupside,1,_DAC_Z_Set,_groupende] spawn DAC_fReduceGroup};
						[_group,_groupside] spawn DAC_fRouteMarker;DAC_Init_Group = DAC_Init_Group - [_randomcount];
						if(!(_group in DAC_Camp_Groups)) then {DAC_Camp_Groups set[(count DAC_Camp_Groups), _group]};
						if(!(_group in DAC_All_Groups)) then {DAC_All_Groups set [count DAC_All_Groups,_group]};
						DAC_Init_Unit set [4,(DAC_Init_Unit select 4) - 1];DAC_Master_Init = DAC_Master_Init - 1;
						if((((getMarkerSize _ma) select 0) == 6) && (!(DAC_InSpawn)) && ((DAC_Com_Values select 0) > 0) && ((getdir DAC_StartDummy) > 170)) then {player groupchat format["%1 was activated",_group]};
						DAC_InSpawn = false;
						if(call compile format["z_%1",_groupzone] > 0) then {call compile format["z_%1 = z_%1 - 1",_groupzone]};
						if((typeName _GroupVar) == "STRING") then
						{
							if(!(format["%1",_groupvar] == "")) then {call compile format["%1 set [count %1,_group]",_groupvar]};
						}
						else
						{
							[_wside,_camp]execVM "DAC\Marker\DAC_CampMarker.sqf";
						};
						
						_gc = 0;_allobj = _objarray + [_build,_camp,_flag,_fire];{_x setpos position _x} foreach _allobj;
						_campSet = 	[
										_build,_camp,_flag,_allobj,(_TempUnitsB select 5),(_TempUnitsB select 6),
										_wallArray,_ammoarray,_fire,(_campScr select 5),(_campScr select 6)
									] 	call DAC_fCreateCamp;
									
						sleep 0.1;
						_camparray = [_flag,_camp,_build,_fire,_ammoarray,_isM,_objarray,_setDG,_campSet];
						[[_group,_DAC_Z_Set,_groupende],_wparray,5,_camparray,_HeloArray,_groupside] spawn DAC_fMoveCamp;
						[_group,5,_groupende,_groupside,_grouppara,_ma,_camparray,_isM] spawn DAC_fWaitingForEnd;_run = 0;
					};
			case 11:{
						//-----------------------------
						//#NoCamp
						//-----------------------------
						if(((getMarkerSize _ma) select 0) <= 4) then
						{
							_run = 0;
						}
						else
						{
							[
								_unitcount,_vehcount,_wparray,5,_groupside,_groupstart,_groupende,
								_maxwps,_heloarray,_groupvar,_marker,_homezone,_TempUnitsB,_ma
							]	execVM "DAC\Scripts\DAC_No_Camp.sqf";
							_run = 0;
						};
					};
			Default{};
		};
	};
};