_eosMarkers=server getvariable "EOSmarkers";

{_x setMarkerAlpha (MarkerAlpha _x);
_x setMarkercolor (getMarkercolor _x);
}foreach _eosMarkers;
