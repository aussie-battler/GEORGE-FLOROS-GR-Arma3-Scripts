//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_to_Enemy     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private		[
				"_garray","_group","_marker","_target","_wparray","_groupid","_maxrad","_zskill","_emptyVeh"",_proVeh","_emptyGun","_proGun",
				"_targetpos","_leader","_run","_go","_speed","_comb","_behav","_vehvalue","_id","_newtarget","_cobj","_coverval","_tempID",
				"_startpos","_mindist","_maxdist","_range","_diff","_rgrad","_grad","_movepos","_checktime","_checkpos","_groupveh","_jArray",
				"_waittime","_searcharea","_searchcount","_troublepos","_wx","_wy","_start","_checkpos1","_checkpos2","_i","_unit","_rd",
				"_artibehav","_gunU","_gunA"
			];
		
				_garray = _this select 0;_group = _garray select 0;_marker = _garray select 1;_target = _this select 1;_coverval = 0;_tempID = 0;
				_wparray = _this select 2;_groupid = _this select 3;_maxrad = _this select 4;_zskill = _this select 5;_id = 1;_i = 0;_unit = objNull;_cobj = objNull;_groupveh = [];
				_targetpos = getPosATL vehicle _target;_leader = leader _group;_run = 1;_go = 0;_vehvalue = [];_newtarget = objNull;_gunU = objNull;_gunA = [];
				_startpos = [];_targetpos = position _target;_mindist = 0;_maxdist = 0;_range = 0;_diff = 0;_rgrad = 0;_grad = 0;_movepos = position _leader;_checktime = 0;_checkpos = position _leader;
				_waittime = 0;_searcharea = 0;_searchcount = 0;_troublepos = [];_wx = 0;_wy = 0;_start = 0;_checkpos1 = position _leader;_checkpos2 = position _leader;
				_speed = "limited";_comb = "yellow";_behav = "combat";_coverval = ((_zskill select 5) select 1);
				_emptyVeh = (((_zskill select 13) select 0) select 0);_proVeh = (((_zskill select 13) select 0) select 1);_joinbehav = _zskill select 12;_artibehav = ((_zskill select 11) select 1);
				_emptyGun = (((_zskill select 13) select 1) select 0);_proGun = (((_zskill select 13) select 1) select 1);_jArray = [];_rd = 0;

				if(count _this == 7) then {_vehvalue = _this select 6};
				{if((!(vehicle _x == _x)) && (!(vehicle _x in _groupveh))) then	{_groupveh = _groupveh + [vehicle _x]}}foreach units _group;
				if(({alive _x} count units _group) == 0) then {_run = 21};
				
