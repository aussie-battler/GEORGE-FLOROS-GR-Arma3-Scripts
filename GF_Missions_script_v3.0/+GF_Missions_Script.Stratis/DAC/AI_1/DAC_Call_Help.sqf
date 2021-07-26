//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Call_Help         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_manonfire","_grouponfire","_firepos","_troublepos","_checkgroup","_sc",
			"_leader","_tempgroups","_groupside","_uArray","_DAC_Temp_Groups","_m","_ma",
			"_ct","_kw","_distgroup","_distunits","_cg","_sg","_fnr","_gnr","_rw","_action","_distOk",
			"_skillgroup","_delay","_hgroup","_hleader","_enddelay","_run","_go","_TempAll","_scount"
		];

			_manonfire = objNull;_grouponfire = objNull;_firepos = [];_troublepos = [];_distOk = true;_fnr = 0;_distunits = 0;
			_run = true;_leader = objNull;_TempAll = DAC_All_Groups;_DAC_Temp_Groups = [];_m = "";_ma = "";
			_tempgroups = [];_uArray = [];_action = true;_sc = 0;_scount = (call compile DAC_Radio_Count);_delay = 1;
			_ct = 0;_kw = 0;_distgroup = objNull;_cg = 0;_sg = 0;_gnr = 0;_rw = 0;_skillgroup = 0;_hgroup = objNull;_hleader = objNull;_enddelay = 0;

if(count _this == 3) then
{
	_manonfire = _this select 0;_grouponfire = _this select 1;_firepos = _this select 2;
}
else
{
	_manonfire = _this select 0;_grouponfire = group _manonfire;_firepos = _this select 1;
};

_troublepos = getpos _manonfire;_leader = leader _grouponfire;
_groupside = side _manonfire;_go = true;_checkgroup = _grouponfire;

