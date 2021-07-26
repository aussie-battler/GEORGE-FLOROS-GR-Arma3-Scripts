private ["_eosKills"];
_eosKills=server getvariable "EOSkillCounter";

	if (isnil "_eosKills") then {_eosKills=0;}else{
		_eosKills=server getvariable "EOSkillCounter";
				};		
				
_eosKills=_eosKills + 1;
server setvariable ["EOSkillCounter",_eosKills,true];

hint format ["Units Killed: %1",_eosKills];