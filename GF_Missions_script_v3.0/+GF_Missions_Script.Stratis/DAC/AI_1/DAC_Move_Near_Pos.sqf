//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_near_Pos     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_garray","_group","_wparray","_groupid","_maxrad","_zskill","_leader","_target","_ra","_EventList",
			"_kimodus","_timestep","_nextwp","_bgs","_allVeh","_firstwait","_newveh","_checktime","_call","_startid",
			"_checkpos","_wait","_jArray","_rndnr","_wpstart2","_nextpos","_checkpos1","_checkpos2","_waittime","_mz",
			"_emptyVeh","_nextbg","_maxpos","_coverval","_allZones","_knowsabout","_speedselect","_combatselect","_behavselect","_formselect","_unitcombat","_unitbehav","_oldskill","_wpCheck",
			"_unitspeed","_unitform","_bldgbehav","_joinbehav","_unitwait","_lastwp","_nextmp","_grouponfire","_eventid","_posarray","_numarray","_marker","_DAC_Arrays","_callg","_run","_go","_newtarget","_sum","_id"
		];
		
			_garray = _this select 0;_group = _garray select 0;_posarray = _this select 1;_wparray = (_posarray select 0);_numarray = (_posarray select 1);_marker = _garray select 1;_nextmp = [0,0];_EventList = [];_unitspeed = 0;
			_groupid = _this select 2;_maxrad = _this select 3;_leader = leader _group;_target = objNull;_ra = _maxrad / 2;_knowsabout = 0;_eventid = _garray select 2;_wpCheck = [];_allZones = (_posarray select 2);_wait = 0;
			_kimodus = 0;_timestep = time + 20;_nextwp = [(position _leader select 0),(position _leader select 1)];_bgs = [];_lastwp = _nextwp;_wpstart2 = [0,0];_jArray = [];_checktime = 0;_rndnr = 0;_speedselect = 0;
			_allVeh = [];_firstwait = 0;_newveh = objNull;_newtarget = objNull;_call = [];_id = 0;_startid = _this select 4;_callg = [];_waittime = 0;_coverval = 0;_nextpos = [];_checkpos1 = [];_checkpos2 = [];_combatselect = 0;
			_run = 1;_go = 0;_DAC_Arrays = ["DAC_Help_Groups","DAC_Hit_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Cover_Groups","DAC_Call_Groups"];_sum = 0;_emptyVeh = [];_nextbg = "";_maxpos = 0;_behavselect = 0;_joinbehav = 0;
			_formselect = 0;_unitcombat = 0;_unitbehav = 0;_unitwait = 0;_grouponfire = "";_checkpos = position (vehicle _leader);_mz = (_posarray select 3);
			_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
			_oldskill = ((getMarkerPos (_marker select 2)) select 1);_searcharea  = _maxrad;
			if(_maxrad < 50) then {_maxrad = 50};

_group setVariable ["dacData",[0,(position _leader)],false];
			
