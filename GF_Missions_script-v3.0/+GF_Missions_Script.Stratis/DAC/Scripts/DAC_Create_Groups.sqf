//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Create_Groups     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_DAC_Group_Typ","_DAC_GroupCount","_DAC_UnitCount","_DAC_CountMIN","_DAC_CountMAX",
			"_DAC_Count_SG","_check","_maxrad","_DAC_SelectZone","_DAC_EnemyZone","_DAC_ZoneRadiusX",
			"_DAC_ZoneRadiusY","_DAC_ZoneMode","_DAC_ZoneStart","_DAC_ZoneEnde","_DAC_GroupSol","_WPArray",
			"_DAC_GroupVeh","_DAC_GroupTan","_DAC_GroupAir","_DAC_UnitTyp","_DAC_ZoneSide","_DAC_AI_Skill",
			"_DAC_Camp_Typ","_countrandom","_zonr","_zmod","_WPTempA","_WPTempB","_fwp","_m","_max","_zData","_newCount",
			"_HeloArray","_CenterSides","_ci","_chnr","_run","_go","_countmax","_countmin","_tz","_DAC_ExtraUnit","_mr",
			"_GroupVar","_TempArray","_ScriptArray","_GroupWP","_WPAll","_nr","_wp","_zc","_tw","_GroupPos","_h","_mz","_wz",
			"_gwp","_cwp","_Camp_Pool","_groupBehav","_DAC_Zone_Set","_DAC_This_Zone","_wpConfNr","_action","_countPL","_active"
		];

			_DAC_Group_Typ = _this select 0;_TempArray = ["S","V","T","A","C"];_ScriptArray = [2,3,4,5];_zonr = 0;_h = 0;_newCount = 0;_active = 0;
			_zmod = 0;_WPTempA = [];_WPArray = format["DAC_WP_Pool_%1",_TempArray select (_DAC_Group_Typ - 1)];_action = true;_mz = 100;_mr = 0;_wz = 0;
			_WPTempB = [];_fwp = [];_m = 0;_DAC_GroupCount = 0;_DAC_UnitCount = 0;_DAC_CountMIN = 0;_DAC_CountMAX = 0;_zData = [];_GroupWP = [];
			_countrandom = 0;_max = 0;_HeloArray = [];DAC_Init_Group set [count DAC_Init_Group,_DAC_Group_Typ];_run = 9;_GroupPos = [];
			_go = true;_check = 1;_maxrad = 0;_Camp_Pool = [];_groupBehav = [];_DAC_This_Zone = "";_wpConfNr = 0;_DAC_ExtraUnit = [];
			
if(_DAC_Group_Typ == 1) then
{
	{[_x]execVM "DAC\Scripts\DAC_Create_Groups.sqf"} foreach _ScriptArray;
	_run = 1;
}
else
{
	sleep 0.1;
};

