//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Call_Arti         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_target","_basePos","_random","_entry","_group","_unit","_waitTime","_artiAmmo",
			"_t","_r","_p","_a","_d","_b","_m","_ma","_mb","_mc","_l","_na","_n","_np","_oldTime",
			"_color","_conditions","_ca","_artiUnit","_mark","_artiArray","_count","_run","_aid",
			"_val1","_val2","_val3","_val4","_val7","_val8","_val5","_val6","_Apara","_aMC","_val9","_sc",
			"_c","_s","_z","_repeat","_hold","_fs","_side","_articolor","_cv","_cw","_h","_nextPos","_tempA"
		];
		
_unit = _this select 0;_target = _this select 1;_group = group _unit;_basePos = position DAC_StartDummy;_random = random 100;_n = 0;
_b = 0;_waitTime = 0;_r = 0;_t = 0.1;_d = 0;_a = "";_h = "";_oldTime = 0;_conditions = [];_aid = _this select 2;_sc = 0;_color = "";
_ca = 0;_run = true;_mark = "logic" createvehiclelocal [0,0,0];_artiAmmo = "";_c = 0;_mc = "";_val9 = 0;_tempA = [];
_s = 0;_u = 0;_val1 = 0;_val2 = 0;_val3 = 0;_val4 = 0;_val7 = 0;_val8 = 0;_val5 = 0;_val6 = 0;_Apara = [4,5,7];_artiArray = [];
if(DAC_Marker > 0) then {_articolor = DAC_Marker_Val select 14} else {_articolor = []};_side = ["EAST","WEST","GUER","CIV"];_cv = 0;_cw = 1;_z = 0;_aMC = [];_fs = "";_count = 0;

_mark setpos position DAC_StartDummy;_p = position _mark;_artiUnit = objNull;


