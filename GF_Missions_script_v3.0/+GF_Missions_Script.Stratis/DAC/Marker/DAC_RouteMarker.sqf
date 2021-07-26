//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_RouteMarker       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_group","_wppos","_newpos","_newbeh","_side","_leader","_md","_np","_wait","_go","_ison",
			"_m","_ma","_na","_r","_d","_n","_check","_rf","_sz","_t","_v","_l","_s","_pos","_rn","_run"
		];
		
_run = 0;_go = true;_ison = 0;_pos = [];_newbeh = 0;_md = "";_np = "";
_group = _this select 0;_side = _this select 1;_leader = leader _group;
_check = true;_wppos = [0,0];_newpos = [0,0];_m = "";_ma = "";_na = "";
_rf = ((DAC_Marker_Val select 6) select 1);_sz = ((DAC_Marker_Val select 7) select 0);
_t = 0;_v = 0;_rn = _rf;_wait = time + 5;_r = 0;_d = 0;_n = 0;_l = "";_s = 0;

if(isDedicated) exitwith {};

waituntil {(getdir DAC_StartDummy) > 170};
sleep 3;

{[_x,(_this select 0)] spawn DAC_fLeaderMarker} foreach units (_this select 0);

while {_go} do
{
	switch (_run) do
	{
		case 0:	{
					while {_run == 0} do
					{
						sleep (1 + random 1);
						if((DAC_Marker > 0) && (((DAC_Marker_Val select 7) select 0) > 0) && (((DAC_Marker_Val select 7) select 1) > 0)) then {_run = 1};
					};
				};
		case 1:	{
					if(({alive _x} count units _group) > 0) then
					{
						_group = _this select 0;_side = _this select 1;_leader = leader _group;
						_check = true;_wppos = [0,0];_newpos = [0,0];_t = 0;_v = 0;_rn = _rf;_wait = time + 5;
						_rf = ((DAC_Marker_Val select 6) select 1);_sz = ((DAC_Marker_Val select 7) select 0);
						_m  = format["_mwp%1%2",_group,(round (random 1000))];_ma = createmarkerlocal [_m, position (units _group select 0)];
						_ma setMarkerShapelocal "RECTANGLE";_ma setMarkerSizelocal [1,1];_ma setMarkerColorlocal ((DAC_Marker_Val select 14) select 6);
						_l  = format["_nwp%1%2",_group,(round (random 1000))];_na = createmarkerlocal [_l, position (units _group select 0)];_ison = 0;
						_na setMarkerShapelocal "ELLIPSE";_na setMarkerSizelocal [((DAC_Marker_Val select 7) select 1),((DAC_Marker_Val select 7) select 1)];_na setMarkerColorlocal ((DAC_Marker_Val select 14) select 5);
						while {_check} do
						{
							sleep (_rn);
							if(format["%1",_group getVariable "dacData"] != "<NULL>") then
							{
								_wppos = ((_group getVariable "dacData") select 1);_newbeh = ((_group getVariable "dacData") select 0);
								_na setmarkerposlocal _wppos;_t = 0;_v = 0;
								_na setMarkerSizelocal [((DAC_Marker_Val select 7) select 1),((DAC_Marker_Val select 7) select 1)];_rn = _rf;
								switch (_newbeh) do
								{
									case 0:	{
												_ma setMarkerColorlocal ((DAC_Marker_Val select 14) select 5);
												_na setMarkerColorlocal ((DAC_Marker_Val select 14) select 6);
											};
									case 1:	{
												_ma setMarkerColorlocal "ColorBlue";
												_na setMarkerColorlocal "ColorBlue";
											};
									case 2:	{
												_ma setMarkerColorlocal "ColorRed";
												_na setMarkerColorlocal "ColorRed";
											};
									case 3:	{
												_ma setMarkerColorlocal "ColorYellow";
												_na setMarkerColorlocal "ColorYellow";
											};
									Default {};
								};
								if(({alive _x} count units _group) == 0) then
								{
									deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_go = false;
									sleep 1;
								}
								else
								{
									if(!(_group in DAC_All_Groups)) then
									{
										deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_run = 0;_go = false;
									}
									else
									{
										if((DAC_Marker == 0) || ((((DAC_Marker_Val select 7) select 0) == 0) && (((DAC_Marker_Val select 7) select 1) == 0))) then
										{
											deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_run = 0;
										}
										else
										{
											if((alive _leader) && (_group == group _leader)) then
											{
												_d = ((_wppos distance [(position _leader select 0),(position _leader select 1),0]) / 2);
												_r = ((_wppos select 0) - (position _leader select 0)) atan2 ((_wppos select 1) - (position _leader select 1));
												_n = [(position _leader select 0) + (Sin (_r) * _d),(position _leader select 1) + (Cos (_r) * _d),0];
												_ma setMarkerSizelocal [_d,_sz];_ma setMarkerPoslocal _n;_ma setMarkerDirlocal (_r + 90);
											}
											else
											{
												{_x setMarkerColorlocal "ColorWhite"} foreach [_ma,_na];
												waituntil {((DAC_Marker == 0) || (({alive _x} count units _group) == 0) || ((!(leader _group == _leader)) || ((format["%1",group _leader] == "<NULL-group>") && (({alive _x} count units _group) == 0))))};
												if(DAC_Marker == 0) then
												{
													deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_run = 0;
												}
												else
												{
													if((({alive _x} count units _group) == 0) || ((({alive _x} count units _group) == 0) && (format["%1",group _leader] == "<NULL-group>"))) then
													{
														deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_go = false;
														sleep 1;
													}
													else
													{
														_leader = leader _group;_wppos = [0,0];
														sleep 1;
													};
												};
											};
										};
									};
								};
							};
						};
					}
					else
					{
						_check = false;_go = false;
					};
				};
	};
};