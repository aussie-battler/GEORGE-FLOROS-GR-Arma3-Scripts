//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_ResizeMarker      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_marker","_zone","_sp","_mxvalue","_myvalue","_i","_mPos","_mSetr","_mSets"];	

		_marker = _this select 0;_zone = _this select 1;_sp = _this select 2;
		_mxvalue = ((triggerarea _zone) select 0);_myvalue = ((triggerarea _zone) select 1);
		_mPos = position _zone;_i = 0;
		
_mSetr = 	[
				0,11.25,22.5,33.75,45,56.25,67.5,78.75,90,101.25,112.5,123.75,135,146.25,157.5,168.75,180,
				191.25,202.5,213.75,225,236.25,247.5,258.75,270,281.25,292.5,303.75,315,326.25,337.5,348.75
			];
_mSets = 	[
				[(_mxvalue + (DAC_Marker_Val select 11)),(DAC_Marker_Val select 11),_myvalue,180],
				[(DAC_Marker_Val select 11),(_myvalue + (DAC_Marker_Val select 11)),_mxvalue,90],
				[(_mxvalue + (DAC_Marker_Val select 11)),(DAC_Marker_Val select 11),_myvalue,0],
				[(DAC_Marker_Val select 11),(_myvalue + (DAC_Marker_Val select 11)),_mxvalue,270]
			];

if((triggerarea _zone) select 3) then
{
	while {_i < count _marker} do
	{
		(_marker select _i) setmarkerpos [(position _zone Select 0) + (Sin (((triggerarea _zone) select 2) + ((_mSets select _i) select 3)) * ((_mSets select _i) select 2)),(position _zone Select 1) + (Cos (((triggerarea _zone) select 2) + ((_mSets select _i) select 3)) * ((_mSets select _i) select 2))];
		(_marker select _i) setMarkerSize [((_mSets select _i) select 0),((_mSets select _i) select 1)];
		(_marker select _i) setMarkerDir ((triggerarea _zone) select 2);
		_i = _i + 1;
	};
}
else
{
	if(((triggerarea _zone) select 0) == ((triggerarea _zone) select 1)) then
	{
		while {_i < count _mSetr} do
		{
			(_marker select _i) setmarkerpos [(position _zone Select 0) + (Sin (_mSetr select _i) * ((triggerarea _zone) select 0)),(position _zone Select 1) + (Cos (_mSetr select _i) * ((triggerarea _zone) select 0))];
			(_marker select _i) setMarkerSize [(((pi * _mxvalue) / 32) + (((pi * _mxvalue) / 32) / 30)),(DAC_Marker_Val select 11)];
			_i = _i + 1;
		};
	}
	else
	{
		(_marker select 0) setmarkerpos (position _zone);
		(_marker select 0) setMarkerSize [((triggerarea _zone) select 0),((triggerarea _zone) select 1)];
		(_marker select 0) setMarkerDir ((triggerarea _zone) select 2);
	};
};