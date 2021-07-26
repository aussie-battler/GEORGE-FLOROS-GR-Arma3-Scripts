//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Insert_Group      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_group","_zones","_count","_side","_behav","_options","_wparray","_vehA","_vehvalue","_delval2",
			"_wptemp","_iw","_id","_dt","_entry","_newwp","_run","_go","_gtyp","_delval0","_delval1","_i","_wpData","_wpString",
			"_typArray","_wpPool","_zone","_c","_a","_marker","_wpstr","_eventid","_h","_action","_GroupWP","_GroupPos","_zData"
		];

_group = _this select 0;_gtyp = _this select 1;_zones = _this select 2;_options = _this select 6;
_count = _this select 3;_side = _this select 4;_behav = _this select 5;_eventid = _this select 7;
_wparray = [];_wptemp = [];_iw = 0;_id = 0;_dt = 4;_run = 0;_go = true;_newwp = [0,0];_marker = [];
_action = true;_h = 0;_GroupWP = [];_GroupPos = [];_zData = [];_i = 0;_wpData = [];_wpString = 0;
_typArray = ["S","V","T"];_wpPool = format["DAC_WP_Pool_%1",(_typArray select (_gtyp - 1))];_wpstr = "";
_delval0 = 0;_delval1 = 0;_delval2 = 0;

