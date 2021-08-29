


//________________  Author : GEORGE FLOROS [GR] ___________ 10.08.18 _____________

/*
________________ GF Skinning Script ________________

https://forums.bohemia.net/forums/topic/218636-gf-skinning-script/

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


/*
Big thanks to Killzonekid , for his ArmA Scripting Tutorials
http://killzonekid.com/category/tutorials/
*/


// Please keep the Credits or add them to your Diary

waitUntil {!(isNull (findDisplay 46))};

//Credits
_subject = player createDiarySubject ["GF Skinning Script", "GF Skinning Script"];
_log_briefing = player createDiaryRecord ["GF Skinning Script", ["About and Credits", "

<br /><font size='30' color='#FF0000'>GF Skinning Script
<br />
<br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
<br />
<br />
<br /><font size='15' color='#FF0000'>V e r s i o n    1 . 0
<br />
<br /><font size='17' color='#0059B0'>GF Skinning Script
<br />
<br />
<br /><font size='15' color='#A1D2FA'>GF Skinning Script, configurable script.
<br />
<br />
<br />You are free to do anything but 
<br />i would like to give me Credits for this!
<br />
<br />Simple and easy to use and adapt .
<br />
<br />
<br />Thanks to All script contributors .
<br />Thanks to everyone who tries to do the best for this game!
<br />Thanks to Armaholic Community and Forums .
<br />Thanks to BIS for such a great platform.
<br />Thanks to BIS Community and BIS Community Forums
<br />
<br />
<br />Special Thanks to :
<br />
<br />Big thanks to Killzonekid , for his ArmA Scripting Tutorials.
<br />Haleks for Ravage mod.
<br />Heros  for Heros Survive mod.
<br />
<br />
<br />More info to:
<br />Armaholic and Bohemia Interactive Forums
<br />
<br />
<br /><font size='20' color='#FF0000'>Have Fun !
"
]];