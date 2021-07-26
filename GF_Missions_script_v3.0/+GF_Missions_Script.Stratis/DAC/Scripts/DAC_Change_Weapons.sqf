//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Change_Weapons    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private   ["_unit","_val","_weapons","_magazines","_countM","_data","_i","_c","_m"];

_unit = _this select 0;_val = _this select 1;_weapons = [];_magazines = [];_countM = 0;_data = [];_i = 0;_c = 0;_m = 0;

waituntil {(DAC_Basic_Value > 0)};

sleep 0.5;

_data = [(call compile _val)] call DAC_fConfigWeapons;

if(count _data > 0) then
{
	_weapons = _data select 0;_magazines = _data select 1;
	{_unit removeweapon _x}foreach (weapons _unit);
	{_unit removemagazine _x}foreach (magazines _unit);
	sleep 0.1;
	while{_i < count _magazines} do
	{
		while{(_m < ((_magazines select _i) select 1))} do {_unit addMagazine ((_magazines select _i) select 0);_m = _m + 1};
		_m = 0;_i = _i + 1;
	};
	while{_c < count _weapons} do
	{
		_unit addWeapon (_weapons select _c);_c = _c + 1;
	};
	sleep 0.5;
	_unit selectWeapon (primaryWeapon _unit);reload _unit;
	if(isPlayer _unit) then {showCompass true};
};