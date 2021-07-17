//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_UnitMarker        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_unit","_mtyp","_color","_side","_group","_mzoom","_check",
			"_i","_rdm","_m","_ma","_rf","_s","_wait","_MarkerVal","_md"
		];		

			_unit = _this select 0;_mtyp  = _this select 1;_check = 0;
			_color = DAC_Marker_Val select 14;_MarkerVal = [];_side = ["EAST","WEST","GUER","CIV"];_rdm = random 1000;
			_i = 0;_rf = ((DAC_Marker_Val select 6) select 0);_m = format["m%1%2",_mtyp,_rdm];_group = objNull;_wait = 0;
			_ma = createmarkerlocal [_m, position _unit];_MarkerVal = [(DAC_Marker_Val select 15),_unit] call DAC_fFindMClass;
			_ma setMarkerTypelocal (_MarkerVal select 1);_ma setMarkerColorlocal (_color select 4);_s = _side find format["%1",side _unit];
			if(count _this > 2) then {_group = _this select 2} else {_group = group _unit};_mzoom = 1.5;_md = 9;

if(isDedicated) exitwith {};

if((count (_MarkerVal select 2)) > 1) then
{
	_ma setMarkerSizelocal (_MarkerVal select 2);
}
else
{
	_ma setMarkerSizelocal [((boundingBox _unit select 1) select 0),((boundingBox _unit select 1) select 1)];
};

if(_s == -1) then {_ma setMarkerColorlocal (_color select 4)} else {_ma setMarkerColorlocal (_color select _s)};

sleep (random 1);

if(count _this > 2) then
{
	if(({_x == _group} count DAC_Marker_Array) != 1) then {_check = 1};
};

if(_check == 0) then
{
	while {_mtyp > 0} do
	{
		if(((format["%1",group _unit] == "<NULL-group>") && (_unit iskindof "Man")) || (format["%1",_unit] == "<NULL-object>")) then
		{
			deletemarkerlocal _ma;_mtyp = 0;
		}
		else
		{
			if((DAC_Marker == 0) || ((DAC_Marker_Val select 3) == 0)) then
			{
				deletemarkerlocal _ma;_mtyp = 0;
			}
			else
			{
				switch (_mtyp) do
				{
					case 1:	{
								if(not alive _unit) then
								{
									_mtyp = 5;
								}
								else
								{
									if(!(_unit == vehicle _unit)) then
									{
										_ma setmarkerposlocal [0,0];_mtyp = 4;_wait = 1;
									}
									else
									{
										if((count (DAC_Marker_Val select 4)) > 0) then
										{
											if(!(isPlayer _unit)) then
											{
												if(_unit == leader (group _unit)) then
												{
													_ma setMarkerTextlocal (call compile ((DAC_Marker_Val select 4) select 0));
												}
												else
												{
													_ma setMarkerTextlocal "";
												};
											}
											else
											{
												_ma setMarkerTextlocal format["%1",name _unit];
											};
										};	
										_ma setmarkerposlocal [(position _unit select 0),(position _unit select 1)];
										_ma setmarkerdirlocal (direction _unit);
										sleep (_rf + random 0.1);
									};
								};
							};
					case 2:	{
								if(format["%1", _unit] == "<NULL-object>") then
								{
									deletemarkerlocal _ma;_mtyp = 0;
								}
								else
								{
									if(not alive _unit) then
									{
										_mtyp = 5;
									}
									else
									{
										if((count crew _unit) == 0) then
										{
											_ma setMarkerColorlocal (_color select 4);
											if((count (DAC_Marker_Val select 4)) > 0) then
											{
												_ma setMarkerTextlocal (call compile ((DAC_Marker_Val select 4) select 0));
											};
											_ma setmarkerdirlocal (direction _unit);
											_mtyp = 4;_wait = 2;
										}
										else
										{
											if(_unit != vehicle _unit) then
											{
												deletemarkerlocal _ma;_mtyp = 0;
											}
											else
											{
												_ma setmarkerposlocal [(position _unit select 0),(position _unit select 1)];
												_ma setmarkerdirlocal (direction vehicle _unit);
												sleep (_rf + random 0.1);
											};
										};
									};
								};
							};
					case 4:	{
								while {_wait > 0} do
								{
									if((format["%1",group _unit] == "<NULL-group>") && (_unit iskindof "Man")) then
									{
										deletemarkerlocal _ma;_mtyp = 0;_wait = 0;
									}
									else
									{
										if((DAC_Marker == 0) || ((DAC_Marker_Val select 3) == 0)) then
										{
											deletemarkerlocal _ma;_mtyp = 0;_wait = 0;
										}
										else
										{
											switch (_wait) do
											{
												case 1:	{
															sleep (0.5 + random 0.5);
															if(not alive _unit) then {_mtyp = 5;_wait = 0};
															if(_unit == vehicle _unit) then {_mtyp = 1;_wait = 0};
														};
												case 2:	{
															sleep (0.5 + random 0.5);
															_group = group _unit;
															if(not alive _unit) then {_mtyp = 5;_wait = 0};
															if((count crew _unit) > 0) then {_wait = 3};
															if((count (DAC_Marker_Val select 4)) > 0) then
															{
																_ma setMarkerTextlocal (call compile ((DAC_Marker_Val select 4) select 0));
															};
														};
												case 3:	{
															_s = _side find format["%1",side ((crew _unit) select 0)];
															if(_s >= 0) then {_ma setMarkerColorlocal (_color select _s)} else {_ma setMarkerColorlocal "ColorWhite"};
															_mtyp = 2;_wait = 0;
														};
												Default {};
											};
										};
									};
								};
							};
					case 5:	{
								_ma setMarkerTypelocal "waypoint";
								_ma setmarkerposlocal [(position _unit select 0),(position _unit select 1)];
								_ma setMarkerTextlocal "";_ma setMarkerColorlocal ((DAC_Marker_Val select 14) select 7);_ma setmarkerdirlocal 0;
								_ma setMarkerSizelocal [((_MarkerVal select 2) select 0),((_MarkerVal select 2) select 0)];
								if((DAC_Marker_Val select 5) == 0) then
								{
									_mtyp = 0;
								}
								else
								{
									if((DAC_Marker_Val select 5) == 2) then
									{
										deletemarkerlocal _ma;_mtyp = 0;
									}
									else
									{
										while {((!(format["%1",_unit] == "<NULL-object>")) && (DAC_Marker > 0) && ((DAC_Marker_Val select 3) == 1))} do
										{
											sleep (1 + random 1);
										};
										deletemarkerlocal _ma;_mtyp = 0;
									};
								};
							};
					Default {};
				};
			};
		};
	};
}
else
{
	deletemarkerlocal _ma;
};