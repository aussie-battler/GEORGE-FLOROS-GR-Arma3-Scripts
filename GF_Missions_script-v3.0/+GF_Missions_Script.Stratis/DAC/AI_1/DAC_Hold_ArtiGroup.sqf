//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Hold_Building     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_waitFact","_group","_run","_waitTime"];

_group = _this select 0;_waitFact = _this select 1;_run = 0;_waitTime = time + _waitFact;
		
while {_run == 0} do
{
	if(({alive _x} count units _group) == 0) then
	{
		_run = 1;
	}
	else
	{
		if(time < _waitTime) then
		{
			sleep 0.3;
		}
		else
		{
			_run = 1;
		};
	};
};
DAC_Arti_Array = DAC_Arti_Array - [_group];