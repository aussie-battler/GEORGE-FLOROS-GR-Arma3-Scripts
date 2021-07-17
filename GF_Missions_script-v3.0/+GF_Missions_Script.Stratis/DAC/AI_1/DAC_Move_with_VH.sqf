//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_with_VH      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_garray","_group","_wparray","_groupid","_maxrad","_zskill","_leader","_target","_leaderveh","_coverval",
			"_timestep","_nextwp","_firstwait","_checktime","_call","_startid","_scriptmod","_patrolon","_cG","_groupveh","_cw",
			"_checkpos","_wait","_rndnr","_wpstart2","_nextpos","_checkpos1","_checkpos2","_waittime","_looktime","_joinbehav","_split",
			"_knowsabout","_speedselect","_combatselect","_behavselect","_formselect","_unitcombat","_isin","_rd","_oldskill","_allZones","_na",
			"_unitbehav","_unitspeed","_unitform","_unitwait","_lastwp","_nextmp","_grouponfire","_vehA","_EventList","_patpos","_wpCheck","_EventDetect",
			"_vehvalue","_vehA","_searcharea","_searchcount","_marker","_DAC_Arrays","_callg","_run","_rdir","_eventid","_posgetout","_posarray","_numarray",
			"_go","_newtarget","_sum","_id","_tempcount","_wx","_wy","_veharray","_cu","_cv","_ca","_nv","_fp","_start","_fp1","_fp2","_VehSet","_jArray","_mz"
		];
		
			_garray = _this select 0;_group = _garray select 0;_posarray = _this select 1;_wparray = (_posarray select 0);_numarray = (_posarray select 1);_marker = _garray select 1;
			_groupid = _this select 2;_maxrad = _this select 3;_startid = _this select 4;_leader = leader _group;_wpCheck = [];_allZones = (_posarray select 2);_jArray = [];
			_target = DAC_StartDummy;_knowsabout = 0;_rndnr = 0;_nv = objNull;_timestep = time + 20;_isin = 0;_rd = 0;_na = "";_split = [];_cw = 0;
			_nextwp = [(position _leader select 0),(position _leader select 1)];_lastwp = _nextwp;_wpstart2 = [0,0];_cG = 0;_mz = (_posarray select 3);
			_start = 0;_firstwait = 0;_newtarget = objNull;_call = [];_id = 0;_callg = [];_waittime = 0;_scriptmod = 0;_looktime = 0;_patpos = position _leader;
			_nextmp = [0,0];_wait = 0;_leaderveh = _leader;_rdir = 0;_run = 1;_go = 0;_wx = 0;_wy = 0;_veharray = [];_EventList = [];_EventDetect = [];_groupveh = [];_VehSet = [];
			_DAC_Arrays = ["DAC_Help_Groups","DAC_Hit_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Cover_Groups","DAC_Call_Groups"];_coverval = 0;
			_sum = 0;_searchcount = 0;_vehA = [];_vehvalue = [];_patrolon = 0;_posgetout = position _leader;_tempcount = 0;_eventid = _garray select 2;
			_cu = 0;_cv = 0;_ca = 0;_fp= 0;_fp1= 0;_fp2= 0;

_group setVariable ["dacData",[0,(position _leader)],false];
			
if(format["%1",driver vehicle _leader] == "<NULL-object>") then
{
	[_garray,_posarray,_groupid,_maxrad,_startid] spawn DAC_fMoveNot;;_run = 0;
}
else
{
	if(count _wparray == 1) then
	{
		[_garray,_posarray,_groupid,_maxrad,_startid] spawn DAC_fMoveNear;_run = 0;
	};
};

_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
_oldskill = ((getMarkerPos (_marker select 2)) select 1);
			
