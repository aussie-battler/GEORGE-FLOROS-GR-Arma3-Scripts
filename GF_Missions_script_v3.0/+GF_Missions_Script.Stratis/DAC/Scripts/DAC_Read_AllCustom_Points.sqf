// DAC_fReadAllCustomPoints.sqf by MadRussian [created for use with the Dynamic AI Creator (DAC) by Silola, master of the universe]
// See DAC documentation for usage and notes

private ["_baseS","_baseV","_baseT","_baseB","_baseA","_baseC","_blankLimit","_delete","_result","_baseStrs","_baseStr","_blanks","_i","_markStr","_found","_pos","_locType","_locName","_loc"];

_baseS = _this select 0;
_baseV = _this select 1;
_baseT = _this select 2;
_baseB = _this select 3;
_baseA = _this select 4;
_baseC = _this select 5;
_blankLimit = _this select 6;
_delete = _this select 7;

_result = [];

_baseStrs = [_baseS, _baseV, _baseT, _baseB, _baseA, _baseC];
{
	_baseStr = _x;
	_blanks = 0;
	_i=0;
	while { _blanks <= _blankLimit } do
	{
		_markStr = "";
		_found=false;
		if (_i==0) then
		{
			_markStr = _baseStr;
		}
		else
		{
			_markStr = _baseStr + (format ["_%1", _i]);
		};
		_pos = getMarkerPos _markStr;

		if ( ((_pos select 0)==0) and ((_pos select 1)==0) and ((_pos select 2)==0) ) then
		{
			_blanks=_blanks+1;	  
		}
		else
		{
			_found=true;
		};
		if (_found) then
		{
			if (not (_baseStr == "") ) then
			{
				_locType = "";
				switch (_baseStr) do
				{
					case _baseS : {
						_locType = "DAC_Point_Soldier";
					};
					case _baseV : {
						_locType = "DAC_Point_Vehicle";
					};
					case _baseT : {
						_locType = "DAC_Point_Tank";
					};
					case _baseB : { // Both
						if ((random 1) > 0.5) then
						{
							_locType = "DAC_Point_Vehicle";
						}
						else
						{
							_locType = "DAC_Point_Tank";
						};
					};
					case _baseA : {
						_locType = "DAC_Point_Air";
					};
					case _baseC : {
						_locType = "DAC_Point_Camp";
					};
				};
				_loc = createLocation ["Name", _pos, 0, 0];
				_loc setVariable ["DAC_Type", _locType];
				_result = _result + [_loc];		
			};
		};
		if (_delete) then
		{
			deleteMarker _markStr;
		};
		_i=_i+1;
	};
} foreach _baseStrs;

_result