if(isServer) then
{
	_delval0 = ((DAC_Delete_Value select 1) select 0);
	_delval1 = ((DAC_Delete_Value select 1) select 1);
	_delval2 = (DAC_Delete_Value select 2);
	DAC_Release_Action = DAC_Release_Action + 1;

	if((_options select 1) == 0) then {_dt = 4};

	waituntil {((getdir DAC_StartDummy) > 170)};

	if(({format["%1",isnull _x] == "BOOL"} count _zones) > 0) then
	{
		player groupchat "Error: DAC_Insert_Group - No valid zone";
		DAC_Release_Action = DAC_Release_Action - 1;
		if(time > 0) exitwith {};
	}
	else
	{
		_group setVariable ["DAC_Excluded", False];
		sleep (0.1 + (random 0.3));
		if(count _this > 8) then
		{
			_wpString = _this select 8;
			if(_wpString) then
			{
				_wpString = format["wp_%1",round(random 100000)];
				if(format["%1",_group getVariable "wpdata_dac"] == "<NULL>") then {_group setVariable ["wpdata_dac", _wpString, false]} else {_wpString = _group getVariable "wpdata_dac"};
				_wpdata = [_group] call DAC_fGetWaypoints;
				call compile format["%1 = _wpData",_wpString];
			};
		};
		
		_zone = _zones select 0;_c = 0;_a = "";
		while {_c < count DAC_Zones} do
		{
			_a = DAC_Zones select _c;
			if((call compile (_a select 0)) == _zone) then
			{
				_marker = (_a select 9);
				_c = ((count DAC_Zones) + 1);
			}
			else
			{
				_c = _c + 1;
			};
		};

		while{_run == 0} do
		{
			if(_iw >= count (call compile _wpPool)) then
			{
				_run = 1;
			}
			else
			{
				_entry = (call compile _wpPool) select _iw;
				if(count _entry == 2) then
				{
					_iw = _iw + 1;
				}
				else
				{
					if(!((_entry select 0) in _zones)) then
					{
						_iw = _iw + 1;
					}
					else
					{
						_iw = _iw + 1;
						while {_go} do
						{
							if(_iw >= count (call compile _wpPool)) then
							{
								_go = false;_run = 1;
							}
							else
							{
								if(count ((call compile _wpPool) select _iw) > 2) then
								{
									_go = false;
								}
								else
								{
									_wpstr = format["%1 select %2",_wpPool,_iw];
									_wptemp set [count _wptemp,_wpstr];
									_iw = _iw + 1;
								};
							};
						};
					};
				};
			};
		};
		sleep 0.1;
		if(count _wptemp > 0) then
		{
			_run = 0;_go = true;
			while {_run == 0} do
			{
				if(count _wparray >= _count) then
				{
					_run = 1;
				}
				else
				{
					_go = true;_id = 0;
					while {_go} do
					{
						_newwp = _wptemp select (random ((count _wptemp) - 1));
						{if((format["%1",_newwp]) == (format["%1",_x])) then {_id = _id + 1}} foreach _wparray;
						if(_id == 0) then {_wparray set [count _wparray,format["%1",_newwp]];_go = false} else {_id = 0};
					};
				};
			};
			sleep 0.1;
			_vehA = [];_vehvalue = [];_run = 0;
			{
				if((!(_x == vehicle _x)) && (!(vehicle _x in _vehA))) then
				{
					_vehA set [count _vehA,vehicle _x];
					DAC_VehicleInUse set [count DAC_VehicleInUse,vehicle _x];
					[(vehicle _x),_delval0,_delval1,2,(_marker select 0),_group,_delval2,_side] spawn DAC_fDeleteUnit;
				};
			} 	foreach units _group;
			if(count _wparray == 0) then
			{
				player groupchat format["Error : DAC_Insert_Group - No waypoints available for group %1",_group];
				_group setVariable ["DAC_Excluded", True];
			}
			else
			{
				while {_run == 0} do
				{
					if(!(_group in DAC_All_Groups)) then {DAC_All_Groups set [count DAC_All_Groups,_group]};
					if(_side == 0) then {{DAC_East_Units set [count DAC_East_Units,_x]} foreach units _group};
					if(_side == 1) then {{DAC_West_Units set [count DAC_West_Units,_x]} foreach units _group};
					if(_side == 2) then
					{
						if(DAC_Res_Side == 0) then
						{
							{DAC_East_Units set [count DAC_East_Units,_x]} foreach units _group;
						}
						else
						{
							{DAC_West_Units set [count DAC_West_Units,_x]} foreach units _group;
						};
					};
					
					while{_action} do
					{
						_GroupPos = _wparray call DAC_fWritePosition;
						sleep 0.1;
						if(format["%1",_GroupPos] != "ANY") then {if(count _GroupPos > 0) then {_action = false}};
					};
					while{_h < count DAC_Zones} do {_zData set [count _zData,((DAC_Zones select _h) select 0)];_h = _h + 1};
					
					switch (_gtyp) do
					{
						case 1:	{
									[[_group,_marker,0],[_wparray,_GroupPos,_zData,0],1,10,0] spawn DAC_fMoveToWaypoint;
									if((_options select 0) == 1) then {[_group,_side,1,_marker,0] spawn DAC_fReduceGroup};
									[_group,_side] spawn DAC_fRouteMarker;
								};
						case 2:	{
									[[_group,_marker,0],[_wparray,_GroupPos,_zData,0],2,25,0] spawn DAC_fMoveWithVH;
									if((_options select 0) == 1) then {[_group,_side,2,_marker,0] spawn DAC_fReduceGroup};
									[_group,_side] spawn DAC_fRouteMarker;
								};
						case 3:	{
									[[_group,_marker,0],[_wparray,_GroupPos,_zData,0],3,25,0] spawn DAC_fMoveWithTank;
									if((_options select 0) == 1) then {[_group,_side,3,_marker,0] spawn DAC_fReduceGroup};
									[_group,_side] spawn DAC_fRouteMarker;
								};
						Default	{};
					};
					if((_options select 2) == 0) then {DAC_No_Support set [count DAC_No_Support,_group]};
					if(count _wpData > 0) then
					{
						[_group,_dt,0,_side,[],(_marker select 0),_wpString] spawn DAC_fWaitingForEnd;
					}
					else
					{
						[_group,_dt,0,_side,[],(_marker select 0)] spawn DAC_fWaitingForEnd;
					};
					_run = 1;
				};
				if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 was inserted into DAC",_group]};
			};
			DAC_Release_Action = DAC_Release_Action - 1;
		}
		else
		{
			player groupchat format["No Waypoints available for group %1 (Type = %2)",_group,_gtyp];
			_group setVariable ["DAC_Excluded", True];
			DAC_Release_Action = DAC_Release_Action - 1;
		};
	};
};