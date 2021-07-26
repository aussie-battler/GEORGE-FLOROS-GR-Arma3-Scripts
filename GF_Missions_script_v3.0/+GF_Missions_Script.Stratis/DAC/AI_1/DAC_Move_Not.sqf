//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_Not          //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_garray","_group","_wparray","_groupid","_maxrad","_zskill","_leader","_target",
			"_timestep","_firstwait","_checktime","_call","_startid","_waittime","_emptyVeh","_maxpos","_maxtime",
			"_knowsabout","_speedselect","_combatselect","_behavselect","_formselect","_unitcombat","_unitbehav","_allZones",
			"_unitspeed","_unitform","_bldgbehav","_joinbehav","_unitwait","_grouponfire","_looktime","_rd","_posarray","_numarray",
			"_marker","_DAC_Arrays","_callg","_callE","_run","_go","_newtarget","_id","_coverval"
		];
		
			_garray = _this select 0;_group = _garray select 0;_posarray = _this select 1;_wparray = (_posarray select 0);_numarray = (_posarray select 1);_marker = _garray select 1;_coverval = 0;
			_groupid = _this select 2;_maxrad = _this select 3;_leader = leader _group;_target = objNull;_knowsabout = 0;_looktime = 0;_rd = 0;_allZones = (_posarray select 2);
			_timestep = time + 20;_firstwait = 0;_newtarget = objNull;_call = [];_id = 0;_startid = _this select 4;_callg = [];_waittime = 0;
			_run = 1;_go = 0;_DAC_Arrays = ["DAC_Help_Groups","DAC_Hit_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Cover_Groups","DAC_Call_Groups"];

			_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#waitforstart
					//-----------------------------
					waituntil {(getdir DAC_StartDummy) > 170};
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
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
							_emptyVeh = _zskill select 13;_unitwait = ((_zskill select 7) select (_groupid - 1));_coverval = ((_zskill select 5) select 1);
							{call compile format["if(_group in %1) then {%1 = %1 - [_group]}",_x]}foreach _DAC_Arrays;_run = 3;
						};
					};
				};
		case 3:	{
					//-----------------------------
					//#setbehaviour
					//-----------------------------
					{_x setunitpos "auto"}foreach units _group;
					_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));
					_speedselect  = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
					_behavselect  = (random ((count _unitbehav) - 1));_formselect   = (random ((count _unitform) - 1));
					_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
					_group setspeedmode (_unitspeed select _speedselect);_group setformation (_unitform select _formselect);
					_run = 4;
				};
		case 4:	{
					//-----------------------------
					//#wait
					//-----------------------------
					_go = 1;_looktime = time + (5 + random 3);
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
							if(time > _looktime) then
							{
								_looktime = time + (5 + random 3);
								_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
								if(((_zskill select 11) select 0) == 0) then {if(!(_group in DAC_No_Support)) then {DAC_No_Support set [count DAC_No_Support,_group]}};
								_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;
								_unitform = _zskill select 4;_bldgbehav = _zskill select 8;_joinbehav = _zskill select 12;
								_emptyVeh = _zskill select 13;_unitwait = ((_zskill select 7) select (_groupid - 1));
								{
									if(!(vehicle _x in DAC_Arti_Veh)) then
									{
										_rd = random 360;_x lookat [(position _x Select 0) + (Sin (_rd) * 500),(position _x Select 1) + (Cos (_rd) * 500),50];
									};
								}	foreach units _group;
								_run = 3;
							};
						};
					};	
				};
		case 13:{
					//-----------------------------
					//#groupchangemove
					//-----------------------------
					if((_groupid < 3) || (_groupid == 5)) then {[_leader,2] spawn DAC_fAISpeak};
					if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
					[_group,_target] spawn DAC_fSetBehaviour;
					if(!(_group in DAC_Radio_Groups)) then {[17,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
					_waittime = time + call compile ((_zskill select 15) select 0);_run = 14;
				};
		case 14:{
					//-----------------------------
					//#groupwaitfortarget
					//-----------------------------
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
						_run = 3;
					};
				};
		case 17:{
					//-----------------------------
					//#groupmovetoenemy
					//-----------------------------
					sleep (1 + (random 1));
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
								[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;_run = 3;
							}
							else
							{
								{_x dowatch _target} foreach units _group;
								if(!(_group in DAC_Help_Groups)) then {DAC_Help_Groups set [count DAC_Help_Groups,_group]};
								if(_group in DAC_Hit_Groups) then {[20,_groupid,_group,"T",_target distance leader _group] spawn DAC_fShowRadio} else {[15,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
								if((_groupid < 3) || (_groupid == 5)) then {[_leader,3] spawn DAC_fAISpeak;[5,(leader _group)] spawn DAC_fAIRadio;};
								_run = 16;
							};
						};
					};
				};
		case 20:{
					//-----------------------------
					//#Break
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
								_go = 0;_run = 21;
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
										_run = 4;_go = 0;
									}
									else
									{
										_run = 13;_go = 0;
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
					_run = 0;		
				};
		Default{};
	};
};