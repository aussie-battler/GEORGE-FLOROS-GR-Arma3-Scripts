


//________________  Author : GEORGE FLOROS [GR] ___________	17.02.19	_____________


/*
________________	GF Vegetation Replacement Script - Mod	________________

https://forums.bohemia.net/forums/topic/221658-gf-auto-loot-road-crash-script-mod/

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
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


//________________ Settings _____________
//________________ Set true or false  _____________

GF_Vegetation_Replacement_Debug_info			= true;
GF_Vegetation_Replacement_Systemchat_info		= true;		
GF_Vegetation_Replacement_diag_log_info			= true;

GF_Vegetation_Replacement_Tree_Enabled 			= true;
GF_Vegetation_Replacement_Bush_Enabled 			= true;


/*
________________	Available Selections Trees :	________________

case 1 : CUP Winter Trees
case 2 : CUP Cold Theme
case 3 : CUP Autumn Theme
case 4 : CUP Spring Theme
case 5 : CUP Summer Theme
case 6 : CUP Tropical Theme
case 7 : CUP Spruce Theme
case 8 : Eden Extended Objects Altis Theme
case 9 : Eden Extended Objects Tanoa Theme
case 10 : MIX CUP + Eden Extended Objects Namalsk Theme
case 11 : Custom Theme
*/

GF_Vegetation_Replacement_Preset_Trees			= 1;


/*
________________	Available Selections Bushes :	________________

case 1 : CUP Winter Bushes
case 2 : CUP Cold Bushes Theme
case 3 : CUP Autumn Bushes Theme
case 4 : CUP Spring Theme
case 5 : CUP Summer Theme
case 6 : CUP Tropical Theme
case 7 : CUP Spruce Theme
case 8 : Eden Extended Objects Altis Theme
case 9 : Eden Extended Objects Tanoa Theme
case 10 : MIX CUP + Eden Extended Objects Namalsk Theme
case 11 : Custom Theme
*/

GF_Vegetation_Replacement_Preset_Bush			= 1;




if (GF_Vegetation_Replacement_diag_log_info) then {
diag_log "//________________ GF_Vegetation_Replacement_init.sqf ________________";
};




GF_Vegetation_Replacement_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
GF_Vegetation_Replacement_Tree_Objects = nearestTerrainObjects [GF_Vegetation_Replacement_centerPosition, ["Tree"], worldsize];
GF_Vegetation_Replacement_Bush_Objects = nearestTerrainObjects [GF_Vegetation_Replacement_centerPosition, ["Bush"], worldsize];
GF_Vegetation_Replacement_Tree_Count = 0;
GF_Vegetation_Replacement_Bush_Count = 0;


if(GF_Vegetation_Replacement_Tree_Enabled) then {
[] execVM "GF_Vegetation_Replacement\GF_Vegetation_Replacement_Presets_Tree.sqf";
[] execVM "GF_Vegetation_Replacement\GF_Vegetation_Replacement_Tree.sqf";
};

if(GF_Vegetation_Replacement_Bush_Enabled) then {
[] execVM "GF_Vegetation_Replacement\GF_Vegetation_Replacement_Presets_Bush.sqf";
[] execVM "GF_Vegetation_Replacement\GF_Vegetation_Replacement_Bush.sqf";
};