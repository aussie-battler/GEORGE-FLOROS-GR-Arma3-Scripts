


//________________  Author : [GR]GEORGE F ___________ 21.07.18 _____________

/*
________________ GF Custom Deathscreen Script ________________

https://forums.bistudio.com/forums/topic/205897-custom-deathscreen-script/

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


[] execVM "GF_DeathScreen\GF_DeathScreen.sqf";

[] spawn 
{		
		"dynamicBlur" ppEffectEnable true;   
		"dynamicBlur" ppEffectAdjust [20];   
		"dynamicBlur" ppEffectCommit 0;     
		"dynamicBlur" ppEffectAdjust [0.0];  
		"dynamicBlur" ppEffectCommit 12;  		
};	

//["<t size='2.5'>WASTED !</t>",0,0.3,2,0,0,7017] spawn bis_fnc_dynamicText;

titleText ["<t color='#ff0000' size='6'>You are Dead!</t>", "PLAIN", -1, true, true];