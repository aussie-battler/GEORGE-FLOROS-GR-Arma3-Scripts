//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Show_Radio        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_funknr","_groupid","_param1","_param2","_sameside","_sidetext","_check"];

_funknr = _this select 0;_groupid = _this select 1;_group = _this select 2;_param1 = _this select 3;
_param2 = _this select 4;_sameside = 0;_sidetext = ["global","side"];_check = 0;

sleep (random 2);

if(!(format["%1_%2",_group,_funknr] in DAC_Check_Radio)) then
{
	DAC_Check_Radio set [count DAC_Check_Radio,format["%1_%2",_group,_funknr]];
	if((({alive _x} count units _group) == 0) || ((DAC_Com_Values select 2) == 0)) then {_check = 1};
	if(((DAC_Com_Values select 2) == 1) && (side (leader _group) == side player)) then {_check = 1};
	if(((DAC_Com_Values select 2) == 2) && (!(side (leader _group) == side player))) then {_check = 1};
	if(side (leader _group) == side player) then {_sameside = 1};
	if(_check == 0) then
	{
		_RadioString = 	[
							"We've got casualties. Needing support urgently.","HQ copy. We're needing support here immediately.",
							"We try to give suppressed fire.","4","5","6","7","8","9","10","11","12","13","14",
							"We've got one. Advancing further.","Enemy Contact! Attacking now!",
							"Hostiles spotted. Taking position.","Unknown contact. Taking cover.",
							"Sector clean. Moving back to Zone.","No more contacts. Starting search mode.",
							"Under fire! Attacking now!","Received. We're on the way.",
							"No hostiles spotted. Searching the area.","Got to get out here, can't get trough here.",
							"Fire fight detected. Keeping track of it.","Hostiles in the crosshairs. Attacking!",
							"Hostiles in front of us. Taking cover!","Enemy units spotted, we will check this.",
							"Got to pull back, way too hot here!","Gotta get outta here! Go, go, go!",
							"We've blown them out.","We must give up the camp.",
							"More enemy units spotted.","Empty vehicle in range. We will try to get in.",
							"Building in range. We will check some positions.","We join now the nearest group.",
							"We confirm arti support.","We confirm new waypoint data.","We lost enemy contact. Moving back to Zone.",
							"Empty gun in range. One soldier will try to get in."
						];

		call compile format["leader _group %1chat format[""%2 (%3 m > %5) ---> %4""]",_sidetext select _sameside,_group,round _param2,(_RadioString select _funknr),_param1];
	};
	sleep 2;
	DAC_Check_Radio = DAC_Check_Radio - [format["%1_%2",_group,_funknr]];
};