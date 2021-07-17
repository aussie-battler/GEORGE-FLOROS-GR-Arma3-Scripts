//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_LeaderMarker      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_unit","_wppos","_leader","_m","_ma","_r","_d","_n","_check","_rf","_sz","_run","_go"];

_unit = _this select 0;_group = _this select 1;_leader = leader _group;_check = true;_run = 0;_go = true;_wppos  = position _leader;_m = "";_ma = "";_r = 0;_d = 0;_n = 0;_rf = 0;_sz = 0;

if(isDedicated) exitwith {};

waituntil {(getdir DAC_StartDummy) > 170};

if(_unit == _leader) exitwith {};
if((DAC_Marker > 0) && ((DAC_Marker_Val select 3) == 1)) then {_run = 1};

while {_check} do
{
	switch (_run) do
	{
		case 0:	{
					while {_run == 0} do
					{
						sleep (1 + random 1);
						if((DAC_Marker_Val select 3) == 1) then
						{
							if((DAC_Marker > 0) && ((DAC_Marker_Val select 8) == 1)) then {_run = 1;_go = true};
						};
					};
				};
		case 1:	{
					_rf = ((DAC_Marker_Val select 6) select 1);
					_sz = (DAC_Marker_Val select 8);
					_m  = format["_uwp%1",_unit];
					_ma = createmarkerlocal [_m, position _unit];
					_ma setMarkerShapelocal "RECTANGLE";
					_ma setMarkerSizelocal [_sz,_sz];
					_ma setMarkerColorlocal "ColorBlack";
					while {_go} do
					{
						sleep (_rf + random 0.1);
						if((format["%1",leader _group] == "<NULL-group>") && (({alive _x} count units _group) == 0)) then
						{
							deletemarkerlocal _ma;_check = false;_go = false;
						}
						else
						{
							if(DAC_Marker == 0) then
							{
								deletemarkerlocal _ma;_go = false;_run = 0;
							}
							else
							{
								if(!((group _unit) in DAC_All_Groups)) then
								{
									deletemarkerlocal _ma;_go = false;_run = 0;
								}
								else
								{
									if((alive _unit) && ((_unit in DAC_East_Units) || (_unit in DAC_West_Units))) then
									{
										if((_unit == leader _group) || (!(_group == group _unit))) then
										{
											deletemarkerlocal _ma;_check = false;_go = false;
										}
										else
										{
											_leader = leader _group;
											if(_unit == vehicle _unit) then
											{
												_d = ((_leader distance _unit) / 2);
												_r = ((position _leader select 0) - (position _unit select 0)) atan2 ((position _leader select 1) - (position _unit select 1));
												_n = [(position _unit select 0) + (Sin (_r) * _d),(position _unit select 1) + (Cos (_r) * _d),0];
												_ma setMarkerSizelocal [_d,_sz];_ma setMarkerPoslocal _n;_ma setMarkerDirlocal (_r + 90);
												if(alive _leader) then {_ma setMarkerColorlocal "ColorBlack";} else {_ma setMarkerColorlocal "ColorWhite"};
											}
											else
											{
												if(!(format["%1",(driver (vehicle _unit))] == "<NULL-object>")) then
												{
													if(_unit == (driver (vehicle _unit))) then
													{
														_d = ((_leader distance _unit) / 2);
														_r = ((position _leader select 0) - (position _unit select 0)) atan2 ((position _leader select 1) - (position _unit select 1));
														_n = [(position _unit select 0) + (Sin (_r) * _d),(position _unit select 1) + (Cos (_r) * _d),0];
														_ma setMarkerSizelocal [_d,_sz];_ma setMarkerPoslocal _n;_ma setMarkerDirlocal (_r + 90);
														if(alive _leader) then {_ma setMarkerColorlocal "ColorBlack";} else {_ma setMarkerColorlocal "ColorWhite"};
													}
													else
													{
														_ma setMarkerSizelocal [1,1];_ma setMarkerPoslocal [0,0];
													};
												}
												else
												{
													if(!(format["%1",(gunner (vehicle _unit))] == "<NULL-object>")) then
													{
														if(_unit == (gunner (vehicle _unit))) then
														{
															_d = ((_leader distance _unit) / 2);
															_r = ((position _leader select 0) - (position _unit select 0)) atan2 ((position _leader select 1) - (position _unit select 1));
															_n = [(position _unit select 0) + (Sin (_r) * _d),(position _unit select 1) + (Cos (_r) * _d),0];
															_ma setMarkerSizelocal [_d,_sz];_ma setMarkerPoslocal _n;_ma setMarkerDirlocal (_r + 90);
															if(alive _leader) then {_ma setMarkerColorlocal "ColorBlack";} else {_ma setMarkerColorlocal "ColorWhite"};
														};
													}
													else
													{
														_ma setMarkerSizelocal [1,1];_ma setMarkerPoslocal [0,0];
													};
												};
											};
										};
									}
									else
									{
										deletemarkerlocal _ma;_check = false;_go = false;
									};
								};
							};
						};
					};
				};
		default	{};
	};
};