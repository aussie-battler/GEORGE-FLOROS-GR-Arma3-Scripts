


//________________	Author : GEORGE FLOROS [GR]	___________	08.03.19	___________


/*
________________	GF Auto Population Script - Mod	________________

https://forums.bohemia.net/forums/topic/221987-gf-auto-population-script-mod/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts - Mods , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


/*
//___________________	add this to use	___________________
//___________________	Static_Weapons	___________________
[] spawn GF_AP_Spawn_Static_Weapons;
*/


//___________________	GF_AP_Spawn_Static_Weapons	___________________

GF_AP_Spawn_Static_Weapons = {

if (count allUnits < GF_AP_Enemy_Max_Number) then {

_Pos = GF_AP_Pos;
_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

if !(_Pos_Spawn isEqualTo [0,0,0]) then {
_Group = createGroup GF_AP_Enemy_Side;

for "_x" from 0 to (1 + random 4) do {

_Pos_Spawn =  [[[_Pos, 25 + random 25]],["water"]] call BIS_fnc_randomPos;

_Unit_Defend = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
[_Unit_Defend] JoinSilent _Group;
(leader _Group) setSkill GF_AP_set_AiSkill_leader + floor random GF_AP_set_AiSkill_leader_random;
_Unit_Defend setSkill GF_AP_set_AiSkill + random GF_AP_set_AiSkill_random;
_Unit_Defend setVariable ["Var_GF_AP_Spawn",true];

if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit_Defend spawn GF_AP_ARL;
};

};


_Group setBehaviour "AWARE";
_Group setCombatMode "RED";

[_Group, _Pos] call BIS_fnc_taskDefend;

if (GF_AP_DynamicSimulation) then {	
_Group enableDynamicSimulation true;
};

for "_x" from 0 to (1 + random 2) do {

_Static_Weapons = selectRandom GF_AP_Pool_Static_Weapons; 
_create_Static_Weapons = _Static_Weapons createVehicle _Pos_Spawn;
_create_Static_Weapons setVariable ["Var_GF_AP_Spawn",true];

_Seats_Number = [_Static_Weapons,true] call BIS_fnc_crewCount; //	Count all available seats including cargo slots

if (GF_AP_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Static_Weapons , _Seats_Number];
};

for "_x" from 1 to _Seats_Number do {

	_Unit = _Group createunit [selectrandom GF_AP_Pool_Infantry,_Pos_Spawn,[],0,"Can_collide"];
	[_Unit] JoinSilent _Group;
	_Unit moveInAny _create_Static_Weapons;
	_Unit setSkill GF_AP_set_AiSkill + floor random GF_AP_set_AiSkill_random;
	_Unit setVariable ["Var_GF_AP_Spawn",true];
	
if (GF_AP_Auto_Random_Loadout_Enabled) then {	
_Unit spawn GF_AP_ARL;
};
};

_weapons = weapons _create_Static_Weapons;	//	Returns all weapons of the vehicle

waitUntil {((damage _create_Static_Weapons > 0.8) or (_create_Static_Weapons ammo (_weapons select 0) isEqualto 0))};

{	
unassignvehicle _x;
_x action ["Eject", vehicle _x];
}forEach (crew _create_Static_Weapons);

};

};
};
};