while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#waitforstart
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case1",time]};
					waituntil {(getdir DAC_StartDummy) > 170};
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(_eventid > 0) then
						{
							switch (_groupid) do
							{
								case 1:	{
											_EventList = ((([_eventid] call DAC_fConfigEvents) select 0) select 1);
										};
								case 2:	{
											_EventList = ((([_eventid] call DAC_fConfigEvents) select 1) select 1);
										};
								case 3:	{
											_EventList = ((([_eventid] call DAC_fConfigEvents) select 2) select 1);
										};
								default	{};
							};
						};	
						if(count _wparray == 0) then
						{
							_run = 21;
						}
						else
						{
							waituntil{DAC_NewZone == 0};
							sleep (random 1);
							_wpCheck = [[_wparray,_numarray,_allZones],_groupid] call DAC_fSumWaypoints;
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
								_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;_coverval = ((_zskill select 5) select 1);
								_unitform = _zskill select 4;_bldgbehav = _zskill select 8;_joinbehav = _zskill select 12;_emptyVeh = _zskill select 13;
								_unitwait = "((((_zskill select 7) select (_groupid - 1)) select 0) + (random (((_zskill select 7) select (_groupid - 1)) select 1)))";
								{call compile format["if(_group in %1) then {%1 = %1 - [_group]}",_x]}foreach _DAC_Arrays;_run = 2;
							};
						};
					};
				};
		case 2:	{
					//-----------------------------
					//#RandomStartPos
					//-----------------------------
					_go = 1;
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case2",time]};
					while {_go > 0} do
					{
						_nextwp = call compile (_wparray select 0);
						_nextpos = [(_nextwp select 0) + (_maxrad - (random (_maxrad * 2))),(_nextwp select 1) + (_maxrad - (random (_maxrad * 2))),0];
						if(!(surfaceIsWater _nextpos)) then {_go = 0;_run = 3};
						sleep 0.01;
					};	
				};
		case 3:	{
					//-----------------------------
					//#setbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case3",time]};
					{_x setunitpos "auto"}foreach units _group;
					_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));
					_speedselect  = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
					_behavselect  = (random ((count _unitbehav) - 1));_formselect   = (random ((count _unitform) - 1));
					_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
					_group setspeedmode (_unitspeed select _speedselect);_group setformation (_unitform select _formselect);
					_checkpos1 = ((position (vehicle _leader)) select 0) + ((position (vehicle _leader)) select 1);
					_checkpos2 = (_checkpos select 0) + (_checkpos select 1);
					_run = 4;_go = 1;
				};
		case 4:	{
					//-----------------------------
					//#move
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case4",time]};
					if(_go == 1) then
					{
						_checktime = time + (15 + random 3);_checkpos = position (vehicle _leader);
						_group setVariable ["dacData",[0,_nextpos],false];
						_group move _nextpos;
					};
					_go = 1;
					while {_go > 0} do
					{
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
							if((unitready (vehicle _leader)) && (_go == 1)) then {_go = 0;_run = 5};
							if((time > _checktime) && (_go == 1)) then {_go = 0;_run = 6};
						};
					};	
				};
		case 5:	{
					//-----------------------------
					//#waiting
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case5",time]};
					if((count _EventList) > 0) then {call compile (_EventList select 0)};
					if(_groupid == 1) then {[_leader,1] spawn DAC_fAISpeak;[0,(leader _group)] spawn DAC_fAIRadio;};
					_wait = time + (call compile _unitwait);
					_group setformdir (random 360);_go = 1;
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						_call = [_group,_leader,_marker,_timestep,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							_go = 0;
						}
						else
						{
							if((({alive _x} count units _group) <= _joinbehav) && (_groupid == 1) && (!(_group in DAC_Min_Groups))) then {_go = 0;_run = 7};
							if((_group in DAC_Cover_Groups) && (_go == 1)) then {_go = 0;_run = 18};
							if((time > _wait) && (_go > 0)) then
							{
								_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
								_go = 0;_run = 8;
							};
						};
					};		
				};
		case 6:	{
					//-----------------------------
					//#checkwp
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case6",time]};
					waituntil{DAC_NewZone == 0};
					_wpCheck = [[_wparray,_numarray,_allZones],_groupid] call DAC_fSumWaypoints;
					_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
					_wparray = ((_wpCheck select 0) select 0);
					if(_sum != (_wpCheck select 1)) then
					{
						_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
						[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;_run = 8;
					}
					else
					{
						if(_oldskill != ((getMarkerPos (_marker select 2)) select 1)) then
						{
							_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;_oldskill = ((getMarkerPos (_marker select 2)) select 1);
							_checkpos1 = ((position (vehicle _leader)) select 0) + ((position (vehicle _leader)) select 1);
							_checkpos2 = (_checkpos select 0) + (_checkpos select 1);
							if(((_zskill select 11) select 0) == 0) then {if(!(_group in DAC_No_Support)) then {DAC_No_Support set [count DAC_No_Support,_group]}};
							_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;
							_unitform = _zskill select 4;_bldgbehav = _zskill select 8;_joinbehav = _zskill select 12;_emptyVeh = _zskill select 13;
							_unitwait = "((((_zskill select 7) select (_groupid - 1)) select 0) + (random (((_zskill select 7) select (_groupid - 1)) select 1)))";
							_speedselect  = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
							_behavselect  = (random ((count _unitbehav) - 1));_formselect   = (random ((count _unitform) - 1));
							_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
							_group setspeedmode (_unitspeed select _speedselect);_group setformation (_unitform select _formselect);
						};
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
						{
							_run = 0;
						}
						else
						{
							if((((_checkpos2 - _checkpos1) < 2) && ((_checkpos2 - _checkpos1) > -2)) && ((speed vehicle _leader) < 3)) then
							{
								_run = 8;
							}
							else
							{
								_checktime = time + (7 + random 3);_checkpos = getPosATL (vehicle _leader);
								if(_run == 6) then {_run = 4;_go = 0};
							};
						};
					};
				};
		case 7:	{
					//-----------------------------
					//#joinGroup
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case7",time]};
					_jArray = [_group] call DAC_fFindGroup;
					if(count _jArray > 0) then
					{
						[_group,(_jArray select 0),1] spawn DAC_fRemoveGroup;
						_run = 21;
					}
					else
					{
						_run = 8;
					};	
				};
		case 8:	{
					//-----------------------------
					//#dynamicagain
					//-----------------------------
					sleep 0.01;
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case8",time]};
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
								sleep 0.01;
								if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
								{
									_go = 0;_run = 0;
								}
								else
								{
									_nextwp = call compile (_wparray select 0);
									_nextpos = [(_nextwp select 0) + (_maxrad - (random (_maxrad * 2))),(_nextwp select 1) + (_maxrad - (random (_maxrad * 2))),0];
									if(!(surfaceIsWater _nextpos)) then {_go = 0;_run = 3};
								};
							};
						};
					};
				};
		case 13:{
					//-----------------------------
					//#groupchangemove
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case13",time]};
					if(_groupid == 1) then {[_group,1,1] spawn DAC_fLeaveVehicle};
					if((_groupid < 3) || (_groupid == 5)) then {[_leader,2] spawn DAC_fAISpeak};
					if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
					[_group,_target] spawn DAC_fSetBehaviour;
					if(!(_group in DAC_Radio_Groups)) then {[17,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
					if((_target distance _leader) < ((call compile DAC_Alert_Dist) / 2)) then {{_x setunitpos "down"} foreach units _group} else {{_x setunitpos "auto"} foreach units _group};
					_waittime = time + call compile ((_zskill select 15) select 0);_run = 14;
				};
		case 14:{
					//-----------------------------
					//#groupwaitfortarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case14",time]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
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
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case16",time]};
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
						if((_groupid < 3) || (_groupid == 5)) then {[_leader,5] spawn DAC_fAISpeak;[11,(leader _group)] spawn DAC_fAIRadio;};
						_run = 2;
					};
				};
		case 17:{
					//-----------------------------
					//#groupmovetoenemy
					//-----------------------------
					sleep 0.1;
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case17",time]};
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
								[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;_run = 2;
							}
							else
							{
								{_x dowatch _target} foreach units _group;
								if(!(_group in DAC_Help_Groups)) then {DAC_Help_Groups set [count DAC_Help_Groups,_group]};
								if(_group in DAC_Hit_Groups) then {[20,_groupid,_group,"T",_target distance leader _group] spawn DAC_fShowRadio} else {[15,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
								[_garray,_target,_posarray,_groupid,_maxrad,_zskill] spawn DAC_fMovetoEnemy;
								if((_groupid < 3) || (_groupid == 5)) then {[_leader,3] spawn DAC_fAISpeak;[5,(leader _group)] spawn DAC_fAIRadio;};
								_run = 0;
							};
						};
					};
				};
		case 18:{
					//-----------------------------
					//#directmove
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case18",time]};
					_callg = [];_grouponfire = _group;
					if(_groupid == 1) then {[_group,1,1] spawn DAC_fLeaveVehicle};
					{if(side (leader _x ) == side leader _group) then {_callg set [count _callg,_x]}} foreach DAC_Call_Groups;
					if((count _callg) == 0) then
					{
						DAC_Cover_Groups = DAC_Cover_Groups - [_group];
						{_x setunitpos "auto"} foreach units _group;
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
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case20",time]};
					_go = 1;
					while {_go > 0} do
					{
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
									{_x commandmove (position _leader)}foreach (units _group);
									if((_group in DAC_Hit_Groups) && (_go == 1)) then {_go = 0;_run = 17};
									if(_go == 1) then
									{
										_newtarget = [_group,_target] call DAC_fCheckNewTarget;
										if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
										if(_id == 0) then
										{
											if(_group in DAC_Cover_Groups) then
											{
												_run = 16;_go = 0;_id = 0;
											}
											else
											{
												_run = 8;_go = 0;
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
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_near_pos - case21",time]};
					if(((count _allVeh) > 0) && (({alive _x} count units _group) == 0)) then {{DAC_VehicleInUse = DAC_VehicleInUse - [_x]} foreach _allVeh};
					if(count _jArray > 0) then {[35,_groupid,_group,"T",(leader (_jArray select 0)) distance _leader] spawn DAC_fShowRadio};
					_run = 0;		
				};
		Default{};
	};
};