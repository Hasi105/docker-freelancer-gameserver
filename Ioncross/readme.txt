IONCROSS Freelancer Server Operator mk.V -- JoeBoomz
September 30, 2004

--------------------------------------------------------------------

If you get error messages when loading the program, you need the
Visual Basic runtime files!  You can find them at 
www.ioncross.com/software.

--------------------------------------------------------------------

Designed for Serverops
Run a Freelancer Server with all the fun and none of the work!

Written in Visual Basic 6.0.

MK.I FEATURES:

- Fully automatic decoding of ALL your players' files 
- Lists players online and displays their current rank and system
- Facilitates banning/kicking of players with universe console
  notification messages
- Lists all your players and displays a quick summary with their
  stats including ship, power generator, and mounted weapons
- Allows you to spot cheaters, INCLUDING
	infinite power
	uber shields
	CLOAKS ;)
- Allows you to view which players belong to the same accounts
- Server maintenance allows for cleaning up of inactive and 
  uninterested players, as well as the removal of empty player
  account folders
- More banner options than you can shake a stick at!
- FULLY FEATURED PLAYER EDITOR.  Edit:
	ship
	power plant
	engine
	shield
	forward hard points
	turrets
	equipment
	lights
	cargo
	location
	factions
	AND money :)

   **** EDIT CAREFULLY AND BACK UP YOUR FILES! ****

mk.II FEATURES:

- 200 MORE HORSEPOWER THAN VERSION MK.I!  Thanks FiiK ;)  
  mk.II decodes player files MUCH faster than mk.I did.
- Variable money/location kicks and bans (kick a player to Alaska
  and fine them 10,000)
- Manually DELETE player files
- Set ban durations for players (ban them until 10PM on a certain
  date).  Will automatically unban players after specified time.
- Output of currently online players to web page
- Output of banned players (with durations and reasons) to web page
- MORE BANNER OPTIONS!  IFSO now allows for 11 timed and 12 daily
  banners, in addition to a new player banner.  
  I deserve a gold star!
- Graphical FLStat front-end for Cryogenius' FLStat utility.
  No more task scheduler! Requires FLStat 1.2.
- Automated server maintenance options. Can restart FLServer to 
  clear memory and help with lag, and clean up your player files at
  the same time.  A clean FLServer is a fast FLServer! :)
- AUTOMATIC scanning of online players for specified name and 
  equipment filters.  IFSO can AUTO BAN players with inappropriate 
  names and cheaters using cloaks and uber-shields!  w00t!
- Complete log files for player, server and IFSO activity.
- There's more... I just can't remember them... :)

mk.III FEATURES:

- New version of FLAdmin.dll to help deal with server crashes and
  improve performance.
- Added more hashcodes for sound, video and other game effects.
- Added hashcodes for the TNG 1.7 mod (provided by InDoMiNaE)
- Expanded cheat-detection abilities to include FLServer's 
  cheaters.log file (auto ban players appearing in this file now).
- Can now auto-kick OR auto-ban players with inappropriate names.
- Can now auto-ban players with UNKNOWN equipment hashcodes in 
  their files.
- Speed optimizations, now runs faster...
- Expanded auto-maintenance options a bit...
- Fixed "input past end of file" bug.  
- Fixed single-number date bugs.  Ensure your OS date is set to 
  the EXACT same format as IFSO is in the configuration tab!
- Fixed web output bug when players used the "<" and ">" characters
  in their name.
- Enabled editing of player names.  DON'T USE THIS OPTION.  IT'S 
  BAD AND MAY MESS UP YOUR SERVER.  You've been warned! :)
  But seriously, I'm sick of getting requests for this so it's
  working now.  Just ensure you restart FLServer.exe every time
  you rename a player :)
- Fixed other bugs that I can't remember now :)

mk.IV FEATURES:

- Deleted characters logfile added (output to IFSO program folder).
  Use this feature to find cheaters that delete their characters 
  to hide from you
- Added a fourth option to scan from cheaters.log
- Viewing or editing new players should no longer crash IFSO
- New inline file scanning engine.  IFSO will no longer cause lag
  spikes on servers while it scans every online player's file at 
  time of update.  Instead, it now scans one or more files per 
  second, all the time.  All the testers agree, this is a much
  better setup.  
- Fixed ban duration engine (damn extra space in my time list...)
- Added character creation date stamp for Pinger ;)
- IFSO now warns admins about players carrying more than 100 cargo 
  items (causes server instability)
- Allows serverops to limit the number of characters a player can 
  have on the server
- Added support/requirement for GAMEDATA_miscequipment.txt file. 
  This file contains mountable equipment that can not be carried 
  in cargo (ie, contrails, sound effects, and armor modifiers)
- Added delete hard point options in the editor
- Fixed various editor bugs

mk.V FEATURES:

