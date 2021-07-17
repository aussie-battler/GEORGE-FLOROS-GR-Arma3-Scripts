//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_to_VH        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_garray","_group","_groupid","_maxrad","_zskill","_leader","_groupvehicle","_posarray",
			"_startid","_groupmode","_marker","_DAC_Arrays","_run","_go","_exgroup"
		];
		
			_garray = _this select 0;_group = _garray select 0;_marker = _garray select 1;_posarray = _this select 1;
			_groupid = _this select 2;_exgroup = _this select 4;_startid = _this select 5;
			_leader = leader _group;_maxrad = (300 * (skill _leader));_groupvehicle = objNull;_groupmode = _group;
			_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;_run = 1;_go = 1;
			_DAC_Arrays = ["DAC_Help_Groups","DAC_Hit_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Cover_Groups","DAC_Call_Groups"];
	
_group setVariable ["dacData",[0,(position _leader)],false];
	
while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#waitforaction
					//-----------------------------
					if(_group in xCam_Debug_Group) then {xCam_Debug_String = format["%1 - Move_to_VH - case1",time]};
					sleep 3;
					waituntil {((getdir DAC_StartDummy) > 170)};
					_groupvehicle = _exgroup select 0;_groupmode = _exgroup select 1;
					if(((_zskill select 11) select 0) == 0) then {if(!(_group in DAC_No_Support)) then {DAC_No_Support set [count DAC_No_Support,_group]}};
					while {_go > 0} do
					{
						sleep (1 + (random 0.5));
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 0;_run = 0};
						if((({alive _x} count units _group) == 0) && (_go == 1)) then {_go = 0;_run = 0};
						if(((getdammage _groupvehicle) > 0.6) && (_go == 1)) then {_run = 2;_go = 0};
						if((((position _groupvehicle) select 2) > 5) && ((!(alive (driver _groupvehicle))) || (!((driver _groupvehicle) in _groupvehicle))) && (_go == 1)) then {_run = 2;_go = 0};
						if(((({alive _x} count units _groupmode) == 0)) && (_go == 1)) then {_run = 2;_go = 0};
						if((!(_leader in _groupvehicle)) && (_go == 1)) then {_run = 0;_go = 0};
					};
				};
		case 2:	{
					//-----------------------------
					//#HeliGroupDown
					//-----------------------------
					{
						if(alive _x) then
						{
							if(((position _groupvehicle) select 2) > 5) then {_x action ["EJECT",_groupvehicle]};
							unassignvehicle _x;[_x] allowgetin false;[_x] ordergetin false;sleep 0.5;
						};
					}	foreach units _group;
					[2,(leader _group)] spawn DAC_fAIRadio;
					[_garray,str(position _groupvehicle),1,_maxrad,_startid] spawn DAC_fMoveAround;_run = 0;
				};
		Default{};
	};
};