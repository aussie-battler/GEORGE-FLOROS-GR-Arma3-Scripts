//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_to_WP        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_garray","_group","_wparray","_groupid","_maxrad","_zskill","_leader","_target","_ra","_rd","_proGun","_EventDetect","_cw",
			"_timestep","_nextwp","_bgs","_firstwait","_newveh","_checktime","_call","_startid","_emptyGun","_eventid","_allZones","_split",
			"_checkpos","_wait","_jArray","_rndnr","_wpstart2","_nextpos","_checkpos1","_checkpos2","_bgs","_waittime","_wpCheck","_wparray",
			"_emptyVeh","_rndbg","_builg","_nextbg","_maxpos","_maxtime","_postyp","_veh","_queryA","_queryB","_groupveh","_posarray","_numarray",
			"_knowsabout","_speedselect","_combatselect","_behavselect","_formselect","_unitcombat","_unitbehav","_curV","_curG","_oldskill","_na",
			"_unitspeed","_unitform","_bldgbehav","_joinbehav","_unitwait","_lastwp","_nextmp","_grouponfire","_proVeh","_EventList","_gunA","_ic",
			"_marker","_DAC_Arrays","_callg","_callE","_ce","_kw","_ct","_run","_go","_val","_newtarget","_sum","_id","_looktime","_coverval","_gunU","_mz"
		];
		
			_garray = _this select 0;_group = _garray select 0;_posarray = _this select 1;_wparray = (_posarray select 0);_numarray = (_posarray select 1);_marker = _garray select 1;_val = 0;_nextmp = [0,0];
			_groupid = _this select 2;_maxrad = _this select 3;_leader = leader _group;_target = objNull;_ra = _maxrad / 2;_knowsabout = 0;_rd = 0;_groupveh = [];_ic = 0;_na = "";
			_timestep = time + 60;_nextwp = [(position _leader select 0),(position _leader select 1)];_bgs = [];_lastwp = _nextwp;_wpstart2 = [0,0];_gunA = [];_allZones = (_posarray select 2);
			_firstwait = 0;_newveh = objNull;_newtarget = objNull;_call = [];_id = 0;_startid = _this select 4;_callg = [];_waittime = 0;_EventList = [];_EventDetect = [];_gunU = objNull;_jArray = [];
			_run = 1;_go = 0;_DAC_Arrays = ["DAC_Help_Groups","DAC_Hit_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Cover_Groups","DAC_Call_Groups"];_sum = 0;_kw = 0;_split = [];_mz = (_posarray select 3);
			_curV = objNull;_curG = objNull;_emptyVeh = 0;_emptyGun = 0;_proVeh = 0;_proGun = 0;_looktime = 0;_eventid = _garray select 2;_coverval = 0;_wpCheck = [];_cw = 0;
			
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

