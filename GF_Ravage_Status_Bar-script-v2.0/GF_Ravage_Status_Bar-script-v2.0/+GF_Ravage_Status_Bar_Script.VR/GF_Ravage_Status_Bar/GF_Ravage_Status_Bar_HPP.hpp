


//________________  Author : [GR]GEORGE F ___________ 08.06.18 _____________

/*
________________ GF Ravage Status Bar Script ________________

https://forums.bohemia.net/forums/topic/215645-ravage-status-bar-gf-script/?tab=comments#comment-3279085
// Please keep the Credits or add them to your Diary

For everything that is with comment  //  in front  or between /* 
means that it is disabled , so there is no need to delete the extra lines. 
Don't try to open this with the simple notepad.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/download/v7.5.4.html

and also use the extra pluggins
(this way will be better , it will give also some certain collours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing . 


include this in the desrcription.ext :

//____________________________________________________
class RscTitles
{
	#include "GF_Ravage_Status_Bar\GF_Ravage_Status_Bar_HPP.hpp"		
};
//____________________________________________________

*/

//	https://community.bistudio.com/wiki/Dialog_Control

class RscStatusBar
{
        idd = -1;
		duration = 10000000000;
        onLoad = "uiNamespace setVariable ['RscStatusBar', _this select 0];";
		fadein = 0;
		fadeout = 0;
		movingEnable = 0;
		objects[] = {};

//____________________________________________________



//________________ Background Image ________________
class controlsBackground
{
		class statusBarImage
      {
       	idc = 55557;
		type = 0;
		style = 48;
	    x = safezoneX + safezoneW - 1.90;	//1.50 	left  	 1.20 	right	1.90 for 1920 ,	1.38 for 1024
        y = safezoneY + safezoneH - 0.075;	//70 	down 	 75 	up		0.075
        w = 1.38;
        h = 0.08;
        colorText[] = {1, 1, 1, 1};
		colorBackground[]={0,0,0,0};
		sizeEx = 0.4;
		font = "EtelkaMonospaceProBold";
        text = "GF_Ravage_Status_Bar\images\Background.paa";	
		
		class Attributes
        {
        align="center";
        color = "#ffffff";
        font = "EtelkaMonospaceProBold";
        };
      };
};



//________________ Images and status ________________
class controls
{
        class statusBarText
      {
        idc = 55554;
        x = safezoneX + safezoneW - 1.90;	//1.50 	left  	 1.20 	right	1.90 for 1920 ,	1.38 for 1024
        y = safezoneY + safezoneH - 0.070;	//70 	down 	 75 	up		0.070
        w = 1.38;
        h = 0.08;
        shadow = 1;
        font = "EtelkaMonospaceProBold";
        size = 0.040;
        type = 13;
		style = 2;
        text = "";
		
        class Attributes
        {
        align="center";
        color = "#ffffff";
        font = "EtelkaMonospaceProBold";
		// https://community.bistudio.com/wiki/FXY_File_Format#Available_Fonts
        };
      };
   };
};