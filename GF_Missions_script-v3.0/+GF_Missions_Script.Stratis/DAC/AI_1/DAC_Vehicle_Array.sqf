//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Vehicle_Array     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_fp1","_fp2","_veharray","_vehvalue","_VehSet"];

_vehvalue = _this select 0;_veharray = [];_fp1 = 0;_fp2 = 0;

{
	if(format["%1",(_x select 0)] != "<NULL-object>") then
	{
		if((canmove (_x select 0)) && ((getdammage (_x select 0)) < 1)) then
		{
			_veharray set [count _veharray,_x select 0];
			_fp1 = (_x select 0) emptyPositions "gunner";_x set[1,_fp1];
			_fp2 = (_x select 0) emptyPositions "cargo";_x set[2,_fp2];
		}
		else
		{
			_x set[1,0];_x set[2,0];
		};
	}
	else
	{
		_x set[1,0];_x set[2,0];
	};
}	foreach _vehvalue;

_VehSet = [_vehArray,_vehvalue];
_VehSet
