//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_PlayerMarker      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_i","_m","_ma","_s","_side","_mColor","_check"];

_i = 0;_m = "";_ma = "";_s = 0;
_side = ["EAST","WEST","GUER","CIV"];_check = [];
_mColor = ["ColorRed","ColorBlue","ColorYellow","ColorGreen"];

{
	_m = format["m%1",_x];_ma = createmarkerlocal [_m, [0,0]];_ma setmarkersizelocal [0.5,0.5];
	_ma setMarkerTypelocal "o_inf";_ma setMarkerColorlocal "ColorWhite";
}	foreach DAC_Players;

waituntil {(DAC_Basic_Value > 0)};

player setVariable ["respawn_var", 0, true];

while{time > 1} do
{
	_i = 0;
	while{_i < count DAC_Players} do
	{
		if(!(format["%1",(DAC_Players select _i)] == "<NULL-object>")) then
		{
			if(alive (DAC_Players select _i)) then
			{
				if(format["%1",(DAC_Players select _i) getVariable "respawn_var"] == "<NULL>") then
				{
					(DAC_Players select _i) setVariable ["respawn_var", 0, true];
				}
				else
				{
					if((DAC_Players select _i) in _check) then
					{
						if(((DAC_Players select _i) getVariable "respawn_var") == 1) then
						{
							_check = _check - [(DAC_Players select _i)];
							(DAC_Players select _i) setVariable ["respawn_var", 0, true];
							deletemarkerlocal format["d%1",(DAC_Players select _i)];
						};
					};
					_s = _side find format["%1",side (DAC_Players select _i)];
					if(_s >= 0) then
					{
						(format["m%1",(DAC_Players select _i)]) setmarkerposlocal (position (DAC_Players select _i));
						(format["m%1",(DAC_Players select _i)]) setMarkerTextlocal format["%1",name (DAC_Players select _i)];
						(format["m%1",(DAC_Players select _i)]) setMarkerColorlocal (_mColor select _s);
					};
				};
			}
			else
			{
				if(!((DAC_Players select _i) in _check)) then
				{
					_check set [count _check,(DAC_Players select _i)];
					_m = format["d%1",(DAC_Players select _i)];_ma = createmarkerlocal [_m, position (DAC_Players select _i)];_ma setmarkersizelocal [0.5,0.5];
					_ma setMarkerTypelocal "o_inf";_ma setMarkerColorlocal "ColorRed";
				};
			};
		};
		_i = _i + 1;
	};
	sleep 0.5;
};