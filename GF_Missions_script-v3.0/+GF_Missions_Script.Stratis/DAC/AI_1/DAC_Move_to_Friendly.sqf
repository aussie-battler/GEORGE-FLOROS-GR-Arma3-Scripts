//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_to_Friendly  //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private		[
				"_garray","_group","_marker","_grouponfire","_wparray","_groupid","_maxrad","_zskill","_vehvalue","_act",
				"_leader","_sidearray","_firemark","_firePos","_target","_cg","_sg","_skillgroup","_waittime","_coverval",
				"_radfaktor","_troublepos","_callg","_cx","_cy","_movepos","_searcharea","_groupveh","_id","_checktime","_unitwait","_tempID",
				"_searchcount","_wx","_wy","_start","_speed","_comb","_behav","_newtarget","_helo","_run","_go","_sc","_searchwait","_jArray"
			];
			
				_garray = _this select 0;_group = _garray select 0;_marker = _garray select 1;_grouponfire = _this select 1;
				_wparray = _this select 2;_groupid = _this select 3;_maxrad = _this select 4;_zskill = _this select 5;_sc = [];
				_vehvalue = [];_leader = leader _group;_sidearray = ["East","West"];_firemark = position (leader _grouponfire);_tempID = 0;
				_target = objNull;_cg = 0;_sg = 0;_skillgroup = 0;_waittime = 0;_radfaktor = 0;_troublepos = _firemark;_callg = [];_helo = objNull;
				_cx = 0;_cy = 0;_movepos = [0,0,0];_searcharea = 0;_searchcount = 0;_wx = 0;_wy = 0;_start = 0;_id = 0;_checktime = 1;_act = true;
				_speed = "";_comb = "";_behav = "";_newtarget = objNull;_run = 1;_go = 1;_firePos = objNull;_groupveh = [];_coverval = 0;_searchwait = 0;_jArray = [];

_group setVariable ["dacData",[1,(position _leader)],false];
if(_groupid == 4) then {_groupid = 1;_tempID = 1};
				
if(count _this == 7) then
{
	_vehvalue = _this select 6;
	if(_groupid != 2) then {_helo = _vehvalue select 0};
};

_coverval = ((_zskill select 5) select 1);
{if((!(vehicle _x == _x)) && (!(vehicle _x in _groupveh))) then	{_groupveh = _groupveh + [vehicle _x]}}foreach units _group;
_unitwait = "((((_zskill select 7) select (_groupid - 1)) select 0) + (random (((_zskill select 7) select (_groupid - 1)) select 1)))";

if(format["%1",_grouponfire getVariable "support_pos"] != "<NULL>") then {_firemark = _grouponfire getVariable "support_pos"};

