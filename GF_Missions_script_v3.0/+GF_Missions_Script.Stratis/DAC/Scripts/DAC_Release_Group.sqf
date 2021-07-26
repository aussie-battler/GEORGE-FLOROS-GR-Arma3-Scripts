//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Release_Group     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_group","_zones","_count","_side","_behav","_wparray",
			"_wptemp","_iw","_id","_dt","_entry","_newwp","_run","_go","_gtyp",
			"_typArray","_wpPool","_zone","_c","_a","_marker","_wpstr","_eventid"
		];
		
_group = _this select 0;_wparray = [];_wptemp = [];_iw = 0;_id = 0;_dt = 4;_run = 0;_go = true;_zone = "";_entry = [];
_newwp = [0,0];_marker = [];_gtyp = 0;_zones = [];_count = 0;_typArray = [];_wpPool = "";_wpstr = "";_c = 0;_a = "";

if(isServer) then
{
	DAC_Release_Action = DAC_Release_Action + 1;

	waituntil {((getdir DAC_StartDummy) > 170)};

	_group setVariable ["getout_dac", 1, false];
	if(format["%1",_group getVariable "reduce_action"] != "<NULL>") then {waituntil{((_group getVariable "reduce_action") == 0)}};

	if(count _this > 1) then
	{
		_gtyp = _this select 2;_zones = _this select 1;_count = _this select 3;
		_typArray = ["S","V","T"];_wpPool = format["DAC_WP_Pool_%1",(_typArray select (_gtyp - 1))];_wpstr = "";
		if(({format["%1",isnull _x] == "BOOL"} count _zones) > 0) then
		{
			player groupchat "Error: DAC_Insert_Group - No valid zone";
			if(time > 0) exitwith {DAC_Release_Action = DAC_Release_Action - 1};
		}
		else
		{
			sleep (0.1 + (random 1));
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
										_wpstr = call compile format["%1 select %2",_wpPool,_iw];
										_wptemp set [count _wptemp,format["%1",_wpstr]];
										_iw = _iw + 1;
									};
								};
							};
						};
					};
				};
			};
			sleep 0.1;
			_run = 0;_go = true;
			if(count _wptemp > 0) then
			{
				if(_count >= count _wptemp) then {_count = count _wptemp};
				while {_run == 0} do
				{
					_id = 0;_go = true;
					if(count _wparray >= _count) then
					{
						_run = 1;
					}
					else
					{
						while {_go} do
						{
							_newwp = _wptemp select (random ((count _wptemp) - 1));
							sleep 0.01;
							{if(_newwp == _x) then {_id = _id + 1}} foreach _wparray;
							if(_id == 0) then {_wparray set [count _wparray,_newwp];_go = false} else {_id = 0};
						};
					};
				};
				if((count waypoints _group) > 0) then
				{
					_i = (count waypoints _group);
					while{_i > 0} do {deleteWaypoint [_group, (_i - 1)];_i = _i - 1};
				};
				sleep 0.1;
				[_group,_wparray] spawn DAC_fMoveSimple;
			}
			else
			{
				player sidechat "Error > No Waypoints found";
			};
			DAC_Release_Action = DAC_Release_Action - 1;
			_group setVariable ["DAC_Excluded", True];
		};
	}
	else
	{
		waituntil{(!(_group in DAC_All_Groups))};
		sleep 0.3;
		if((count waypoints _group) > 0) then
		{
			_i = (count waypoints _group);
			while{_i > 0} do {deleteWaypoint [_group, (_i - 1)];_i = _i - 1};
		};
		sleep 0.1;
		(vehicle (leader _group)) stop true;
		sleep 1;
		_marker = position (leader _group);
		_group move _marker;
		(vehicle (leader _group)) stop false;
		if(format["%1",_group getVariable "wpdata_dac"] != "<NULL>") then
		{
			[_group,(_group getVariable "wpdata_dac")] call DAC_fSetWaypoints;
		};
		_group setVariable ["DAC_Excluded", True];
		DAC_Release_Action = DAC_Release_Action - 1;
	};
};