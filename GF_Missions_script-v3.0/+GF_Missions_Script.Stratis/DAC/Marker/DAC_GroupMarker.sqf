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
			"_unit","_mtyp","_color","_side","_group","_mzoom",
			"_rdm","_m","_ma","_rf","_s","_MarkerVal","_md","_status"
		];		

			_unit = _this select 0;_mtyp  = _this select 1;
			_color = DAC_Marker_Val select 14;_MarkerVal = [];_side = ["EAST","WEST","GUER","CIV"];_rdm = random 1000;
			_rf = ((DAC_Marker_Val select 6) select 0);_m = format["m%1%2",_mtyp,_rdm];_group = objNull;
			_ma = createmarkerlocal [_m, position _unit];_MarkerVal = [(DAC_Marker_Val select 15),(vehicle _unit)] call DAC_fFindMClass;
			_ma setMarkerTypelocal (_MarkerVal select 1);_ma setMarkerColorlocal (_color select 4);_s = _side find format["%1",side _unit];
			if(count _this > 2) then {_group = _this select 2} else {_group = group _unit};_mzoom = 1.5;_md = 9;_status = 0;

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

waituntil {(DAC_Basic_Value == 1)};

sleep (random 1);

if(DAC_Marker == 0) then {_status = 1};

while {_mtyp > 0} do
{
	if((DAC_Marker == 0) || ((DAC_Marker_Val select 3) == 1)) then
	{
		deletemarkerlocal _ma;_mtyp = 0;
	}
	else
	{
		switch (_mtyp) do
		{
			case 1:	{
						if(format["%1",_group] == "<NULL-group>") then
						{
							deletemarkerlocal _ma;_mtyp = 0;
						}
						else
						{
							if(({alive _x} count units _group) == 0) then
							{
								_mtyp = 2;
							}
							else
							{
								_unit = leader _group;
								if((count (DAC_Marker_Val select 4)) > 0) then
								{
									if(!(isPlayer _unit)) then
									{
										_ma setMarkerTextlocal (call compile ((DAC_Marker_Val select 4) select 0));
									}
									else
									{
										_ma setMarkerTextlocal format["%1",name _unit];
									};
								};
								_s = _side find format["%1",side _unit];
								if(_s == -1) then {_ma setMarkerColorlocal (_color select 4)} else {_ma setMarkerColorlocal (_color select _s)};
								_ma setmarkerposlocal [(position _unit select 0),(position _unit select 1)];
								if((_MarkerVal select 3) > 0) then {_ma setmarkerdirlocal (direction _unit)};
								sleep (_rf + random 0.1);
							};
						};
					};
			case 2:	{
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
								while {((!(isNull _unit)) && (DAC_Marker > 0) && ((DAC_Marker_Val select 3) == 0))} do
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