_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;_oldskill = ((getMarkerPos (_marker select 2)) select 1);
{if((!(vehicle _x == _x)) && (!(vehicle _x in _groupveh))) then	{_groupveh = _groupveh + [vehicle _x]}}foreach units _group;

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#waitforstart
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case1",time]};
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
							_EventList = ((([_eventid] call DAC_fConfigEvents) select 0) select 1);
							_EventDetect = ((([_eventid] call DAC_fConfigEvents) select 0) select 6);
						};
						if(count _wparray == 0) then
						{
							_run = 21;
						}
						else
						{
							{call compile format["if(_group in %1) then {%1 = %1 - [_group]}",_x]}foreach _DAC_Arrays;
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
								_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;
								_unitform = _zskill select 4;_bldgbehav = _zskill select 8;_joinbehav = _zskill select 12;
								_emptyVeh = (((_zskill select 13) select 0) select 0);_proVeh = (((_zskill select 13) select 0) select 1);
								_emptyGun = (((_zskill select 13) select 1) select 0);_proGun = (((_zskill select 13) select 1) select 1);_coverval = ((_zskill select 5) select 1);
								_unitwait = "((((_zskill select 7) select (_groupid - 1)) select 0) + (random (((_zskill select 7) select (_groupid - 1)) select 1)))";
								_run = 2;
							};
						};
					};
				};
		case 2:	{
					//-----------------------------
					//#RandomStartPos
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case2",time]};
					if(_kw == 0) then {_go = 1} else {_run = 3;_go = 0;_kw = 0};
					while {_go > 0} do
					{
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
						{
							_run = 0;_go = 0;
						}
						else
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - RandomStartPos",time]};
							waituntil{DAC_NewZone == 0};
							_wpCheck = [[_wparray,_numarray,_allZones,_mz],_groupid] call DAC_fSumWaypoints;
							_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
							_wparray = ((_wpCheck select 0) select 0);
							if(_sum != (_wpCheck select 1)) then
							{
								_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
								[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
							};
							_lastwp = _nextwp;_nextmp = call compile (_wparray select (random ((count _wparray) - (1 + _mz))));
							if(((_lastwp select 0) + (_lastwp select 1)) != ((_nextmp select 0) + (_nextmp select 1))) then
							{
								_split = [(position _leader),_nextmp,_leader] call DAC_fSplitWPWay;
								if(count _split > 0) then
								{
									_nextwp = _nextmp;_nextpos = _nextwp;_go = 0;_run = 3;_cw = 0;
								};
							};
							sleep 0.01;
						};
					};	
				};
		case 3:	{
					//-----------------------------
					//#setbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case3",time]};
					waituntil {(({vehicle _x in DAC_Arti_Veh} count units _group) == 0)};
					{_x setunitpos "auto"}foreach units _group;
					_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));
					_speedselect  = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
					_behavselect  = (random ((count _unitbehav) - 1));_formselect   = (random ((count _unitform) - 1));
					_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
					_group setformation (_unitform select _formselect);
					_group setformdir (random 360);_run = 4;_go = 1;
					_group setspeedmode (_unitspeed select _speedselect);
				};
		case 4:	{
					//-----------------------------
					//#move
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case4",time]};
					_nextpos = (_split select _cw);
					_group setVariable ["dacData",[0,_nextpos],false];
					if(_go == 1) then {_group move _nextpos};
					_checktime = time + (20 + random 20);_checkpos = position (vehicle _leader);
					[_group] spawn DAC_fForceSpeed;_go = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - Move",time]};
						sleep (1 + (random 1));
						_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							_go = 0;
						}
						else
						{
							if((_group in DAC_Cover_Groups) && (_go == 1)) then {_go = 0;_run = 18};
							if((time > _checktime) && (_go == 1)) then {_go = 0;_run = 6};
							if((unitready (vehicle _leader)) && (_go == 1)) then
							{
								if(_cw == ((count _split) - 1)) then
								{
									_go = 0;_run = 5;
								}
								else
								{
									_cw = _cw + 1;
									_nextpos = (_split select _cw);
									_group setVariable ["dacData",[0,_nextpos],false];
									_group move _nextpos;
								};
							};
						};
					};	
				};
		case 5:	{
					//-----------------------------
					//#waiting
					//-----------------------------				
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case5",time]};
					if((count _EventList) > 0) then {call compile (_EventList select 0)};
					waituntil {(({vehicle _x in DAC_Arti_Veh} count units _group) == 0)};
					[_leader,1] spawn DAC_fAISpeak;[0,(leader _group)] spawn DAC_fAIRadio;if(format["%1",(behaviour _leader)] != "CARELESS") then {{_x setunitpos "auto"} foreach units _group};
					_wait = time + (call compile _unitwait);
					_go = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - waiting",time]};
						sleep (1 + (random 1));
						waituntil {(({vehicle _x in DAC_Arti_Veh} count units _group) == 0)};
						{_rd = random 360;if((_x == (gunner (vehicle _x))) && ((count crew (vehicle _x)) > 1)) then {if(!((vehicle _x) in DAC_Arti_Veh)) then {_x lookat [(position _x Select 0) + (Sin (_rd) * 500),(position _x Select 1) + (Cos (_rd) * 500),50]}}} foreach units _group;
						_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							_go = 0;
						}
						else
						{
							if((_group in DAC_Cover_Groups) && (_go == 1)) then {_go = 0;_run = 18};
							if(time > _wait) then
							{
								_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
								_go = 0;_run = 2;
							};
						};
					};		
				};
		case 6:	{
					//-----------------------------
					//#checkwp
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case6",time]};
					if(_oldskill != ((getMarkerPos (_marker select 2)) select 1)) then
					{
						_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;_oldskill = ((getMarkerPos (_marker select 2)) select 1);
						if(((_zskill select 11) select 0) == 0) then {if(!(_group in DAC_No_Support)) then {DAC_No_Support set [count DAC_No_Support,_group]}};
						_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;
						_unitform = _zskill select 4;_bldgbehav = _zskill select 8;_joinbehav = _zskill select 12;
						_emptyVeh = (((_zskill select 13) select 0) select 0);_proVeh = (((_zskill select 13) select 0) select 1);
						_emptyGun = (((_zskill select 13) select 1) select 0);_proGun = (((_zskill select 13) select 1) select 1);
						_unitwait = "((((_zskill select 7) select (_groupid - 1)) select 0) + (random (((_zskill select 7) select (_groupid - 1)) select 1)))";
						_speedselect  = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
						_behavselect  = (random ((count _unitbehav) - 1));_formselect   = (random ((count _unitform) - 1));
						_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
						_group setformation (_unitform select _formselect);
						[_leader,1] spawn DAC_fAISpeak;
					};
					waituntil{DAC_NewZone == 0};
					_wpCheck = [[_wparray,_numarray,_allZones,_mz],_groupid] call DAC_fSumWaypoints;
					_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
					_wparray = ((_wpCheck select 0) select 0);
					if(_sum != (_wpCheck select 1)) then
					{
						_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
						[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
						_checkpos = getpos (vehicle _leader);_run = 2;
					}
					else
					{
						waituntil {(({vehicle _x in DAC_Arti_Veh} count units _group) == 0)};
						{
							if((_x != (vehicle _x)) && (_x == (gunner (vehicle _x)))) then
							{
								if(!((vehicle _x) in DAC_Arti_Veh)) then {_rd = random 360;_x lookat [(position _x Select 0) + (Sin (_rd) * 500),(position _x Select 1) + (Cos (_rd) * 500),50]};
							};
						}	foreach units _group;
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
								_run = 2;
							}
							else
							{
								_checktime = time + (20 + random 20);_checkpos = getPosATL (vehicle _leader);
								if((({alive _x} count units _group) <= _joinbehav) && (!(_group in DAC_Min_Groups))) then {_run = 7};
								if((((_bldgbehav select 0) > 0)) && (({_x == vehicle _x} count units _group) > 1) && (_run == 6)) then {_run = 9};
								if(((_emptyVeh > 0) || (_emptyGun > 0)) && (({_x == vehicle _x} count units _group) > 1) && (({alive _x} count units _group) > 1) && (_run == 6)) then {_run = 11};
								if(_run == 6) then {_run = 4;_go = 0};
							};
						};
					};
					if(count _wparray == 0) then {player sidechat format["%1 has no waypoints.",_group]};
				};
		case 7:	{
					//-----------------------------
					//#joinGroup
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case7",time]};
					_jArray = [_group] call DAC_fFindGroup;
					if(count _jArray > 0) then
					{
						[_group,(_jArray select 0),1] spawn DAC_fRemoveGroup;
						_run = 21;
					}
					else
					{
						_run = 4;_go = 1;
					};	
				};
		case 8:	{
					//disabled
				};
		case 9:	{
					//-----------------------------
					//#findbuilding
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case9",time]};
					_bgs = [_leader,(_bldgbehav select 1),(_bldgbehav select 4)] call DAC_fScanBuilding;
					sleep 1;
					if((count _bgs > 0) && (!(_group in DAC_Min_Groups))) then
					{
						_run = 10;
					}
					else
					{
						if(((_emptyVeh > 0) || (_emptyGun > 0)) && (({_x == vehicle _x} count units _group) > 1) && (({alive _x} count units _group) > 1)) then
						{
							_run = 11;
						}
						else
						{
							_run = 4;_go = 0;
						};
					};
				};
		case 10:{
					//-----------------------------
					//#checkbuildings
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case10",time]};
					_rndbg = round(random ((count _bgs) - 1));_builg = (_bgs select _rndbg);_nextbg = (_builg select 0);
					_maxpos = (_builg select 1);_maxtime = time + 25;_postyp = 0;
					[34,_groupid,_group,"T",_nextbg distance _leader] spawn DAC_fShowRadio;
					[_nextbg,(_bldgbehav select 3),_group,_bgs] spawn DAC_fHoldBuilding;
					_nextpos = [(((position _nextbg) Select 0) + (Sin (direction _nextbg + 180) * (((boundingBox _nextbg select 1) select 1) + 3))),(((position _nextbg) Select 1) + (Cos (direction _nextbg + 180) * (((boundingBox _nextbg select 1) select 1) + 3))),0];
					_group setVariable ["dacData",[0,_nextpos],false];
					_group move _nextpos;
					if(!(_group in DAC_In_Building)) then {DAC_In_Building set [count DAC_In_Building,_group]};
					//-----------------------------
					//#movetobuilding
					//-----------------------------
					_go = 1;_kw = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - MoveToBuilding",time]};
						sleep (1 + (random 1));
						_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							if(_group in DAC_In_Building) then {DAC_In_Building = DAC_In_Building - [_group]};
							_go = 0;
						}
						else
						{
							if(_group in DAC_Min_Groups) then
							{
								if(_group in DAC_In_Building) then {DAC_In_Building = DAC_In_Building - [_group]};
								_go = 0;_run = 2;
							}
							else
							{
								if(((_leader distance _nextbg) < 25) || (time > _maxtime)) then {_go = 0};
							};
						};
					};
					if(_run == 10) then
					{
						{_x setunitpos "auto"} foreach units _group;_maxtime = time + (_bldgbehav select 2);
						[_builg,_garray,(_bldgbehav select 0),_postyp] spawn DAC_fMoveToBuilding;[1,(leader _group)] spawn DAC_fAIRadio;
						_val = 1;_looktime = time + 5;
						_group setbehaviour "combat";
						while {_val > 0} do
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - MoveToBuilding2",time]};
							sleep (1 + (random 1));
							_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
							if((count _call) > 0) then
							{
								_run = (_call select 0);_target = (_call select 1);
								if(_group in DAC_In_Building) then {DAC_In_Building = DAC_In_Building - [_group]};
								_val = 0;
							}
							else
							{
								if((time > _maxtime) || (_group in DAC_Min_Groups)) then {_val = 0};
								if(time > _looktime) then {_looktime = time + 5;{if(!((vehicle _x) in DAC_Arti_Veh)) then {_rd = random 360;_x lookat [(position _x Select 0) + (Sin (_rd) * 500),(position _x Select 1) + (Cos (_rd) * 500),50]}} foreach units _group};
							};
						};
						if(_run == 10) then
						{
							{if((alive _x) && (!(_x == leader _group))) then {[_x]joinsilent (leader _group);_x commandmove (position (leader _group))}}foreach (units _group);
							if(_group in DAC_In_Building) then {DAC_In_Building = DAC_In_Building - [_group]};
							{_x setunitpos "auto"} foreach units _group;_run = 2;
						};
					};
				};
		case 11:{
					//-----------------------------
					//#findemptygun
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case11",time]};
					if(count _groupveh > 0) then {_groupveh = [_groupveh] call DAC_fCheckCrew};
					if(count _gunA > 0) then {{if(not alive _x) then {_gunA = _gunA - [_x]}} foreach _gunA};
					if(_emptyGun > 0) then
					{
						_veh = [_group,_emptyVeh,_emptyGun,_proVeh,_proGun,_curV,_curG] call DAC_fFindVehicle;
						_curV = (_veh select 2);_curG = (_veh select 3);_i = ((count units _group) - 1);_gunU = objNull;_newveh = objNull;
						if(isNull(_veh select 0)) then
						{
							if(isNull(_veh select 1)) then
							{
								_run = 4;_go = 0;
							}
							else
							{
								while {_i >= 0} do
								{
									_gunU = units _group select _i;
									if((not alive _gunU) || (_gunU == leader _group) || (_gunU != vehicle _gunU) || (_gunU in _gunA)) then
									{
										_i = _i - 1;
									}
									else
									{
										_newveh = _gunU;_gunA set [count _gunA,_gunU];_i = -1;
									};
								};
								if(!(isNull _newveh)) then
								{
									[_newveh,(_veh select 1),_marker,_coverval] spawn DAC_fEnterGun;
									[39,_groupid,_group,"T",_newveh distance _leader] spawn DAC_fShowRadio;
									[1,(leader _group)] spawn DAC_fAIRadio;
								};
								_run = 4;_go = 0;
							};
						}
						else
						{
							if(_emptyVeh > 0) then {if(count _groupveh == 0) then {_run = 12} else {_run = 4;_go = 0}} else {_run = 4;_go = 0};
						};
					}
					else
					{
						if(_emptyVeh > 0) then {if(count _groupveh == 0) then {_run = 12} else {_run = 4;_go = 0}} else {_run = 4;_go = 0};
					};
				};
		case 12:{
					//-----------------------------
					//#entervehicle
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case12",time]};
					_newveh = (_veh select 0);
					if(!(_newveh in DAC_VehicleInUse)) then {DAC_VehicleInUse set [count DAC_VehicleInUse,_newveh]};
					_groupveh set [count _groupveh,_newveh];
					[33,_groupid,_group,"T",_newveh distance _leader] spawn DAC_fShowRadio;
					_group setVariable ["dacData",[0,[(position _newveh Select 0) + (Sin (direction _newveh) * 10),(position _newveh Select 1) + (Cos (direction _newveh) * 10),0]],false];
					_group move [(position _newveh Select 0) + (Sin (direction _newveh) * 10),(position _newveh Select 1) + (Cos (direction _newveh) * 10),0];_go = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - EnterVehicle",time]};
						sleep (1 + (random 1));
						_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							_go = 0;
						}
						else
						{
							if((({alive _x} count crew _newveh) > 0) || (getdammage _newveh > 0.8) || (!(canmove _newveh))) then
							{
								_go = 0;_run = 2;
							}
							else
							{
								if((_leader distance _newveh) < 25) then
								{
									{_x setunitpos "auto"} foreach units _group;
									[_garray,_newveh] spawn DAC_fEnterVehicle;_go = 0;
									[1,(leader _group)] spawn DAC_fAIRadio;
								};
							};
						};
					};
					if(_run == 12) then
					{
						_go = 1;
						while {_go > 0} do
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - EnterVehicle2",time]};
							sleep (1 + (random 1));
							_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
							if((count _call) > 0) then
							{
								_run = (_call select 0);_target = (_call select 1);
								_go = 0;
							}
							else
							{
								if((getdammage _newveh > 0.8) || (!(canmove _newveh))) then
								{
									_go = 0;_run = 2;
								}
								else
								{
									if((count crew _newveh) > 0) then
									{
										if(!(_group in DAC_Min_Groups)) then {DAC_Min_Groups set [count DAC_Min_Groups,_group]};
										{_x setunitpos "auto"} foreach units _group;
										sleep 1;
										{[_x]join (leader _group);_x commandmove (position (leader _group))} foreach (crew _newveh);
										_go = 0;_run = 2;
									};
								};
							};
						};
					};
				};
		case 13:{
					//-----------------------------
					//#selectbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case13",time]};
					[_group] spawn DAC_fLeaveVehicle;[_leader,2] spawn DAC_fAISpeak;
					if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
					[_group,_target] spawn DAC_fSetBehaviour;
					if(!(_group in DAC_Radio_Groups)) then {[17,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio};
					_waittime = time + call compile ((_zskill select 15) select 0);
					if((_target distance _leader) < ((call compile DAC_Alert_Dist) / 2)) then 
					{
						{_x setunitpos "down"} foreach units _group;
					}
					else
					{
						if(format["%1",gunner _target] != "<NULL-object>") then
						{
							{_x setunitpos "down"} foreach units _group;
						}
						else
						{
							{_x setunitpos "auto"} foreach units _group;
						};
					};
					_i = 0;_run = 14;
					if((count _EventDetect) > 0) then {call compile (_EventDetect select 0)};
				};
		case 14:{
					//-----------------------------
					//#groupwaitfortarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case14",time]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - GroupWaitingForTarget",time]};
						sleep (1 + (random 1));
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 0;_run = 0};
						if((({alive _x} count units _group) == 0) && (_go == 1)) then {_go = 0;_run = 21};
						if((_group in DAC_Hit_Groups) && (_go == 1)) then {_go = 0;_run = 17};
						if(_go == 1) then
						{
							_newtarget = [_group,_target] call DAC_fCheckNewTarget;
							if((isNull _newtarget) || (format["%1",typeof _newtarget] == "")) then
							{
								_id = 0;
							}
							else
							{
								if(_newtarget != _target) then {_target = _newtarget};
								if(alive _target) then {_id = 1} else {_id = 0};
							};
						};
						if((time > _waittime) || (_id == 0)) then
						{
							{_x setunitpos "auto"} foreach units _group;
							_go = 0;_run = 16;
						};
					};
				};
		case 16:{
					//-----------------------------
					//#querytarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case16",time]};
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
						{_x setunitpos "auto"} foreach units _group;
						if(({alive _x} count units (group _target)) == 0) then {[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
						[_leader,5] spawn DAC_fAISpeak;[11,(leader _group)] spawn DAC_fAIRadio;
						_run = 2;
					};
				};
		case 17:{
					//-----------------------------
					//#groupmovetoenemy
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case17",time]};
					sleep 0.1;
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(({alive _x} count units _group) == 0) then
						{
							_run = 21;
						}
						else
						{
							if(_group in DAC_Hit_Groups) then
							{
								_group setbehaviour "combat";_callg = [];
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
							_go = 1;_id = 1;_waittime = (time + (60 * (skill (leader _group))));
							while {_go > 0} do
							{
								if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - GroupWaitingForTarget",time]};
								sleep (1 + (random 1));
								if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 0;_run = 0};
								if((({alive _x} count units _group) == 0) && (_go == 1)) then {_go = 0;_run = 21};
								if(_go == 1) then
								{
									_newtarget = [_group,_target] call DAC_fCheckNewTarget;
									if((isNull _newtarget) || (format["%1",typeof _newtarget] == "")) then
									{
										_id = 0;
									}
									else
									{
										if(_newtarget != _target) then {_target = _newtarget};
										if(alive _target) then {_id = 1} else {_id = 0};
									};
								};
								if(time > _waittime) then
								{
									if(_id == 1) then
									{
										{_x dowatch _target} foreach units _group;
										if(!(_group in DAC_Help_Groups)) then {DAC_Help_Groups set [count DAC_Help_Groups,_group]};
										if(_group in DAC_Hit_Groups) then {[20,_groupid,_group,"T",_target distance (leader _group)] spawn DAC_fShowRadio} else {[15,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio};
										[_garray,_target,_posarray,_groupid,_maxrad,_zskill] spawn DAC_fMovetoEnemy;
										[_leader,3] spawn DAC_fAISpeak;[5,(leader _group)] spawn DAC_fAIRadio;_run = 21;_go = 0;
									}
									else
									{
										{_x setunitpos "auto"} foreach units _group;
										if(_group in DAC_Hit_Groups) then {DAC_Hit_Groups = DAC_Hit_Groups - [_group]};
										if(_group in DAC_Call_Groups) then {DAC_Call_Groups = DAC_Call_Groups - [_group]};
										[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;_run = 2;_go = 0;
									};
								};
							};
						};
					};
				};
		case 18:{
					//-----------------------------
					//#directmove
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case18",time]};
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
						_run = 1;
					}
					else
					{
						_grouponfire = _callg select (random ((count _callg) - 1));
						{_x setunitpos "auto"} foreach units _group;
						[_garray,_grouponfire,_posarray,_groupid,_maxrad,_zskill] spawn DAC_fMoveToFriendly;
						_run = 0;
					};
				};
		case 20:{
					//-----------------------------
					//#Break
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case20",time]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - Break",time]};
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
								if(!(leader _group == _leader)) then
								{
									_leader = leader _group;
									if(count _groupveh > 0) then {_groupveh = [_groupveh] call DAC_fCheckCrew};
									{_x commandmove (position _leader)}foreach (units _group);
									if((_group in DAC_Hit_Groups) && (_go == 1)) then {_go = 0;_run = 17};
									if(_go == 1) then
									{
										if([_group,_target] call DAC_fCheckTarget) then
										{
											_newtarget = [(leader _group),_group,_target] call DAC_fEnemyCond;
											if((_newtarget == _target) || (isNull _newtarget)) then
											{
												_id = 0;
											}
											else
											{
												_target = _newtarget;
											};
										}
										else
										{
											_newtarget = [(leader _group),_group,_target,0] call DAC_fEnemyCond;
											if((_newtarget != _target) && (!(isNull _newtarget))) then
											{
												_target = _newtarget;
											};
										};
										if(_id == 0) then
										{
											if(_group in DAC_Cover_Groups) then
											{
												_run = 18;_go = 0;_id = 0;
											}
											else
											{
												_run = 2;_go = 0;
											};
										}
										else
										{
											_go = 0;_run = 13;
										};
									};
								};
							};
						};
					};
				};
		case 21:{
					//-----------------------------
					//#groupdown
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_WP - case21",time]};
					sleep 1;
					if((count _groupveh > 0) && (({alive _x} count units _group) == 0)) then {{DAC_VehicleInUse = DAC_VehicleInUse - [_x]} foreach _groupveh};
					if(count _jArray > 0) then {[35,_groupid,_group,"P",(leader (_jArray select 0)) distance player] spawn DAC_fShowRadio};
					_run = 0;		
				};
		Default{};
	};
};