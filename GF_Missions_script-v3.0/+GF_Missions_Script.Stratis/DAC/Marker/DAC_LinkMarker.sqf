//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_LinkMarker        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

if(DAC_Code != 1) exitwith {};

private [
			"_l","_la","_ld","_lr","_lp","_zc1","_zc2","_zone1","_zone2",
			"_tz1","_tz2","_tz3","_zv1","_zv2","_zSide","_color"
		];

if((DAC_Marker == 0) || ((DAC_Marker_Val select 9) <= 0) || (isDedicated)) exitwith {};
	
_zSide = DAC_Marker_Val select 14;_zone1 = "";_zone2 = "";_zv1 = 0;_zv2 = 0;
_tz1 = [];_tz2 = [];_tz3 = [];_zc1 = 0;_zc2 = 0;_zvl = 0;_color = [];_l = "";_la = "";_ld = 0;_lr = 0;_lp = [];

while {_zc1 < count DAC_Zones} do
{
	_zone1 = call compile ((DAC_zones select _zc1) select 0);
	_zv1 = (((DAC_zones select _zc1) select 3) select 0);_zc2 = 0;
	_color = _zSide select (((DAC_zones select _zc1) select 8) select 0);
	_tz3 set [count _tz3,format["((DAC_zones select %1) select 0)",_zc1]];
	while {_zc2 < count DAC_Zones} do
	{
		_zone2 = call compile ((DAC_zones select _zc2) select 0);
		if((format["%1%2",(position _zone1 select 0),(position _zone2 select 0)]) in _tz1) then
		{
			_zc2 = _zc2 + 1;
		}
		else
		{
			_zv2 = (((DAC_zones select _zc2) select 3) select 0);
			if(_zv1 == _zv2) then
			{
				_l  = format["_zma%1",(count _tz1 + 1)];_la = createmarkerlocal [_l, position _Zone1];
				_la setMarkerShapelocal "RECTANGLE";_la setMarkerSizelocal [10,10];_la setMarkerColorlocal _color;
				_ld = ((_Zone1 distance _Zone2) / 2);
				_lr = ((position _Zone2 select 0) - (position _Zone1 select 0)) atan2 ((position _Zone2 select 1) - (position _Zone1 select 1));
				_lp = [(position _Zone1 select 0) + (Sin (_lr) * _ld),(position _Zone1 select 1) + (Cos (_lr) * _ld),0];
				_la setMarkerSizelocal [_ld,(DAC_Marker_Val select 9)];_la setMarkerPoslocal _lp;_la setMarkerDirlocal (_lr - 90);
				_tz1 set [count _tz1,format["%1%2",(position _zone1 select 0),(position _zone2 select 0)]];
				_tz2 set [count _tz2,_la];
			};
			_zc2 = _zc2 + 1;
		};
	};
	_zc1 = _zc1 + 1;
};

waituntil {((getdir DAC_StartDummy) > 170)};

if((DAC_Marker_Val select 0) == 1) then
{
	sleep 5;
	{deletemarkerlocal _x}foreach _tz2;
}
else
{
	//disabled
};

