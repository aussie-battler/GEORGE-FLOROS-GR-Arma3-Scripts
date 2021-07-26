//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Connect_Camps     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_SideID","_SideCP","_SideTX","_CampList","_CheckD","_ln","_wn","_zi","_ti",
			"_NextList","_checkwp","_CList","_TempCamp1","_TempPos1","_cid","_check",
			"_TestZone","_TempZone","_ZoneSide","_tempList","_log","_NextZone","_countF","_flag",
			"_TempNext","_wn","_s1","_mn","_entry","_find1","_find2","_find3","_find4","_find5","_find6","_find7"
		];

			_SideID = _this select 0;_SideCP = ["DAC_Spawn_CampsE","DAC_Spawn_CampsW"];
			_SideTX = ["East","West"];_CampList = format["%1",_SideCP select _SideID];_flag = _this select 1;

waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_CheckD = "Logic" createvehiclelocal [0,0,0];_cid = 0;_check = 0;
_find1 = 0;_find2 = 0;_find3 = 0;_find4 = 0;_find5 = 0;_find6 = 0;_find7 = 0;_countF = 0;

if((count (call compile _CampList)) == 0) then
{
	_find1 = 99;
};

while {_find1 == 0} do
{
	while {_check == 0} do
	{
		if(_cid >= count DAC_Zones) then
		{
			_check = 2;
		}
		else
		{
			_TestZone = DAC_Zones select _cid;_zi = 0;
			_TempZone = call compile (_TestZone select 0);
			_ZoneSide = ((_TestZone select 8) select 0);
			
			switch (_ZoneSide) do
			{
				case 0:	{
							if(!(_ZoneSide == _SideID)) then {_cid = _cid + 1} else	{_check = 1};
						};
				case 1:	{
							if(!(_ZoneSide == _SideID)) then {_cid = _cid + 1} else	{_check = 1};
						};
				case 2:	{
							if(DAC_Res_Side == 0) then
							{
								if(_SideID == 1) then {_cid = _cid + 1} else {_check = 1};
							}
							else
							{
								if(_SideID == 0) then {_cid = _cid + 1} else {_check = 1};
							};
						};
				case 3:	{
							if(!(_ZoneSide == _SideID)) then {_cid = _cid + 1} else	{_check = 1};
						};
				Default {_check = 3};
			};
		};
	};
	sleep 0.2;
	switch (_check) do
	{
		case 3:	{
					player groupchat format["Error connect Camps: %1 is not a valid side value",_ZoneSide];
					_find1 = 2;
				};
		case 2:	{
					if(_countF == 0) then
					{
						//player groupchat format["No Camp on side %1 are connected.",_SideTX select _SideID];
					};
					_find1 = 3;
				};
		case 1:	{
					_tempList = List _TempZone;
					sleep 0.2;
					if(count _tempList == 0) then
					{
						_cid = _cid + 1;_check = 0;
					}
					else
					{
						_ln = 0;_wn = 0;_find2 = 0;
						while{_find2 == 0} do
						{
							if(_ln >= count _tempList) then
							{
								_cid = _cid + 1;_check = 0;_find2 = 1;
							}
							else
							{
								_log = _tempList select _ln;
								if(!(format["%1",typeof _log] == "Logic")) then
								{
									_ln = _ln + 1;
								}
								else
								{
									if((format["%1",(getdir _log)] in ["1","2","3","4","5"]) || ((count waypoints _log) < 2)) then
									{
										_ln = _ln + 1;
									}
									else
									{
										_find3 = 0;
										while {_find3 == 0} do
										{
											_checkwp = getwppos[_log,_wn];
											if((_checkwp select 0)+(_checkwp select 1) == 0) then
											{
												_ln = _ln + 1;_wn = 0;_find3 = 1;
											}
											else
											{
												_CheckD setpos _checkwp;_ti = 0;
												sleep 0.6;
												_find4 = 0;
												while {_find4 == 0} do
												{
													if(_ti >= count DAC_Zones) then
													{
														_ln = _ln + 1;_wn = 0;_find3 = 1;_find4 = 1;
													}
													else
													{
														_NextZone = DAC_Zones select _ti;
														_TempNext = call compile (_NextZone select 0);
														_NextList = List _TempNext;
														sleep 0.6;
														if(!(_CheckD in _NextList)) then
														{
															_ti = _ti + 1;
														}
														else
														{
															_find5 = 0;
															while {_find5 == 0} do
															{
																_checkwp = getwppos[_log,_wn+1];_sl = 0;
																if((_checkwp select 0)+(_checkwp select 1) == 0) then
																{
																	_ln = _ln + 1;_wn = 0;_find3 = 1;_find4 = 1;_find5 = 1;
																}
																else
																{
																	_CheckD setpos _checkwp;
																	sleep 0.6;
																	_find6 = 0;
																	while {_find6 == 0} do
																	{
																		if(_sl >= count DAC_Zones) then
																		{
																			_wn = _wn + 1;_ti = _ti + 1;_find6 = 1;
																		}
																		else
																		{
																			_CheckZone = call compile ((DAC_Zones select _sl) select 0);
																			_CList     = List _CheckZone;
																			_ZoneSide  = (((DAC_Zones select _sl) select 8) select 0);
																			sleep 0.6;
																			if(!(_CheckD in _CList)) then
																			{
																				_sl = _sl + 1;
																			}
																			else
																			{
																				if(_ZoneSide < 2) then
																				{
																					if(!(_ZoneSide == _SideID)) then
																					{
																						_sl = _sl + 1;
																					};
																				}
																				else
																				{
																					if(_ZoneSide > 2) then
																					{
																						_sl = _sl + 1;
																					}
																					else
																					{
																						if(DAC_Res_Side == 0) then
																						{
																							if(_SideID == 1) then
																							{
																								_sl = _sl + 1;
																							}
																							else
																							{
																								if(_SideID == 0) then
																								{
																									_sl = _sl + 1;
																								};
																							};
																						};
																					};
																				};
																				_mn = 0;_find7 = 0;
																				while {_find7 == 0} do
																				{
																					if(_mn >= count (call compile _CampList)) then
																					{
																						_sl = _sl + 1;_find7 = 1;
																					}
																					else
																					{
																						_TempCamp1 = ((call compile _CampList) select _mn);
																						_TempPos1 = _TempCamp1 select 0;
																						sleep 0.1;
																						if(!(format["%1",(_TempPos1 select 0) + (_TempPos1 select 1)] == format["%1",(getPosATL _TempNext select 0) + (getPosATL _TempNext select 1)])) then
																						{
																							_mn = _mn + 1;
																						}
																						else
																						{
																							_entry = count ((call compile _CampList select _mn) select 6);
																							if(!((getPosATL _CheckZone select 0) in (((call compile _CampList) select _mn) select 6))) then
																							{
																								(((call compile _CampList) select _mn) select 6) set [_entry,(getPosATL _CheckZone select 0)];
																								_countF = _countF + 1;
																								if((DAC_Com_Values select 0) > 0) then
																								{
																									player groupchat format["(%4) DAC connects [%1_Camp_%2] with [Zone_%3]",_SideTX select _SideID,round (getPosATL (((call compile _CampList) select _mn) select 1) select 0),round (getPosATL _CheckZone select 0),_countF];
																								};
																							};
																							_mn = _mn + 1;
																						};
																					};
																				};
																			};
																		};
																	};
																};
															};
														};
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
		Default {};
	};
sleep 0.1;
_check = 0;
};
sleep (random 1);
deletevehicle _CheckD;
if(_countF > 0) then {DAC_AI_Spawn set [2,1]};
sleep (random 1);
[_SideID,_flag]execVM "DAC\Marker\DAC_CampMarker.sqf";