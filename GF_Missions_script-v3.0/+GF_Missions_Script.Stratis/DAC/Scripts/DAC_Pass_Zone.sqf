//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Pass_Zone         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_zones","_i","_scr","_temp"];

_zones = _this select 0;_i = 0;_scr = "";_temp = [];

sleep 5;

DAC_Init_WP = [];DAC_InitText = "";DAC_Init_Counter = [2,2,2,2,2];DAC_Master_Init = 0;

while{_i < count _zones} do
{
	DAC_CheckZones = DAC_CheckZones - [(_zones select _i)];
	_temp set [count _temp,(_zones select _i)];
	_scr = [(_zones select _i)] call DAC_fClearZone;
	sleep 0.5;
	_i = _i + 1;
};
sleep 1;
DAC_NewZone = 0;
player groupchat format["Zone(s) %1 deleted",_temp];