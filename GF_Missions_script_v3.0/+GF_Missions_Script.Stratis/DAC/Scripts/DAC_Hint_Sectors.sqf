//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Hint_Sector.sqf   //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private   ["_status","_c0","_c1","_c2","_c3","_c4","_text1","_text2","_text3","_hint"];

_status = 0;_text1 = "",_text2 = "",_text3 = "";_hint = "";

sleep 8;

while{true} do
{
	_c0 = ({_x == 0} count DAC_Sectors);
	_c1 = ({_x == 1} count DAC_Sectors);
	_c2 = ({_x == 2} count DAC_Sectors);
	_c3 = ({_x == 3} count DAC_Sectors);
	_c4 = ({_x == 4} count DAC_Sectors);
	_text1 = "<t color='#FFFF66' size='0.9' shadow='1' shadowColor='#333333' align='left'>DAC Sector Status</t>";
	_text2 = "<t color='#CCCCCC' size='0.7' shadow='1' shadowColor='#333333' font='PuristaMedium'><br/>";
	_text3 = "<t color='#FFFF99' size='0.7' shadow='0' font='PuristaMedium' align='left'>";
	_hint = (_text1 + _text3 + format["  -  [%1 sector(s)]",(count DAC_Sectors)] + _text2 + format["%1 sector(s) not occupied",_c0] + _text2 + format["%1 sector(s) occupied by friendly units",_c1] + _text2 + format["%1 sector(s) occupied by enemy units",_c2] + _text2 + format["%1 sector(s) conquered by friendly units",_c3] + _text2 + format["%1 sector(s) conquered by enemy units",_c4]);
	hintSilent parseText _hint; 
	sleep 1;
	//if(({_x == 3} count DAC_Sectors) == count DAC_Sectors) then {if(((DAC_Sector_Values select 4) select 2) != "") then {_status = 3}};
	//if(({_x == 4} count DAC_Sectors) == count DAC_Sectors) then {if(((DAC_Sector_Values select 5) select 2) != "") then {_status = 4}};
};