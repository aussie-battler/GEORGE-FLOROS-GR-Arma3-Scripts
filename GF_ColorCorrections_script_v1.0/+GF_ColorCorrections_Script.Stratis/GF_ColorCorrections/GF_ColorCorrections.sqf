


//________________  Author : GEORGE FLOROS [GR] ___________ 20.10.18 _____________

/*
________________ GF ColorCorrections Script ________________

https://forums.bohemia.net/forums/topic/219908-gf-colorcorrections-script/

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
0. 	Disabled
1.	Realistic Color Correction theme
2.	Post Apocalyptic theme
3.	Nightstalkers theme
4.	OFP Gamma theme
5.	Golden autumn theme
6.	Africa theme
7.	Afghan theme
8.	Middle East theme
9.	Real Is Brown theme
10. Gray Tone theme
11.	Cold Tone theme
12. Winter Blue theme
13. Winter White theme
14. Mediterranean theme
*/


//________________	If you are using the Mission_Parameters.hpp then , keep this enabled	________________

GF_ColorCorrections = "GF_ColorCorrections" call BIS_fnc_getParamValue;


//________________	If you are using the Mission_Parameters.hpp then , disable this or else , Select here :	________________

GF_ColorCorrections = 3; 


//________________	GF_ColorCorrections	________________

switch (GF_ColorCorrections) do {

case 0: {
//Disabled
hint"Realistic Color Correction Disabled";
};

case 1: {
//	Realistic Color Correction theme

hint"Realistic Color Correction theme selected";	
"ColorCorrections" ppEffectEnable true; 
"ColorCorrections" ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]]; 
"ColorCorrections" ppEffectCommit 0;
};

case 2: {
//	Post Apocalyptic theme

hint"Post Apocalyptic Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 0.9, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6],  [0.199, 0.587, 0.114, 0.0]];  
"colorCorrections" ppEffectCommit 0;  
};

case 3: {
//	Nightstalkers theme

hint"Nightstalkers Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1.1, 0.0, [0.0, 0.0, 0.0, 0.0], [1.0,0.7, 0.6, 0.60], [0.200, 0.600, 0.100, 0.0]];
"colorCorrections" ppEffectCommit 0;
};

case 4: {
//	OFP Gamma theme

hint"OFP Gamma Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.6, 1.4, 0.6, 0.7],  [0.199, 0.587, 0.114, 0.0]];  
"colorCorrections" ppEffectCommit 1;  
};

case 5: {
//	Golden autumn theme

hint"Golden Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1.8, 1.8, 0.3, 0.7],  [0.199, 0.587, 0.114, 0.0]];  
"colorCorrections" ppEffectCommit 0;  
};

case 6: {
//	Africa theme

hint"Africa Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust[ 1, 1.3, 0.001, [-0.11, -0.65, -0.76, 0.015],[-5, -1.74, 0.09, 0.86],[-1.14, -0.73, 1.14, -0.09]]; 
"colorCorrections" ppEffectCommit 0; 
};

case 7: {
//	Afghan theme

hint"Afghan Color Correction theme selected";
"ColorCorrections" ppEffectEnable true; 
"ColorCorrections" ppEffectAdjust [0.9, 0.9, 0, [0, 0.1, 0.25, -0.14], [1, 1, 1, 1.26], [0.15, 0.09, 0.09, 0.0]]; 
"ColorCorrections" ppEffectCommit 0;
};

case 8: {
//	Middle East theme

hint"Middle East Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [0.9, 1, 0, [0.1, 0.1, 0.1, -0.1], [1, 1, 0.8, 0.528],  [1, 0.2, 0, 0]];
"colorCorrections" ppEffectCommit 0;
};

case 9: {
//	Real Is Brown theme

hint"Real Is Brown Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1,1,0,[0.1,0.2,0.3,-0.3],[1,1,1,0.5],[0.5,0.2,0,1]];
"colorCorrections" ppEffectCommit 0;
};

case 10: {
//	Gray Tone theme

hint"Gray Tone Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1.0, 1.0, 0.0,[1.0, 1.0, 1.0, 0.0],[1.0, 1.0, 0.9, 0.35],[0.3,0.3,0.3,-0.1]];
"colorCorrections" ppEffectCommit 0;
};

case 11: {
//	Cold Tone theme

hint"Cold Tone Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1.0, 1.0, 0.0,[0.2, 0.2, 1.0, 0.0],[0.4, 0.75, 1.0, 0.60],[0.5,0.3,1.0,-0.1]];
"colorCorrections" ppEffectCommit 0;
};

case 12: {
//	Winter Blue theme

hint"Winter Blue Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"ColorCorrections" ppEffectAdjust [1.1, 1.3, 0.0, [0.5, 0.5, 0.1, -0.1], [0.4, 0.75, 1.0, 0.60], [0.5,0.3,1.0,-0.1]];
"colorCorrections" ppEffectCommit 0;
};

case 13: {
//	Winter White theme

hint"Winter White Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.31, 0.31, 1.0, 0.1], [0.85, 0.85, 0.92, 0.48], [1 , 1, 1, 0.03]];
"colorCorrections" ppEffectCommit 0;
};

case 14: {
//	Mediterranean theme

hint"Mediterranean Color Correction theme selected";
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1.01, 1.18, -0.04, [1.0, 1.4, 0.8, -0.04], [0.55, 0.55, 0.72, 1.35],  [0.699, 1.787, 0.314, 20.03]];   
"colorCorrections" ppEffectCommit 1;       
};

};