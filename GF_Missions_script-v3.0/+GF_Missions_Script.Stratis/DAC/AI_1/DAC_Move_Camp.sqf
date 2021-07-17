//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_Camp         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_garray","_group","_marker","_wparray","_groupid","_camparray","_grouparray","_groupside",
			"_leader","_campzone","_campmodus","_campspawn","_spawncount","_target","_knowsabout","_unitwait",
			"_movepos","_setDG","_zskill","_buildingA","_buildingB","_buildingC","_buildingD","_buildingE","_EventList",
			"_buildingX","_MarkerF","_speedselect","_combatselect","_behavselect","_formselect","_unitcombat",
			"_unitbehav","_unitspeed","_unitform","_jArray","_explo","_carscrew","_ver","_id","_unitrad","_eventid",
			"_campObjects","_i","_rCamp","_tempcamp","_thisCamp","_wait","_waittime","_DAC_Arrays","_looktime","_rd",
			"_emptyVeh","_proVeh","_emptyGun","_proGun","_curV","_curG","_coverval","_newtarget","_gunU","_gunA"
		];
		
			_garray = _this select 0;_group = _garray select 0;_marker = _garray select 1;_wparray = _this select 1;_eventid = _garray select 2;
			_groupid = _this select 2;_camparray = _this select 3;_grouparray = _this select 4;_groupside = _this select 5;
			_leader = leader _group;_campzone = _grouparray select 0;_campmodus = _grouparray select 2;_campspawn = _grouparray select 3;
			_spawncount = _grouparray select 4;_target = objNull;_movepos = position _leader;_coverval = 0;
			_setDG = _camparray select 7;_buildingA = _camparray select 1;_buildingB = _camparray select 2;_buildingC = _camparray select 0;
			_buildingD = _camparray select 3;_buildingE = _camparray select 4;_MarkerF = _camparray select 5;_buildingX = _camparray select 6;
			_EventList = [];_campObjects = [_buildingA,_buildingB,_buildingC,_buildingD];{_campObjects = _campObjects + [_x]} foreach _buildingE;
			{_campObjects = _campObjects + [_x]} foreach _buildingX;_i = 0;_go = 1;_run = 1;_ver = 0;_id = 0;_unitrad = 0;_tempcamp = "";_thisCamp = "";
			_DAC_Arrays = ["DAC_Hit_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Call_Groups"];_looktime = 0;_rd = 0;_gunA = [];_jArray = [];
			_emptyVeh = 0;_proVeh = 0;_emptyGun = 0;_proGun = 0;_curV = objNull;_curG = objNull;_newtarget = objNull;_gunU = objNull;
					
			_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;

_group setVariable ["dacData",[0,(position _leader)],false];
			