- Automatic backups of the playerlist.ini are now created 
  (in cases where the ini becomes corrupt, you can simply 
  overwrite the corrupt ini with the backup and you don't lose 
  the player list. 
- Fixed bugs in equipment editor.  MAD props to cbonneville 
  for pointing these out to me :) 
- Players deleted log file now appends to top of file instead of 
  the bottom for lazy serverops like Pinger ;) 
- Added user inactivity detection to the player view/edit window 
  for forgetful serverops like Pinger.  
- Fixed player having more than 20 weapons bug pointed out by 
  Elliot G of the Freeport 3 Police. 
- Other various other touchups, bug fixes, and finalizations.

Known limitations:

- PROGRAM MAY NOT WORK PROPERLY ON OPERATING SYSTEMS OTHER THAN 
  WINDOWS XP WITH NORTH-AMERICAN REGIONAL SETTINGS.  

- PROGRAM WILL NOT WORK WITH ANY VERSION OF WINDOWS 9X (incl. ME).

- The date/time settings in the configuration tab MUST match the 
  format of the settings of your OS.  If they do not, maintenance 
  and unbanning options will not function properly. DO NOT USE
  IFSO UNLESS YOUR FORMATS MATCH IT!  
  You must have your date format set to either MM/DD/YYYY or 
  DD/MM/YYYY.  

- Program will NOT work with player names using extended characters 
  (i.e., Asian language symbols).  These characters are interpreted 
  as linefeed characters and will be skipped.  If you would like to 
  use IFSO on YOUR server, please notify your players NOT to use 
  extended characters in their player names, otherwise your server's 
  performance will suffer while IFSO deals with names with special 
  characters in them.

- FLAdmin may no longer function properly on slower servers with 
  more than 1000 player files.  Use the maintenance options to keep 
  your servers' player database as small as possible to ensure 
  FLAdmin's proper operation.

- The player editor: When editing items in a list (i.e., forward 
  hard points), if an object is changed, IFSO changes the FIRST 
  instance of that object found in the player's file (not 
  necessarily the one you have selected). This affects forward 
  hard points, turrets, equipment and lights.

--------------------------------------------------------------------

INCLUDED FILES

-BANNEDPLAYERSFOOTER.HTT
-BANNEDPLAYERSHEADER.HTT
-BANNEDPLAYERSTABLE.CSS

Sample files included to help you set up banned players web output.

-FLSERVEROPERATOR.EXE

Program executable.

-FLSERVEROPERATOR*.INI

Text files created by IFSO storing configuration settings and 
information.

-GAMEDATA*.txt

Text files storing information regarding objects in Freelancer.
IFSO uses these files as a database when it requires information
about Freelancer.  These are the files you will be editing if you
need to make a mod work with IFSO.  See the mod section of this
README for more information.

-PLAYERSONLINEFOOTER.HTT
-PLAYERSONLINEHEADER.HTT
-PLAYERSONLINETABLE.CSS

Sample files included to help you set up your online players web
output.

-README.TXT

This file.  

-UNINSTALL.* 

The uninstaller for IFSO.  You shouldn't ever need these files ;)

--------------------------------------------------------------------

INITIAL SETUP

On the first run of the software, IFSO will ask for the location
of two files.

FLServer.exe is found in the Freelancer\EXE folder (look where you
installed Freelancer to on your system).

FLServer.cfg is found in your 
my games\freelancer\accounts\multiplayer folder, which is usually
located in your my documents folder.  

YOU HAVE TO RUN FLSERVER.EXE AT LEAST ONCE BEFORE USING IFSO SO 
THAT THIS FILE WILL BE CREATED.

IFSO will generate a player list on its first run.  This involves
finding and decoding ALL of the .fl (player) files on your hard 
drive.  IFSO does this to build a list of player names for you, 
in addition to storing other useful information like player's rank,
money, and loadouts.  The initial generation will take a bit of time,
but you should only have to do this once if IFSO is left to run your
server all the time (player files are automatically updated as 
required when they are found online).  

Once those steps are completed, you should be up running!  

--------------------------------------------------------------------

TNG SERVERS:

If you're running a server utilizing a version of the TNG mod, your
FLServer.exe has been modified and no longer has the default window
name.  As a result, the default window name in IFSO will be incorrect
and IFSO will be unable to find your FLServer window.  TO FIX THIS,
YOU MUST CHANGE YOUR FLSERVER WINDOW NAME IN THE IFSO 
CONFIGURATION TAB.  This field must match the FLServer window name 
EXACTLY as it appears for IFSO to be able to manipulate FLServer.  

If you need to e-mail me because you can't figure this part out, 
you shouldn't be running a server.  

TNG MOD AUTHORS: QUIT MESSING WITH THE EXE AND 
CHANGING THE BLOODY FLSERVER WINDOW NAME.  IT IS NOT NECESSARY.

--------------------------------------------------------------------

MODDED SERVERS

