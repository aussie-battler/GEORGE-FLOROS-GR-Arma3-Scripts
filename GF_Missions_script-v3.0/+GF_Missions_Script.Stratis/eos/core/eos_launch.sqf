if (isServer) then {
private ["_HPpatrols","_HPgroupProbability","_CHgroupArray","_LVgroupArray","_HPgroupArray","_PAgroupArray","_CHgroupSize","_CHGroups","_SVehGroups","_AVgroupSize","_AVehGroups","_LVehGroups","_LVgroupSize","_PAgroupSize","_PApatrols","_HPpatrols","_HPgroupSize"];

_JIPmkr=(_this select 0);
_HouseInfantry=(_this select 1);
_HPpatrols=_HouseInfantry select 0;
_HPgroupSize=_HouseInfantry select 1;
_HPgroupProbability=if (count _HouseInfantry > 2) then {_HouseInfantry select 2} else {100};

_infantry=(_this select 2);
_PApatrols=_infantry select 0;
_PAgroupSize=_infantry select 1;
_PAgroupProbability=if (count _infantry > 2) then {_infantry select 2} else {100};

_LVeh=(_this select 3);
_LVehGroups=_LVeh select 0;
_LVgroupSize=_LVeh select 1;
_LVgroupProbability=if (count _LVeh > 2) then {_LVeh select 2} else {100};

_AVgrp=(_this select 4);
_AVehGroups=_AVgrp select 0;
_AVgroupProbability=if (count _AVgrp > 1) then {_AVgrp select 1} else {100};

_SVgrp=(_this select 5);
_SVehGroups=_SVgrp select 0;
_SVgroupProbability=if (count _SVgrp > 1) then {_SVgrp select 1} else {100};

_CHGrp=(_this select 6);
_CHGroups=_CHGrp select 0;
_CHgroupSize=_CHGrp select 1;
_CHgroupProbability=if (count _CHGrp > 2) then {_CHGrp select 2} else {100};

_settings=(_this select 7);

if (_HPgroupProbability > floor random 100) then {
	if (_HPgroupSize==0) then {_HPgroupArray=[1,1]};
	if (_HPgroupSize==1) then {_HPgroupArray=[2,4]};
	if (_HPgroupSize==2) then {_HPgroupArray=[4,8]};
	if (_HPgroupSize==3) then {_HPgroupArray=[8,12]};
	if (_HPgroupSize==4) then {_HPgroupArray=[12,16]};
	if (_HPgroupSize==5) then {_HPgroupArray=[16,20]};
	}else{_HPpatrols=0;_HPgroupArray=[1,1];};
	
if (_PAgroupProbability > floor random 100) then {	
	if (_PAgroupSize==0) then {_PAgroupArray=[1,1]};
	if (_PAgroupSize==1) then {_PAgroupArray=[2,4]};
	if (_PAgroupSize==2) then {_PAgroupArray=[4,8]};
	if (_PAgroupSize==3) then {_PAgroupArray=[8,12]};
	if (_PAgroupSize==4) then {_PAgroupArray=[12,16]};
	if (_PAgroupSize==5) then {_PAgroupArray=[16,20]};
	}else{_PApatrols=0;_PAgroupArray=[1,1];};	

if (_LVgroupProbability > floor random 100) then {	
	if (_LVgroupSize==0) then {_LVgroupArray=[0,0]};
	if (_LVgroupSize==1) then {_LVgroupArray=[2,4]};
	if (_LVgroupSize==2) then {_LVgroupArray=[4,8]};
	if (_LVgroupSize==3) then {_LVgroupArray=[8,12]};
	if (_LVgroupSize==4) then {_LVgroupArray=[12,16]};
	if (_LVgroupSize==5) then {_LVgroupArray=[16,20]};
}else{_LVehGroups=0;_LVgroupArray=[0,0];};

if (_AVgroupProbability > floor random 100) then {
}else{_AVehGroups=0;};

if (_SVgroupProbability > floor random 100) then {
}else{_SVehGroups=0;};

if (_CHgroupProbability > floor random 100) then {
	if (_CHgroupSize==0) then {_CHgroupArray=[0,0]};
	if (_CHgroupSize==1) then {_CHgroupArray=[2,4]};
	if (_CHgroupSize==2) then {_CHgroupArray=[4,8]};
	if (_CHgroupSize==3) then {_CHgroupArray=[8,12]};
	if (_CHgroupSize==4) then {_CHgroupArray=[12,16]};
	if (_CHgroupSize==5) then {_CHgroupArray=[16,20]};
}else{_CHGroups=0;_CHgroupArray=[0,0]};

{
	_eosMarkers=server getvariable "EOSmarkers";
	if (isnil "_eosMarkers") then {_eosMarkers=[];};
		_eosMarkers set [count _eosMarkers,_x];
		server setvariable ["EOSmarkers",_eosMarkers,true];
		null = [_x,[_HPpatrols,_HPgroupArray],[_PApatrols,_PAgroupArray],[_LVehGroups,_LVgroupArray],[_AVehGroups,_SVehGroups,_CHGroups,_CHgroupArray],_settings] execVM "eos\core\EOS_Core.sqf";
}foreach _JIPmkr;
};