//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Exec_Action       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_unit","_ID","_action"];

_unit = _this select 0;_ID = _this select 1;_action = true;

while{_action} do
{
	if((!(alive _unit)) || ((_unit distance player) > 12) || (count crew _unit == 0)) then
	{
		DAC_Join_Array = DAC_Join_Array - [_unit];_unit removeAction _ID;_action = false;
	}
	else
	{
		sleep 0.5;
	};
};