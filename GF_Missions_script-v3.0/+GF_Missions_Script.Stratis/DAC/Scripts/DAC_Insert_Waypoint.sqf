//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Insert_Waypoint   //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_DAC_WP_Typ","_wpConfig","_CheckRadius1","_CheckRadius2","_checkAreaH","_checkNear","_checkObjH1","_checkObjH2",
			"_checkMaxH","_checkMinH","_checkCount","_DAC_Typ_Nr","_MTemp","_string","_TempArray","_DAC_MColor","_sideA","_polyOutLine",
			"_DAC_Typ_Name","_ScriptArray","_DAC_WP_Basic","_minit","_m3","_countairwp","_tnr","_text","_side","_rx","_ry","_px","_py","_pc",
			"_DumyA","_DumyB","_Null","_PosNull","_zonr","_wpnr","_chnr","_hz","_DAC_Count_WP","_DAC_SelectZone","_rsin","_rcos","_polyResult",
			"_DAC_EnemyZone","_DAC_ZoneRadiusX","_DAC_ZoneRadiusY","_DAC_ZoneMode","_DAC_GroupSol","_DAC_GroupVeh","_DAC_PolyCount","_dist",
			"_DAC_GroupTan","_DAC_GroupAir","_DAC_ZoneSide","_tempList","_ln","_wn","_checkwp","_log","_DAC_ActivZoneX","_polyArray",
			"_DAC_ActivZoneY","_RandomX","_RandomY","_PosMin","_PosMax","_nr","_cv","_cr","_np","_cd","_allObjects","_checkResol",
			"_relObjects","_DPos","_ma","_run","_go","_mm1","_m1","_mm2","_m2","_m3","_mm3","_m4","_mm4","_DAC_WP_Nr","_m5","_mm5",
			"_sdv","_sdu","_sdl","_DAC_This_Zone"
		];
		
			_DAC_WP_Typ = _this select 0;_wpConfig = [];_checkResol = 90;_tempList = [];_DAC_EnemyZone = objNull;_rx = 0,_ry = 0;_rsin = [];_rcos = [];
			_DAC_Typ_Nr = ["S","V","T","A","C"];_MTemp = [];_string ="Null";_TempArray = [];_ScriptArray = [2,3,4,5];_DAC_WP_Basic = 0;_dist = 0;
			_DAC_MColor = ["ColorBlue","ColorYellow","ColorRed","ColorGreen","ColorBlack"];_minit = 0;_m3 = "";_mm1 = "";_mm2 = "";_countairwp = 0;
			_DAC_Typ_Name = ["Infantry","Unarmed vehicles","Armed vehicles","Helicopter","Camp"];_run = 1;_go = 0;_DAC_WP_Nr = 0;_m5 = "";_mm5 = "";
			_sideA = ["East","West","Guer","Civl"];_DAC_PolyCount = [];_polyArray = [];_polyOutLine = [];_px = 0;_py = 0;_pc = 0;_polyResult = [];
			_sdv = 0;_sdu = [];_sdl = 0;_DAC_This_Zone = _this select 1;

