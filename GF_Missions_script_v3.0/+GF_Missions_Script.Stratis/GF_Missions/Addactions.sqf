


//________________  Author : GEORGE FLOROS [GR] ___________ 16.12.18 _____________

/*
________________ GF Missions Script ________________

https://forums.bohemia.net/forums/topic/219080-gf-missions-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/

			
//________________	addactions available	________________
//	GF_Missions_addaction_Join_Disband
//	GF_Missions_addaction_Join_Disband_Officer
//	GF_Missions_addaction_Join_Disband_Prisoner
//	GF_Missions_addaction_Release_Tie_Prisoner




//________________	GF_Missions_addaction_Join_Disband	________________

GF_Missions_addaction_Join_Disband = {
[_this, 
[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Join Group", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		[_target] joinSilent _caller;	
		[_target, _actionid] remoteExec ["removeAction"];
		
		[_target,[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Disband", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		_Group = createGroup west;
		[_target]  joinSilent _Group; 
		_target removeAction _actionId;
		_target spawn GF_Missions_addaction_Join_Disband;
    },
    [],1.5,true,true,"","true",8,false,"", ""
]] remoteExec ["addAction"];
    },[], 1.5,true,true,"","true",8,false,"",""
]] remoteExec ["addAction"];
};
publicVariable "GF_Missions_addaction_Join_Disband";


//________________	GF_Missions_addaction_Join_Disband_Officer	________________

GF_Missions_addaction_Join_Disband_Officer = {
[_this, 
[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Officer Join Group", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		[_target] joinSilent _caller;	
		[_target, _actionid] remoteExec ["removeAction"];
		
		[_target,[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Disband Officer", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		_Group = createGroup west;
		[_target]  joinSilent _Group; 
		_target removeAction _actionId;
		_target spawn GF_Missions_addaction_Join_Disband_Officer;
    },
    [],1.5,true,true,"","true",8,false,"", ""
]] remoteExec ["addAction"];
    },[], 1.5,true,true,"","true",8,false,"",""
]] remoteExec ["addAction"];
};
publicVariable "GF_Missions_addaction_Join_Disband_Officer";


//________________	GF_Missions_addaction_Join_Disband_Prisoner	________________

GF_Missions_addaction_Join_Disband_Prisoner = {
[_this, 
[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Prisoner Join Group", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		[_target] joinSilent _caller;	
		_target setCaptive false;
		_target enableAI 'MOVE';
		[_target, _actionid] remoteExec ["removeAction"];
		
		[_target,[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Disband Prisoner", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		_Group = createGroup civilian;
		[_target]  joinSilent _Group; 
		_target setCaptive false;
		_target removeAction _actionId;
		_target spawn GF_Missions_addaction_Join_Disband_Prisoner;
    },
    [],1.5,true,true,"","true",8,false,"", ""
]] remoteExec ["addAction"];
    },[], 1.5,true,true,"","true",8,false,"",""
]] remoteExec ["addAction"];
};
publicVariable "GF_Missions_addaction_Join_Disband_Prisoner";


//________________	GF_Missions_addaction_Release_Tie_Prisoner	________________

GF_Missions_addaction_Release_Tie_Prisoner = {
[_this, 
[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Release Prisoner", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		[[_target,'Acts_ExecutionVictim_Unbow'] remoteExec ['switchMove']];
		_target enableAI 'anim';		
		[_target, _actionid] remoteExec ["removeAction"];
		
		[_target,[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Tie Prisoner", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		[[_target,'Acts_ExecutionVictim_Loop'] remoteExec ['switchMove']];
		_target disableAI 'anim';	
		_target removeAction _actionId;
		_target spawn GF_Missions_addaction_Release_Tie_Prisoner;
    },
    [],1.5,true,true,"","true",8,false,"", ""
]] remoteExec ["addAction"];
    },[], 1.5,true,true,"","true",8,false,"",""
]] remoteExec ["addAction"];
};
publicVariable "GF_Missions_addaction_Release_Tie_Prisoner";


//________________	GF_Missions_addaction_Join_Disband_Hostage	________________

GF_Missions_addaction_Join_Disband_Hostage = {
[_this, 
[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Hostage Join Group", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		[_target] joinSilent _caller;	
		_target setCaptive false;
		_target enableAI 'MOVE';
		[_target, _actionid] remoteExec ["removeAction"];
		
		[_target,[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Disband Hostage", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		_Group = createGroup civilian;
		[_target]  joinSilent _Group; 
		_target setCaptive false;
		_target removeAction _actionId;
		_target spawn GF_Missions_addaction_Join_Disband_Hostage;
    },
    [],1.5,true,true,"","true",8,false,"", ""
]] remoteExec ["addAction"];
    },[], 1.5,true,true,"","true",8,false,"",""
]] remoteExec ["addAction"];
};
publicVariable "GF_Missions_addaction_Join_Disband_Hostage";


//________________	GF_Missions_addaction_Release_Tie_Hostage	________________

GF_Missions_addaction_Release_Tie_Hostage = {
[_this, 
[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Release Hostage", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		[[_target,'Acts_ExecutionVictim_Unbow'] remoteExec ['switchMove']];
		_target enableAI 'anim';		
		[_target, _actionid] remoteExec ["removeAction"];
		
		[_target,[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Tie Hostage", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];		
		private _target = _this select 0;
		private _caller = _this select 1;
		private _actionId = _this select 2;
		[[_target,'Acts_ExecutionVictim_Loop'] remoteExec ['switchMove']];
		_target disableAI 'anim';	
		_target removeAction _actionId;
		_target spawn GF_Missions_addaction_Release_Tie_Hostage;
    },
    [],1.5,true,true,"","true",8,false,"", ""
]] remoteExec ["addAction"];
    },[], 1.5,true,true,"","true",8,false,"",""
]] remoteExec ["addAction"];
};
publicVariable "GF_Missions_addaction_Release_Tie_Hostage";