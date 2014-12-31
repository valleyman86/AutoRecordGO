;Created By valleyman86
; needs to be #Persistent, otherwise events will kick few times and script exits.
#Persistent
 
PlayerName := "MurderDev\.com"
ConsolePath := "C:\Program Files (x86)\Steam\SteamApps\common\Counter-Strike Global Offensive\csgo\console.log"

AutoTrim, On

;Delete this section to remove auto recording
;-start-
SetTimer MonitorConsoleLog, 500
EraseConsoleLog(ConsolePath)
File := FileOpen(ConsolePath, "r")
;File := FileOpen("D:\test.txt", "rw")
File.Seek(0, 2)
Size0 := File.Length
gMapName := ""
;-end-
 
;Delete this section to remove Ctrl+Shift+S hotkey recording
;-start-
#If WinActive("ahk_exe csgo.exe")
    ^+s::
        RecordDemo()
    return
#if
;-end-
 
;Delete this section to enable caps lock in game. (Note: It still works as a key it just does not stay toggled on)
;-start-
#If WinActive("ahk_exe csgo.exe") or WinActive("ahk_exe dota.exe")
    ~CapsLock Up::SetCapsLockState, off
#if
;-end-
 
RecordDemo()
{
    FormatTime, time, %A_Now%, MM-dd-yy_hh-mmtt
    SendInput ``
    Sleep, 250
    SendInput record Saved_Demos\%gMapName%%time% {enter}
    Sleep, 100
    SendInput ``
}

EraseConsoleLog(filePath)
{
    FileToErase := FileOpen(filePath, "w")
    FileToErase.Write("")
    FileToErase.Close()
}

MonitorConsoleLog:
   global gMapName
   Size := File.Length
 
   If (Size0 >= Size) {
      Size0 := Size
      File.Seek(0, 2)
      Return
   }
 
   ;LastLine := File.ReadLine()
   while (LastLine := File.ReadLine()) {
       if (RegExMatch(LastLine,"i)^Map: (.*)", MapName)) {
           ;MsgBox %MapName1%
	   gMapName := MapName1 . "_"
       }

       if (RegExMatch(LastLine,"i)" . PlayerName . " connected")) {
           Sleep, 6000
           RecordDemo()
           ;MsgBox %LastLine%
       }
 
      if (RegExMatch(LastLine,"i)Recording to")) {
          SoundBeep
          ;SoundPlay recording_started.mp3
      }
 
      if (RegExMatch(LastLine,"i)Completed demo")) {
          SoundBeep
          ;SoundPlay replay_saved.mp3
      }
   }
 
   Size0 := Size
Return
