//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_New_Zone          //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_pos","_xVal","_yVal","_form","_dir","_para","_name","_action"];

_pos = _this select 0;_xVal = _this select 1;_yVal = _this select 2;_form = _this select 3;_KiZone = objNull;
_dir = _this select 4;_para = _this select 5;_name = _para select 0;_action = true;_zoneLoc = objNull;

if(_name in DAC_CheckZones) then
{
	hintc format["The name of a zone is not correct !\n\nThere are at least two zones, which contain the same zone name."];
	DAC_Basic_Value = 8;publicvariable "DAC_Basic_Value";
}
else
{
	if(isServer) then
	{
		if(DAC_NewZone == 0) then
		{
			DAC_NewZone = 1;
			waituntil{DAC_Basic_Value > 0};
			DAC_CheckZones set [count DAC_CheckZones,_name];
			DAC_InitText = "";DAC_Init_Counter = [2,2,2,2,2];
			if((count (_para select 5)) >= 6) then {DAC_Init_Camps = ((_para select 5) select 0)};
			call compile format["%1 = createTrigger [""EmptyDetector"",_pos]",_name];
			call compile format["%1 setTriggerActivation [""LOGIC"", ""PRESENT"", true]",_name];;
			if(_form == 0) then
			{
				call compile format["%1 setTriggerArea [_xVal, _yVal, _dir, false]",_name];
			}
			else
			{
				call compile format["%1 setTriggerArea [_xVal, _yVal, _dir, true]",_name];
			};
			call compile format["%1 setTriggerStatements [""this"", """", """"]",_name];
			call compile format["%1 setTriggerType ""NONE""",_name];		
			_para execVM "DAC\Scripts\DAC_Process_Zone.sqf";
		}
		else
		{
			if((DAC_Com_Values select 0) > 0) then {player sidechat "Any Zone action in procress. Please try again later."};
		};
	};
};