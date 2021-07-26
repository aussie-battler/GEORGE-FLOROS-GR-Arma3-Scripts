//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Delete_Object     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_obj","_h","_c","_p"];

_obj = _this select 0;_c = 0;_p = position _obj;
_h = -(((boundingBox _obj select 1) select 2) + 1);

if((format["%1",typeof _obj]) != "Logic") then
{
	while {_c > _h} do
	{
		_obj setpos [(_p select 0),(_p select 1),_c];
		_c = _c - 0.02;
		sleep 0.05;
	};
	deletevehicle _obj;
};