sleep 1;

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					if(!(_DAC_WP_Typ == 1)) then
					{
						_run = 3;
					}
					else
					{
						sleep 1;
						_run = 3;
					};
				};
		case 2:	{
					//disabled
				};
		case 3:	{
					_DumyA = "logic" createvehiclelocal [0,0,0];
					_DumyB = "logic" createvehiclelocal [0,0,0];
					_Null = "EmptyDetector" createvehiclelocal [0,0,0];
					_PosNull = 0;_zonr = 0;_wpnr = 0;_chnr = 0;_hz = 0;_DAC_Count_WP = 0;
					if(_DAC_WP_Typ == 1) then {{[_x,_DAC_This_Zone]execVM "DAC\Scripts\DAC_Insert_Waypoint.sqf"} foreach _ScriptArray};
					if(!(_DAC_WP_Typ in DAC_Init_WP)) then {DAC_Init_WP set [count DAC_Init_WP,_DAC_WP_Typ]};
					if(DAC_Marker > 0) then
					{
						if((DAC_Marker_Val select 1) > 0) then
						{
							_m1 = format["m%1%2%3",_zonr,9999,_DAC_WP_Typ];_mm1 = createmarkerlocal [_m1, position _DumyA];
							_mm1 setMarkerShapelocal "ELLIPSE";_mm1 setMarkerSizelocal [1,1];
							_mm1 setMarkerColorlocal (_DAC_MColor select (_DAC_WP_Typ - 1));
							_m2 = format["p%1%2%3",_zonr,0,_DAC_WP_Typ];_mm2 = createmarkerlocal [_m2, position _DumyA];
							_mm2 setMarkerTypelocal "mil_dot";_mm2 setMarkerSizelocal [0.2,0.2];
							_mm2 setMarkerColorlocal "ColorBlack";
							_m5 = format["m%1%2%3",_zonr,9998,_DAC_WP_Typ];_mm5 = createmarkerlocal [_m5, position _DumyA];
							_mm5 setMarkerShapelocal "ELLIPSE";_mm5 setMarkerSizelocal [1,1];
							_mm5 setMarkerColorlocal "ColorRed";
						};
					};
					sleep (random 0.5);
					if(DAC_StartDummy in DAC_Init_WP) then {DAC_Init_WP = DAC_Init_WP - [DAC_StartDummy]};
					_run = 4;
				};
		case 4:	{
					_go = 0;
					while {_go == 0} do
					{
						_wpnr = 0;_chnr = 0;_hz = 0;_DAC_WP_Nr = 0;
						if(_zonr >= count DAC_Zones) then
						{
							_run = 13;_go = 1;
						}
						else
						{
							_DAC_SelectZone = DAC_Zones select _zonr;_DAC_EnemyZone = call compile (_DAC_SelectZone select 0);
							if((_DAC_SelectZone select 0) == format["%1",_DAC_This_Zone]) then
							{
								_DAC_ZoneRadiusX = _DAC_SelectZone select 1;_DAC_ZoneRadiusY = _DAC_SelectZone select 2;
								_DAC_ZoneMode = _DAC_SelectZone select 3;_DAC_GroupSol = _DAC_SelectZone select 4;
								_DAC_GroupVeh = _DAC_SelectZone select 5;_DAC_GroupTan = _DAC_SelectZone select 6;
								_DAC_GroupAir = _DAC_SelectZone select 7;_DAC_ZoneSide = _DAC_SelectZone select 8;
								_DAC_PolyCount = _DAC_SelectZone select 10;
								if((count _DAC_ZoneSide) > 4) then
								{
									if((_DAC_ZoneSide select 4) > 0) then
									{
										_DAC_WP_Nr = (_DAC_ZoneSide select 4);
									};
								};
								_wpConfig = [(_DAC_WP_Typ - 1),_DAC_WP_Nr] call DAC_fConfigWP;
								_CheckRadius1 = ((_wpConfig select 0) select 0);_CheckRadius2 = ((_wpConfig select 0) select 1);
								_checkAreaH = _wpConfig select 1;_checkNear = _wpConfig select 2;
								_checkObjH1 = ((_wpConfig select 3) select 0);_checkObjH2 = ((_wpConfig select 3) select 1);
								_checkMaxH = _wpConfig select 4;_checkMinH = _wpConfig select 5;_checkCount = _wpConfig select 6;
								_checkResol = ((_wpConfig select 0) select 2);_mm5 setMarkerSizelocal [_CheckRadius1, _CheckRadius1];
								switch (_DAC_WP_Typ) do
								{
									case 1:	{
												if(count _DAC_GroupSol == 0) then
												{
													_zonr = _zonr + 1;_run = 20;
												}
												else
												{
													if(count _DAC_GroupSol == 1) then
													{
														_DAC_Count_WP = _DAC_GroupSol select 0;
													}
													else
													{
														_DAC_Count_WP = _DAC_GroupSol select 2;
													};
												};
											};
									case 2:	{
												if(count _DAC_GroupVeh == 0) then
												{
													_zonr = _zonr + 1;_run = 20;
												}
												else
												{
													if(count _DAC_GroupVeh == 1) then
													{
														_DAC_Count_WP = _DAC_GroupVeh select 0;
													}
													else
													{
														_DAC_Count_WP = _DAC_GroupVeh select 2;
													};
												};
											};
									case 3:	{
												if(count _DAC_GroupTan == 0) then
												{
													_zonr = _zonr + 1;_run = 20;
												}
												else
												{
													if(count _DAC_GroupTan == 1) then
													{
														_DAC_Count_WP = _DAC_GroupTan select 0;
													}
													else
													{
														_DAC_Count_WP = _DAC_GroupTan select 2;
													};
												};
											};
									case 4:	{
												if((count _DAC_GroupAir == 0) || (count _DAC_GroupAir > 4)) then
												{
													_zonr = _zonr + 1;_run = 20;
												}
												else
												{
													if(count _DAC_GroupAir == 1) then
													{
														_DAC_Count_WP = _DAC_GroupAir select 0;_hz = 1;
														_countairwp = _DAC_GroupAir select 0;
													}
													else
													{
														_DAC_Count_WP = _DAC_GroupAir select 0;
														_countairwp = _DAC_GroupAir select 2;
													};
													DAC_WP_Pool_H set [count DAC_WP_Pool_H,[_DAC_EnemyZone,_DAC_ZoneMode,0,0,0]];
												};
											};
									case 5:	{
												if(count _DAC_GroupAir < 5) then
												{
													_zonr = _zonr + 1;_run = 20;
												}
												else
												{
													_DAC_Count_WP = _DAC_GroupAir select 0;
												};
												DAC_WP_Pool_B set [count DAC_WP_Pool_B,[_DAC_EnemyZone,_DAC_ZoneMode,0,0,0]];
											};
									Default {};
								};
								if(_run == 20) then
								{
									_run = 4;
								}
								else
								{
									if(_DAC_Count_WP <= 0) then
									{
										hintc format["Error: DAC_Init_Waypoint > There are no waypoints > Zone: %1",(_DAC_SelectZone select 0)];
										_run = 0;_go = 1;
									}
									else
									{
										if(_run == 13) then
										{
											_go = 1;
										}
										else
										{
											call compile format["DAC_WP_Pool_%1 set [count DAC_WP_Pool_%1,[_DAC_EnemyZone,_DAC_ZoneMode,_DAC_GroupSol,_DAC_GroupVeh,_DAC_GroupTan,_DAC_GroupAir,_DAC_ZoneSide,_CheckRadius2]]",_DAC_Typ_Nr select (_DAC_WP_Typ - 1)];
											_run = 5;_go = 1;
										};
									};
								};
							}
							else
							{
								_zonr = _zonr + 1;_run = 4;
							};
						};
					};
				};
		case 5:	{
					_go = 1;
					while {_go > 0} do
					{
						switch (_go) do
						{
							case 1:	{
										_tempList = List _DAC_EnemyZone;_sdl = 0;
										if(count _tempList == 0) then
										{
											_go = 4;
										}
										else
										{
											_ln = 0;_wn = 0;_go = 2;_dist = 100000;_log = objNull;
											{
												if((format["%1",typeof _x] == "Logic")
												&& (format["%1",direction _x] == format["%1",_DAC_WP_Typ])
												&& ((count waypoints _x) > 1)
												&& ((getwppos[_x,0] distance _DAC_EnemyZone) < _dist)) then
												{_log = _x;_dist = (getwppos[_x,0] distance _DAC_EnemyZone)} else
												{if(count DAC_SaveDistance > 0) then
												{if(format["%1",_x] in (DAC_SaveDistance select 1)) then {_sdl = 1;_sdv = (DAC_SaveDistance select 0);_sdu = (DAC_SaveDistance select 1)};
												}};
											}foreach _tempList;
											if(isNull _log) then {_go = 4} else {_go = 3};
										};
									};
							case 2:	{		
										//disabled;	
									};
							case 3:	{
										while{(((getwppos[_log,_wn + 1]) select 0)+((getwppos[_log,_wn + 1]) select 1) != 0)} do
										{
											_checkwp = getwppos[_log,_wn + 1];
											call compile format["DAC_WP_Pool_%1 set [count DAC_WP_Pool_%1,[_checkwp select 0,_checkwp select 1]]",_DAC_Typ_Nr select (_DAC_WP_Typ - 1)];
											DAC_Master_Init = DAC_Master_Init + 1;_wn = _wn + 1;_wpnr = _wpnr + 1;
											if(DAC_Marker > 0) then
											{
												if((DAC_Marker_Val select 1) > 0) then
												{
													_m = format["m%1%2%3",_zonr,_wn,_log];
													_ma = createmarkerlocal [_m, [_checkwp select 0,_checkwp select 1]];
													_ma setMarkerShapelocal "ELLIPSE";_ma setMarkerSizelocal [_CheckRadius2, _CheckRadius2];
													_ma setMarkerColorlocal (_DAC_MColor select (_DAC_WP_Typ - 1));
													if((DAC_Marker_Val select 1) == 1) then {_MTemp set [count _MTemp,_ma]};
												};
											};
										};
										_go = 4;
									};
							case 4:	{		
										if(_hz == 1) then
										{
											_run = 12;_go = 0;
										}
										else
										{
											_run = 6;_go = 0;
										};
									};
							Default	{};
						};
					};
				};
		case 6:	{
					if(_wpnr >= _DAC_Count_WP) then
					{
						_run = 12;
					}
					else
					{
						_DAC_ActivZoneX  = ((getPosATL _DAC_EnemyZone select 0) - _DAC_ZoneRadiusX);
						_DAC_ActivZoneY  = ((getPosATL _DAC_EnemyZone select 1) - _DAC_ZoneRadiusY);
						_run = 7;
					};
				};
		case 7:	{
					_go = 1;
					while {_go > 0} do
					{
						if(_chnr > _checkCount) then
						{
							_run = 11;_go = 0;
						}
						else
						{
							if(count _DAC_PolyCount > 0) then
							{
								_pc = 0;_px = 0;_py = 0;_xd = 0;_yd = 0;
								while{_pc < count _DAC_PolyCount} do
								{
									if(_pc == 0) then
									{
										_px = ((_DAC_PolyCount select _pc) select 0);_xd = ((_DAC_PolyCount select _pc) select 0);
										_py = ((_DAC_PolyCount select _pc) select 1);_yd = ((_DAC_PolyCount select _pc) select 1);
									}
									else
									{
										if(((_DAC_PolyCount select _pc) select 0) < _px) then
										{
											_px = ((_DAC_PolyCount select _pc) select 0);
										}
										else
										{
											if(((_DAC_PolyCount select _pc) select 0) > _xd) then {_xd = ((_DAC_PolyCount select _pc) select 0)};
										};
										if(((_DAC_PolyCount select _pc) select 1) < _py) then
										{
											_py = ((_DAC_PolyCount select _pc) select 1);
										}
										else
										{
											if(((_DAC_PolyCount select _pc) select 1) > _yd) then {_yd = ((_DAC_PolyCount select _pc) select 1)};
										};
									};
									_pc = _pc + 1;
								};
								_polyResult = [[_px,_py],(_xd - _px),(_yd - _py),_DAC_PolyCount] call DAC_fFindPolyPos;
								_RandomX = (_polyResult Select 0);_RandomY = (_polyResult Select 1);
							}
							else
							{
								if((triggerarea _DAC_EnemyZone) select 3) then
								{
									_rx = random (_DAC_ZoneRadiusX * 2);_ry = random (_DAC_ZoneRadiusY * 2);
									_rsin = [(position _DAC_EnemyZone Select 0) + (Sin (((triggerarea _DAC_EnemyZone) select 2) + 90) * ((-_DAC_ZoneRadiusX) + _rx)),(position _DAC_EnemyZone Select 1) + (Cos (((triggerarea _DAC_EnemyZone) select 2) + 90) * ((-_DAC_ZoneRadiusX) + _rx))];
									_rcos = [(_rsin Select 0) + (Sin ((triggerarea _DAC_EnemyZone) select 2) * ((-_DAC_ZoneRadiusY) + _ry)),(_rsin Select 1) + (Cos ((triggerarea _DAC_EnemyZone) select 2) * ((-_DAC_ZoneRadiusY) + _ry))];
									_RandomX = (_rcos Select 0);_RandomY = (_rcos Select 1);
								}
								else
								{
									_ellipsResult = [_DAC_EnemyZone,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY] call DAC_fFindEllipsPos;
									_RandomX = (_ellipsResult Select 0);_RandomY = (_ellipsResult Select 1);
								};
							};
							if(_checkMinH >= 0) then
							{
								if(surfaceIsWater [_RandomX, _RandomY]) then
								{
									_chnr = _chnr + 1;
								}
								else
								{
									_Null setpos [_RandomX,_RandomY,0];_DumyA setpos [_RandomX,_RandomY,0];
									_mm1 setmarkerposlocal [_RandomX,_RandomY];
									_mm1 setMarkerSizelocal [_CheckRadius2, _CheckRadius2];
									_mm5 setmarkerposlocal [_RandomX,_RandomY];
									if((getPosASL _Null select 2 > _checkminh) && (getPosASL _Null select 2 < _checkmaxh)) then
									{
										_run = 8;_go = 0;
									}
									else
									{
										_chnr = _chnr + 1;
									};
								};
							}
							else
							{
								if(!(surfaceIsWater [_RandomX, _RandomY])) then
								{
									_chnr = _chnr + 1;
								}
								else
								{
									_Null setpos [_RandomX,_RandomY,0];_DumyA setpos [_RandomX,_RandomY,0];
									_mm1 setmarkerposlocal [_RandomX,_RandomY];_mm1 setMarkerSizelocal [_CheckRadius2, _CheckRadius2];
									if((getPosASL _Null select 2 > _checkminh) && (getPosASL _Null select 2 < _checkmaxh)) then
									{
										_run = 8;_go = 0;
									}
									else
									{
										_chnr = _chnr + 1;
									};
								};
							};
						};
					};
				};
		case 8:	{
					_PosMin = (getPosASL _Null select 2);_PosMax = _PosMin;_nr = 0;_cv = 0;_mm2 setmarkerposlocal [_RandomX,_RandomY];
					_DumyA setpos [_RandomX,_RandomY,0];_DumyA setdir 0;_cr = _CheckRadius2;_go = 1;
					while {_go > 0} do
					{
						if(_nr > 360) then
						{
							_go = 0;_run = 9;
						}
						else
						{
							if(_cv == 0) then {_cv = 1;_cr = _CheckRadius2} else {_cv = 0;_cr = (_CheckRadius2 / 2)};
							_np = 	[
										((getPosATL _DumyA Select 0) + (Sin ((getdir _DumyA) + _nr) * _cr)),
										((getPosATL _DumyA Select 1) + (Cos ((getdir _DumyA) + _nr) * _cr)),0
									];
							_Null setpos _np;
							if(_checkMinH >= 0) then
							{
								if(getPosASL _Null select 2 > _PosMax) then {_PosMax = (getPosASL _Null select 2)} else {if(getPosASL _Null select 2 < _PosMin) then {_PosMin = (getPosASL _Null select 2)}};
							}
							else
							{
								if(!(surfaceIsWater (position _Null))) then {_PosMax = (_checkAreaH * 10);_nr = 360};
							};
							_mm2 setmarkerposlocal _np;_mm2 setmarkerdir _nr;
							_nr = _nr + _checkResol;
						};
					};
				};
		case 9:	{
					if((_PosMax - _PosMin) > _checkAreaH) then
					{
						_chnr = _chnr + 1;_run = 7;
					}
					else
					{
						if(_CheckRadius1 == 0) then
						{
							_run = 10;
						}
						else
						{
							_allObjects = nearestObjects [[_RandomX,_RandomY], [], _CheckRadius2];_relObjects = [];
							{
								if(((format["%1",typeOf _x]) != "LOGIC")
								&& ((format["%1",typeOf _x]) != "EmptyDetector")
								&& (speed _x == 0)) then
								{
									if(canmove _x) then
									{
										if(((boundingBox _x select 1) select 2) > _checkObjH1) then
										{
											_relObjects set [count _relObjects,_x];
										};
									}
									else
									{
										if(((position _x) select 2) > _checkObjH1) then
										{
											_relObjects set [count _relObjects,_x];
										};
									};
								};
							} 	foreach _allObjects;
							if(count _relObjects > 0) then
							{
								if(({((([_RandomX,_RandomY] distance _x) - ((((boundingBox _x select 1) select 0) + ((boundingBox _x select 1) select 1)) / 4)) < _CheckRadius1)} count _relObjects) > 0) then
								{
									_chnr = _chnr + 1;_run = 7;
								}
								else
								{
									_run = 10;
								};
							}
							else
							{
								_run = 10;
							};
						};
					};
				};
		case 10:{
					_allObjects = nearestObjects [[_RandomX,_RandomY], [], _CheckRadius2];_relObjects = [];
					{
						if(((format["%1",typeOf _x]) != "LOGIC")
						&& ((format["%1",typeOf _x]) != "EmptyDetector")
						&& (speed _x == 0)) then
						{
							if(canmove _x) then
							{
								if((((position _x) select 2) > _checkObjH2) && ((_x distance _DumyA) < _CheckRadius2)) then
								{
									_relObjects set [count _relObjects,_x];
								};
							}
							else
							{
								if((((boundingBox _x select 1) select 2) > _checkObjH2) && ((_x distance _DumyA) < _CheckRadius2)) then
								{
									_relObjects set [count _relObjects,_x];
								};
							};
						};
					} 	foreach _allObjects;
					if(count _relObjects > 0) then
					{
						_chnr = _chnr + 1;_run = 7;
					}
					else
					{
						if(_sdl == 1) then
						{
							{if(((call compile _x) distance _DumyA) < _sdv) then {_run = 7}}foreach _sdu;
						};
						if((_checkNear > 0) && (_run != 7)) then
						{
							_cd = 0;
							while {_cd < count _TempArray} do
							{
								_DPos = _TempArray select _cd;
								if(count _DPos > 2) then
								{
									_cd = _cd + 1;
								}
								else
								{
									_DumyB setpos [(_DPos select 0),(_DPos select 1),0];
									if((_DumyB distance _DumyA) < _checkNear) then
									{
										_cd = ((count _TempArray) + 1);
										_chnr = _chnr + 1;_run = 7;
									}
									else
									{
										_cd = _cd + 1;
									};
								};
							};
						};
						if(_run != 7) then
						{
							sleep DAC_WP_Speed;
							if(_DAC_Count_WP == 0) then
							{
								call compile format["DAC_WP_Pool_%1 set [count DAC_WP_Pool_%1,[0,0]]",_DAC_Typ_Nr select (_DAC_WP_Typ - 1)];
							}
							else
							{
								if(_wpnr < _DAC_Count_WP) then {call compile format["DAC_WP_Pool_%1 set [count DAC_WP_Pool_%1,[_RandomX,_RandomY]]",_DAC_Typ_Nr select (_DAC_WP_Typ - 1)]};
							};
							if(DAC_Marker > 0) then
							{
								if(((DAC_Marker_Val select 1) > 0) && (_DAC_Count_WP > 0)) then
								{
									if(_wpnr < _DAC_Count_WP) then
									{
										_m = format["m%1%2%3",_zonr,_wpnr,_DAC_WP_Typ];
										_ma = createmarkerlocal [_m, position _DumyA];
										_ma setMarkerShapelocal "ELLIPSE";_ma setMarkerSizelocal [_CheckRadius2, _CheckRadius2];
										_ma setMarkerColorlocal (_DAC_MColor select (_DAC_WP_Typ - 1));
										if((DAC_Marker_Val select 1) == 1) then {_MTemp set [count _MTemp,_ma]};
									};
								};
							};
							_TempArray set [count _TempArray,[_RandomX,_RandomY]];
							DAC_Master_Init = DAC_Master_Init + 1;
							_wpnr = _wpnr + 1;_chnr = 0;_minit = 0;
							if(_wpnr >= _DAC_Count_WP) then
							{
								_run = 12;
							}
							else
							{
								_run = 6;
							};
						};
					};
				};
		case 11:{
					{deletevehicle _x} foreach [_DumyA,_DumyB,_Null];
					deletemarkerlocal _mm1;deletemarkerlocal _mm2;deletemarkerlocal _mm5;
					_run = 0;
					if(count _MTemp > 0) then {[_MTemp]execVM "DAC\Marker\DAC_DeleteMarker.sqf"};
					if(time > 0) exitwith {DAC_NewZone = -1};
				};
		case 12:{
					_zonr = _zonr + 1;
					if((!(_DAC_WP_Typ == 4)) && (!(_DAC_WP_Typ == 5))) then
					{
						_run = 4;
					}
					else
					{
						if(_DAC_WP_Typ == 4) then {DAC_WP_Pool_H set [count DAC_WP_Pool_H,[_DAC_EnemyZone,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY,_countairwp]]};
						if(_DAC_WP_Typ == 5) then {DAC_WP_Pool_B set [count DAC_WP_Pool_B,[getPosATL _DAC_EnemyZone,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY,0]]};
						_run = 4;
					};
				};
		case 13:{
					sleep 0.1;
					deletemarkerlocal _mm1;deletemarkerlocal _mm2;deletemarkerlocal _mm5;
					DAC_Init_WP = DAC_Init_WP - [_DAC_WP_Typ];
					{deletevehicle _x} foreach [_DumyA,_DumyB,_Null];
					if(count _MTemp > 0) then {[_MTemp]execVM "DAC\Marker\DAC_DeleteMarker.sqf"};
					if(!(_DAC_WP_Typ == 1)) then
					{
						_run = 0;
						DAC_Init_Counter set[(_DAC_WP_Typ - 1),1];
					}
					else
					{
						waituntil {((({_x == 1} count DAC_Init_Counter) == 4)) || (DAC_NewZone < 0)};
						if(DAC_NewZone < 0) then
						{
							_run = 0;
						}
						else
						{
							sleep 0.1;
							DAC_Init_Counter set[(_DAC_WP_Typ - 1),1];
							DAC_WPCount_Init = DAC_Master_Init;
							DAC_Master_Init = 0;DAC_List = List DAC_Trigger;
							_run = 0;DAC_NewZone = 2;
						};
					};
				};
		Default	{};
	};
};