


//________________	Author : GEORGE FLOROS [GR]	___________	19.06.19	_____________ 


/*
________________ GF Zombie Spawner Script - Mod	________________

Not Published yet	SOON !

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


if(GF_ZS_Systemchat_info)then{
	systemchat "GF_ZS_Loadout initializing";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_ZS_Loadout initializing	________________";
};


GF_ZS_Loadout = {


	switch (GF_ZS_Loadout_Select) do{

		case 1 : {
			//	No change
		};
		
		
		case 2 : {

			removeallweapons _this;
			removeAllItems _this;
			removeAllAssignedItems _this;
			removeUniform _this;
			removeVest _this;
			removeBackpack _this;
			removeHeadgear _this;
			removeGoggles _this;


			//________________	_Uniform_array	________________
			_Uniform_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 801 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons"))apply{configName _x};

			//________________	_handgunWeapon_array	________________
			_handgunWeapon_array = ("getNumber (_x >> 'type') isEqualTo 2 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons"))apply{configName _x};

			_primaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 1 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons"))apply{configName _x};
			_secondaryWeapon_array = ("getNumber (_x >> 'type') isEqualTo 4 && getNumber (_x>> 'scope') isEqualTo 2" configClasses (configfile >> "CfgWeapons"))apply{configName _x};
			_Magazines_array = ("getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') in [256,16,2*256,3*256,6*256]"configClasses (configFile >> "CfgMagazines"))apply{configName _x};

			_Vests_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 701 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons"))apply{configName _x};
			_Headgear_array = ("getNumber (_x >> 'itemInfo' >> 'type') isEqualTo 605 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons"))apply{configName _x};
			_Backpacks_array = ("getNumber (_x >> 'isbackpack') isEqualTo 1 && getNumber (_x>> 'scope') >1 && getNumber (_x>> 'maximumLoad') != 0" configClasses (configfile >> "CfgVehicles"))apply{configName _x};
			_Goggles_array = ("getNumber (_x >> 'scope') > 1" configClasses (configfile >> "CfgGlasses"))apply{configName _x};

			_Items_array = ("getNumber (_x >> 'type') isEqualTo 4096 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons"))apply{configName _x};
			_Attachments_array = ("getNumber (_x >> 'type') isEqualTo 131072 && getNumber (_x>> 'scope') >1" configClasses (configfile >> "CfgWeapons"))apply{configName _x};

			_Binocular_and_Nvg_array = (
				"(!(getText( _x >> 'DLC' ) == 'mcc_sandbox_a3'))
				&& getNumber ( _x >> 'scope' ) isEqualTo 2	
				&& getNumber ( _x >> 'type' ) in [ 131072, 4096 ]
				&& getNumber ( _x >> 'ItemInfo' >> 'type' ) in [ 0 , 616 ] 
				"configClasses (configfile >> "CfgWeapons")
				)apply {configName _x};



			_Uniform = selectRandom _Uniform_array;
			_Headgear = selectRandom _Headgear_array; 
			_Goggles = selectRandom _Goggles_array; 
			_Vests = selectRandom _Vests_array; 
			_Backpacks = selectRandom _Backpacks_array;
			_primaryWeapon = selectRandom _primaryWeapon_array;
			_secondaryWeapon = selectRandom _secondaryWeapon_array;
			_handgunWeapon = selectRandom _handgunWeapon_array;


			//________________ _Items	________________

			_Items = selectRandom _Items_array;
			_Attachments = selectRandom _Attachments_array;
			_Magazines = selectRandom _Magazines_array;

			
			//________________	add Gear	________________
			
			_this forceAddUniform _Uniform;
			_this addVest _Vests;
			_this addHeadgear _Headgear;
			_this addGoggles _Goggles;
			_this addWeapon _primaryWeapon;
			_this addWeaponGlobal _handgunWeapon;

			if(random 10 < 3) then{_this addBackpack _Backpacks;};
			if(!(backpack _this isEqualTo ""))then{
				if(random 10 < 3) then{_this addWeapon _secondaryWeapon};
			};
			
			//________________	addItemToUniform	________________
			
			for "_i" from 1 to 1 do{_this addItemToUniform "FirstAidKit";};


			//________________	addItemToVest	________________
			
			for "_i" from 1 to 1 do{_this addItemToVest "FirstAidKit";};
			for "_i" from 1 to 1 do{_this addItemToVest "HandGrenade";};
			for "_i" from 1 to 1 do{_this addItemToVest "MiniGrenade";};
			for "_i" from 1 to 1 do{_this addItemToVest "SmokeShell";};

			if(random 10 < 3) then{_this addItemToVest _Items;};
			if(random 10 < 3) then{_this addItemToVest _Attachments;};
			if(random 10 < 3) then{_this addItemToVest _Magazines;};
			
			
			for "_i" from 1 to random 6 do{
				_assignableItems = selectRandom _Binocular_and_Nvg_array;
				if(random 10 < 3) then{_this linkItem _assignableItems;};	
			};
			
			//________________	add _primaryWeapon's compatible attachments	________________

			_primaryWeapon_MuzzleSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
			if(count _primaryWeapon_MuzzleSlot >= 1)then{_primaryWeapon_Muzzle = selectRandom _primaryWeapon_MuzzleSlot;
			if(random 10 < 3) then{_this addPrimaryWeaponItem _primaryWeapon_Muzzle;};}; 

			_primaryWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count _primaryWeapon_CowsSlot >= 1)then{_primaryWeapon_Optic = selectRandom _primaryWeapon_CowsSlot;
			if(random 10 < 3) then{_this addPrimaryWeaponItem _primaryWeapon_Optic;};}; 

			_primaryWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
			if(count _primaryWeapon_PointerSlot >= 1)then{_primaryWeapon_Pointer = selectRandom _primaryWeapon_PointerSlot;
			if(random 10 < 3) then{_this addPrimaryWeaponItem _primaryWeapon_Pointer;};}; 

			_primaryWeapon_UnderBarrelSlot = getArray (configFile / "CfgWeapons" >> _primaryWeapon >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
			if(count _primaryWeapon_UnderBarrelSlot >= 1)then{_primaryWeapon_UnderBarrel = selectRandom _primaryWeapon_UnderBarrelSlot;
			if(random 10 < 3) then{_this addPrimaryWeaponItem _primaryWeapon_UnderBarrel;};}; 

			
			//________________	add _secondaryWeapon 's compatible attachments	________________

			_secondaryWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _secondaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count _secondaryWeapon_CowsSlot >= 1)then{_secondaryWeapon_Optic = selectRandom _secondaryWeapon_CowsSlot;
			if(random 10 < 3) then{_this addSecondaryWeaponItem _secondaryWeapon_Optic;};}; 

			_secondaryWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _secondaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
			if(count _secondaryWeapon_PointerSlot >= 1)then{_secondaryWeapon_Pointer = selectRandom _secondaryWeapon_PointerSlot;
			if(random 10 < 3) then{_this addSecondaryWeaponItem _secondaryWeapon_Pointer;};}; 

			
			//________________	add _handgunWeapon's compatible attachments	________________

			_handgunWeapon_MuzzleSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
			if(count _handgunWeapon_MuzzleSlot >= 1)then{_handgunWeapon_Muzzle = selectRandom _handgunWeapon_MuzzleSlot;
			if(random 10 < 3) then{_this addHandgunItem _handgunWeapon_Muzzle;};}; 

			_handgunWeapon_CowsSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count _handgunWeapon_CowsSlot >= 1)then{_handgunWeapon_Optic = selectRandom _handgunWeapon_CowsSlot;
			if(random 10 < 3) then{_this addHandgunItem _handgunWeapon_Optic;};}; 

			_handgunWeapon_PointerSlot = getArray (configFile / "CfgWeapons" >> _handgunWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
			if(count _handgunWeapon_PointerSlot >= 1)then{_handgunWeapon_Pointer = selectRandom _handgunWeapon_PointerSlot;
			if(random 10 < 3) then{_this addHandgunItem _handgunWeapon_Pointer;};}; 

			
			//________________	add _primaryWeapon's mags	________________

			_primaryWeapon_Magazines_array = getArray (configFile / "CfgWeapons" / _primaryWeapon / "magazines");
			if(count _primaryWeapon_Magazines_array > 0)then{
				private _primaryWeapon_magazines = selectRandom _primaryWeapon_Magazines_array;
				
				for "_i" from 1 to 2 do{_this addItemToUniform _primaryWeapon_magazines;};
				for "_i" from 1 to 5 do{_this addItemToVest _primaryWeapon_magazines;};
			};

			//________________	add _secondaryWeapon's mags	________________

			_secondaryWeapon_Magazines_array = getArray (configFile / "CfgWeapons" / _secondaryWeapon / "magazines");
			if(count _secondaryWeapon_Magazines_array > 0)then{
				private _secondaryWeapon_Magazines = selectRandom _secondaryWeapon_Magazines_array;
				
				if(!(backpack _this isEqualTo ""))then{
					for "_i" from 1 to 5 do{_this addItemTobackpack _secondaryWeapon_Magazines;};
				};
			};

			//________________	add _handgunWeapon's mags	________________

			_handgunWeapon_Magazines_array = getArray (configFile / "CfgWeapons" / _handgunWeapon / "magazines");
			if(count _handgunWeapon_Magazines_array > 0)then{
				private _handgunWeapon_Magazines = selectRandom _handgunWeapon_Magazines_array;
				
				for "_i" from 1 to 2 do{_this addItemToUniform _handgunWeapon_Magazines;};
			};

		};
	
	
		case 3 : {
		
			comment "You must change , this to _this";
			
			
			comment "Exported from Arsenal by [GR]GEORGE F";

			comment "[!] UNIT MUST BE LOCAL [!]";
			if (!local _this) exitWith {};

			comment "Remove existing items";
			removeAllWeapons _this;
			removeAllItems _this;
			removeAllAssignedItems _this;
			removeUniform _this;
			removeVest _this;
			removeBackpack _this;
			removeHeadgear _this;
			removeGoggles _this;

			comment "Add containers";
			_this forceAddUniform "U_B_HeliPilotCoveralls";
			_this addItemToUniform "FirstAidKit";
			_this addItemToUniform "HandGrenade";
			_this addItemToUniform "Chemlight_green";
			_this addItemToUniform "30Rnd_65x39_caseless_green";
			_this addVest "V_TacVestIR_blk";
			_this addItemToVest "Chemlight_green";
			for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_65x39_caseless_green";};
			for "_i" from 1 to 3 do {_this addItemToVest "11Rnd_45ACP_Mag";};
			_this addHeadgear "H_Cap_blk";

			comment "Add weapons";
			_this addWeapon "arifle_Katiba_C_F";
			_this addWeapon "hgun_Pistol_heavy_01_F";
			_this addHandgunItem "optic_MRD";
			_this addWeapon "Rangefinder";

			comment "Add items";
			_this linkItem "ItemMap";
			_this linkItem "ItemCompass";
			_this linkItem "ItemWatch";
			_this linkItem "ItemRadio";

			comment "Set identity";
			[_this,"WhiteHead_09","male05eng"] call BIS_fnc_setIdentity;
		};
	};
};


if(GF_ZS_Systemchat_info)then{
	systemchat "GF_ZS_Loadout initialized";			
};	

if(GF_ZS_diag_log_info)then{
	diag_log "//________________	GF_ZS_Loadout initialized	________________";
};