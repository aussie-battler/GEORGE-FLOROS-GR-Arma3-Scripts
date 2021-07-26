//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Add_behaviour     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private	[
			"_group","_groupid","_i","_art","_maxrad","_maxtime","_zskill","_leader","_target","_curwp","_curBH","_firemark","_cargoA","_call","_callg",
			"_curCM","_run","_go","_allCargo","_cargoG","_vehG","_looktime","_id","_newtarget","_troublepos","_searcharea","_searchcount","_wx","_wy","_rd","_pos"
		];
		
_group = _this select 0;_art = _this select 1;_zskill = _this select 2;_i = 0;_id = 0;_firemark = [];_cargoA = [];_callg = [];
_searcharea = 0;_searchcount = 0;_leader = leader _group;_target = objNull;_allCargo = [];_cargoG = [];_vehG = [];_troublepos = [];_call = [];_pos = [];
_curwp = 0;_curBH = "";_curCM = "";_run = 2;_go = 0;_timestep = time + 20;_groupid = 1;_looktime = 10;_newtarget = objNull;_wx = 0;_wy = 0;_rd = 0;
_DAC_Arrays = ["DAC_All_Groups","DAC_Help_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Cover_Groups","DAC_Call_Groups","DAC_Hit_Groups","DAC_No_Support","DAC_Min_Groups","DAC_Arti_Array"];

if(format["%1",_group getVariable "getout_dac"] != "<NULL>") then
{
	if((_group getVariable "getout_dac") == 1) then
	{
		_group setVariable ["getout_dac", 0, false];
	};
}
else
{
	_group setVariable ["getout_dac", 0, false];
};

{if(_x != (vehicle _x)) then {if(!((vehicle _x) in _vehG)) then {_vehG set [count _vehG,(vehicle _x)]}}}foreach units _group;
sleep 0.1;
if(count _vehG > 0) then
{
	while{_i < count _vehG} do
	{
		
		_cargoA = crew (_vehG select _i);
		if(count _cargoA > 1) then
		{
			{if((_x != (driver (_vehG select _i))) && (_x != (gunner (_vehG select _i))) && (_x != (commander (_vehG select _i)))) then {_allCargo set [count _allCargo,[_x,(_vehG select _i)]]}}foreach _cargoA;
		};
		_i = _i + 1;
	};
};

if((count waypoints _group) == 1) then {_pos = getWPPos [_group,0]};