while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					////#waitforstart
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case1",time]};
					waituntil {(getdir DAC_StartDummy) > 170};
					sleep (random 2);
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(_eventid > 0) then
						{
							_EventList = ((([_eventid] call DAC_fConfigEvents) select 1) select 1);
							_EventDetect = ((([_eventid] call DAC_fConfigEvents) select 1) select 6);
						};
						if(count _wparray == 0) then
						{
							_run = 21;
						}
						else
						{
							waituntil{DAC_NewZone == 0};
							sleep (random 1);
							_wpCheck = [[_wparray,_numarray,_allZones,_mz],_groupid] call DAC_fSumWaypoints;
							_sum = (_wpCheck select 1);_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
							_wparray = ((_wpCheck select 0) select 0);
							if(((((_zskill select 7) select 5) select 0) + (((_zskill select 7) select 5) select 1)) == 0) then
							{
								_firstwait = 1;
							}
							else
							{
								_firstwait = ((((_zskill select 7) select 5) select 0) + random (((_zskill select 7) select 5) select 1));
							};
							sleep _firstwait;
							if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
							{
								_run = 0;
							}
							else
							{
								if(((_zskill select 11) select 0) == 0) then {if(!(_group in DAC_No_Support)) then {DAC_No_Support set [count DAC_No_Support,_group]}};
								_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;_unitform = _zskill select 4;
								_unitwait = "((((_zskill select 7) select (_groupid - 1)) select 0) + (random (((_zskill select 7) select (_groupid - 1)) select 1)))";
								{call compile format["if(_group in %1) then {%1 = %1 - [_group]}",_x]}foreach _DAC_Arrays;_coverval = ((_zskill select 5) select 1);
								if(count _this == 5) then
								{
									_run = 2;
								}
								else
								{
									if(_leader == vehicle _leader) then {_patrolon = 1};
									_scriptmod = 1;_vehvalue = _this select 5;
									_run = 4;
								};
							};
						};
					};
				};
		case 2:	{
					//-----------------------------
					//#savevehicle
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case2",time]};
					_vehA = [];_vehvalue = [];_run = 3;
					{
						if((!(_x == vehicle _x)) && (!(vehicle _x in _vehA))) then
						{
							_vehA set [count _vehA,vehicle _x];
							_vehvalue set [count _vehvalue,[vehicle _x,0,0]];
						};
					} 	foreach units _group;
				};
		case 3:	{
					//-----------------------------
					//#RandomStartPos
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case3",time]};
					waituntil{DAC_NewZone == 0};
					_wpCheck = [[_wparray,_numarray,_allZones,_mz],_groupid] call DAC_fSumWaypoints;
					_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
					_wparray = ((_wpCheck select 0) select 0);
					if(_sum != (_wpCheck select 1)) then
					{
						_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
						[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
					};
					if(count _wparray == 1) then
					{
						_nextwp = call compile (_wparray select 0);_run = 4;
					}
					else
					{
						_go = 1;
						while {_go > 0} do
						{
							if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
							{
								_run = 0;_go = 0;
							}
							else
							{
								if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - RandomStartPos",time]};
								_lastwp = _nextwp;_nextmp = call compile (_wparray select (random ((count _wparray) - (1 + _mz))));
								if(((_lastwp select 0) + (_lastwp select 1)) != ((_nextmp select 0) + (_nextmp select 1))) then
								{
									_split = [(position _leader),_nextmp,_leader] call DAC_fSplitWPWay;
									if(count _split > 0) then
									{
										_nextwp = _nextmp;_posgetout = _nextwp;_go = 0;_cw = 0;
										if(_patrolon == 1) then {_run = 12} else {_run = 4};
									};
								};
								sleep 0.01;
							};
						};
					};
				};
		case 4:	{
					//-----------------------------
					////#setbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case4",time]};
					{_x setunitpos "auto"}foreach units _group;_go = 1;
					_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));_joinbehav = _zskill select 12;
					_speedselect = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
					_behavselect = (random ((count _unitbehav) - 1));_formselect = (random ((count _unitform) - 1));
					_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
					_group setspeedmode (_unitspeed select _speedselect);_group setformation (_unitform select _formselect);
					if(_scriptmod == 1) then {_run = 9} else {_run = 5};
				};
		case 5:	{
					//-----------------------------
					//#move
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case5",time]};
					_nextwp = (_split select _cw);
					if(_go == 1) then
					{
						_checktime = time + (120 + random 20);_checkpos = position (vehicle _leader);
						_group setVariable ["dacData",[0,_nextwp],false];
						_group move _nextwp;
					};
					[_group] spawn DAC_fForceSpeed;_go = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - Move - %2",time,(_checktime - time)]};
						sleep (1 + (random 1));
						_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);
							if(_run == 20) then {_run = 21};
							if(_run == 13) then {_target = (_call select 1);_run = 14};
							_go = 0;
						}
						else
						{
							if((_group in DAC_Cover_Groups) && (_go == 1)) then {_go = 0;_run = 18};
							if((time > _checktime) && (_go == 1)) then {_go = 0;_run = 8};
							if((unitready (vehicle _leader)) && (_go == 1)) then
							{
								if(_cw == ((count _split) - 1)) then
								{
									_go = 0;_run = 6;
								}
								else
								{
									_cw = _cw + 1;
									_nextwp = (_split select _cw);
									_group setVariable ["dacData",[0,_nextwp],false];
									_group move _nextwp;
								};
							};
						};
					};					
				};
		case 6:	{
					//-----------------------------
					//#waiting
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case6",time]};
					if((count _EventList) > 0) then {call compile (_EventList select 0)};
					_wait = time + 1;[_leader,1] spawn DAC_fAISpeak;[0,(leader _group)] spawn DAC_fAIRadio;_go = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - Waiting",time]};
						sleep (1 + (random 1));
						_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);
							if(_run == 20) then {_run = 21};
							if(_run == 13) then {_target = (_call select 1);_run = 14};
							_go = 0;
						}
						else
						{
							if((_group in DAC_Cover_Groups) && (_go == 1)) then {_go = 0;_run = 18};
							if(time > _wait) then
							{
								_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
								_go = 0;_run = 10;
							};
						};
					};
				};
		case 7:	{
					//-----------------------------
					//#dynamicagain
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case7",time]};
					sleep 0.01;
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(not alive _leader) then
						{
							_run = 20;
						}
						else
						{
							_go = 1;
							while {_go > 0} do
							{
								if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - DynamicAgain",time]};
								sleep 0.1;
								if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
								{
									_go = 0;_run = 0;
								}
								else
								{
									waituntil{DAC_NewZone == 0};
									_wpCheck = [[_wparray,_numarray,_allZones,_mz],_groupid] call DAC_fSumWaypoints;
									_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
									_wparray = ((_wpCheck select 0) select 0);
									if(_sum != (_wpCheck select 1)) then
									{
										_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
										[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
									};
									_rndnr = (random ((count _wparray) - 1));_wpstart2 = call compile (_wparray select _rndnr);
									if(((_wpstart2 select 0) + (_wpstart2 select 1)) != ((_nextwp select 0) + (_nextwp select 1))) then
									{
										_split = [(position _leader),_wpstart2,_leader] call DAC_fSplitWPWay;
										if(count _split > 0) then
										{
											_nextwp = _wpstart2;_posgetout = _nextwp;_go = 0;_run = 4;_cw = 0;
										};
									};
								};
							};
						};
					};
				};
		case 8:	{
					//-----------------------------
					//#checkwp
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case8",time]};
					if(_oldskill != ((getMarkerPos (_marker select 2)) select 1)) then
					{
						_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;_oldskill = ((getMarkerPos (_marker select 2)) select 1);
						if(((_zskill select 11) select 0) == 0) then {if(!(_group in DAC_No_Support)) then {DAC_No_Support set [count DAC_No_Support,_group]}};
						_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;_unitform = _zskill select 4;_joinbehav = _zskill select 12;
						_unitwait = "((((_zskill select 7) select (_groupid - 1)) select 0) + (random (((_zskill select 7) select (_groupid - 1)) select 1)))";
						_speedselect = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
						_behavselect = (random ((count _unitbehav) - 1));_formselect = (random ((count _unitform) - 1));
						_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
						_group setspeedmode (_unitspeed select _speedselect);_group setformation (_unitform select _formselect);
					};
					waituntil{DAC_NewZone == 0};
					_wpCheck = [[_wparray,_numarray,_allZones,_mz],_groupid] call DAC_fSumWaypoints;
					_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
					_wparray = ((_wpCheck select 0) select 0);
					if(_sum != (_wpCheck select 1)) then
					{
						_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
						[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
						_checkpos = getPosATL (vehicle _leader);
						if(({_x == vehicle _x} count units _group) > 0) then {_run = 12} else {_run = 7};
					}
					else
					{
						_checkpos1 = (position vehicle _leader select 0) + (position vehicle _leader select 1);
						_checkpos2 = (_checkpos select 0) + (_checkpos select 1);
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
						{
							_run = 0;
						}
						else
						{
							if((((_checkpos2 - _checkpos1) < 2) && ((_checkpos2 - _checkpos1) > -2)) && ((speed vehicle _leader) < 3)) then
							{
								if((unitready (vehicle _leader)) && (_go == 1)) then
								{
									_run = 6;
								}
								else
								{
									_run = 7;
								};
							}
							else
							{
								_checktime = time + (120 + random 20);_checkpos = position (vehicle _leader);
								if((({alive _x} count units _group) <= _joinbehav) && (!(_group in DAC_Min_Groups))) then
								{
									if(({_x == vehicle _x} count units _group) > 0) then
									{
										_run = 19;
									}
									else
									{
										[_group] spawn DAC_fCommandUnit;
										if(_run == 8) then {_run = 5;_go = 0};
									};
								}
								else
								{
									if(_leader == (vehicle _leader)) then
									{
										{if(_x != gunner (vehicle _x)) then {unassignvehicle _x;[_x] ordergetin false}} foreach units _group;
										[2,(leader _group)] spawn DAC_fAIRadio;
										sleep 3;
										_run = 12;
									}
									else
									{
										[_group] spawn DAC_fCommandUnit;
										if(_run == 8) then {_run = 5;_go = 0};
									};
								};
							};
						};
						{
							if((_x != (vehicle _x)) && (_x == (gunner (vehicle _x)))) then
							{
								if(!((vehicle _x) in DAC_Arti_Veh)) then {_rd = random 360;_x lookat [(position _x Select 0) + (Sin (_rd) * 500),(position _x Select 1) + (Cos (_rd) * 500),50]};
							};
						}	foreach units _group;
					};
				};
		case 9:	{
					//-----------------------------
					//#searchbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case9",time]};
					[_group,_target] spawn DAC_fSetBehaviour;
					_run = 10;
				};
		case 10:{
					//-----------------------------
					//#patrolstart
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case10",time]};
					if((time < _timestep) && (count _this == 5)) then
					{
						_run = 3;
					}
					else
					{
						_leaderveh = vehicle _leader;_tempcount = 0;_start = 0;
						_searcharea  = call compile ((_zskill select 9) select 0);_patpos = position _leader;
						_searchcount = (time + call compile ((_zskill select 9) select 1));
						if(_leaderveh isKindOf "Ship") then
						{
							{[_x] ordergetin false}foreach units _group;_go = 1;
							while {_go > 0} do
							{
								if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - PatrolStart",time]};
								sleep (1 + (random 1));
								if(!(_leader in _leaderveh)) then
								{
									_wx = _patpos select 0;_wy = _patpos select 1;
									{if(_x != gunner (vehicle _x)) then {unassignvehicle _x;[_x] ordergetin false}} foreach units _group;
									_patrolon = 1;_run = 11;[_leader,1] spawn DAC_fAISpeak;[0,(leader _group)] spawn DAC_fAIRadio;
									_go = 0;
								};
							};
						}
						else
						{
							_wx = _patpos select 0;_wy = _patpos select 1;
							{if(_x != gunner (vehicle _x)) then {unassignvehicle _x;[_x] ordergetin false}} foreach units _group;
							_patrolon = 1;_run = 11;[_leader,1] spawn DAC_fAISpeak;[0,(leader _group)] spawn DAC_fAIRadio;
						};
					};
				};
		case 11:{
					//-----------------------------
					//#patrolmove
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case11",time]};
					_scriptmod = 0;
					while {_run == 11} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - PatrolMove1",time]};
						_tempcount = 0;_go = 1;
						while {_go > 0} do
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - PatrolMove2",time]};
							sleep 0.01;
							_rdir = random 360;_posgetout = [((_wx) + (Sin _rdir * (_searcharea - 5))),((_wy) + (Cos _rdir * (_searcharea - 5))),0];
							{if((_posgetout distance _x) < 5) then {_tempcount = _tempcount + 1}} foreach _vehA;
							if((_tempcount > 0) || (surfaceIsWater (_posgetout))) then
							{
								_tempcount = 0;
							}
							else
							{
								_go = 0;
							};
						};
						//-----------------------------
						//#move
						//-----------------------------
						sleep 2;
						{_x domove [(((_posgetout) select 0) + (Sin (random 360) * (3 + (random 15)))),(((_posgetout) select 1) + (Cos (random 360) * (3 + (random 15)))),0]}foreach units _group;_looktime = time + (5 + random 3);
						_go = 1;
						while {_go > 0} do
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - PatrolMove3",time]};
							sleep (1 + (random 1));
							_call = [_group,_leader,_marker,_timestep,_groupid,0] call DAC_fSomeConditions;
							if((count _call) > 0) then
							{
								_run = (_call select 0);
								if(_run == 20) then {_run = 21};
								if(_run == 13) then {_target = (_call select 1);_run = 14};
								_go = 0;
							}
							else
							{
								if(time > _looktime) then
								{
									_looktime = time + (5 + random 3);
									{
										if((_x != (vehicle _x)) && (_x == (gunner (vehicle _x)))) then
										{
											_rd = random 360;_x lookat [(position _x Select 0) + (Sin (_rd) * 500),(position _x Select 1) + (Cos (_rd) * 500),50];
										};
									}	foreach units _group;
								};
								if((_group in DAC_Cover_Groups) && (_go == 1)) then {_go = 0;_run = 12};
								if((unitready (vehicle _leader)) && (_go == 1)) then {_go = 0};
								if(time > _searchcount) then {_go = 0;_run = 12};
							};
						};
						if(_run == 11) then
						{
							_wait = time + (call compile _unitwait);_go = 1;
							[_leader,1] spawn DAC_fAISpeak;[0,(leader _group)] spawn DAC_fAIRadio;
							if(format["%1",(behaviour _leader)] != "CARELESS") then {{_x setunitpos "auto"} foreach units _group};
							while {_go > 0} do
							{
								if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - PatrolMove4",time]};
								sleep (1 + (random 1));
								_call = [_group,_leader,_marker,_timestep,_groupid,0] call DAC_fSomeConditions;
								if((count _call) > 0) then
								{
									_run = (_call select 0);
									if(_run == 20) then {_run = 21};
									if(_run == 13) then {_target = (_call select 1);_run = 14};
									_go = 0;
								}
								else
								{
									if((_group in DAC_Cover_Groups) && (_go == 1)) then {_go = 0;_run = 12};
									if((time > _wait) && (_go == 1)) then {_go = 0};
								};
							};
							if(_run == 11) then
							{
								waituntil{DAC_NewZone == 0};
								_wpCheck = [[_wparray,_numarray,_allZones,_mz],_groupid] call DAC_fSumWaypoints;
								_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
								_wparray = ((_wpCheck select 0) select 0);
								if(_sum != (_wpCheck select 1)) then
								{
									_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
									[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
									_scriptmod = 0;_run = 12;
								}
								else
								{
									if(time > _searchcount) then
									{
										_scriptmod = 0;_run = 12;
									}
									else
									{
										_wx = _patpos select 0;_wy = _patpos select 1;_start = _start + 1;
									};
								};
							};
						};
					};
				};
		case 12:{
					//-----------------------------
					//#getinveh
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case12",time]};
					_VehSet = [_vehvalue] call DAC_fVehicleArray;
					_veharray = _VehSet select 0;_vehvalue = _VehSet select 1;
					if(count _veharray == 0) then
					{
						_patrolon = 0;_run = 3;
					}
					else
					{
						[_group,_vehvalue] spawn DAC_fGroupGetin;
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - GetIn",time]};
						{_x setunitpos "up"} foreach units _group;_group setspeedmode "FULL";_run = 13;
					};
				};
		case 13:{
					//-----------------------------
					//#checkcargo
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case13",time]};
					_go = 1;_cG = ({alive _x} count units _group);_waittime = (time + (DAC_Intern select 0));
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - CheckCargo",time]};
						sleep (1 + (random 1));
						_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);
							if(_run == 20) then {_run = 21};
							if(_run == 13) then {_target = (_call select 1);_run = 14};
							_go = 0;
						}
						else
						{
							if(_cG != ({alive _x} count units _group)) then
							{
								{unassignvehicle _x;[_x] ordergetin false} foreach units _group;
								sleep 5;
								_go = 0;_run = 12;_scriptmod = 0;
							}
							else
							{
								if(time > _waittime) then
								{
									_patrolon = 0;_go = 0;_isin = 0;
									if(_group in DAC_Cover_Groups) then {_run = 18} else {_run = 3};
								}
								else
								{
									if(({(isNull (assignedVehicle _x))} count units _group) > 0) then
									{
										{unassignvehicle _x;[_x] ordergetin false} foreach units _group;
										sleep 5;
										_go = 0;_run = 12;_scriptmod = 0;
									}
									else
									{
										if(({((canmove _x) && ((_x emptyPositions "driver") == 1))} count _veharray) == 0) then
										{
											if(([_veharray] call DAC_fCheckCargo) == 0) then
											{
												_patrolon = 0;_go = 0;_isin = 0;
												if(_group in DAC_Cover_Groups) then {_run = 18} else {_run = 3};
											}
											else
											{
												if(({((alive _x) && (_x == vehicle _x))} count units _group) == 0) then
												{
													_patrolon = 0;_go = 0;_isin = 0;
													if(_group in DAC_Cover_Groups) then {_run = 18} else {_run = 3};
												};
											};
										};
									};
								};
							};
						};
					};
				};
		case 14:{
					//-----------------------------
					//#selectbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case14",time]};
					[_group] spawn DAC_fLeaveVehicle;[_leader,2] spawn DAC_fAISpeak;
					if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
					[_group,_target] spawn DAC_fSetBehaviour;
					if(!(_group in DAC_Radio_Groups)) then {[17,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio};
					if((_target distance _leader) < ((call compile DAC_Alert_Dist) / 2)) then {{_x setunitpos "down"} foreach units _group} else {{_x setunitpos "auto"} foreach units _group};
					if((count _EventDetect) > 0) then {call compile (_EventDetect select 0)};
					_waittime = time + call compile ((_zskill select 15) select 0);_run = 15;
				};
		case 15:{
					//-----------------------------
					//#groupwaitfortarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case15",time]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - GroupWaitForTarget",time]};
						sleep (1 + (random 1));
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 0;_run = 0};
						if((({alive _x} count units _group) == 0) && (_go == 1)) then {_go = 0;_run = 21};
						if((_group in DAC_Hit_Groups) && (_go == 1)) then {_go = 0;_run = 17};
						if(_go == 1) then
						{
							_newtarget = [_group,_target] call DAC_fCheckNewTarget;
							if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
							if((time > _waittime) || (_id == 0)) then
							{
								{_x setunitpos "auto"} foreach units _group;
								_go = 0;_run = 16;
							};
						};
					};
				};
		case 16:{
					//-----------------------------
					//#querytarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case16",time]};
					if(_id > 0) then
					{
						if(!([_group,_target] call DAC_fCheckTarget)) then
						{
							_run = 17;
						};
					};
					if(_run == 16) then
					{
						if(_group in DAC_Hit_Groups) then {DAC_Hit_Groups = DAC_Hit_Groups - [_group]};
						if(_group in DAC_Call_Groups) then {DAC_Call_Groups = DAC_Call_Groups - [_group]};
						{_x setunitpos "auto"} foreach units _group;[_leader,5] spawn DAC_fAISpeak;[11,(leader _group)] spawn DAC_fAIRadio;
						if(({alive _x} count units (group _target)) == 0) then {[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
						_run = 9;_scriptmod = 1;
					};
				};
		case 17:{
					//-----------------------------
					//#groupmovetoenemy
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case17",time]};
					sleep 0.1;
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(({alive _x} count units _group) == 0) then
						{
							_run = 20;
						}
						else
						{
							if(_group in DAC_Hit_Groups) then
							{
								_callg = [];
								{if((!(side _x == side leader _group)) && (((leader _group) knowsabout _x) > 0) && (alive _x))  then {_callg set [count _callg,_x]}} foreach DAC_Fire_Pos;
								if((count _callg) > 0) then
								{
									if((count _callg) > 1) then
									{
										_target = _callg select (random ((count _callg) - 1));
									}
									else
									{
										_target = _callg select 0;
									};
								};
							};
							if(isNull _target) then
							{
								if(_group in DAC_Hit_Groups) then {DAC_Hit_Groups = DAC_Hit_Groups - [_group]};
								if(_group in DAC_Call_Groups) then {DAC_Call_Groups = DAC_Call_Groups - [_group]};
								[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
								_run = 12;_scriptmod = 0;
							}
							else
							{
								{_x dowatch _target} foreach units _group;
								if(!(_group in DAC_Help_Groups)) then {DAC_Help_Groups set [count DAC_Help_Groups,_group]};
								if(_group in DAC_Hit_Groups) then {[20,_groupid,_group,"T",_target distance leader _group] spawn DAC_fShowRadio} else {[15,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio};
								[_garray,_target,_posarray,_groupid,_maxrad,_zskill,_vehvalue] spawn DAC_fMovetoEnemy;[_leader,3] spawn DAC_fAISpeak;[5,(leader _group)] spawn DAC_fAIRadio;
								[_leader,_target] spawn DAC_fSmokeGren;
								if(((leader _group) distance _target) < (DAC_AI_Level * 50)) then {{if(_x != gunner (vehicle _x)) then {unassignvehicle _x;[_x] ordergetin false}} foreach units _group};
								_run = 0;
							};
						};
					};
				};
		case 18:{
					//-----------------------------
					//#directmove
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case18",time]};
					_callg = [];_grouponfire = _group;
					{if(side (leader _x ) == side leader _group) then {_callg set [count _callg,_x]}} foreach DAC_Call_Groups;
					if((count _callg) == 0) then
					{
						DAC_Cover_Groups = DAC_Cover_Groups - [_group];
						{_x setunitpos "auto"} foreach units _group;
						if(!(isNil "DAC_Support_Logic")) then
						{
							_callg = (DAC_Support_Logic getVariable "support_groups");
							if(_group in _callg) then
							{
								_callg = _callg - [_group];
								DAC_Support_Logic setVariable ["support_groups", _callg, true];
							};
						};
						_run = 3;
					}
					else
					{
						_grouponfire = _callg select (random ((count _callg) - 1));
						{_x setunitpos "auto"} foreach units _group;
						[_garray,_grouponfire,_posarray,_groupid,_maxrad,_zskill,_vehvalue] spawn DAC_fMoveToFriendly;
						_run = 0;
					};
				};
		case 19:	{
					//-----------------------------
					//#joinGroup
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case19",time]};
					_jArray = [_group] call DAC_fFindGroup;
					if(count _jArray > 0) then
					{
						{unassignvehicle _x;[_x] ordergetin false} foreach (units _group);
						[_group,(_jArray select 0),1] spawn DAC_fRemoveGroup;
						_run = 21;
					}
					else
					{
						_run = 5;_go = 0;
					};	
				};
		case 20:{
					//-----------------------------
					//#Break
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case21",time]};
					_go = 1;_groupveh = [];_id = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - Break",time]};
						sleep (0.1 + (random 0.2));
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
						{
							_go = 0;_run = 0;
						}
						else
						{
							if((({alive _x} count units _group) == 0) && (_go == 1)) then
							{
								_go = 0;_run = 21;
							}
							else
							{
								if(_isin == 0) then {_isin = 1;{if(_x != gunner (vehicle _x)) then {unassignvehicle _x;[_x] ordergetin false}} foreach units _group};
								if(!(leader _group == _leader)) then
								{
									_leader = leader _group;{_groupveh set [count _groupveh,(_x select 0)]} foreach _vehvalue;
									if(count _groupveh > 0) then {_groupveh = [_groupveh] call DAC_fCheckCrew};
									_posgetout = "_x commandmove [(((position (vehicle _x)) select 0) + (Sin (random 360) * (random 30))),(((position (vehicle _x)) select 1) + (Cos (random 360) * (random 30))),0]";
									{if(_x != leader _group) then {call compile _posgetout}} foreach units _group;
									if((_group in DAC_Hit_Groups) && (_go == 1)) then {_go = 0;_run = 17};
									if(_go == 1) then
									{
										_newtarget = [_group,_target] call DAC_fCheckNewTarget;
										if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
										if(_id == 0) then
										{
											if(_group in DAC_Cover_Groups) then
											{
												_run = 12;_go = 0;_id = 0;
											}
											else
											{
												_run = 9;_go = 0;
											};
										}
										else
										{
											_go = 0;_run = 14;
										};
									};
								};
							};
						};
					};
				};
		case 21:{
					//-----------------------------
					//#ende
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_with_VH - case22",time]};
					{DAC_VehicleInUse = DAC_VehicleInUse - [(_x select 0)]} foreach _vehvalue;
					_run = 0;
				};
		Default{};
	};
};