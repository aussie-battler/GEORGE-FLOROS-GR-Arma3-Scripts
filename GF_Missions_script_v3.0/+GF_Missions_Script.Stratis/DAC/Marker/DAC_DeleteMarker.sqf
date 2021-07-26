//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_DeleteMarker      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_mArray"];		

_mArray  = _this select 0;

//waituntil {DAC_Basic_Value == 1};

sleep 3; 

{deletemarker _x}foreach _mArray;