if(!(isServer)) then
{
	if(format["%1",DAC_Support_Logic] == scalar) then
	{
		player sidechat "DAC_Support_Logic not found. Support for Players not available.";
	}
	else
	{
		if((DAC_Support_Logic getVariable "arti_count") >= (DAC_Player_Support select 0)) then
		{
			player sidechat "Call arti support aborted - Max count arti support reached";
		}
		else
		{
			_val1 = _this select 0;_val2 = _this select 1;_val3 = _this select 2;_val4 = _this select 3;
			DAC_Player_Arti = str([_val1,_val2,_val3,_val4,player]);publicvariable "DAC_Player_Arti";
			_m  = format["_awp%1%2",_group,time];_ma = createmarkerlocal [_m, _val2];_ma setMarkerShapelocal "ELLIPSE";
			_ma setMarkerSizelocal [(_val4 / 2),(_val4 / 2)];_ma setMarkerColorlocal "ColorBlack";_ma setMarkerBrushlocal "DiagGrid";
			sleep 5;
			deletemarkerlocal _ma;
		};
	};
}
else
{
	_fs = _side find format["%1",side (leader _group)];
	_artiArray = [_aid] call DAC_fConfigArti;
	sleep 0.1;
	if(count _artiArray > 0) then
	{			
		{if(alive _x) then {_c = _c + 1;_s = _s + (skill _x)}} foreach (units _group);
		if(_c > 0) then
		{
			_s = (_s / _c);
			while {_cv < count _Apara} do
			{
				if(((_artiArray select (_Apara select _cv)) select 2) == 0) then {_z = 1} else {_z = _s};;
				call compile format["_val%1 = (((_artiArray select (_Apara select _cv)) select 0) / _z)",_cw];
				call compile format["_val%1 = (((_artiArray select (_Apara select _cv)) select 1) / _z)",(_cw + 1)];
				_cv = _cv + 1;_cw = _cw + 2;
			};
			_count  = ((_artiArray select 1) select 4);
			_rtime  = ((_artiArray select 1) select 5);
			_repeat = ((_artiArray select 2) select 5);
			_hold   = ((_artiArray select 0) select 3);
			_condi	= (_artiArray select 9);
			_val9 = ((_artiArray select 6) select 1);
			if(DAC_Marker > 0) then {if(_fs == -1) then {_color = (_articolor select 4)} else {_color = (_articolor select _fs)}} else {_color = ""};
			if((typeName _target) == "ARRAY") then
			{
				if(format["%1",DAC_Support_Logic] == scalar) then
				{
					player sidechat "DAC_Support_Logic not found. Support for Players not available.";_count = -1;_condi = [];
				}
				else
				{
					DAC_Support_Logic setpos _target;_d = _this select 3;
					_target = DAC_Support_Logic;_entry = (group _target);
					[7,player] spawn DAC_fAIRadio;
				};
			}
			else
			{
				_entry = (group _target);_d = _val3 + random (_val4 - _val3);
			};
			
			if(count _condi > 0) then
			{
				if(call compile (_condi select 0)) then
				{
					if(count _condi > 1) then
					{
						if((DAC_Com_Values select 0) > 0) then {DAC_StartDummy globalchat (_condi select 1)};
						if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", (_condi select 1), true]};
						sleep 1;
						if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", -1, true]};
					};
				}
				else
				{
					if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", 11, true]};
					if((DAC_Com_Values select 0) > 0) then {if((side _unit) != "CIV") then {DAC_StartDummy globalchat format["Call arti support [%2] aborted - reason %1",11,side _unit]}};_count = 0;
					sleep 1;
					if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", -1, true]};
				};
			};
			while {_count > 0} do
			{
				_conditions = [_group,_entry,_artiArray,_color,_target,_d] call DAC_fArtiConditions;
				sleep 0.1;
				if(count _conditions == 0) then
				{
					if(count _this < 5) then
					{
						_count = 0;
						if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", 14, true]};
						sleep 1;
						if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", -1, true]};
					}
					else
					{
						_count = _count - 1;_run = true;
						_oldTime = time + _rtime;
						while {_run} do
						{
							sleep 1;
							if((({alive _x} count units _entry) == 0)
							|| (({alive _x} count units _group) == 0)
							|| (!(_group in DAC_Fire_Groups))) then {_run = false;_count = 0};
							if(time > _oldTime) then {_run = false};
						};
					};
				}
				else
				{
					[_entry,_hold] spawn DAC_fHoldArtiGroup;
					_basePos = (_conditions select 0);
					_mark setpos _basePos;
					if(DAC_Marker > 0) then
					{
						if((DAC_Marker_Val select 12) > 0) then
						{
							_n = ((_artiArray select 5) select 1);
							_m  = format["_bwp%1%2",_group,time];_mb = createmarkerlocal [_m, [0,0]];_mb setMarkerShapelocal "RECTANGLE";
							_mb setMarkerSizelocal [0,0];_mb setMarkerColorlocal _color;
							_m  = format["_awp%1%2",_group,time];_ma = createmarkerlocal [_m, _basePos];_ma setMarkerShapelocal "ELLIPSE";
							_ma setMarkerSizelocal [0,0];_ma setMarkerColorlocal "ColorBlack";_ma setMarkerBrushlocal "DiagGrid";
							if(count _this < 5) then
							{
								_ma setMarkerSizelocal [_d,_d];_r = random 360;
								_p = [(_basePos Select 0) + (Sin (_r) * _d),(_basePos Select 1) + (Cos (_r) * _d),0];
								_mb setMarkerSizelocal [(_d / 3),(_d / 8)];
							}
							else
							{
								_d = _val9;
								_ma setMarkerSizelocal [_d,_d];_r = random 360;_l = random _d;
								_p = [(_basePos Select 0) + (Sin (_r) * _l),(_basePos Select 1) + (Cos (_r) * _l),0];
								_mb setMarkerSizelocal [(_d / 3),(_d / 8)];
							};
							[[_mb,_ma,_artiArray,_mark,_n],7,_basePos,_d] spawn DAC_fFlashMarker;
						};
					};
					_waitTime = time + (_val1 + random (_val2 - _val1));
					sleep 1;
					if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", -1, true]};
					while{time < _waitTime} do
					{
						sleep 0.1;
					};
					while{_ca < count (_conditions select 1)} do
					{
						_artiUnit = (((_conditions select 1) select _ca) select 0);
						_artiAmmo = (((_conditions select 1) select _ca) select 1);
						if(((_artiArray select 6) select 2) == 0) then
						{
							_val7 = ((_artiArray select 6) select 0);
							_val8 = ((_artiArray select 6) select 1);
						}
						else
						{
							if((skill (gunner _artiUnit)) < 0.1) then {_s = 0.1} else {_s = (skill (gunner _artiUnit))};
							_val7 = (((_artiArray select 6) select 0) / _s);
							_val8 = (((_artiArray select 6) select 1) / _s);
						};
						_r = random 360;_l = random _d;_p = [(_basePos Select 0) + (Sin (_r) * _l),(_basePos Select 1) + (Cos (_r) * _l),0];
						_t = _val5 + random (_val6 - _val5);_b = _val7 + random (_val8 - _val7);_r = random 360;
						_nextPos = [(_p Select 0) + (Sin (_r) * _b),(_p Select 1) + (Cos (_r) * _b),0];_u = ((_artiArray select 6) select 2);
						if(DAC_Marker > 0) then
						{
							if((DAC_Marker_Val select 12) > 0) then
							{
								_m = format["_h%1%2",_artiUnit,time];_mc = createmarkerlocal [_m, [0,0]];_mc setMarkerTypelocal "mil_destroy";
								_mc setMarkerSizelocal [0,0];_mc setMarkerColorlocal "ColorBlack";_aMC set [count _aMC,_mc];
							};
						};
						[_artiUnit,_nextPos,_mark,_repeat,_artiAmmo,_b,_u,_mc] spawn DAC_fArtiFire;
						_ca = _ca + 1;_tempA set [count _tempA,_artiUnit];
						if(count _tempA == 1) then
						{
							if(!(isNil "DAC_Support_Logic")) then
							{
								_sc = ((DAC_Support_Logic getVariable "arti_count") + 1);
								DAC_Support_Logic setVariable ["arti_count", _sc, true];
							};
						};
						sleep _t;
					};
					_count = -1;
				};
			};
		};
		if(count _aMC > 0) then
		{
			sleep 1;
			_waitTime = time + 30;
			waituntil {(({(getMarkerType _x) != ""} count _aMC) == 0) || (time > _waittime)};
		};
		if(_count == 0) then
		{
			if(DAC_Marker > 0) then
			{
				if((DAC_Marker_Val select 12) > 0) then
				{
					_m  = format["_awp%1%2",_group,time];_ma = createmarkerlocal [_m, position _target];_ma setMarkerShapelocal "ELLIPSE";
					_ma setMarkerSizelocal [_d,_d];_ma setMarkerColorlocal "ColorRed";_ma setMarkerBrushlocal "DiagGrid";
					_t = ((getMarkerSize _ma) select 0);
					while{_t > 0} do
					{
						_t = _t - 2;
						_ma setMarkerSizelocal [_t,_t];
						sleep 0.03;
					};
					deletemarkerlocal _ma;
				};
			};
		};
	}
	else
	{
		DAC_StartDummy globalchat "ERROR: arti config not found.";
	};
};
if(count _tempA > 0) then
{
	waituntil{(({_x in DAC_Arti_Veh} count _tempA) == 0)};
	deletevehicle _mark;
}
else
{
	deletevehicle _mark;
};
