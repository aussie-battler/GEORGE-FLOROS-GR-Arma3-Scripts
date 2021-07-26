//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Delete_Zone       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_zones","_a","_c","_m","_i","_z","_scr","_delArray"];

_zones = _this;_c = 0;_a = "";_i = 0;_z = objNull;_scr = "";_delArray = [];

if(isServer) then
{
	if(DAC_NewZone == 0) then
	{
		DAC_NewZone = 1;
		waituntil{DAC_Basic_Value > 0};
		while {_i < count _zones} do
		{
			_z = call compile (_zones select _i);_c = 0;
			if(str(_z) == scalar) then
			{
				hintc "Error: DAC_Delete_Zone > No valid zone";_i = _i + 1;
			}
			else
			{
				while {_c < count DAC_Zones} do
				{
					_a = DAC_Zones select _c;
					if((call compile (_a select 0)) == _z) then
					{
						_m = ((_a select 9) select 0);
						_m setmarkersizelocal [3,3];
						_c = ((count DAC_Zones) + 1);
						_delArray set [count _delArray,(_zones select _i)];
						if(_z in DAC_Inactive_Zones) then {DAC_Inactive_Zones = DAC_Inactive_Zones - [_z]};;
					}
					else
					{
						_c = _c + 1;
					};
				};
				_i = _i + 1;
			};
		};
		if(count _delArray > 0) then {[_delArray] execVM "DAC\Scripts\DAC_Pass_Zone.sqf"};
	}
	else
	{
		if((DAC_Com_Values select 0) > 0) then {player groupchat "Any Zone action in procress. Please try again later."};
	};
};