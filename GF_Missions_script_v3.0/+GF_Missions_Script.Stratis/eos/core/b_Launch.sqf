if (isServer) then {
private ["_CHgroupArray","_LVgroupArray","_PAgroupArray","_CHGroups","_AVehGroups","_LVehGroups","_PApatrols"];

_JIPmkr=(_this select 0);
_infantry=(_this select 1);
_PApatrols=_infantry select 0;
_PAgroupSize=_infantry select 1;
_LVeh=(_this select 2);
_LVehGroups=_LVeh select 0;
_LVgroupSize=_LVeh select 1;
_AVeh=(_this select 3);
_AVehGroups=_AVeh select 0;
_SVeh=(_this select 4);
_CHGroups=_SVeh select 0;
_CHgroupSize=_SVeh select 1;
_settings=(_this select 5);
_basSettings=(_this select 6);
	if (_PAgroupSize==0) then {_PAgroupArray=[1,1]};
	if (_PAgroupSize==1) then {_PAgroupArray=[2,4]};
	if (_PAgroupSize==2) then {_PAgroupArray=[4,8]};
	if (_PAgroupSize==3) then {_PAgroupArray=[8,12]};
	if (_PAgroupSize==4) then {_PAgroupArray=[12,16]};
	if (_PAgroupSize==5) then {_PAgroupArray=[16,20]};


	if (_LVgroupSize==0) then {_LVgroupArray=[1,1]};
	if (_LVgroupSize==1) then {_LVgroupArray=[2,4]};
	if (_LVgroupSize==2) then {_LVgroupArray=[4,8]};
	if (_LVgroupSize==3) then {_LVgroupArray=[8,12]};
	if (_LVgroupSize==4) then {_LVgroupArray=[12,16]};
	if (_LVgroupSize==5) then {_LVgroupArray=[16,20]};

	if (_CHgroupSize==0) then {_CHgroupArray=[0,0]};
	if (_CHgroupSize==1) then {_CHgroupArray=[2,4]};
	if (_CHgroupSize==2) then {_CHgroupArray=[4,8]};
	if (_CHgroupSize==3) then {_CHgroupArray=[8,12]};
	if (_CHgroupSize==4) then {_CHgroupArray=[12,16]};
	if (_CHgroupSize==5) then {_CHgroupArray=[16,20]};
{
	_eosMarkers=server getvariable "EOSmarkers";
	
	if (isnil "_eosMarkers") then {_eosMarkers=[];};
		_eosMarkers set [count _eosMarkers,_x];
		server setvariable ["EOSmarkers",_eosMarkers,true];
		null = [_x,[_PApatrols,_PAgroupArray],[_LVehGroups,_LVgroupArray],[_AVehGroups],[_CHGroups,_CHgroupArray],_settings,_basSettings] execVM "eos\core\b_core.sqf";
}foreach _JIPmkr;

};