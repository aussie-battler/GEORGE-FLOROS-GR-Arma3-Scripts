// DAC_fApplyPointsWithinZone.sqf by MadRussian [created for use with the Dynamic AI Creator (DAC) by Silola, master of the universe]
// See DAC documentation for usage and notes

private ["_zoneInput","_paraS","_paraV","_paraT","_paraA","_paraC","_fail","_zone","_replacementReport","_actualAppliedPositions","_locTypes","_zoneTypes","_usages","_caps","_zoneLoc","_i","_locType","_zoneType","_usage","_cap","_tempLocs","_nearbyLocations","_loc","_ptsInZone","_pos","_shuffleArray","_idx","_usageAmt","_swapPts","_j","_maxReplace","_actualReplaced","_ofTotal","_report","_currentAppliedPositions","_result"];

_zoneInput = _this select 0;
_paraS = _this select 1;
_paraV = _this select 2;
_paraT = _this select 3;
_paraA = _this select 4;
_paraC = _this select 5;

_fail = false;

_zone = "";
if ( (typeName _zoneInput) == "STRING" ) then
{
	_zone = call compile format ["%1",_zoneInput];
}
else
{
	_zone = _zoneInput;
};

if (isNil "_zoneInput") then { hint "ApplyPointsWithinZone - Invalid Zone any!"; _fail = true; };
if ( (not _fail) and (isNil "_zone") ) then { hint format ["ApplyPointsWithinZone - Invalid Zone %1!", _zoneInput]; _fail = true; };

_replacementReport = "";
_actualAppliedPositions = [];

if (not _fail) then
{
	_locTypes = [];
	_zoneTypes = [];
	_usages = [];
	_caps = [];

	if ( (count _paraS) > 0 ) then
	{
		_locTypes = _locTypes + ["DAC_Point_Soldier"];
		_zoneTypes = _zoneTypes + ["S"];
		_usages = _usages + [_paraS select 0];
		_caps = _caps + [_paraS select 1];
	};
	if ( (count _paraV) > 0 ) then
	{
		_locTypes = _locTypes + ["DAC_Point_Vehicle"];
		_zoneTypes = _zoneTypes + ["V"];
		_usages = _usages + [_paraV select 0];
		_caps = _caps + [_paraV select 1];
	};
	if ( (count _paraT) > 0 ) then
	{
		_locTypes = _locTypes + ["DAC_Point_Tank"];
		_zoneTypes = _zoneTypes + ["T"];
		_usages = _usages + [_paraT select 0];
		_caps = _caps + [_paraT select 1];
	};
	if ( (count _paraA) > 0 ) then
	{
		_locTypes = _locTypes + ["DAC_Point_Air"];
		_zoneTypes = _zoneTypes + ["A"];
		_usages = _usages + [_paraA select 0];
		_caps = _caps + [_paraA select 1];
	};
	if ( (count _paraC) > 0 ) then
	{
		_locTypes = _locTypes + ["DAC_Point_Camp"];
		_zoneTypes = _zoneTypes + ["C"];
		_usages = _usages + [_paraC select 0];
		_caps = _caps + [_paraC select 1];
	};

	_zoneLoc = _zone getVariable "DAC_ZoneLoc";

	_i = 0;
	{
		_locType = _x;
		_zoneType = _zoneTypes select _i;
		_usage = _usages select _i;
		_cap = _caps select _i;
		_tempLocs = nearestLocations [position _zone, ["Name"], 100000];

		_nearbyLocations = [];
		{
			_loc = _x;
			if ( (_loc getVariable "DAC_Type") == _locType ) then
			{
				_nearbyLocations = _nearbyLocations + [_loc];
			};
		} foreach _tempLocs;

		_ptsInZone = [];
		{
			_pos = locationPosition _x;
			if (_pos in _zoneLoc) then
			{
				_ptsInZone = _ptsInZone + [_pos];
			};
		} foreach _nearbyLocations;

		// Begin shuffle points
		_shuffleArray = +_ptsInZone;
		_ptsInZone = [];
		while { (count _shuffleArray) > 0 } do
		{
			_idx = floor (random (count _shuffleArray));
			_ptsInZone = _ptsInZone + [_shuffleArray select _idx];
			_shuffleArray set [_idx, "DELETE"];
			_shuffleArray = _shuffleArray - ["DELETE"];
		};
		// End shuffle points

		_usageAmt = round ((count _ptsInZone) * _usage);
		_swapPts = [];
		_j = 0;
		while { (_j < _usageAmt) and (_j < _cap) and (_j < (count _ptsInZone)) } do
		{
			_swapPts = _swapPts + [_ptsInZone select _j];
			_j = _j + 1;
		};
		_maxReplace = count _swapPts;
		_actualReplaced = 0;
		_ofTotal = 0;
		if ( (count _swapPts) > 0 ) then
		{
			_report = [_zone, _zoneType, _swapPts, _maxReplace] call DAC_fReplaceZoneWaypoints;
			_actualReplaced = _report select 1;
			_ofTotal = _report select 2;
			_currentAppliedPositions = _report select 4;
			{
				_actualAppliedPositions = _actualAppliedPositions + [_x];
			} foreach _currentAppliedPositions;
		};
		if (_ofTotal == 0) then
		{
			_ofTotal = count ([_zone, _zoneType] call DAC_fGetZoneWaypoints);
		};
		_replacementReport = _replacementReport + (format ["\n%1: %2 of %3 zone WPs replaced", _zoneType, _actualReplaced, _ofTotal]);
		_i = _i + 1;
	} foreach _locTypes;
};

_result = [];
if (_fail) then
{
	_result = ["ApplyPointsWithinZone - Operation failed.  No waypoints were applied.", []];
}
else
{
	_result = [_replacementReport, _actualAppliedPositions];
};

_result




