


//________________  Author : GEORGE FLOROS [GR] ___________ 16.12.18 _____________

/*
________________ GF Missions Script ________________

https://forums.bohemia.net/forums/topic/219080-gf-missions-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


/*
//________________	add this to use	________________
//________________	Static_Weapons	________________
[] spawn GF_Missions_Spawn_Static_Weapons;
*/


//________________	GF_Missions_Spawn_Static_Weapons	________________

GF_Missions_Spawn_Static_Weapons = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 75]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;

_Static_Weapons = selectRandom GF_Missions_Pool_Static_Weapons; 
_create_Static_Weapons = _Static_Weapons createVehicle _Pos_Spawn;
_Seats_Number = [_Static_Weapons,true] call BIS_fnc_crewCount; //	Count all available seats including cargo slots

if (GF_Missions_Systemchat_info) then {
	systemchat format ['Vehicle: %1		seats:	%2', _Static_Weapons , _Seats_Number];
};

for "_x" from 1 to _Seats_Number do {

	_unit = _Group createunit [GF_Missions_Pool_Infantry select floor(random count GF_Missions_Pool_Infantry),_Pos_Spawn,[],0,"None"];
	[_unit] JoinSilent _Group;
	_unit moveInAny _create_Static_Weapons;
	(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
};

};