IONCROSS Freelancer Server Operator was DESIGNED for (and tested on)
MODDED servers.  If your mod adds new weapons, cargo, ships,
factions, systems, bases, or pretty much ANYTHING to the original
Freelancer, you can add the new information to the corresponding
GAMEDATA txt file in the program's folder.  Once you add your new 
objects' nicknames and hash codes to the GAMEDATA files, the editor
will work with the new ships and objects.

The IONCROSS Freelancer GAMEDATA Creator can be used to modify 
GAMEDATA files.  It's also available from the IONCROSS website.

Of course, this means that if your server is modded, you HAVE TO 
make sure you add this information to IFSO if you want it to work
properly!  Otherwise, it will be coming up with a lot of "UNKNOWN"
values for objects and locations.

If you're coming up with base nicknames in your mod, stick to the
Freelancer original system naming convention - systemnick_basenick.  
For example, Li01_Base01 is in system Li01.  

IFSO was designed to use this naming scheme to determine 
which bases belong in which system.  If your base nicks do not
follow this convention, your bases will not be listed in the editor
window.  You have been warned :) 

IONCROSS IS NOT RESPONSIBLE FOR CREATING ANY GAMEDATA FILES. IF YOU
NEED GAMEDATA FILES FOR A MOD THAT YOU ARE RUNNING BUG THE MOD 
AUTHOR - DO NOT E-MAIL ME.  

--------------------------------------------------------------------

TESTING

I'd like to shout out to my testing team!  

They're the boys that made sure I didn't make an ass of myself and 
release a super-buggy version.  Instead, now it only contains HALF
the bugs! :)

These guys were also essential in suggesting which features I should
implement in this software.  Without them, this program is NOTHING
and I couldn't have done it without their help.  

Thanks for your hard work guys!

Pinger

Earendil

Bobway

Shaitan

---------------------------------------------------------------------

CREDITS

I'd like to give credit where it's due:

- FiiK for his DLLs that make things much easier on me ;)  This 
  software is run solely on FiiKJuice! :)

- FiiK for code suggestions and solutions :D

- FiiK for just being such a damn cool guy.  DAMN COOL!

- JohnSteve for information about the layout of .fl files

- JohnSteve for his extensive list of object nicknames from the game

- JohnSteve for the .fl file I ripped the "all map info" from ;)

- Proxima for nicknames of the games' lights and cloaking info

- Crabtree for analyzing my code from time to time to help me find 
  bugs

- Sherlog (the master!) for the utility to calculate .fl hash codes

- Sherlog and Jor for the original algorithms to decode .fl files

- www.lancersreactor.com for getting IONCROSS software out to the 
  world! ;)



- AND my new wife Jody.  We finally got the marriage over with :)

---------------------------------------------------------------------

DISCLAIMER

I will refrain from using lawyer speak; I'd have to be smarter for 
that and it's a waste of time anyway :)

USE THIS SOFTWARE AT YOUR OWN RISK.  BACK UP YOUR PLAYER FILES.

IFSO works perfectly on my server.  I could NOT test it on yours
and can make no guarantee regarding its performance for you.  The
software is free, don't complain if it causes you hassles.  I've 
allowed plenty of time (an extra few weeks, actually) for testing so
I hope it's as bug free as possible.  Of course, no software can
ever be 100% bug free.  You have been warned :)

IFSO DECODES player files.  I do not believe this violates 
Microsoft's EULA for Freelancer as these files are not part of game 
itself.  Make your own decision about it.  If you are concerned
about Freelancers' EULA, don't use IFSO.

IONCROSS software is in NO WAY affiliated with Microsoft.  Or anyone
for that matter.  Nor do I WANT to be affiliated with anyone.  Leave
me alone.

The above names/trademarks/call signs/whatever are registered to 
whoever they belong to.  

---------------------------------------------------------------------

FINAL NOTE

Something new for those of you who still bother reading my readme 
files.

I've been at this now for over a year.  The first (stable) version
of IFSO was released on TLR at 9/24/2003 1:41:59 PM.  Everyone that
was with me along the way (testers, users, donators, everyone) has
made it a truly unique experience and I thank every one of you from 
the bottom of my heart.  The community revolving around Freelancer
was honestly the first one that I ever really took a part like this
in and I'm glad that I was able to make a difference for so many 
people.

I regret to announce I have decided that it's time for me to move
forward and that this is probably my last major release of IFSO.  I 
have new challenges waiting for me and can no longer find the time
(or interest) to pursue development on this project.  Instead, I 
will now be able to spend this time further developing the 
cutting-edge server software for the IONCROSS Total War mod and 
properly finishing up that particular project.

I will not be publicly releasing the source code for the IFSO 
project.  I may be willing to sell it, but it has taken too much 
time and effort on my part to just freely give away.  Interested 
parties may e-mail me regarding realistic offers to purchase the 
source code at my regular e-mail address, joeboomz@ioncross.com.  
The IFSO forum will remain up for a yet-to-be-determined amount of 
time but it will eventually also be removed. 

Again, thanks again all.  God bless.

-- JoeBoomz
IONCROSS
