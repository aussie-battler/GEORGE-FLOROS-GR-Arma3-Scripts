// DAC_fReplaceZoneWaypoints.sqf by MadRussian [created for use with the Dynamic AI Creator (DAC) by Silola, master of the universe]
// See DAC documentation for usage and notes

private ["_zoneInput","_type","_replacementWPs","_maxReplace","_fail","_DAC_Pool_Types","_zoneMetaIdx","_actualReplaced","_waypoints","_actualReplacedPositions","_zone","_DAC_WP_Array","_found","_DacZonesIndex","_elem","_zoneTest","_idx","_done","_wpCount","_shuffleArray","_shuffleIdx","_typeNum","_mark","_i","_pos","_dacPos","_result"];

_zoneInput = _this select 0;
_type = _this select 1;
_replacementWPs = _this select 2;
_maxReplace = _this select 3; // Optional

_type = toUpper _type;
_fail = false;

_DAC_Pool_Types = ["S","V","T","A","C"];
_zoneMetaIdx = -1;
_actualReplaced = 0;
_waypoints = [];
_actualReplacedPositions = [];

_zone = "";
if ( (typeName _zoneInput) == "STRING" ) then
{
	_zone = call compile format ["%1",_zoneInput];
}
else
{
	_zone = _zoneInput;
};

_DAC_WP_Array = call compile format ["DAC_WP_Pool_%1", _type];

if (isNil "_zoneInput") then { hint "ReplaceZoneWaypoints - Invalid Zone any!"; _fail = true; };
if ( (not _fail) and (isNil "_zone") ) then { hint format ["ReplaceZoneWaypoints - Invalid Zone %1!", _zoneInput]; _fail = true; };
if ( (not _fail) and (not (_type in _DAC_Pool_Types)) ) then { hint format ["ReplaceZoneWaypoints - Invalid WP type of %1!", _type]; _fail = true; };
if ( (not _fail) and (isNil "_DAC_WP_Array") ) then { _fail = true; };

if (not _fail) then
{
	_found = false;
	_DacZonesIndex = 0;
	while { (_DacZonesIndex < (count DAC_Zones)) and (not _found) } do
	{
		_elem = DAC_Zones select _DacZonesIndex;
		_zoneTest = "";
		call compile format ["_zoneTest = %1", _elem select 0];
		if (_zoneTest == _zone) then
		{
			_found = true;
		};
		_DacZonesIndex = _DacZonesIndex + 1;
	};
	if (_found) then
	{
		// Found - subtract one for correct index
		_DacZonesIndex = _DacZonesIndex - 1;
	}
	else
	{
		hint "ReplaceZoneWaypoints - Zone not found in DAC_Zones array!";
		_fail = true;
	};

	_found = false;
	_idx = 0;
	while { (not _fail) and (_idx < (count _DAC_WP_Array)) and (not _found) } do
	{
		_elem = _DAC_WP_Array select _idx;
		if ( (count _elem) == 8 ) then
		{
			_zoneMetaIdx = _zoneMetaIdx + 1;
			_zoneTest = _elem select 0;
			if (_zoneTest == _zone) then
			{
				_found = true;
			};
		};
		_idx = _idx+1;
	};
	if (_found) then
	{
		// Found - subtract one for correct index
		_idx = _idx - 1;
	}
	else
	{
		// Would alert user of fail via hint - but cannot because of DAC_ApplyPointsWithinZone's blind calls
		_fail = true;
	};

	if (not _fail) then
	{
		_done = false;

		_wpCount = 0;
		while { ((_idx + _wpCount + 1) < (count _DAC_WP_Array)) and (not _done) } do
		{
			_elem = _DAC_WP_Array select (_idx + _wpCount + 1);
			if ( (count _elem) == 8 ) then
			{
				_done = true;
			}
			else
			{
				_waypoints set [count _waypoints,_elem];
			};
		_wpCount = _wpCount + 1;
		};

		if (format["%1",_maxReplace] == "<null>") then
		{
			_maxReplace = count _replacementWPs;	
		};

		// Begin shuffle points
		_shuffleArray = +_replacementWPs;
		_replacementWPs = [];
		while { (count _shuffleArray) > 0 } do
		{
			_shuffleIdx = floor (random (count _shuffleArray));
			_replacementWPs set [count _replacementWPs,_shuffleArray select _shuffleIdx];
			_shuffleArray set [_shuffleIdx, "DELETE"];
			_shuffleArray = _shuffleArray - ["DELETE"];
		};
		// End shuffle points

		_typeNum = ""; // scope ref
		_mark = ""; // scope ref

		_done = false;
		_i = 0;
		while { (_i < _wpCount) and (_i < _maxReplace) and (_i < (count _replacementWPs)) and (_i < (count _waypoints)) } do
		{
			_pos = _replacementWPs select _i;
			_typeNum = (_DAC_Pool_Types find _type) + 1;
			_mark = format["m%1%2%3", _DacZonesIndex, _i, _typeNum];
			_mark setMarkerPos _pos;
			_dacPos = [_pos select 0, _pos select 1];
			call compile format ["DAC_WP_Pool_%1 set [_idx + 1 + _i, _dacPos]", _type];
			
			_actualReplacedPositions set [count _actualReplacedPositions,_pos];
			
			_i = _i + 1;
		};
		_actualReplaced = _i;
	};
};

_result = [];
if (_fail) then
{
	_result = ["ReplaceZoneWaypoints - Operation failed.  No waypoints were replaced.", 0, 0, _type, []];
}
else
{
	_result = [format ["ReplaceZoneWaypoints Report\n\nReplaced %1 of %2 zone waypoints of type %3.", _actualReplaced, count _waypoints, _type], _actualReplaced, count _waypoints, _type, _actualReplacedPositions];
};

_result