while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#startcamp
					//-----------------------------
					waituntil {((getdir DAC_StartDummy) > 170)};
					if(_eventid > 0) then {_EventList = ((([_eventid] call DAC_fConfigEvents) select 4) select 1)};
					switch (_groupside) do
					{
						case 0:	{_rCamp = call compile format["DAC_Spawn_CampsE"]};
						case 1:	{_rCamp = call compile format["DAC_Spawn_CampsW"]};
						case 2:	{
									if(DAC_Res_Side == 0) then
									{
										_rCamp = call compile format["DAC_Spawn_CampsE"];
									}
									else
									{
										_rCamp = call compile format["DAC_Spawn_CampsW"];
									};
								};
						default	{};
					};
					_run = 2;_i = 0;
				};
		case 2:	{
					//-----------------------------
					//#findcamp
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Camp - case2",time]};
					while {_i < count _rCamp} do
					{
						_tempcamp = ((_rCamp select _i) select 1);_thisCamp = (_rCamp select _i);
						if(_buildingA == _tempcamp) then {_i = count _rCamp;_ver = 1};
						_i = _i + 1;
					};
					if(_ver == 0) then
					{
						player groupchat "Error DAC_Move_Camp: Camp not found";
						_run = 0;
					}
					else
					{
						_run = 3;
					};
				};
		case 3:	{
					//-----------------------------
					//#setskill
					//-----------------------------
					_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;_unitform = _zskill select 4;
					_unitwait = "((((_zskill select 7) select (_groupid - 1)) select 0) + (random (((_zskill select 7) select (_groupid - 1)) select 1)))";
					_unitrad = _grouparray select 1;_knowsabout = ((DAC_KnowsAbout + 2.4) - (skill _leader * 2));_run = 4;_coverval = ((_zskill select 5) select 1);
					_emptyVeh = (((_zskill select 13) select 0) select 0);_proVeh = (((_zskill select 13) select 0) select 1);
					_emptyGun = (((_zskill select 13) select 1) select 0);_proGun = (((_zskill select 13) select 1) select 1);
				};
		case 4:	{
					//-----------------------------
					//#newwp
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Camp - newwp",time]};
					_speedselect = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
					_behavselect = (random ((count _unitbehav) - 1));_formselect = (random ((count _unitform) - 1));
					_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
					_group setspeedmode (_unitspeed select _speedselect);_group setformation (_unitform select _formselect);
					_go = 1;_leader = leader _group;
					while {_go > 0} do
					{
						_movepos = [(getPosATL _buildingA select 0) + random (2 * _unitrad) - _unitrad,(getPosATL _buildingA select 1) + random (2 * _unitrad) - _unitrad,0];
						if((({((_movepos distance _x) < 5)} count _campObjects) > 0) || (surfaceIsWater (_movepos))) then
						{
							sleep 0.01;
						}
						else
						{
							_run = 5;_go = 0;
						};
					};
					
				};
		case 5:	{
					//-----------------------------
					//#patrol
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Camp - patrol",time]};
					_group setVariable ["dacData",[0,_movepos],false];
					_group move _movepos;
					_go = 1;_looktime = time + (5 + random 3);
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						_call = [_group,_leader,_marker,0,_groupid] call DAC_fSomeConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							if(_run == 20) then {_run = 14};
							if(_run == 17) then {_run = 7};
							if(_run == 13) then {_run = 7};
							if(_run == 21) then {_run = 13};
							_go = 0;
						}
						else
						{
							if(_run == 5) then
							{
								if((unitready _leader) && (_go == 1)) then
								{
									_go = 0;_run = 6;
								}
								else
								{
									if(time > _looktime) then
									{
										_looktime = time + (5 + random 3);
										{
											if((_x != (vehicle _x)) && (_x == (gunner (vehicle _x)))) then
											{
												if(!(vehicle _x in DAC_Arti_Veh)) then
												{
													_rd = random 360;if(!((vehicle _x) in DAC_Arti_Veh)) then {_x lookat [(position _x Select 0) + (Sin (_rd) * 500),(position _x Select 1) + (Cos (_rd) * 500),50]};
												};
											};
										}	foreach units _group;
									};
								};
							};
						};
					};
				};
		case 6:	{
					//-----------------------------
					//#waiting
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Camp - waiting",time]};
					if((count _EventList) > 0) then {call compile (_EventList select 0)};
					_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
					if((behaviour (leader _group)) != "CARELESS") then {{_x setunitpos "auto"} foreach units _group};
					_wait = time + (call compile _unitwait);_go = 1;
					sleep 0.5;
					if(_setDG == 1) then {_buildingA setdammage 0;_buildingB setdammage 0};
					if((((_thisCamp select 5) select 0) <= 0) && ((DAC_AI_Spawn select 5) == 0)) then
					{
						_run = 12;
					}
					else
					{
						while {_go > 0} do
						{
							sleep (1 + (random 1));
							_call = [_group,_leader,_marker,0,_groupid] call DAC_fSomeConditions;
							if((count _call) > 0) then
							{
								_run = (_call select 0);_target = (_call select 1);
								if(_run == 20) then {_run = 14};
								if(_run == 17) then {_run = 7};
								if(_run == 13) then {_run = 7};
								if(_run == 21) then {_run = 13};
								_go = 0;
							}
							else
							{
								if(_run == 6) then
								{
									if(time > _wait) then
									{
										if((_emptyGun > 0) && (({((_x == vehicle _x) && (alive _x))} count units _group) > 1)) then
										{
											_go = 0;_run = 11;
										}
										else
										{
											_go = 0;_run = 4;
										};
									};
								};
							};
						};
					};
				};
		case 7:	{
					//-----------------------------
					//#groupchangemove
					//-----------------------------
					[_leader,2] spawn DAC_fAISpeak;
					if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
					[_group,_target] spawn DAC_fSetBehaviour;
					if(!(_group in DAC_Radio_Groups)) then {[17,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
					if((_target distance _leader) < ((call compile DAC_Alert_Dist) / 2)) then {{_x setunitpos "down"} foreach units _group} else {{_x setunitpos "auto"} foreach units _group};
					_waittime = time + call compile ((_zskill select 15) select 0);_run = 8;
				};
		case 8:	{
					//-----------------------------
					//#groupwaitfortarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Camp - waitfortarget",time]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 0;_run = 0};
						if((({alive _x} count units _group) == 0) && (_go == 1)) then {_go = 0;_run = 13};
						
						if(_go == 1) then
						{
							_newtarget = [_group,_target] call DAC_fCheckNewTarget;
							if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
							if(_id == 0) then
							{
								{_x setunitpos "auto"} foreach units _group;
								{call compile format["if(_group in %1) then {%1 = %1 - [_group]}",_x]}foreach _DAC_Arrays;
								_go = 0;_run = 4;
							}
							else
							{
								if(time > _waittime) then
								{
									if((_emptyGun > 0) && (({((_x == vehicle _x) && (alive _x))} count units _group) > 1)) then
									{
										_go = -1;_run = 11;
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
		case 11:{
					//-----------------------------
					//#findemptygun
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Camp - findemptygun",time]};
					_veh = [_group,_emptyVeh,_emptyGun,_proVeh,_proGun,_curV,_curG] call DAC_fFindVehicle;
					_curV = (_veh select 2);_curG = (_veh select 3);_i = 0;_gunU = objNull;
					if(isNull(_veh select 1)) then
					{
						if(_go == 0) then
						{
							_run = 4;_go = 0;
						}
						else
						{
							_run = 8;_go = 0;
						};
					}
					else
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
						if(_go == 0) then
						{
							_run = 4;_go = 0;
						}
						else
						{
							_run = 8;_go = 0;
						};
					};
				};
		case 12:{
					//-----------------------------
					//#leavecamp
					//-----------------------------
					_go = 1;
					sleep 1;
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_Camp - leavecamp",time]};
					{unassignvehicle _x;[_x] ordergetin false} foreach (units _group);[2,(leader _group)] spawn DAC_fAIRadio;
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						if(!(_buildingA in DAC_Camps_InUse)) then
						{
							_go = 0;
						};
					};
					sleep 1;
					_go = 1;
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						if(({alive _x} count units _group) == 0) then
						{
							_go = 0;
						}
						else
						{
							_jArray = [_group] call DAC_fFindGroup;
							if(count _jArray > 0) then
							{
								[_group,(_jArray select 0),1] spawn DAC_fRemoveGroup;
								[31,_groupid,_group,"P",(leader (_jArray select 0)) distance player] spawn DAC_fShowRadio;
								_go = 0;
							};
						};
					};
					if((DAC_AI_Spawn select 3) == 0) then
					{
						_run = 0;
					}
					else
					{
						sleep (DAC_AI_Spawn select 3);
						_go = 1;_i = 0;
						while {_i < count _buildingX} do
						{
							_explo = "Sh_122_HE" createvehicle (position (_buildingX select _i));
							(_buildingX select _i) setdamage 1;
							sleep (0.1 + (random 3));
							_i = _i + 1;
						};
						sleep (0.2 + (random 0.2));
						{if((_x iskindof "Car") || (_x iskindof "Tank")) then {DAC_VehicleInUse = DAC_VehicleInUse - [_x]}}foreach _buildingX;
						if(count _MarkerF > 0) then {deletemarkerlocal (_MarkerF select 0)};
						_buildingD inflame false;_buildingC setFlagTexture "";
						_run = 0;
					};
				};
		case 13:{
					//-----------------------------
					//#EndCamp
					//-----------------------------
					if((DAC_AI_Spawn select 3) == 0) then
					{
						{if((_x iskindof "Car") || (_x iskindof "Tank")) then {DAC_VehicleInUse = DAC_VehicleInUse - [_x]}}foreach _buildingX;_run = 0;
					}
					else
					{
						_i = 0;
						sleep (DAC_AI_Spawn select 3);
						while {_i < count _buildingX} do
						{
							_explo = "Sh_122_HE" createvehicle (position (_buildingX select _i));
							(_buildingX select _i) setdamage 1;
							sleep (0.1 + (random 3));
							_i = _i + 1;
						};	
						sleep (2 + (random 1));
						{if((!(_x iskindof "Car")) && (!(_x iskindof "Tank"))) then {DAC_VehicleInUse = DAC_VehicleInUse - [_x]}}foreach _buildingX;
						_buildingD inflame false;_buildingC setFlagTexture "";
						_run = 0;
					};
				};
		case 14:{
					//-----------------------------
					////#Break
					//-----------------------------
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
								_go = 0;_run = 13;
							}
							else
							{
								if(!(leader _group == _leader)) then
								{
									_leader = leader _group;
									_go = 0;_run = 6;
								};
							};
						};
					};
				};
		Default{};
	};
};