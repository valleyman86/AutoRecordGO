AutoRecordGO
============

Automatically Record Games in CS:GO with this AutoHotKey Script.

[Here is a video on how it works.][1]

\*Update\*
* I made the script erase the previous console.log to prevent large console logs in the future. 

This script can be run (or compiled actually) from AutoHotKey. I am not going to release the compiled version because I do not want people thinking I hacked their computers... and I'm not sure what the rules are. If you do compile it then that means you don't need AHK installed to use the script. 

Anyhow this script does 3 main things. It does not read memory or do anything with the actual client so no reason anyone would get banned for this of course. You can edit out what you like if you want. I commented stuff a bit so you can see what to remove. 

**Requirements:**
>* [AutoHotKey](http://www.autohotkey.com/)
>* Enable console in settings
>* Add "-condebug" (without quotes) to your launch options in steam under CS:GO properties. This just outputs console to a log file (as well as the console).
>* Create a Saved_Demos folder in the csgo directory
>* Change the PlayerName value in the top of the script to your in game name. Note: The characters \\.*?+[{|()^$ must be preceded by a backslash to be seen as literal. For example, \\. is a literal period and \\\ is a literal backslash.
>* If you changed your steam directory you will need to edit the location of the console.log in the script as well. Its at the top and is called "ConsolePath".

Without further ado. 

1. It automatically records you game demos for you. The way this works is pretty simple. -condebug writes your console to a log in the cs:go directory. This script monitors that log and when it sees that you connected to a server it (using keyboard strokes) quickly launches the console and types Record Saved_Demos\{time of day} then closes the console. 

2. The script will let you press Ctrl+Shift+S to start recording as well. It doesn't stop though so just leaving a game or manually stopping it is required.

3. This feature is more niche but I use Caps Lock for my talk button. I hated having to make sure it wasn't on when typing so this feature makes the caps lock key work as a button but never toggles on. This only affects CS:GO and Dota 2. You can change or remove this if you like. I commented these sections so you can find them.

Note:
I actually use the sound files from Sc2Gears that say "Recording Started" and "Replay Saved" for this. The code is there and can be uncommented if you want to do that. I am not going to share those files though because they aren't mine. Currently it just beeps when it starts and stops letting you know it was successful. If it beeps its working because I also read the Log for that as well.

Anyhow I hope this isn't too complicated and that you guys get some use out of it. I couldn't find anything that let me auto record demos and I also kept forgetting to do it. So I solved my problem. Hope I didn't miss anything.

Feel free to comment and let me know if you have any ways to improve it.

[1]: http://www.youtube.com/watch?v=zOFKdfA8Uyg "YouTube"