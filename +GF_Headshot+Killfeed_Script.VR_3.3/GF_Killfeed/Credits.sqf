


//________________	Author : GEORGE FLOROS [GR]	___________	30.07.19	___________

/*
________________ GF Killfeed Script ________________

https://forums.bohemia.net/forums/topic/206593-headshot-killfeed-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


// Please keep the Credits or add them to your Diary

waitUntil {!(isNull (findDisplay 46))};

//Credits
_subject = player createDiarySubject ["GF Headshot Script", "GF Headshot Script"];
_log_briefing = player createDiaryRecord ["GF Headshot Script", ["About and Credits", "

<br /><font size='30' color='#FF0000'>GF Headshot Script
<br />
<br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
<br />
<br />
<br /><font size='15' color='#FF0000'>V e r s i o n    3 . 3
<br />
<br /><font size='17' color='#0059B0'>GF Headshot Script
<br />
<br />
<br /><font size='15' color='#A1D2FA'>3 different type of notification available .
<br />It is 2 scripts , that you can use also seperate.
<br />It is possible , to select between 3 different type of notification ,
<br />for both scripts.
<br />Working on Multiplayer + Spawned Units .
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


_subject = player createDiarySubject ["GF Killfeed Script", "GF Killfeed Script"];
_log_briefing = player createDiaryRecord ["GF Killfeed Script", ["About and Credits", "

<br /><font size='30' color='#FF0000'>GF Killfeed Script
<br />
<br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
<br />
<br />
<br /><font size='15' color='#FF0000'>V e r s i o n    3 . 3
<br />
<br /><font size='17' color='#0059B0'>GF Killfeed Script
<br />
<br />
<br /><font size='15' color='#A1D2FA'>It is 2 scripts , that you can use also seperate.
<br />It is possible , to select between 3 different type of notification ,
<br />for both scripts.
<br />
<br />3 different type of notification available .
<br />All the 3 can display together .
<br />Working on Multiplayer + Spawned Units .
<br />Display Kills shows on global .
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