_countPL = ((playersNumber west) + (playersNumber east));

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:		{
						_CenterSides = ["East","West","Resistance","Civilian"];_ci = 0;
						while {_ci < count _CenterSides} do
						{
							if(({format["%1",side _x] == (_CenterSides select _ci)} count DAC_List) == 0) then
							{
								call compile format["DAC_Center%1 = createCenter %1",(_CenterSides select _ci)];
							};
							_ci = _ci + 1;
						};
						sleep 0.2;
						if(DAC_Res_Side < 2) then
						{
							West setFriend [East, 0.1];East setFriend [West, 0.1];
							if(DAC_Res_Side == 0) then 
							{
								Resistance setFriend [West, 0.1];West setFriend [Resistance, 0.1];
							}
							else
							{
								Resistance setFriend [East, 0.1];East setFriend [Resistance, 0.1];
							};
						}
						else
						{
							Resistance setFriend [West, 0.1];West setFriend [Resistance, 0.1];
							Resistance setFriend [East, 0.1];East setFriend [Resistance, 0.1];
							if(DAC_Res_Side == 3) then {West setFriend [East, 0.9];East setFriend [West, 0.9]};
						};
						DAC_GroupNull = call compile format["createGroup %1","Civilian"];_run = 9;
					};
		case 2:		{
						_chnr = 0;_DAC_Count_SG = 0;_DAC_Zone_Set = [];
						_tz = DAC_StartDummy;_GroupVar = "";
						if(_zonr >= count DAC_Zones) then
						{
							_run = 7;
						}
						else
						{
							_DAC_SelectZone = DAC_Zones select _zonr;_DAC_EnemyZone = call compile (_DAC_SelectZone select 0);_DAC_ZoneRadiusX = _DAC_SelectZone select 1;
							_DAC_ZoneRadiusY = _DAC_SelectZone select 2;_DAC_ZoneMode = ((_DAC_SelectZone select 3) select 0);_DAC_This_Zone = _DAC_SelectZone select 0;
							_DAC_ZoneStart = ((_DAC_SelectZone select 3) select 1);_DAC_ZoneEnde = ((_DAC_SelectZone select 3) select 2);
							_DAC_GroupSol = _DAC_SelectZone select 4;_DAC_GroupVeh = _DAC_SelectZone select 5;_DAC_GroupTan = _DAC_SelectZone select 6;
							_DAC_GroupAir = _DAC_SelectZone select 7;_DAC_UnitTyp = ((_DAC_SelectZone select 8) select 1);
							_DAC_ZoneSide = ((_DAC_SelectZone select 8) select 0);_DAC_AI_Skill = ((_DAC_SelectZone select 8) select 2);
							_DAC_Camp_Typ = ((_DAC_SelectZone select 8) select 3);_DAC_Zone_Set = _DAC_SelectZone select 9;
							DAC_Init_Unit set [(_DAC_Group_Typ - 1),(DAC_Init_Unit select (_DAC_Group_Typ - 1)) + 1];
							if(count (_DAC_SelectZone select 3) > 3) then {_mz = ((_DAC_SelectZone select 3) select 3)} else {_mz = 100};
							if((count (_DAC_SelectZone select 8)) > 4) then
							{
								if(((_DAC_SelectZone select 8) select 4) > 0) then {_wpConfNr = ((_DAC_SelectZone select 8) select 4)};
							};
							
							switch (_DAC_Group_Typ) do
							{
								case 1:	{
											if(count _DAC_GroupSol >= 4) then
											{
												if(count _DAC_GroupSol == 5) then
												{
													_GroupVar = _DAC_GroupSol select 4;
													call compile format["%1 = []",_GroupVar];
												};
												if((typeName ((_DAC_SelectZone select 4) select 0)) == "STRING") then
												{
													_newCount = (_countPL - (DAC_Auto_UnitCount select 0)) * ((call compile ((_DAC_SelectZone select 4) select 0) / 100) * (DAC_Auto_UnitCount select 1));
													_DAC_GroupCount = ((call compile ((_DAC_SelectZone select 4) select 0)) + _newCount);
												}
												else
												{
													_DAC_GroupCount = ((_DAC_SelectZone select 4) select 0);
												};
												_DAC_UnitCount = ((_DAC_SelectZone select 4) select 1);
												if(((_DAC_SelectZone select 4) select 3) > 3) then
												{
													_DAC_CountMIN = (((_DAC_SelectZone select 4) select 3) - 1);
													_DAC_CountMAX = (((_DAC_SelectZone select 4) select 3) + 1);
												}
												else
												{
													_DAC_CountMIN = ((_DAC_SelectZone select 4) select 3);
													_DAC_CountMAX = _DAC_CountMIN;
												};
											}
											else
											{
												_run = 5;
											};
										};
								case 2:	{
											if(count _DAC_GroupVeh >= 4) then
											{
												if(count _DAC_GroupVeh == 5) then
												{
													_GroupVar = _DAC_GroupVeh select 4;
													call compile format["%1 = []",_GroupVar];
												};
												if((typeName ((_DAC_SelectZone select 5) select 0)) == "STRING") then
												{
													_newCount = (_countPL - (DAC_Auto_UnitCount select 0)) * ((call compile ((_DAC_SelectZone select 5) select 0) / 100) * (DAC_Auto_UnitCount select 1));
													_DAC_GroupCount = ((call compile ((_DAC_SelectZone select 5) select 0)) + _newCount);
												}
												else
												{
													_DAC_GroupCount = ((_DAC_SelectZone select 5) select 0);
												};
												_DAC_UnitCount = ((_DAC_SelectZone select 5) select 1);
												if(((_DAC_SelectZone select 5) select 3) > 3) then
												{
													_DAC_CountMIN = (((_DAC_SelectZone select 5) select 3) - 1);
													_DAC_CountMAX = (((_DAC_SelectZone select 5) select 3) + 1);
												}
												else
												{
													_DAC_CountMIN = ((_DAC_SelectZone select 5) select 3);
													_DAC_CountMAX = _DAC_CountMIN;
												};
											}
											else
											{
												_run = 5;
											};
										};
								case 3:	{
											if(count _DAC_GroupTan >= 4) then
											{
												if(count _DAC_GroupTan == 5) then
												{
													_GroupVar = _DAC_GroupTan select 4;
													call compile format["%1 = []",_GroupVar];
												};
												if((typeName ((_DAC_SelectZone select 6) select 0)) == "STRING") then
												{
													_newCount = (_countPL - (DAC_Auto_UnitCount select 0)) * ((call compile ((_DAC_SelectZone select 6) select 0) / 100) * (DAC_Auto_UnitCount select 1));
													_DAC_GroupCount = ((call compile ((_DAC_SelectZone select 6) select 0)) + _newCount);
												}
												else
												{
													_DAC_GroupCount = ((_DAC_SelectZone select 6) select 0);
												};
												if((typeName ((_DAC_SelectZone select 6) select 1)) == "ARRAY") then
												{
													_DAC_UnitCount = (((_DAC_SelectZone select 6) select 1) select 0);
													_DAC_ExtraUnit = [(((_DAC_SelectZone select 6) select 1) select 1),(((_DAC_SelectZone select 6) select 1) select 2)];
												}
												else
												{
													_DAC_UnitCount = ((_DAC_SelectZone select 6) select 1);
												};
												if(((_DAC_SelectZone select 6) select 3) > 3) then
												{
													_DAC_CountMIN = (((_DAC_SelectZone select 6) select 3) - 1);
													_DAC_CountMAX = (((_DAC_SelectZone select 6) select 3) + 1);
												}
												else
												{
													_DAC_CountMIN = ((_DAC_SelectZone select 6) select 3);
													_DAC_CountMAX = _DAC_CountMIN;
												};
											}
											else
											{
												_run = 5;
											};
										};
								case 4:	{
											if((count _DAC_GroupAir >= 3) && (count _DAC_GroupAir <= 4)) then
											{
												if(count _DAC_GroupAir == 4) then
												{
													_GroupVar = _DAC_GroupAir select 3;
													call compile format["%1 = []",_GroupVar];
												};
												_HeloArray = _HeloArray + 	[
																				format["[(call compile ((DAC_Zones select %1) select 0)),
																				((DAC_Zones select %1) select 1),
																				((DAC_Zones select %1) select 2),
																				(((DAC_Zones select %1) select 7) select 2)]",_zonr]
																			];
												_DAC_GroupCount = ((_DAC_SelectZone select 7) select 0);
												_DAC_UnitCount = ((_DAC_SelectZone select 7) select 1);
												_DAC_CountMIN = (((_DAC_SelectZone select 7) select 2) - 1);
												_DAC_CountMAX = (((_DAC_SelectZone select 7) select 2) + 1);
											}
											else
											{
												_run = 5;
											};
										};
								case 5:	{
											if(count _DAC_GroupAir >= 6) then
											{
												if(count _DAC_GroupAir == 7) then
												{
													_GroupVar = _DAC_GroupAir select 6;
													if((typeName _GroupVar) == "STRING") then
													{
														call compile format["%1 = []",_GroupVar];
													}
													else
													{
														if(!((typeName _GroupVar) == "ARRAY")) then
														{
															hintc "Error heli array: wrong data type";
														};
													};
												};
												_HeloArray = _HeloArray + 	[
																				getPosATL _DAC_EnemyZone,
																				((_DAC_SelectZone select 7) select 2),
																				((_DAC_SelectZone select 7) select 3),
																				((_DAC_SelectZone select 7) select 4),
																				((_DAC_SelectZone select 7) select 5)
																			];
												_DAC_GroupCount = ((_DAC_SelectZone select 7) select 0);
												_DAC_UnitCount = ((_DAC_SelectZone select 7) select 1);
												_DAC_CountMIN = (((_DAC_SelectZone select 7) select 2) - 1);
												_DAC_CountMAX = (((_DAC_SelectZone select 7) select 2) + 1);
											}
											else
											{
												_run = 5;
											};
										};
								Default {};
							};
							if(_run != 5) then
							{
								if(_DAC_UnitCount < 1) then {_DAC_UnitCount = 1};
								if(_DAC_Group_Typ == 5) then {_Camp_Pool = [_DAC_Camp_Typ] call DAC_fConfigCamps};
								_DAC_Count_SG = _DAC_GroupCount;_run = 3;_nr = 0;_check = 1;
								sleep 0.01;
							};
						};
					};
		case 3:		{
						while {_check > 0} do
						{
							switch (_check) do
							{
								case 1:	{
											_go = true;
											while {_go} do
											{
												if(_nr >= count (call compile _WPArray)) then
												{
													_go = false;_check = 4;
												}
												else
												{
													_wp = format["DAC_WP_Pool_%1 select %2",_TempArray select (_DAC_Group_Typ - 1),_nr];
													if((count (call compile _wp) > 2) && (!(count (call compile _wp) == 3))) then
													{
														_tz = ((call compile _wp) select 0);_active = (((call compile _wp) select 1) select 1);_maxrad = ((call compile _wp) select 7);
														if(count ((call compile _wp) select 1) > 3) then {_wz = ((_DAC_SelectZone select 3) select 3)} else {_wz = 100};
														if(_tz == _DAC_EnemyZone) then
														{
															_go = false;_check = 2;
														}
														else
														{
															if((((call compile _wp) select 1) select 0) == _DAC_ZoneMode) then
															{
																if(_wz > 0) then
																{
																	if((random 100) < _wz) then
																	{
																		_go = false;_check = 2;
																	};
																};
															};
														};
													};
													if(_check == 1) then {_nr = _nr + 1};
												};
											};
										};
								case 2:	{
											_go = true;
											while {_go} do
											{
												_nr = _nr + 1;
												if(_nr >= count (call compile _WPArray)) then
												{
													_check = 4;_go = false;
												}
												else
												{
													_wp = format["DAC_WP_Pool_%1 select %2",_TempArray select (_DAC_Group_Typ - 1),_nr];
													if((count (call compile _wp) > 2) && (!(count (call compile _wp) == 3))) then
													{
														_check = 3;_go = false;
													}
													else
													{
														if(_tz == _DAC_EnemyZone) then
														{
															_WPTempA set [count _WPTempA,_wp];
														}
														else
														{
															if(_active == 0) then {_WPTempB set [count _WPTempB,_wp]};
														};
													};
												};
											};
										};
								case 3:	{
											if(!((((call compile _wp) select 1) select 0) == _DAC_ZoneMode)) then
											{
												_nr = _nr + 1;
												_check = 1;
											};
											if((((call compile _wp) select 1) select 0) == _DAC_ZoneMode) then
											{
												_tz = ((call compile _wp) select 0);_active = (((call compile _wp) select 1) select 1);
												if(_tz == _DAC_EnemyZone) then
												{
													_check = 2;
												}
												else
												{
													if(count ((call compile _wp) select 1) > 3) then {_wz = ((_DAC_SelectZone select 3) select 3)} else {_wz = 100};
													if(_wz > 0) then
													{
														if((random 100) < _wz) then
														{
															_check = 2;
														}
														else
														{
															_nr = _nr + 1;
															_check = 1;
														};
													}
													else
													{
														_nr = _nr + 1;
														_check = 1;
													};
												};
											};
											if(_check == 3) then {_check = 4};
										};
								case 4:	{
											_zc  = 0;
											if((_DAC_Group_Typ == 4) || (_DAC_Group_Typ == 5)) then
											{
												_zmod = 1;_check = 7;
											}
											else
											{
												_check = 5;
											};
										};
								case 5:	{
											_GroupWP = [];
											if(_DAC_CountMAX == 0) then {_max = 0} else {_max = ((_DAC_CountMIN - 1) + (random ((_DAC_CountMAX - _DAC_CountMIN) + 1)))};
											if((_max > (count _WPTempA + count _WPTempB)) && (_DAC_CountMAX > 0)) then
											{
												if(count _WPTempA == 0) then
												{
													_max = count _WPTempB;
												}
												else
												{
													_max = count _WPTempA;
												};
											};
											if(count _WPTempA == 0) then {_fwp = _WPTempB select (random ((count _WPTempB) - 1))} else {_fwp = _WPTempA select (random ((count _WPTempA) - 1))};
											if((_max == 0) && (_DAC_CountMIN < 2)) then
											{
												_GroupWP set [count _GroupWP,_fwp];
												_check = 0;_run = 4;
											}
											else
											{
												if((random 100) < _mz) then
												{
													_WPAll = _WPTempA + _WPTempB;_mr = 0;
												}
												else
												{
													_WPAll = _WPTempB;_mr = 1;
												};
											};
											if(_check == 5) then {_check = 6};
										};
								case 6:	{
											_go = true;
											if(count _WPAll > 0) then
											{
												while {_go} do
												{
													_tw = 0;_gwp = _WPAll select (random ((count _WPAll) - 1));
													{
														if(((format["%1",_gwp]) == (format["%1",_x])) || ((((call compile _gwp) select 0) + ((call compile _gwp) select 1)) == 0)) then
														{
															_tw = _tw + 1;
														};
													} 	foreach _GroupWP;
													if(_tw == 0) then {_GroupWP set [count _GroupWP,_gwp]};
													if(((count _GroupWP) >= _max) || (count _GroupWP == count _WPAll)) then
													{
														_check = 0;_run = 4;_go = false;
													}
													else
													{
														if(((count _GroupWP) >= (_max - 1)) && (!(_max > (count _WPTempA + count _WPTempB)))) then
														{
															_GroupWP set [count _GroupWP,_fwp];
															_check = 0;_run = 4;_go = false;
														};
													};
												};
											}
											else
											{
												_GroupWP set [count _GroupWP,_fwp];
												_check = 0;_run = 4;_go = false;
											};
										};
								case 7:	{
											_cwp = (_DAC_CountMIN + (random (_DAC_CountMAX - _DAC_CountMIN)));
											_GroupWP = [];_GroupWP set [count _GroupWP,_WPTempA select _zc];
											if(((!(_DAC_Group_Typ == 4)) && (!(_DAC_Group_Typ == 5))) || (_zmod == 2)) then
											{
												_check = 0;_run = 4;
											}
											else
											{
												_nr = 0;_check = 8;
											};
										};
								case 8:	{
											_go = true;
											while {_go} do
											{
												if(_DAC_Group_Typ == 4) then {_wp = format["DAC_WP_Pool_H select %1",_nr]};
												if(_DAC_Group_Typ == 5) then {_wp = format["DAC_WP_Pool_B select %1",_nr]};
												if(count (call compile _wp) > 4) then
												{
													_tz = (call compile _wp) select 0;
													if((((call compile _wp) select 1) select 0) == _DAC_ZoneMode) then
													{
														_go = false;_check = 9;
													};
												};
												if(_check == 8) then
												{
													_nr = _nr + 1;
													if((_DAC_Group_Typ == 4) && (_nr >= count DAC_WP_Pool_H)) then
													{
														_zmod = 2;
														_check = 0;_run = 4;_go = false;
													};
													if((_DAC_Group_Typ == 5) && (_nr >= count DAC_WP_Pool_B)) then
													{
														_zmod = 2;
														_check = 0;_run = 4;_go = false;
													};
												};
											};
										};
								case 9:	{
											_nr = _nr + 1;
											if((_DAC_Group_Typ == 4) && (_nr >= count DAC_WP_Pool_H)) then
											{
												_zmod = 2;
												_check = 0;_run = 4;
											};
											if((_DAC_Group_Typ == 5) && (_nr >= count DAC_WP_Pool_B)) then
											{
												_zmod = 2;
												_check = 0;_run = 4;
											};
											if(_check == 9) then
											{
												if(_tz == _DAC_EnemyZone) then
												{
													_nr = _nr + 1;
													_check = 8;
												}
												else
												{
													if(_DAC_Group_Typ == 4) then {_wp = format["DAC_WP_Pool_H select %1",_nr]};
													if(_DAC_Group_Typ == 5) then {_wp = format["DAC_WP_Pool_B select %1",_nr]};
													_HeloArray set [count _HeloArray,_wp];
													_check = 8;
												};
											};
										};
								Default {};
							};
						};
					};
		case 4:		{
						_countmax = ((DAC_AI_Count_Level select (_DAC_UnitCount - 1)) select 1);
						_countmin = ((DAC_AI_Count_Level select (_DAC_UnitCount - 1)) select 0);_m = 0;_action = true;_h = 0;_zData = [];
						if(_countmax == 0) then {_countrandom = _countmin} else {_countrandom = _countmin + random (_countmax - _countmin)};
						if(_DAC_Group_Typ < 5) then
						{
							while{_action} do
							{
								_GroupPos = _GroupWP call DAC_fWritePosition;
								sleep 0.1;
								if(format["%1",_GroupPos] != "ANY") then {if(count _GroupPos > 0) then {_action = false}};
							};
							while{_h < count DAC_Zones} do {_zData set [count _zData,((DAC_Zones select _h) select 0)];_h = _h + 1};
						};
						switch (_DAC_Group_Typ) do
						{
							case 1:	{
										[_countrandom,[_GroupWP,_GroupPos,_zData,_mr],1,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_maxrad,[],_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,"null",[_countmax,_countmin,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY,_DAC_Zone_Set,_wpConfNr]]execVM "DAC\Scripts\DAC_Group_Soldier.sqf";
										[1,[_countrandom,[_GroupWP,_GroupPos,_zData,_mr],1,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_maxrad,[],_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,"null",[_countmax,_countmin,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY,_DAC_Zone_Set,_wpConfNr]]]execVM "DAC\Scripts\DAC_Rebuild_Group.sqf";
									};
							case 2:	{
										[_countrandom,[_GroupWP,_GroupPos,_zData,_mr],2,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_maxrad,[],_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,"null",[_countmax,_countmin,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY,_DAC_Zone_Set,_wpConfNr]]execVM "DAC\Scripts\DAC_Group_Vehicle.sqf";
										[2,[_countrandom,[_GroupWP,_GroupPos,_zData,_mr],2,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_maxrad,[],_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,"null",[_countmax,_countmin,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY,_DAC_Zone_Set,_wpConfNr]]]execVM "DAC\Scripts\DAC_Rebuild_Group.sqf";
									};
							case 3:	{
										[_countrandom,[_GroupWP,_GroupPos,_zData,_mr],3,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_maxrad,_DAC_ExtraUnit,_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,"null",[_countmax,_countmin,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY,_DAC_Zone_Set,_wpConfNr]]execVM "DAC\Scripts\DAC_Group_Tank.sqf";
										[3,[_countrandom,[_GroupWP,_GroupPos,_zData,_mr],3,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_maxrad,_DAC_ExtraUnit,_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,"null",[_countmax,_countmin,_DAC_ZoneRadiusX,_DAC_ZoneRadiusY,_DAC_Zone_Set,_wpConfNr]]]execVM "DAC\Scripts\DAC_Rebuild_Group.sqf";
									};
							case 4:	{
										if((random 100) < _mz) then {_mr = 0} else {_mr = 1};
										[_countrandom,1,[_GroupWP,_GroupPos,_zData,_mr],4,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_cwp,_HeloArray,[],_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,_DAC_Zone_Set,_wpConfNr]execVM "DAC\Scripts\DAC_Group_Air.sqf";
										[4,[_countrandom,1,[_GroupWP,_GroupPos,_zData,_mr],4,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_cwp,_HeloArray,[],_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,_DAC_Zone_Set,_wpConfNr]]execVM "DAC\Scripts\DAC_Rebuild_Group.sqf";
									};
							case 5:	{
										[_countrandom,1,_GroupWP,5,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_cwp,_HeloArray,[],_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,_Camp_Pool,_DAC_Zone_Set,_wpConfNr]execVM "DAC\Scripts\DAC_Group_Camp.sqf";
										[5,[_countrandom,1,_GroupWP,5,_DAC_ZoneSide,_DAC_ZoneStart,_DAC_ZoneEnde,_cwp,_HeloArray,[],_GroupVar,_m,_DAC_This_Zone,_DAC_UnitTyp,_Camp_Pool,_DAC_Zone_Set,_wpConfNr]]execVM "DAC\Scripts\DAC_Rebuild_Group.sqf";
									};
							Default {};
						};
						_zc = _zc + 1;
						if(_zc >= _DAC_Count_SG) then
						{
							_run = 5;
						}
						else
						{
							if(_zmod > 0) then
							{
								_run = 3;_check = 7;
							}
							else
							{
								_run = 3;_check = 5;
							};
						};
					};
		case 5:		{
						DAC_Init_Unit set [(_DAC_Group_Typ - 1),(DAC_Init_Unit select (_DAC_Group_Typ - 1)) - 1];
						_WPTempA = [];_WPTempB = [];_Heloarray = [];
						_zonr = _zonr + 1;
						if(_DAC_Group_Typ == 1) then
						{
							_run = 6;
						}
						else
						{
							_run = 2;
						};
					};
		case 6:		{
						DAC_Init_Unit set [0,(DAC_Init_Unit select 0) - 1];
						sleep 0.1;
						DAC_Init_Unit set [0,(DAC_Init_Unit select 0) + 1];
						_run = 2;
					};
		case 7:		{
						if(_DAC_Group_Typ == 1) then
						{
							_run = 8;
						}
						else
						{
							DAC_Init_Group = DAC_Init_Group - [_DAC_Group_Typ];
							DAC_Init_Counter set[(_DAC_Group_Typ - 1),0];
							sleep 0.01;
							if(count DAC_Init_Group == 0) then {DAC_StartDummy setpos [100,100,0]};
							_run = 0;
						};
					};
		case 8:		{
						waituntil {((({(_x == 0)} count DAC_Init_Counter) == 4) && (!(DAC_InCreate)) && (DAC_Master_Init == 0))};
						DAC_Init_Unit set [0,(DAC_Init_Unit select 0) - 1];
						DAC_Init_Group = DAC_Init_Group - [_DAC_Group_Typ];
						sleep 0.01;
						if(count DAC_Init_Group == 0) then {DAC_StartDummy setpos [100,100,0]};
						DAC_Init_Counter set[(_DAC_Group_Typ - 1),0];
						_run = 0;
					};
		case 9:		{
						if(_DAC_Group_Typ == 5) then
						{
							_run = 2;
						}
						else
						{
							if(DAC_Init_Camps == 0) then
							{
								_run = 2;
							}
							else
							{
								waituntil {DAC_Init_Camps == 0};
								_run = 2;
							};
						};
					};
		Default {};
	};
};