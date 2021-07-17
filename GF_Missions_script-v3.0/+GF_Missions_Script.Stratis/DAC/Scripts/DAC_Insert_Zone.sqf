//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Insert_Zone       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

if(!(isServer)) exitwith {};

private [
			"_thisZone","_KiZone","_ZonePos","_mxvalue","_myvalue","_s","_start","_isserv",
			"_ZoneMode","_GroupSol","_GroupVeh","_GroupTan","_GroupAir","_ZoneSide","_zPoly",
			"_ZoneRadius","_randomcount","_typ","_zs","_ma","_cu","_marker","_ac","_zoneLoc"
		];

			_thisZone = _this select 0;_cu = 0;_mxvalue = 0;_myvalue = 0;_s = 0;_marker = [];_typ = 0;_zoneLoc = objNull;
			_ZoneMode = 0;_GroupSol = [];_GroupVeh = [];_GroupTan = [];_GroupAir = [];_ZoneSide = 0;_zoneValues = [];
			_mxvalue = 0;_myvalue = 0;_ac = 0;_randomcount = 0;_zs = "";_ma = objNull;_KiZone = objNull;_zPoly = [];
			
if((typeName _thisZone) != "STRING") then
{
	hintc format["The name of a zone is not correct !\n\nThe Name of a zone in the Script call must be a string."];
	DAC_Basic_Value = 8;publicvariable "DAC_Basic_Value";
	if(time > 0) exitwith {};
}
else
{
	_KiZone = call compile _thisZone;
	if(format["%1",_KiZone] == scalar) then
	{
		hintc format["The name of a zone is not correct !\n\nEither in the Script call,\nor the name of one Trigger\nis not right."];
		DAC_Basic_Value = 8;publicvariable "DAC_Basic_Value";
		if(time > 0) exitwith {};
	}
	else
	{
		if(format["%1",_KiZone] in DAC_CheckZones) then
		{
			hintc format["The name of a zone is not correct !\n\nThere are at least two zones, which contain the same zone name."];
			DAC_Basic_Value = 8;publicvariable "DAC_Basic_Value";
			if(time > 0) exitwith {};
		}
		else
		{
			if	(((count (_this select 2) + count (_this select 3) + count (_this select 4) + count (_this select 5)) == 0) ||
				((count (_this select 1)) < 3) || ((count (_this select 1)) > 4) ||
				(((count (_this select 2)) < 4) && (!((count (_this select 2)) <= 1))) || ((count (_this select 2)) > 5) ||
				(((count (_this select 3)) < 4) && (!((count (_this select 3)) <= 1))) || ((count (_this select 3)) > 5) ||
				(((count (_this select 4)) < 4) && (!((count (_this select 4)) <= 1))) || ((count (_this select 4)) > 5) ||
				(((count (_this select 5)) < 3) && (!((count (_this select 5)) <= 1))) || ((count (_this select 5)) == 5) ||
				((count (_this select 5)) > 7) || ((count (_this select 6)) < 4) || ((count (_this select 6)) > 5)) then
			{
				hintc format[
								"Attention, in at least one zone\nthere is a faulty one script call.\n\nEither parameters were handed over\nnot enough, or too many parameters\nwere handed over...\n\n%1\n%2\n%3\n%4\n%5\n%6\n\nName of the faulty zone: = %7",
								_this select 1,_this select 2,_this select 3,_this select 4,_this select 5,_this select 6,_thisZone
							];
				DAC_Basic_Value = 2;publicvariable "DAC_Basic_Value";
				if(time > 0) exitwith {};
			}
			else
			{
				if(((_this select 6) select 0) > 3) then
				{
					hintc format["Error: DAC_Create_Zone > No valid side value > Zone: %1",_thisZone];
				}
				else
				{
					_typ = ((_this select 6) select 0);_mxvalue = ((triggerArea _KiZone) select 0);_myvalue = ((triggerArea _KiZone) select 1);
					if(((count (_this select 2)) < 2) && ((count (_this select 3)) < 2) && ((count (_this select 4)) < 2) && ((count (_this select 5)) < 2)) then {_typ = 4};
					[
						_KiZone,_typ,
						_mxvalue,
						_myvalue,
						(_this select 6)
					]	execVM "DAC\Marker\DAC_ZoneMarker.sqf";
				};
			};
		};
		
		_ZoneMode 	= _this select 1;_GroupSol = _this select 2;
		_GroupVeh 	= _this select 3;_GroupTan = _this select 4;
		_GroupAir 	= _this select 5;_ZoneSide = _this select 6;
		_mxvalue 	= ((triggerArea _KiZone) select 0);_myvalue = ((triggerArea _KiZone) select 1);_ac = _ZoneMode select 1;_randomcount = random 10000;
		
		_zoneValues =	[
							[1,[(position _KiZone select 0),(position _KiZone select 1)]],
							[2,[_mxvalue,_myvalue]],
							[3,[(_ZoneSide select 1),(_ZoneSide select 2)]]
						];
	
		sleep 0.01;
		while {_cu < count _zoneValues} do
		{
			_zs = format["%1#%2",_thisZone,_cu];
			_ma = createmarkerlocal [_zs, ((_zoneValues select _cu) select 1)];
			_ma setMarkerShapelocal "RECTANGLE";
			_ma setMarkerSizelocal [6,6];
			_ma setMarkerColorlocal "ColorBlack";
			if(_ac == 1) then {_ma setMarkerSizelocal [4,4]};
			_marker set [count _marker,_ma];
			_cu = _cu + 1;
		};
		DAC_Zones set [count DAC_Zones,[_thisZone,_mxvalue,_myvalue,_ZoneMode,_GroupSol,_GroupVeh,_GroupTan,_GroupAir,_ZoneSide,_marker,_zPoly]];
		
		_zoneLoc = createLocation ["Name", position _KiZone, ((triggerArea _KiZone) select 0), ((triggerArea _KiZone) select 1)];
		_zoneLoc setDirection ((triggerArea _KiZone) select 2);
		_zoneLoc setRectangular ((triggerArea _KiZone) select 3);
		_zoneLoc attachObject _KiZone;
		_zoneLoc setVariable ["DAC_Zone", _KiZone];
		_zoneLoc setVariable ["DAC_Type", "NewZone"];
		_KiZone setVariable ["DAC_ZoneLoc", _zoneLoc];
		
		call compile format["z_%1 = 0",_thisZone];
	};
};