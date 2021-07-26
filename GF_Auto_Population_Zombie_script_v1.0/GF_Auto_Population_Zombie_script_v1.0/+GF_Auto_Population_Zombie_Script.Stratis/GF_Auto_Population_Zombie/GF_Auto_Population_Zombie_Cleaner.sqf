


//________________	Author : GEORGE FLOROS [GR]	___________	08.03.19	___________


/*
________________	GF Auto Population Zombie Script - Mod	________________

https://forums.bohemia.net/forums/topic/222245-gf-auto-population-zombie-script-mod/

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

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


diag_log "//______________________ GF Auto Population Cleaner initializing	___________________";


[]spawn	{
	while {true} do {

	
		//___________________	MP	___________________
		
		if (isMultiplayer) then {
		
		waitUntil{uisleep GF_APZ_Cleaner_Loop;
		
		
		//____________________________	_Vehicle_list	_________________________
		
		_Vehicle_list = nearestObjects [GF_APZ_centerPosition, ["Car","Tank","Air","Ship"], worldSize];	
		
		_Vehicle_Exclude_List = [
		"examle_classname..."
		]; 
		
		{	
		_Vehicle = _x;
		if (
	
			(isNull(attachedTo _Vehicle)) 
			&& (!((typeOf _x) in _Vehicle_Exclude_List))  
			&& (_x getVariable ["Var_GF_APZ_Spawn",false])
			&& ({_x distance _Vehicle < GF_APZ_Cleaner_Distance}count playableUnits isEqualTo 0)
			&& ((count (crew _Vehicle)) > 0)
			
		) then {
		_Vehicle_list = _Vehicle_list - [_x];
		
		deleteVehicle _x;
	
		};
		}forEach _Vehicle_list;
	
	
		//____________________________	_Unit_list	_________________________
		
		_Unit_list = GF_APZ_centerPosition nearEntities [["Man"], worldSize];	
	
		_Unit_Exclude_List = [
		"examle_classname..."
		]; 
		
		{	
		_Entity = _x;
		if (
	
			(isNull(attachedTo _Entity)) 
			&& (alive _x)
			&& (!((typeOf _x) in _Unit_Exclude_List))  
			&& (_x getVariable ["Var_GF_APZ_Spawn",false])
			&& ({_x distance _Entity < GF_APZ_Cleaner_Distance}count playableUnits isEqualTo 0)
			
		) then {
		_Unit_list = _Unit_list - [_x];
		deleteVehicle _x};
		}forEach _Unit_list;
		};	
			
		}else{
		
		
		//___________________	SP	___________________
		
		waitUntil{uisleep GF_APZ_Cleaner_Loop;
		
		
		//____________________________	_Vehicle_list	_________________________
		
		_Vehicle_list = nearestObjects [GF_APZ_centerPosition, ["Car","Tank","Air","Ship"], worldSize];	
		
		_Vehicle_Exclude_List = [
		"examle_classname..."
		]; 
		
		{	
		_Vehicle = _x;
		if (
	
			(isNull(attachedTo _Vehicle)) 
			&& (!((typeOf _x) in _Vehicle_Exclude_List))  
			&& (_x getVariable ["Var_GF_APZ_Spawn",false])
			&& ((_x distance player) > GF_APZ_Cleaner_Distance)
			&& ((count (crew _Vehicle)) > 0)
			
		) then {
		_Vehicle_list = _Vehicle_list - [_x];
		
		deleteVehicle _x;
	
		};
		}forEach _Vehicle_list;
	
	
		//____________________________	_Unit_list	_________________________
		
		_Unit_list = GF_APZ_centerPosition nearEntities [["Man"], worldSize];	
	
		_Unit_Exclude_List = [
		"examle_classname..."
		]; 
		
		{	
		_Entity = _x;
		if (
	
			(isNull(attachedTo _Entity)) 
			&& (alive _x)
			&& (!((typeOf _x) in _Unit_Exclude_List))  
			&& (_x getVariable ["Var_GF_APZ_Spawn",false])
			&& ((_x distance player) > GF_APZ_Cleaner_Distance)
			
		) then {
		_Unit_list = _Unit_list - [_x];
		deleteVehicle _x};
		}forEach _Unit_list;
		};
		};
	};	
};


diag_log "//______________________ GF Auto Population Cleaner initialized	___________________";