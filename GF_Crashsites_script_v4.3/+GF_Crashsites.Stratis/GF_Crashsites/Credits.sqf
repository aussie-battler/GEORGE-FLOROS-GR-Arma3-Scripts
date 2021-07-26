


//________________  Author : [GR]GEORGE F ___________ 22.07.18 _____________ 


/*
________________ GF Crashsites Script ________________

https://forums.bohemia.net/forums/topic/212505-crashsites_gf-script/

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


// Please keep the Credits or add them to your Diary

waitUntil {!(isNull (findDisplay 46))};

//Credits
_subject = player createDiarySubject ["GF Crashsites Script", "GF Crashsites Script"];
_log_briefing = player createDiaryRecord ["GF Crashsites Script", ["About and Credits", "

<br /><font size='30' color='#FF0000'>GF Crashsites Script
<br />
<br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
<br />
<br />
<br /><font size='15' color='#FF0000'>V e r s i o n    4 . 3
<br />
<br /><font size='17' color='#0059B0'>Spawn Random Crash sites
<br />
<br />
<br /><font size='15' color='#A1D2FA'>Spawn Random Crash sites, at Random position, including configurable loot
<br />
<br />to spice it a little bit.!
<br />
<br />
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
<br />Available at :
<br />Armaholic and Bohemia Interactive Forums 
<br />
<br />
<br /><font size='20' color='#FF0000'>Have Fun !
"
]];