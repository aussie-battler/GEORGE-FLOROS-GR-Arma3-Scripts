// DAC_fInsideOfZones.sqf by MadRussian [created for use with the Dynamic AI Creator (DAC) by Silola, master of the universe]
// See DAC documentation for usage and notes

//private ["_pos","_info","_fail","_result","_allZoneLocs","_zoneLoc","_x"];
private ["_pos","_info","_fail","_result","_tempLocs","_allZoneLocs","_loc","_zoneLoc","_x"];

_pos = _this select 0;
_info = _this select 1;

_info = toUpper _info;
_fail = false;

switch (_info) do
{
	case "ZONES" : { /*hint "Zones";*/ };
	case "ZONELOCS" : { /*hint "ZoneLocs";*/ };
	default { hint "InsideOfZones - Invalid info type."; _fail = true; };
};

_result = [];

if (not _fail) then
{
	_tempLocs = nearestLocations [_pos, ["Name"], 100000];
	_allZoneLocs = [];
	{
		_loc = _x;
		if ( (_loc getVariable "DAC_Type") == "NewZone" ) then
		{
			_allZoneLocs = _allZoneLocs + [_loc];
		};
	} foreach _tempLocs;
	
	{
		_zoneLoc = _x;
		if (_pos in _zoneLoc) then
		{
			switch (_info) do
			{
				case "ZONES" : {
					_result = _result + [_zoneLoc getVariable "DAC_Zone"];
				};
				case "ZONELOCS" : {
					_result = _result + [_zoneLoc];
				};
			};
		};
	} foreach _allZoneLocs;
};

_result