while {_run > 0} do
{
	if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - run = %2",time,_run]};
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#setoldbehaviour
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - SetOldBehav",time]};
					if((_group getVariable "getout_dac") == 1) then
					{
						_go = 0;_run = 10;
					}
					else
					{
						{_x setunitpos "auto"}foreach units _group;
						if(count _allCargo > 0) then {{(_x select 0) assignascargo (_x select 1);[(_x select 0)] ordergetin true;[(_x select 0)] allowgetin true}foreach _allCargo};
						_group setbehaviour _curBH;_group setcombatmode _curCM;
						_group setCurrentWaypoint [_group, _curwp];
						if(count _pos > 0) then {[_group, 0] setWPPos _pos;(leader _group) domove _pos};
						_run = 2;
					};
				};
		case 2:	{
					//-----------------------------
					//#wait
					//-----------------------------
					_go = 1;_looktime = time + (10 + random 10);
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Waiting for Action",time]};
						_call = [_group,_leader,_timestep] call DAC_fSimpleConditions;
						if((_group getVariable "getout_dac") == 1) then
						{
							_go = 0;_run = 10;
						}
						else
						{
							if((count _call) > 0) then
							{
								_run = (_call select 0);_target = (_call select 1);
								_go = 0;
							}
							else
							{
								if(time > _looktime) then
								{
									_looktime = time + (10 + random 10);
									{
										if(!(vehicle _x in DAC_Arti_Veh)) then
										{
											_rd = random 360;
											if(_x != (vehicle _x)) then
											{
												if(_x == (gunner (vehicle _x))) then
												{
													(gunner (vehicle _x)) lookat [(position _x Select 0) + (Sin (_rd) * 500),(position _x Select 1) + (Cos (_rd) * 500),50];
												};
											}
											else
											{
												if(_x hasweapon "Binocular") then {_x selectweapon "Binocular"};
											};
										};
									}	foreach units _group;
								};
							};
						};
					};	
				};
		case 3:	{
					//-----------------------------
					//#groupchangemove
					//-----------------------------
					_curwp = currentWaypoint _group;
					_curBH = behaviour _leader;
					_curCM = combatmode _leader;
					if(count _allCargo > 0) then {{unassignvehicle (_x select 0);[(_x select 0)] ordergetin false}foreach _allCargo};
					if(_leader == (vehicle _leader)) then {[_leader,2] spawn DAC_fAISpeak};
					if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
					[_group,_target] spawn DAC_fSetBehaviour;
					if(!(_group in DAC_Radio_Groups)) then {[17,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
					_waittime = time + (((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1));_run = 4;
				};
		case 4:	{
					//-----------------------------
					//#groupwaitfortarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - groupwaitfortarget_1",time]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						if((_group getVariable "getout_dac") == 1) then
						{
							_go = 0;_run = 10;
						}
						else
						{
							if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - groupwaitfortarget_2",time]};
							if((({alive _x} count units _group) == 0) && (_go == 1)) then {_go = 0;_run = 10};
							if((_group in DAC_Hit_Groups) && (_go == 1)) then {_go = 0;_run = 6};
							if(_go == 1) then
							{
								_newtarget = [_group,_target,0] call DAC_fCheckNewTarget;
								if(isNull _newtarget) then {_go = 0;_id = 1;_run = 5} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
								if((time > _waittime) || (_id == 0)) then
								{
									{_x setunitpos "auto"} foreach units _group;
									if((_art > 0) && (_id == 1)) then
									{
										if(_leader in DAC_West_Units) then {if(((position _target) select 2) < 5) then {[_leader,6] spawn DAC_fAISpeak;[7,(leader _group)] spawn DAC_fAIRadio;[_leader,_target,_artibehav] spawn DAC_fCallArti}};
										if(_leader in DAC_East_Units) then {if(((position _target) select 2) < 5) then {[_leader,6] spawn DAC_fAISpeak;[7,(leader _group)] spawn DAC_fAIRadio;[_leader,_target,_artibehav] spawn DAC_fCallArti}};
									};
									_go = 0;_run = 5;
								};
							};
						};
					};
				};
		case 5:	{
					//-----------------------------
					//#querytarget
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - querytarget",time]};
					if(_id > 0) then
					{
						if(!([_group,_target] call DAC_fCheckTarget)) then
						{
							_run = 6;
						};
					};
					if(_run == 5) then
					{
						if(_group in DAC_Hit_Groups) then {DAC_Hit_Groups = DAC_Hit_Groups - [_group]};
						if(_group in DAC_Call_Groups) then {DAC_Call_Groups = DAC_Call_Groups - [_group]};
						if(({alive _x} count units (group _target)) == 0) then {[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
						if(_leader == (vehicle _leader)) then {[_leader,5] spawn DAC_fAISpeak;[11,(leader _group)] spawn DAC_fAIRadio;};
						_run = 7;
					};
				};
		case 6:	{
					//-----------------------------
					//#groupmovetoenemy
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - groupmovetoenemy",time]};
					sleep (1 + (random 1));
					if(({alive _x} count units _group) == 0) then
					{
						_run = 10;
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
							[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;_run = 7;
						}
						else
						{
							{_x dowatch _target} foreach units _group;
							if(!(_group in DAC_Help_Groups)) then {DAC_Help_Groups set [count DAC_Help_Groups,_group]};
							if(_group in DAC_Hit_Groups) then {[20,_groupid,_group,"T",_target distance leader _group] spawn DAC_fShowRadio} else {[15,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio};
							_run = 5;
						};
					};
				};
		case 7:	{
					//-----------------------------
					//#seenothing
					//-----------------------------
					if(count _zskill == 0) then
					{
						_run = 1;
					}
					else
					{
						{_x setunitpos "auto"} foreach units _group;
						if(_group in DAC_Cover_Groups) then {DAC_Cover_Groups = DAC_Cover_Groups - [_group]};
						_leader = leader _group;
						_troublepos = position (leader _group);[12,(leader _group)] spawn DAC_fAIRadio;
						_searcharea  = (_zskill select 0);_searchcount = (time + (_zskill select 1));
						_wx = _troublepos select 0;_wy = _troublepos select 1;
						_run = 8;
					};
				};
		case 8:	{
					//-----------------------------
					//#searchingtarget
					//-----------------------------
					_go = 1;_id = 0;
					_group setbehaviour "AWARE";
					_group setcombatmode "YELLOW";
					while {_go > 0} do
					{
						sleep 0.1;
						_firemark = [(_wx) + (_searcharea - (random (_searcharea * 2))),(_wy) + (_searcharea - (random (_searcharea * 2))),0];
						if(!(surfaceIsWater _firemark)) then
						{
							_go = 0;
						};
					};
					{if(_x == (vehicle _x)) then {_x domove [(((_firemark) select 0) + (Sin (random 360) * (3 + (random 15)))),(((_firemark) select 1) + (Cos (random 360) * (3 + (random 15)))),0]}}foreach units _group;
					while {_go == 0} do
					{
						sleep (1 + (random 1));
						if(({alive _x} count units _group) == 0) then
						{
							_run = 10;_go = 1;
						}
						else
						{
							_newtarget = [_group,_target,0] call DAC_fCheckNewTarget;
							if(isNull _newtarget) then
							{
								if(time > _searchcount) then
								{
									_run = 1;_go = 1;
								}
								else
								{
									if(unitready (vehicle _leader)) then
									{
										_wx = _troublepos select 0;
										_wy = _troublepos select 1;
										_go = 1;
									};
								};
							}
							else
							{
								_target = _newtarget;_run = 6;_go = 1;
							};
						};
					};
				};
		case 9:	{
					//-----------------------------
					//#Break
					//-----------------------------
					_go = 1;
					while {_go > 0} do
					{
						sleep (0.1 + (random 0.2));
						if((({alive _x} count units _group) == 0) && (_go == 1)) then
						{
							_go = 0;_run = 10;
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
									_run = 7;_go = 0;
								}
								else
								{
									_run = 3;_go = 0;
								};
							};
						};
					};
				};
		case 10:{
					//-----------------------------
					//#groupdown
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - GroupDown",time]};
					{call compile format["if(_group in %1) then {%1 = %1 - [_group]}",_x]}foreach _DAC_Arrays;
					_run = 0;		
				};
		Default	{};
	};
};