_group setVariable ["dacData",[2,(position _leader)],false];
if(_groupid == 4) then {_groupid = 1;_tempID = 1};		

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#init
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case1",time]};
					if(!(_group in DAC_Fire_Groups)) then {DAC_Fire_Groups set [count DAC_Fire_Groups,_group]};
					if(_artibehav > 0) then
					{
						if(_leader in DAC_West_Units) then {if((_targetpos select 2) < 5) then {[_leader,6] spawn DAC_fAISpeak;[7,(leader _group)] spawn DAC_fAIRadio;[_leader,_target,_artibehav] spawn DAC_fCallArti}};
						if(_leader in DAC_East_Units) then {if((_targetpos select 2) < 5) then {[_leader,6] spawn DAC_fAISpeak;[7,(leader _group)] spawn DAC_fAIRadio;[_leader,_target,_artibehav] spawn DAC_fCallArti}};
					};
					_run = 2;
				};
		case 2:	{
					//-----------------------------
					//#selectbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case2",time]};
					if(not alive _leader) then
					{
						_run = 20;_go = 2;
					}
					else
					{
						[_group,_target] spawn DAC_fSetBehaviour;
						[_group,(_zskill select 14)] call DAC_fFindSpUnit;
						if((_leader distance _target) > 100) then {{_x setunitpos "auto"}foreach units _group} else {{_x setunitpos "middle"}foreach units _group};
						if((_groupid < 3) || (_groupid == 5)) then {[_leader,3] spawn DAC_fAISpeak;[5,(leader _group)] spawn DAC_fAIRadio;};
						_run = 4;
						if((position _leader select 2) > 5) then
						{
							waituntil {((position _leader select 2) < 5)};
						};
					};
				};
		case 4:	{
					//-----------------------------
					//#setmovepos
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case4",time]};
					_checktime = time + (15 + random 3);_checkpos = getPosATL vehicle _leader;
					if((({alive _x} count units _group) <= _joinbehav) && (_groupid < 3) && (!(_group in DAC_Min_Groups))) then
					{
						_run = 22;
					}
					else
					{
						if((_leader distance _target) < 50) then
						{
							_targetpos = getPosATL vehicle _target;_run = 6;
							_grad = (((_targetpos select 0) - (_checkpos select 0)) atan2 ((_targetpos select 1) - (_checkpos select 1)));
							_diff = (_leader distance _target);if(_grad < 0) then {_grad = _grad + 360};
							_mindist = (-(45 * (skill _leader)) + (random (90 * (skill _leader))));_maxdist = (_diff * (skill _leader));
							_movepos = [(_checkpos Select 0) + (Sin (_mindist) * _maxdist),(_checkpos Select 1) + (Cos (_mindist) * _maxdist),0];
							{_x lookAt _target} foreach units _group;
						}
						else
						{
							_go = 5;
							while {_go > 4} do
							{
								if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - SetMovePos",time]};
								sleep 0.5;
								if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
								{
									_run = 0;_go = 0;
								}
								else
								{
									if(not alive _leader) then
									{
										_run = 20;_go = 4;
									}
									else
									{
										_startpos = getPosATL vehicle _leader;_targetpos = getPosATL vehicle _target;
										_mindist = ((_leader distance _target) - ((_leader distance _target) / 2));
										_maxdist = ((_leader distance _target) - ((_leader distance _target) / 5));
										_range = (_mindist + ((skill _leader) * (_maxdist - _mindist)));_diff = 10 / (skill _leader);_rgrad = 0;
										if(_diff > 45) then {_rgrad = (random (2 * 45)) - 45} else {_rgrad = (random (2 * _diff)) - _diff};
										_grad = (((_targetpos select 0) - (_startpos select 0)) atan2 ((_targetpos select 1) - (_startpos select 1)) + _rgrad);
										if(_grad < 0) then {_grad = _grad + 360};
										_movepos = [(_startpos Select 0) + (Sin (_grad) * _range),(_startpos Select 1) + (Cos (_grad) * _range),0];
										if(!(surfaceIsWater _movepos)) then
										{
											_checktime = time + (15 + random 3);
											_checkpos = getPosATL vehicle _leader;_go = 0;
											_run = 6;
										};
									};
								};
							};
						};
					};
				};
		case 5:	{
					//disabled
				};
		case 6:	{
					//-----------------------------
					//#movetopos
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case6 - %2",time,_target]};
					if(_id == 1) then
					{
						_group setVariable ["dacData",[2,_movepos],false];
						_group move _movepos;
						[_group,(_zskill select 14)] call DAC_fFindSpUnit;
					}
					else
					{
						_id = 1;
					};
					_waittime = time + call compile ((_zskill select 15) select 0);_go = 7;
					[_group] spawn DAC_fForceSpeed;
					while {_go > 6} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - MoveToPos",time]};
						sleep (1 + (random 1));
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
						{
							_run = 0;_go = 0;
						}
						else
						{
							if(not alive _leader) then
							{
								_go = 6;_run = 20;
							}
							else
							{
								if([_group,_target] call DAC_fCheckTarget) then {_go = 0;_id = 1;_run = 7};
								if((unitready vehicle _leader) && (_go > 0)) then {_go = 0;_id = 3;_run = 7};
								if((time > _waittime) && (_go > 0)) then {_go = 0;_id = 4;_run = 7};
								if((time > _checktime) && (_go > 0)) then
								{
									_checktime = time + (20 + random 20);_checkpos = getPosATL vehicle _leader;_i = 0;_gunU = objNull;_gunA = [];
									if((_groupid == 1)
									&& (_emptyGun > 0)
									&& (({_x == vehicle _x} count units _group) > 0)
									&& (({alive _x} count units _group) > 1)) then
									{
										_veh = [_group,_emptyVeh,_emptyGun,0,_proGun,objNull,objNull] call DAC_fFindVehicle;
										if(!(isNull(_veh select 1))) then
										{
											while {_i < count units _group} do
											{
												_gunU = units _group select _i;
												if((not alive _gunU) || (_gunU == leader _group) || (_gunU != vehicle _gunU) || (_gunU in _gunA)) then
												{
													_i = _i + 1;
												}
												else
												{
													_gunA set [count _gunA,_gunU];_i = 100;
												};
											};
											if(!(isNull _gunU)) then
											{
												[_gunU,(_veh select 1),_marker,_coverval] spawn DAC_fEnterGun;
												[39,_groupid,_group,"T",(_veh select 1) distance _leader] spawn DAC_fShowRadio;
											};
										};
									};
									if(_groupid != 1) then
									{
										if((vehicle _leader distance _checkpos) < 5) then {_run = 9;_go = 0};
									};
									_group setVariable ["dacData",[2,_movepos],false];
									_group move _movepos;
								};
							};
						};
					};
				};
		case 7:	{
					//-----------------------------
					//#checkothertarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case7",time]};
					sleep 0.1;
					if(_id == 1) then
					{
						_run = 8;
					}
					else
					{
						if(_id == 3) then
						{
							_run = 4;_id = 1;
						}
						else
						{
							_newtarget = [(leader _group),_group,_target,0] call DAC_fEnemyCond;
							if((_newtarget != _target) && (!(isNull _newtarget))) then
							{
								if(_groupid == 1) then 
								{
									[(leader _group),3] spawn DAC_fAISpeak;
								};
								_target = _newtarget;_run = 4;_id = 1;
							}
							else
							{
								_run = 6;_id = 2;
							};
						};
					};
				};
		case 8:	{
					//-----------------------------
					//#queryothertarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case8",time]};
					sleep 0.1;
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(({alive _x} count units _group) == 0) then
						{
							_run = 20;_go = 1;
						}
						else
						{
							_newtarget = [(leader _group),_group,_target] call DAC_fEnemyCond;
							if((_newtarget == _target) || (isNull _newtarget)) then
							{
								_run = 9;
							}
							else
							{
								if(_groupid == 1) then 
								{
									[(leader _group),3] spawn DAC_fAISpeak;
								};
								_target = _newtarget;_run = 4;_id = 1;
								[14,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio;
							};
						};
					};
				};
		case 9:	{
					//-----------------------------
					//#seenothing
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case9",time]};
					sleep 0.1;
					if(_group in DAC_Fire_Groups) then {DAC_Fire_Groups = DAC_Fire_Groups - [_group]};
					if((_groupid == 2) || (_groupid == 3)) then
					{
						_run = 12;
					}
					else
					{
						if(((leader _group) distance _movepos) > 1500) then
						{
							_run = 12;
						}
						else
						{
							{_x setunitpos "auto"} foreach units _group;[12,(leader _group)] spawn DAC_fAIRadio;
							[19,_groupid,_group,"T",_target distance (leader _group)] spawn DAC_fShowRadio;
							_searcharea  = call compile ((_zskill select 10) select 0);
							_searchcount = (time + call compile ((_zskill select 10) select 1));
							_troublepos  = getPosATL _leader;_wx = _troublepos select 0;_wy = _troublepos select 1;
							_run = 10;_start = 0;
						};
					};
				};
		case 10:{
					//-----------------------------
					//#searchingtarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case10",time]};
					sleep 0.1;
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(({alive _x} count units _group) == 0) then
						{
							_run = 20;_go = 1;
						}
						else
						{
							_go = 1;_id = 0;
							while {_go > 0} do
							{
								if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - searchingtarget1",time]};
								sleep 0.1;


								if((((getMarkerSize (_marker select 0)) select 0) <= 4) || (({alive _x} count units _group) == 0)) then
								{
									_run = 21;_go = 0;
								}
								else
								{
									_movepos = [(_wx) + (_searcharea - (random (_searcharea * 2))),(_wy) + (_searcharea - (random (_searcharea * 2))),0];
									if(!(surfaceIsWater _movepos)) then
									{
										_go = 0;
									};
								};
							};
							if(!(_run == 21)) then
							{
								_group setVariable ["dacData",[3,_movepos],false];
								_group move _movepos;
								while {_go == 0} do
								{
									sleep (1 + (random 1));
									if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - searchingtarget2",time]};
									if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
									{
										_run = 21;_go = 1;
									}
									else
									{
										if(({alive _x} count units _group) == 0) then
										{
											_run = 20;_go = 1;
										}
										else
										{
											_newtarget = [(leader _group),_group,_target] call DAC_fEnemyCond;
											if((_newtarget == _target) || (isNull _newtarget)) then
											{
												if(time > _searchcount) then
												{
													_run = 12;_go = 1;
												}
												else
												{
													if(unitready (vehicle (leader _group))) then
													{
														_wx = _troublepos select 0;_wy = _troublepos select 1;
														_start = _start + 1;_run = 10;_go = 1;_i = 0;_gunU = objNull;_gunA = [];
														if((_groupid == 1)
														&& ((_emptyVeh > 0) || (_emptyGun > 0))
														&& (({_x == vehicle _x} count units _group) > 0)
														&& (({alive _x} count units _group) > 1)) then
														{
															_veh = [_group,_emptyVeh,_emptyGun,0,_proGun,objNull,objNull] call DAC_fFindVehicle;
															if(!(isNull(_veh select 1))) then
															{
																while {_i < count units _group} do
																{
																	_gunU = units _group select _i;
																	if((not alive _gunU) || (_gunU == leader _group) || (_gunU != vehicle _gunU) || (_gunU in _gunA)) then
																	{
																		_i = _i + 1;
																	}
																	else
																	{
																		_gunA set [count _gunA,_gunU];_i = 100;
																	};
																};
																if(!(isNull _gunU)) then
																{

																	[_gunU,(_veh select 1),_marker,_coverval] spawn DAC_fEnterGun;
																	[39,_groupid,_group,"T",(_veh select 1) distance _leader] spawn DAC_fShowRadio;
																};
															};
														};
													};
												};
											}
											else
											{
												_target = _newtarget;_run = 4;_id = 1;
												[14,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio;
												if((_groupid < 3) || (_groupid == 5)) then {[_leader,2] spawn DAC_fAISpeak};
												if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
											};
										};
									};
								};
							};
						};
					};
				};
		case 11:{
					//disabled
				};
		case 12:{
					//-----------------------------
					//#exitenemymove
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case12",time]};
					{_x setunitpos "auto"} foreach units _group;
					if(_groupid == 2) then {[22,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio} else {[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
					if(_groupid == 1) then {if(_tempID == 0) then {[_garray,_wparray,1,_maxrad,0] spawn DAC_fMoveToWaypoint} else {[_garray,_posarray,1,_maxrad,0] spawn DAC_fMoveNear};[13,(leader _group)] spawn DAC_fAIRadio};
					if(_groupid == 2) then {[_garray,_wparray,2,_maxrad,0,_vehvalue] spawn DAC_fMoveWithVH};
					if(_groupid == 3) then {[_garray,_wparray,3,_maxrad,0] spawn DAC_fMoveWithTank};
					if(_groupid == 6) then {_run = 22} else {_run = 0};
				};
		case 20:{
					//-----------------------------
					//#Break
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case20",time]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - Break",time]};
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
								if((({alive _x} count units _group) <= _joinbehav) && (_groupid < 3) && (!(_group in DAC_Min_Groups))) then
								{
									_go = 0;_run = 22;
								}
								else
								{
									if(!(leader _group == _leader)) then
									{
										_leader = leader _group;
										_newtarget = [_group,_target] call DAC_fCheckNewTarget;

										if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
										if(_id == 0) then
										{
											_run = 9;_go = 0;
										}
										else
										{
											_run = 4;_go = 0;
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
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case21",time]};
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{

						if((count _this == 7) && (_groupid != 6) && (({alive _x} count units _group) == 0)) then
						{
							if(count _vehvalue > 0) then {{DAC_VehicleInUse = DAC_VehicleInUse - [(_x select 0)]} foreach _vehvalue};
						};
						if(count _groupveh > 0) then {{DAC_VehicleInUse = DAC_VehicleInUse - [_x]} foreach _groupveh};
						_run = 0;
					};
				};
		case 22:{
					//-----------------------------
					//#joinGroup
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - case12",time]};
					_searcharea  = call compile ((_zskill select 10) select 0);_go = 1;
					_searchcount = (time + call compile ((_zskill select 10) select 1));
					_troublepos  = getPosATL _leader;_wx = _troublepos select 0;_wy = _troublepos select 1;
					_movepos = [(_wx) + (_searcharea - (random (_searcharea * 2))),(_wy) + (_searcharea - (random (_searcharea * 2))),0];
					if(surfaceIsWater _movepos) then {_go = 0;sleep 1} else {_group move _movepos};
					if(_go > 0) then
					{
						while {_go > 0} do
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Enemy - joingroup",time]};
							if((((getMarkerSize (_marker select 0)) select 0) <= 4)
							|| ((({alive _x} count units _group) == 0))) then {_go = 0;_run = 21};
							if((unitready vehicle _leader) && (_go > 0)) then
							{
								_jArray = [_group] call DAC_fFindGroup;
								if(count _jArray > 0) then
								{
									[_group,(_jArray select 0),1] spawn DAC_fRemoveGroup;
									if(!(isNull _target)) then {_group reveal _target};
									[35,_groupid,_group,"P",(leader (_jArray select 0)) distance player] spawn DAC_fShowRadio;
									_run = 0;_go = 0;
								}
								else
								{
									_go = 0;
								};
							}
							else
							{
								sleep (1 + (random 0.5));
							};
						};
					};
				};
		Default	{};
	};
};