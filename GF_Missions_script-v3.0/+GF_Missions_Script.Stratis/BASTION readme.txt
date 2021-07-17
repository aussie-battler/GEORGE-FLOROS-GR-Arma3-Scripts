Enemy Occupation System
EOS & BASTION
V1.972
Created by BangaBob


What is BASTION?
Bastion places players in a defensive scenario. After activating an BASTION zone, waves of units will attack until they are defeated or the zone is overrun.  
    • Spawn attacking Infantry, divers, boats, vehicles and helicopters
    • Saves server resources
    • Set wave delay
    • Set Initial pause period
    • Set number of waves
    • Integrated with EOS for lost zones
EOS & BASTION requirements
    • ArmA 3
No mods or addons needed to use EOS











Installing EOS
    1. Download latest version of EOS Click here
    2. Extract to desktop
    3. Copy EOS.altis into ArmA 3 mission directory
‘Documents\ArmA 3 – Other profiles\USERNAME\missions’
    4. Load ArmA 3 editor. Open EOS mission
    5. Open EOS.altis. Double click EOS. Double click OpenMe.sqf. This is where you will launch EOS zones.
Getting Started
                            1. Place a Gamelogic named SERVER 
Inside the editor double click and create a player. Click OK. Double click anywhere on the map. Click ‘BLUFOR’ and select ‘Game Logic’ from the dropdown menu. Type SERVER into the name and click ok.

                            2. Place a marker (Rectangle or Ellipse) over the area where you want to defend. Name it BAS_zone_1.

                            3. Open the OpenMe.sqf located inside the ‘eos’ folder. Missions\Missionname\eos\OpenMe.sqf


                            4. Scroll to the bottom. Copy and paste this code into the OpenMe.sqf
null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST],[10,2,120,FALSE,true]] call Bastion_Spawn;

                            5. Save openme.sqf

                            6. Preview the mission








Getting to know BASTION

Calling bastion is very similar to calling EOS. Bastion can be called using scripts & triggers.
What is a Bastion zone?
Upon entering a marker that has been called by bastion waves of units will spawn. Units spawned will proceed to attack the marker area until players leave the marker area or all waves are defeated. 
By default a BASTION zone will; appear orange on the map, glow bright orange when activated and turn green once completed.

GROUP SIZES KEY
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20





Assault Infantry spawn 500m away from the edge of the marker. After spawning each group will be given waypoints and attack the marker. 
To spawn 1 group of infantry  - [1,2] 
To spawn 3 groups of infantry - [3,2] 
To spawn a group with between 2 and 4 units - [1,1]
To spawn three groups with between 16 and 20 units - [3,5]

Motorised Infantry spawn 700m away from the edge of the marker. After spawning each group will be given waypoints and attack the marker. Motorised infantry are light vehicles and carry units in the free seats.
To spawn 1 motorised infantry  - [1,2] 
To spawn 3 motorised infantry  - [3,2] 
Cargo with between 2 and 4 units - [1,1]
Cargo with between 16 and 20 units - [3,5]

Armoured Vehicles spawn 500m away from the edge of the marker. After spawning each vehicle will be given waypoints and attack the marker.

Helicopters spawn outside the marker and fly towards the zone. If the helicopter cargo is 0 then an attack helicopter will spawn. If the helicopter cargo is above 0 then a transport helicopter will carry units into the marker and land.









Faction classes
null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[*0,0,EAST],[10,2,120,FALSE,true]] call Bastion_Spawn; 
*0 = EAST CSAT FACTION
1 = WEST NATO FACTION
2 = INDEPENDENT AAF FACTION
3 = CIVILIAN
4 = WEST FIA FACTION
5,6,7 = Custom classes. Add mods factions ect

Marker setup
null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,*0,EAST],[10,2,120,FALSE,true]] call Bastion_Spawn;
*0 = Default. Markers will show as red and glow red when active and turn green after cleared
1 = Markers will be invisible 

BASTION specific parameters
Initial pause time
null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST],[*10,2,120,FALSE,true]] call Bastion_Spawn;
When the bastion zone is triggered by a player entering the marker zone. EOS will wait *10 seconds before spawning units. 

Number of waves
null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST],[10,*2,120,FALSE,true]] call Bastion_Spawn;
Every wave EOS will spawn the units defined in the call. Set this number to the number of waves that will attack before the zone is successfully defended.

Wave delay
null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST],[10,2,*120,FALSE,true]] call Bastion_Spawn;
EOS will wait *120 seconds before spawning the next wave of units.
Enable EOS integration 
null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST],[10,2,20,*FALSE,TRUE]] call Bastion_Spawn;
Simulates capturing of areas.
If TRUE the marker will act as a normal EOS zone if the player leaves the bastion zone. If *FALSE then bastion zone will turn red on the map but will not contain any units.

Enable hints
null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST],[10,2,20,FALSE,TRUE]] call Bastion_Spawn;
EOS will display hints with the remaining time before the next wave and alert the player if they have lost the bastion zone.