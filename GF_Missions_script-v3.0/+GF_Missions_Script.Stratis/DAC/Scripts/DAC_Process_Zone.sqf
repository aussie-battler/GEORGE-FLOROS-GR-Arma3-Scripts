//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Process_Zone      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_para","_scr","_name"];

_para = _this;_name = _para select 0;

_scr = _para execVM "DAC\Scripts\DAC_Insert_Zone.sqf";
waituntil {scriptdone _scr};
_scr = [1,_name]execVM "DAC\Scripts\DAC_Insert_Waypoint.sqf";
waituntil {(DAC_NewZone != 1)};
if(DAC_NewZone == 2) then
{
	_scr = [1,_name]execVM "DAC\Scripts\DAC_New_Groups.sqf";
	waituntil {scriptdone _scr};
	DAC_NewZone = 0;
	if((DAC_Com_Values select 0) > 0) then {player groupchat format["New DAC Zone %1 was created",_name]};
}
else
{
	DAC_Init_WP = [];DAC_CheckZones = DAC_CheckZones - [_name];
	DAC_InitText = "";DAC_Init_Counter = [2,2,2,2,2];DAC_Master_Init = 0;
	[_name] call DAC_fClearZone;
	sleep 1;
	DAC_NewZone = 0;
};