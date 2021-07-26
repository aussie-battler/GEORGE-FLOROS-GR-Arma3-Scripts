


//________________  Author : GEORGE FLOROS [GR] ___________ 06.08.18 _____________

/*
________________ GF Blood Stains and SFX LITE Script ________________

https://forums.bohemia.net/forums/topic/218538-gf-blood-stains-and-sfx-lite-script/

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

WARNING!!!
This AddOn increases seriously the gore factor in ArmA.
It is not recommended for use by children under the age of 15 years.
*/


// Please keep the Credits or add them to your Diary

waitUntil {!(isNull (findDisplay 46))};

//Credits
_subject = player createDiarySubject ["GF Blood Stains and SFX LITE Script", "GF Blood Stains and SFX LITE Script"];
_log_briefing = player createDiaryRecord ["GF Blood Stains and SFX LITE Script", ["About and Credits", "

<br /><font size='30' color='#FF0000'>GF Blood Stains and SFX LITE Script
<br />
<br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
<br />
<br />
<br /><font size='15' color='#FF0000'>V e r s i o n    1 . 0
<br />
<br /><font size='17' color='#0059B0'>GF Blood Stains and SFX LITE Script
<br />
<br />
<br /><font size='17' color='#0059B0'>Notes:
<br />
<br />
<br /><font size='15' color='#A1D2FA'>Everything is created as a standalone script ,
<br />in order to have the possibility , to use also the desired scripts only.
<br />
<br />
<br /><font size='17' color='#0059B0'>1. GF_Bleeding_LITE script :
<br />
<br /><font size='15' color='#A1D2FA'>
<br />The Bleeding starts when the health is on 80% , for some random time and amount of Blood.
<br />
<br />
<br /><font size='17' color='#0059B0'>2. GF_Blood_Pool_LITE script :
<br />
<br /><font size='15' color='#A1D2FA'>
<br />There is an option for normal size Blood Pools and Large.
<br />There is an option to spawn Flies when killed .
<br /> 
<br />
<br /><font size='17' color='#0059B0'>3. GF_Blood_Pool_BIS_Blood script
<br />
<br /><font size='15' color='#A1D2FA'>This is including the BIS Blood from BIS Orange DLC , when a unit is killed.
<br />There is an option to spawn Flies when killed .
<br />
<br />
<br /><font size='17' color='#0059B0'>4. GF_Blood_shot_LITE script :
<br />
<br /><font size='15' color='#A1D2FA'>Blood , for every shot dealt.
<br /> 
<br />
<br /><font size='17' color='#0059B0'>5. GF_Particles scripts
<br />
<br /><font size='15' color='#A1D2FA'>This is including a Blood particle when bleeding or killed.
<br />
<br />
<br /><font size='17' color='#0059B0'>6. GF_SFX scripts
<br />
<br /><font size='15' color='#A1D2FA'>This is including some custom and game SFX .
<br />GF_SFX_Bullet_Impact for the bullet impact at the bodies .
<br />GF_SFX_Killed_LITE hear a pain sound when killed .
<br />GF_SFX_Screaming for the units when they are getting shot . 
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