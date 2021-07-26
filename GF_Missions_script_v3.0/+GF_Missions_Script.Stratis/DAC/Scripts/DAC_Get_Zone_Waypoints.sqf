// DAC_fGetZoneWaypoints.sqf by MadRussian [created for use with the Dynamic AI Creator (DAC) by Silola, master of the universe]
// See DAC documentation for usage and notes

private ["_zoneInput","_type","_fail","_waypoints","_DAC_Pool_Types","_zone","_DAC_WP_Array","_found","_idx","_elem","_zoneTest","_done","_wpCount"];

_zoneInput = _this select 0;
_type = _this select 1;

_type = toUpper _type;
_fail = false;
_waypoints = [];
_DAC_Pool_Types = ["S","V","T","A","C"];

_zone = "";
if ( (typeName _zoneInput) == "STRING" ) then
{
	_zone = call compile format ["%1",_zoneInput];
}
else
{
	_zone = _zoneInput;
};

_DAC_WP_Array = call compile format["DAC_WP_Pool_%1", _type];

if (isNil "_zoneInput") then { hint "GetZoneWaypoints - Invalid Zone any!"; _fail = true; };
if ( (not _fail) and (isNil "_zone") ) then { hint format ["GetZoneWaypoints - Invalid Zone %1!", _zoneInput]; _fail = true; };
if ( (not _fail) and (not (_type in _DAC_Pool_Types)) ) then { hint format ["GetZoneWaypoints - Invalid WP type of %1!", _type]; _fail = true; };
if ( (not _fail) and (isNil "_DAC_WP_Array") ) then { _fail = true; };

if (not _fail) then
{
	_found = false;
	_idx = 0;
	while { (_idx < (count _DAC_WP_Array)) and (not _found) } do
	{
		_elem = _DAC_WP_Array select _idx;
		if ( (count _elem) == 8 ) then
		{
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
		// Would alert user of this type of fail via hint, but can't because of DAC_ApplyPointsWithinZone's blind calls
		_fail = true;
	};

	if (not _fail) then
	{
		_done = false;
		
		_wpCount = 0;
		while { ((_idx + _wpCount + 1) < (count _DAC_WP_Array)) and (not _done) } do
		{
			_elem = _DAC_WP_Array select (_idx + _wpCount + 1);
			if ( (count _elem) == 8 ) then {
				_done = true;
			}
			else
			{
				_waypoints set [count _waypoints,[_elem select 0, _elem select 1, 0]];
			};
			_wpCount = _wpCount + 1;
		};
	};
};

_waypoints




