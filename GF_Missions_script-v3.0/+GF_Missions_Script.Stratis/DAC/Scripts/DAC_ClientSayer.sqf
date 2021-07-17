//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_ClientSayer       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_radio","_rDist","_man","_sayer"];

_sayer = "logic" createvehiclelocal [0,0,0];
_radio = _this select 0;_rDist = _this select 1;_man = _this select 2;

if(!(dialog)) then
{
	if(_rDist >= 0) then
	{
		if(isNull _man) then
		{
			_sayer setpos [(position player select 0),(position player select 1),- _rDist];
			sleep 0.1;
			if(format["%1",_radio] != "") then {_sayer say _radio};
		}
		else
		{
			_sayer setpos [(position (DAC_Radio_Settings select 4) select 0),(position (DAC_Radio_Settings select 4) select 1),- _rDist];
			sleep 0.1;
			if(format["%1",_radio] != "") then {(DAC_Radio_Settings select 4) say _radio};
		};
	}
	else
	{
		if(format["%1",_radio] != "") then
		{
			_sayer setpos _man;
			sleep 0.1;
			_sayer say _radio;
		};
	};
};

sleep 4;

deletevehicle _sayer;