if(!(isNil "DAC_Support_Logic")) then
{
	_sc = (DAC_Support_Logic getVariable "support_caller");
	if(count _sc > 0) then
	{
		{if(_x in DAC_Call_Groups) then {DAC_Call_Groups = DAC_Call_Groups - [_x]}}foreach _sc;
		DAC_Support_Logic setVariable ["support_caller", [], true];
	};
};

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#checkdistance
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case1",time]};
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - CheckDistance",time]};
						sleep 0.01;
						if((count DAC_Fire_Pos) == 0) then
						{
							_run = 2;_go = 0;
						}
						else
						{
							_firePos = DAC_Fire_Pos select (random ((count DAC_Fire_Pos) - 1));
							if(side _firePos != side _leader) then
							{
								if((_leader distance _firePos) < (_leader distance _firemark)) then
								{
									_firemark = position _firePos;
								};
								_run = 2;_go = 0;
							}
							else
							{
								_run = 2;_go = 0;
							};
						};
					};
				};
		case 2:	{
					//-----------------------------
					//#readskill
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case2",time]};
					_cg = 0;_sg = 0;
					if((((getMarkerSize (_marker select 0)) select 0) <= 4)
					|| (({alive _x} count units _group) == 0)) then
					{
						_run = 21;_go = 0;
					}
					else
					{
						{if(alive _x) then {_cg = _cg + 1;_sg = _sg + skill _x}} foreach units _group;
						_skillgroup = _sg / _cg;_radfaktor = ((48 / DAC_AI_Level) / _skillgroup);
						_run = 3;
					};
				};
		case 3:	{
					//-----------------------------
					//#timetogo
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case3",time]};
					if(_groupid == 6) then
					{
						_cx = _firemark select 0;_cy = _firemark select 1;
						_movepos = [(_cx) + random ((2 * _radfaktor) - _radfaktor), (_cy) + random ((2 * _radfaktor) - _radfaktor),0];
						_firemark = _movepos;_go = 1;
						while {_go > 0} do
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - TimeToGo",time]};
							sleep (0.5 + (random 0.2));
							if((((getMarkerSize (_marker select 0)) select 0) <= 4)
							|| (({alive _x} count units _group) == 0)) then
							{
								_run = 21;_go = 0;
							}
							else
							{
								if(_leader in _helo) then
								{
									sleep 0.5;
								}
								else
								{
									if((position _leader select 2) < 5) then {_go = 0;_run = 4};
								};
							};
						};
					}
					else
					{
						if((((getMarkerSize (_marker select 0)) select 0) <= 4)
						|| (({alive _x} count units _group) == 0)) then
						{
							_run = 21;_go = 0;
						}
						else
						{
							if((getpos _leader select 2) < 5) then {[21,_groupid,_group,"T",(leader _grouponfire) distance _leader] spawn DAC_fShowRadio};
							_cx = _firemark select 0;_cy = _firemark select 1;_run = 4;_go = 0;_id = 0;
							_movepos = [(_cx) + random ((2 * _radfaktor) - _radfaktor), (_cy) + random ((2 * _radfaktor) - _radfaktor),0];_firemark = _movepos;
						};
					};
				};
		case 4:	{
					//-----------------------------
					//#setbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case4",time]};
					_group setcombatmode "yellow";_group setbehaviour "aware";_group setspeedmode "full";
					{_x setunitpos "up"} foreach units _group;{_x allowfleeing 0} foreach units _group;_run = 5;
				};
		case 5:	{
					//-----------------------------
					//#movetofirepos
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case5",time]};
					_go = 1;_checktime = time + (15 + random 3);_checkpos = getPosATL vehicle _leader;
					_group setVariable ["dacData",[1,_movepos],false];
					_group move _movepos;
					[_group] spawn DAC_fForceSpeed;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - MoveToFirepos",time]};
						sleep (1 + (random 0.5));
						_call = [_group,_leader,_marker,0,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							if(_run == 17) then {_run = 12};
							if(_run == 13) then {_run = 8};
							_go = 0;
						}
						else
						{
							if(unitready (vehicle _leader)) then
							{
								_go = 0;_run = 6;
							}
							else
							{
								if(time > _checktime) then
								{
									if((vehicle _leader distance _checkpos) < 5) then {_run = 6;_go = 0};
								};
							};
						};
					};
				};
		case 6:	{
					//-----------------------------
					//#seenothing
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case6",time]};
					{_x setunitpos "auto"} foreach units _group;
					if(_group in DAC_Cover_Groups) then {DAC_Cover_Groups = DAC_Cover_Groups - [_group]};
					_leader = leader _group;
					if((_groupid == 2) || (_groupid == 3)) then
					{
						_run = 13;
					}
					else
					{
						_troublepos = position (leader _group);[12,(leader _group)] spawn DAC_fAIRadio;
						[19,_groupid,_group,"T",(leader _grouponfire) distance _leader] spawn DAC_fShowRadio;
						_searcharea  = call compile ((_zskill select 10) select 0);
						_searchcount = (time + call compile ((_zskill select 10) select 1));
						_wx = _troublepos select 0;_wy = _troublepos select 1;
						_run = 7;_start = 0;
					};
				};
		case 7:	{
					//-----------------------------
					//#searchingtarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case7",time]};
					_go = 1;_id = 0;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - SearchingTarget1",time]};
						sleep 0.1;
						if((((getMarkerSize (_marker select 0)) select 0) <= 4) || (({alive _x} count units _group) == 0)) then
						{
							_run = 21;_go = 0;
						}
						else
						{
							_firemark = [(_wx) + (_searcharea - (random (_searcharea * 2))),(_wy) + (_searcharea - (random (_searcharea * 2))),0];
							if(!(surfaceIsWater _firemark)) then
							{
								_go = 0;
							};
						};
					};
					if(!(_run == 21)) then
					{
						_group setVariable ["dacData",[3,_firemark],false];
						_group move _firemark;
						while {_go == 0} do
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - SearchingTarget2",time]};
							sleep (1 + (random 1));
							if((((getMarkerSize (_marker select 0)) select 0) <= 4) || (({alive _x} count units _group) == 0)) then
							{
								_run = 21;_go = 0;
							}
							else
							{
								_newtarget = [(leader _group),_group,_target] call DAC_fEnemyCond;
								if((_newtarget == _target) || (isNull _newtarget)) then
								{
									if(time > _searchcount) then
									{
										_run = 13;_go = 1;
									}
									else
									{
										if(unitready (vehicle _leader)) then
										{
											_searchwait = time + random (call compile _unitwait);_act = true;
											if(({(vehicle _x) == _x} count (units _group)) > 0) then
											{
												if(format["%1",(behaviour _leader)] != "CARELESS") then {{_x setunitpos "auto"} foreach units _group};
											};
											while{_act} do
											{
												sleep 1;
												if(time > _searchwait) then
												{
													_act = false;
												}
												else
												{
													_newtarget = [(leader _group),_group,_target] call DAC_fEnemyCond;
													if((_newtarget == _target) || (isNull _newtarget)) then {/*nothing*/} else {_target = _newtarget;_run = 8;_go = 1;_act = false};
												};
											};
											if(_run != 8) then
											{
												_wx = _troublepos select 0;_wy = _troublepos select 1;
												_start = _start + 1;_run = 7;_go = 1;
											};
										};
									};
								}
								else
								{
									_target = _newtarget;_run = 8;_go = 1;
								};
							};
						};
					};
				};
		case 8:	{
					//-----------------------------
					////#selectbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case8",time]};
					if((_groupid < 3) || (_groupid == 5)) then
					{
						[_leader,2] spawn DAC_fAISpeak;
						if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
						if(_groupid in [1,2]) then {[_group] spawn DAC_fLeaveVehicle};
					};
					[_group,_target] spawn DAC_fSetBehaviour;
					if(!(_group in DAC_Radio_Groups)) then {[17,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio};
					if((_target distance _leader) < ((call compile DAC_Alert_Dist) / 2)) then {{_x setunitpos "down"} foreach units _group} else {{_x setunitpos "auto"} foreach units _group};
					_waittime = time + call compile ((_zskill select 15) select 0);_run = 9;
				};
		case 9:	{
					//-----------------------------
					////#groupwaitfortarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case9",time]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - WaitingForTarget",time]};
						sleep (1 + (random 1));
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 0;_run = 0};
						if((({alive _x} count units _group) == 0) && (_go == 1)) then {_go = 0;_run = 21};
						if((_group in DAC_Hit_Groups) && (_go == 1)) then {_go = 0;_run = 12};
						if(_go == 1) then
						{
							_newtarget = [_group,_target] call DAC_fCheckNewTarget;
							if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
							if((time > _waittime) || (_id == 0)) then
							{
								{_x setunitpos "auto"} foreach units _group;
								_go = 0;_run = 10;
							};
						};
					};
				};
		case 10:{
					//-----------------------------
					////#querytarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case10",time]};
					if(_id > 0) then
					{
						if(!([_group,_target] call DAC_fCheckTarget)) then
						{
							_run = 12;
						};
					};
					if(_run == 10) then
					{
						if(_group in DAC_Hit_Groups) then {DAC_Hit_Groups = DAC_Hit_Groups - [_group]};
						if(_group in DAC_Call_Groups) then {DAC_Call_Groups = DAC_Call_Groups - [_group]};
						{_x setunitpos "auto"} foreach units _group;
						[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
						if((_groupid < 3) || (_groupid == 5)) then {[_leader,5] spawn DAC_fAISpeak;[11,(leader _group)] spawn DAC_fAIRadio;};
						_run = 3;_id = 0;
					};
				};
		case 11:{
					//disabled;
				};
		case 12:{
					//-----------------------------
					////#groupmovetoenemy
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case12",time]};
					sleep 0.1;
					if((((getMarkerSize (_marker select 0)) select 0) <= 4) || (({alive _x} count units _group) == 0)) then
					{
						_run = 21;_go = 0;
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
							[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;_run = 4;
						}
						else
						{
							if(_groupid == 2) then {{if(_x != gunner (vehicle _x)) then {unassignvehicle _x;[_x] ordergetin false}} foreach units _group;[2,(leader _group)] spawn DAC_fAIRadio};
							{_x dowatch _target;_x setunitpos "auto"} foreach units _group;
							if(!(_group in DAC_Help_Groups)) then {DAC_Help_Groups set [count DAC_Help_Groups,_group]};
							if(_group in DAC_Hit_Groups) then {[20,_groupid,_group,"T",_target distance leader _group] spawn DAC_fShowRadio} else {[15,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio};
							if(count _this == 7) then {[_garray,_target,_wparray,_groupid,_maxrad,_zskill,_vehvalue] spawn DAC_fMoveToEnemy} else {[_garray,_target,_wparray,_groupid,_maxrad,_zskill] spawn DAC_fMoveToEnemy};
							if(!(isNil "DAC_Support_Logic")) then
							{
								_sc = (DAC_Support_Logic getVariable "support_groups");
								if(_group in _sc) then
								{
									_sc = _sc - [_group];
									DAC_Support_Logic setVariable ["support_groups", _sc, true];
								};
							};
							_run = 0;
						};
					};
				};
		case 13:{
					//-----------------------------
					////#exitenemymove
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case13",time]};
					{_x setunitpos "auto"} foreach units _group;
					if(_groupid == 2) then {[22,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio} else {[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
					if(_groupid == 1) then {if(_tempID == 0) then {[_garray,_wparray,1,_maxrad,0] spawn DAC_fMoveToWaypoint} else {[_garray,_wparray,1,_maxrad,0] spawn DAC_fMoveNear};[13,(leader _group)] spawn DAC_fAIRadio};
					if(_groupid == 2) then {[_garray,_wparray,2,_maxrad,0,_vehvalue] spawn DAC_fMoveWithVH};
					if(_groupid == 3) then {[_garray,_wparray,3,_maxrad,0] spawn DAC_fMoveWithTank};
					if(_groupid == 6) then {_run = 16} else {_run = 0};
					if(!(isNil "DAC_Support_Logic")) then
					{
						_sc = (DAC_Support_Logic getVariable "support_groups");
						if(_group in _sc) then
						{
							_sc = _sc - [_group];
							DAC_Support_Logic setVariable ["support_groups", _sc, true];
						};
					};
				};
		case 16:{
					//-----------------------------
					//#joinGroup
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_VH - case12",time]};
					_go = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_VH - joingroup",time]};
						if((((getMarkerSize (_marker select 0)) select 0) <= 4) || (({alive _x} count units _group) == 0)) then
						{
							_run = 21;_go = 0;
						}
						else
						{
							if(_go > 0) then
							{
								_jArray = [_group] call DAC_fFindGroup;
								if(count _jArray > 0) then
								{
									[_group,(_jArray select 0),1] spawn DAC_fRemoveGroup;
									[35,_groupid,_group,"P",(leader (_jArray select 0)) distance player] spawn DAC_fShowRadio;
									_run = 0;_go = 0;
								}
								else
								{
									sleep (1 + (random 0.5));
								};
							};
						};
					};
				};
		case 20:{
					//-----------------------------
					////#Break
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case14",time]};
					_go = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - Break",time]};
						sleep (0.2 + (random 0.2));
						if((((getMarkerSize (_marker select 0)) select 0) <= 4) || (({alive _x} count units _group) == 0)) then
						{
							_run = 21;_go = 0;
						}
						else
						{
							if(!(leader _group == _leader)) then
							{
								_leader = leader _group;
								if(count _groupveh > 0) then {_groupveh = [_groupveh] call DAC_fCheckCrew};
								{if(_x != leader _group) then {_x commandmove (position _leader)}} foreach units _group;
								if((_group in DAC_Hit_Groups) && (_go == 1)) then {_go = 0;_run = 12};
								
								if(_go == 1) then
								{
									_newtarget = [_group,_target] call DAC_fCheckNewTarget;
									if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
									if(_id == 0) then
									{
										_run = 3;_go = 0;
									}
									else
									{
										_go = 0;_run = 8;
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
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Friendly - case21",time]};
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if((count _this == 7) && (_groupid != 6)) then {{DAC_VehicleInUse = DAC_VehicleInUse - [(_x select 0)]} foreach _vehvalue};
						if(count _groupveh > 0) then {{DAC_VehicleInUse = DAC_VehicleInUse - [_x]} foreach _groupveh};
						_run = 0;
					};
					if(!(isNil "DAC_Support_Logic")) then
					{
						_sc = (DAC_Support_Logic getVariable "support_groups");
						if(_group in _sc) then
						{
							_sc = _sc - [_group];
							DAC_Support_Logic setVariable ["support_groups", _sc, true];
						};
					};
				};
		Default	{};
	};
};