if(({alive _x} count units _grouponfire) > 0) then
{
	if((isPlayer _manonfire) && (count _this == 2)) then
	{
		if(!(isNil "DAC_Support_Logic")) then
		{
			_scount = 1;
			_sc = (DAC_Support_Logic getVariable "support_count");
			if(_sc >= ((DAC_Player_Support select 1) select 0)) then
			{
				player sidechat "Call ground support aborted - No more ground support available";
				_action = false;
			}
			else
			{
				if((count (DAC_Support_Logic getVariable "support_groups")) >= ((DAC_Player_Support select 1) select 2)) then
				{
					player sidechat "Call ground support aborted - Max count ground support reached";
					_action = false;
				}
				else
				{
					if(!(isServer)) then
					{				
						if((_firepos distance _manonfire) < ((DAC_Player_Support select 1) select 3)) then
						{
							DAC_Player_SupGroup = str([_manonfire,_firepos]);publicvariable "DAC_Player_SupGroup";
							_m  = format["_swp%1%2",_grouponfire,time];_ma = createmarker [_m, _firepos];
							_ma setMarkerType "selector_selectedMission";
							_ma setMarkerSize [0.5,0.5];_ma setMarkerColor "ColorBlue";
							[[_ma],8] spawn DAC_fFlashMarker;
							_action = false;
						}
						else
						{
							_distOk = false;
							_m  = format["_swp%1%2",_grouponfire,time];_ma = createmarker [_m, _firepos];
							_ma setMarkerType "selector_selectedMission";
							_ma setMarkerSize [0.5,0.5];_ma setMarkerColor "ColorRed";
							[[_ma],8] spawn DAC_fFlashMarker;
							_action = false;
							player sidechat "Position is outside the valid range";
						};
					}
					else
					{
						if((_firepos distance _manonfire) < ((DAC_Player_Support select 1) select 3)) then
						{
							DAC_Hit_Groups set [count DAC_Hit_Groups,_grouponfire];
							_grouponfire setVariable ["support_pos", _firepos, true];
							_m  = format["_swp%1%2",_grouponfire,time];_ma = createmarker [_m, _firepos];
							_ma setMarkerType "selector_selectedMission";
							_ma setMarkerSize [0.5,0.5];_ma setMarkerColor "ColorBlue";
							[[_ma],8] spawn DAC_fFlashMarker;
						}
						else
						{
							_distOk = false;
							_m  = format["_swp%1%2",_grouponfire,time];_ma = createmarker [_m, _firepos];
							_ma setMarkerType "selector_selectedMission";
							_ma setMarkerSize [0.5,0.5];_ma setMarkerColor "ColorRed";
							[[_ma],8] spawn DAC_fFlashMarker;
							_action = false;
							player sidechat "Position is outside the valid range";
						};
					};
					if(!(isNil "DAC_Support_Logic")) then
					{
						if(_distOk) then
						{
							_sc = (DAC_Support_Logic getVariable "support_caller");
							if(!(_grouponfire in _sc)) then
							{
								_sc set [count _sc,_grouponfire];
								DAC_Support_Logic setVariable ["support_caller", _sc, true];
							};
						};
					};
				};
			};
		}
		else
		{
			player sidechat "DAC_Support_Logic not found. Support for Players not available.";
			_action = false;
		};
	};

	if(_action) then
	{
		_uArray set [count _uArray,format["%1",side _leader]];
		switch (format["%1",side _leader]) do
		{
			case "WEST":	{if(DAC_Res_Side == 1) then {_uArray set [count _uArray,"GUER"]}};
			case "EAST":	{if(DAC_Res_Side == 0) then {_uArray set [count _uArray,"GUER"]}};
			case "GUER":	{
								if(DAC_Res_Side == 1) then {_uArray set [count _uArray,"WEST"]};
								if(DAC_Res_Side == 0) then {_uArray set [count _uArray,"EAST"]};
							};
			default {};
		};

		if(!(_grouponfire in DAC_Call_Groups)) then {DAC_Call_Groups set [count DAC_Call_Groups,_grouponfire]};
		if(!(isPlayer _manonfire)) then {[_manonfire,4] spawn DAC_fAISpeak};
		[6,_manonfire] spawn DAC_fAIRadio;

		while{_run} do
		{
			while{_go} do
			{
				_ct = 0;_kw = 100000;
				while{_ct < count _TempAll} do
				{
					_distgroup = _TempAll select _ct;
					if(format["%1",_distgroup] != "<NULL-group>") then
					{
						if((count (units _distgroup)) > 0) then
						{
							if(!(_distgroup in _tempgroups)) then
							{
								_distunits = ((units _distgroup select 0) distance _firepos);
								if(_distunits < _kw) then {_kw = _distunits;_checkgroup = _distgroup};
							};
						};
					};
					_ct = _ct + 1;
				};
				if(_kw == 100000) then
				{
					_run = false;
					_go = false
				}
				else
				{
					_tempgroups set [count _tempgroups,_checkgroup];
					if((count _tempgroups) == (count _TempAll)) then
					{
						_tempgroups set [count _tempgroups,_grouponfire];
						_run = false;
						_go = false
					};
				};
			};
		};
		sleep 0.1;
		_run = true;_go = true;
		while{_run} do
		{
			_cg = 0;_sg = 0;
			{if(alive _x) then {_cg = _cg + 1;_sg = _sg + skill _x}} foreach units _grouponfire;
			if(_cg == 0) then
			{
				_run = false;
			}
			else
			{
				_skillgroup = _sg / _cg;_leader = leader _grouponfire;
				_fnr = 0;_gnr = 0;_delay = ((15 / DAC_AI_Level) / ((skill _leader) + 0.1));
				if(isPlayer _manonfire) then {_rw = ((DAC_Player_Support select 1) select 1)} else {_rw = (call compile DAC_Radio_Dist)};
				if((getpos _manonfire select 2) < 5) then
				{
					[1,0,_grouponfire,"P",player distance (leader _grouponfire)] spawn DAC_fShowRadio;
				};
				while{_go} do
				{
					if(!isPlayer _manonfire) then {sleep (_delay + random _delay)};
					if(({alive _x} count units _grouponfire) > 0) then
					{
						if((_gnr >= count _tempgroups)
						|| ((({format["%1",side leader _x] in _uArray} count _DAC_Temp_Groups) >= _scount) && (_fnr == 1))
						|| (!(_grouponfire in DAC_Hit_Groups))) then
						{
							_run = false;
							_go = false;
						}
						else
						{
							_hgroup = _tempgroups select _gnr;_hleader = leader _hgroup;
							if((!(canmove vehicle _hleader))
							|| (!(format["%1",side _hleader] in _uArray))
							|| (({alive _x} count units _hgroup) < (DAC_Intern select 2))
							|| (_hgroup == _grouponfire)) then
							{
								_gnr = _gnr + 1;
							}
							else
							{
								if(!isPlayer _manonfire) then {sleep ((_hleader distance _troublepos) / 200)};
								if((_hgroup in DAC_Help_Groups) || (_hgroup in DAC_Fire_Groups) || (_hgroup in DAC_In_Building)
								|| (_hgroup in DAC_Hit_Groups) || (_hgroup in DAC_Cover_Groups) || (_hgroup in _DAC_Temp_Groups)
								|| (_hgroup in DAC_No_Support) || (_hgroup in DAC_Camp_Groups) || ((_hleader distance _troublepos) > _rw)
								|| (({alive _x} count units _hgroup) == 0))	then
								{
									_gnr = _gnr + 1;
								}
								else
								{
									if(alive _manonfire) then {_troublepos = getPosATL _manonfire};
									[_hgroup] spawn DAC_fWaitForHelp;_DAC_Temp_Groups set [count _DAC_Temp_Groups,_hgroup];
									if(!isPlayer _manonfire) then {[(units _hgroup select 0),7] spawn DAC_fAISpeak;[8,(units _hgroup select 0)] spawn DAC_fAIRadio};
									if(!(isNil "DAC_Support_Logic")) then
									{
										if((count(DAC_Support_Logic getVariable "support_caller")) > 0) then
										{
											_sc = (DAC_Support_Logic getVariable "support_groups");
											if(!(_hgroup in _sc)) then
											{
												_sc set [count _sc,_hgroup];
												DAC_Support_Logic setVariable ["support_groups", _sc, true];
											};
											if((DAC_Com_Values select 0) > 0) then {player sidechat "Call ground support succesfully."};
										};
									};
									_gnr = _gnr + 1;
									_fnr = 1;
								};
							};
						};
					}
					else
					{
						_run = false;
						_go = false;
					};
				};
				_run = false;
			};
		};
		if(_fnr == 0) then {[9,(leader _grouponfire)] spawn DAC_fAIRadio};
		if(isPlayer _manonfire) then
		{
			DAC_Hit_Groups = DAC_Hit_Groups - [_grouponfire];
			if(_fnr > 0) then
			{
				_sc = ((DAC_Support_Logic getVariable "support_count") + 1);
				DAC_Support_Logic setVariable ["support_count", _sc, true];
				[8,(leader _grouponfire)] spawn DAC_fAIRadio;
			};
		};
	};
};