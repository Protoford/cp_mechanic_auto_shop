# cp_mechanic_auto_shop
FiveM GTAV ES Engine Repair Shop
-- Based on es_carwash by 'EssentialMode 5 CarWash by TheSpartaPT.' --
# FiveM [EssentialMode] Mechanic Shop
Pull in to one of several Mechanic locations on the map, drive in, hit enter to repair auto engine damage.

### Optional Dependencies

>[EssentialMode Base](https://forum.fivem.net/t/release-essentialmode-base/3665)

### Installation

>1- Drag and Drop the cp_mechanic_auto_shop folder into the resources/[local] folder;
>
>2- add this line "start cp_mechanic_auto_shop on server.cfg" near the end of your start and ensure lists.

**Extremelly important: if you're using EssentialMode step 2 needs to be bellow the "start essentialmode" line so the dependencies load first.**

### Optional (notepad++ recommended)

If you wish to make the repairs free open "cp_mechanic_server.lua" and edit the value on the variable "enableprice" to "false":

![Full size preview](http://image.prntscr.com/image/dd5dda7bfd3e4eca85f1674f20f67128.png)

If you wish to edit how much money is spent to wash the car open "cp_mechanic_server.lua" and edit the value on the variable "price" to whatever number you want:

![Full size preview](http://image.prntscr.com/image/ad28c233917a432e901c828ecfde6b10.png)
