


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


[] spawn {
	while {true} do {
    _time = diag_tickTime + 10;	//	every  % second
    _i = 0;
    waitUntil {
    _i = _i + 1;		
    diag_tickTime >= _time
    };		
diag_log format ["FPS : %1    ||    Objects : %2    ||    allUnits : %3",round diag_fps,count allMissionObjects "All",count allUnits,{count _x;}];
systemchat format ["FPS : %1    ||    Objects : %2    ||    allUnits : %3",round diag_fps,count allMissionObjects "All",count allUnits,{count _x;}];	
	};
};