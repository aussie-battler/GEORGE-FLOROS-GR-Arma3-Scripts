


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


	playsound "Death_Blood_Splatter_SFX";

	[] spawn 
	{
//	cutText ["", "BLACK", 1];
	100012 cutRsc ["GF_DeathScreen", "PLAIN", 3];
	sleep 7.4;
//	100012 cutfadeout 0;
//	100012 cutRsc ["GF_DeathScreen_2", "PLAIN", 3];
//	sleep 15;
//	100012 cutfadeout 0;
//	100012 cutRsc ["GF_DeathScreen_3", "PLAIN", 3];
//	sleep 11;
	100012 cutfadeout 1;
	};
	
	sleep 1.7;
	playsound "Heart_Beat_dying";

	[] spawn 
	{		
		sleep 2;
		
		txt1Layer = "txt1" call BIS_fnc_rscLayer; 
	//	txt2Layer = "txt2" call BIS_fnc_rscLayer;
	//	txt3Layer = "txt3" call BIS_fnc_rscLayer;

	};