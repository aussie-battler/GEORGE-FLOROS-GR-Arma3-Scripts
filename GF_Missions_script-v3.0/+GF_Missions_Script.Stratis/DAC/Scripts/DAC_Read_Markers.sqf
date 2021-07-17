// DAC_fReadMarkers.sqf by MadRussian [created for general use]
// Packaged with the Dynamic AI Creator (DAC) v3, (by Silola, my awesome mentor and friend)
//
// This function reads in information (including position) for all markers starting with a given base name, and returns an array containing this information.
// Call with:		Points = [Base_String, Info_Requested, Blank_Limit, Delete] call DAC_fReadMarkers
//
// Base_String:		The base name of the marker.  For example, "Station" will pick up information on "Station", "Station_1", "Station_2", "Station_3", etc.
// Info_Requested:	The type of information requested.  Possibilities are "Pos", "Pos&Dir", "Pos&Dir&Text", or "Pos&Dir&Text&Name".
// Blank_Limit:		The number of missing input markers to ignore.  For example, assuming the markers present on the map are "WayPt", "WayPt_1", "WayPt_2", "WayPt_4", "WayPt_7",
//					using a blank limit of 2 or more would return info on all five markers.  Alternately, using a blank limit of 1 would return info on the first four markers only.
// Delete:			Whether or not to delete upon reading each marker
//
// Note- The blank limit feature is intended so that you may copy and paste in markers and then delete any of the markers without worrying about gaps.  
//		 A blank limit of 1000 or more is therefore recommended, to eliminate such concerns.
//
// Also see DAC documentation for more information

private ["_baseStr","_info","_blankLimit","_delete","_result","_blanks","_fail","_i","_markStr","_found","_pos","_dir","_elem","_text","_name"];

_baseStr = _this select 0;
_info = _this select 1;
_blankLimit = _this select 2;
_delete = _this select 3;

_result = [];
_blanks = 0;

_info = toUpper _info;
_fail = false;

switch (_info) do
{
	case "POS" : { /*hint "Pos";*/ };
	case "POS&DIR" : { /*hint "Pos&Dir";*/ };
	case "POS&DIR&TEXT" : { /*hint "Pos&Dir&Text";*/ };
	case "POS&DIR&TEXT&NAME" : { /*hint "Pos&Dir&Text&Name";*/ };
	default { hint format ["ReadMarkers - Invalid info type of %1!", _info]; _fail = true; };
};

if (not _fail) then
{
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

		if ( ((_pos select 0)==0) and ((_pos select 1)==0) and ((_pos select 2)==0) ) then {
			_blanks=_blanks+1;	  
		}
		else {
			_found=true;
		};
		if (_found) then {
			switch (_info) do
			{
				case "POS" : {
					_result set [count _result,_pos];
				};
				case "POS&DIR" : {
					_dir = markerDir _markStr;
					_elem = [_pos, _dir];
					_result set [count _result,_elem];
				};
				case "POS&DIR&TEXT": {
					_dir = markerDir _markStr;
					_text = markerText _markStr;
					_elem = [_pos, _dir, _text];
					_result set [count _result,_elem];
				};
				case "POS&DIR&TEXT&NAME": {
					_dir = markerDir _markStr;
					_text = markerText _markStr;
					_name = _markStr;
					_elem = [_pos, _dir, _text, _name];
					_result set [count _result,_elem];
				};
			};
		};
		if (_delete) then
		{
			deleteMarker _markStr;
		};
		_i=_i+1;
	};
};

_result




