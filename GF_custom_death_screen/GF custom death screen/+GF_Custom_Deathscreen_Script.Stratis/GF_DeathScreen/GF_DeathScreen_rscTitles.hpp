


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


// Control types
#define CT_STATIC 0

// Static styles

//#define ST_LEFT           0x00

#define ST_LEFT	0
#define ST_RIGHT	1
#define ST_CENTER	2
#define ST_UP		3
#define ST_DOWN	4
#define ST_VCENTER	5

#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_PICTURE	48
#define ST_FRAME	64

#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE	176

#define ST_SHADOW	256
#define ST_NO_RECT	512

#define FontM "Bitstream"
#define ST_LEFT      0
#define ST_RIGHT     1
#define ST_CENTER    2
#define CT_STATIC    0

class RscText_GF_DeathScreen
{
 access = 0;
 idc = -1;
 type = CT_STATIC;
 style = ST_PICTURE;	//style = ST_LEFT;
 colorBackground[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 //w = 0.1; h = 0.05;
 //x and y are not part of a global class since each rsctext will be positioned 'somewhere'
 font = "TahomaB";		//font = "Bitstream";
 sizeEx = 0;			//sizeEx = 0.04;	
 lineSpacing = 0;
 text = "";
 fixedWidth = 0;
 shadow = 0;
 
};

 class GF_DeathScreen 
{
  idd=-1;
  movingEnable=0;
  duration= 7;	//7
  fadein=0;
  name="GF_DeathScreen";
  controlsBackground[] = {};
  controls[]={Bild};
  	class Bild : RscText_GF_DeathScreen

	{
		idc = 1200;		//1200
		text="GF_DeathScreen\Blood_Splatter.paa";	//or.jpg
		//x = 0.1 * safezoneW + safezoneX";
		//y = 0.15 * safezoneH + safezoneY;
		//w = 0.8 * safezoneW;
		//h = 0.7 * safezoneH;
		
		x = 0 * safezoneW + safezoneX";
		y = 0 * safezoneH + safezoneY;
		w = 1 * safezoneW;		
		h = 1 * safezoneH;		
		
	};
};
