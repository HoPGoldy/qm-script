[General]
SyntaxVersion=2
BeginHotkey=192
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=96024261-abbc-449b-a558-0ff9e126e74a
Description=图片确认
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
LeftClick 1
KeyPress "F2", 1
Call Plugin.Sys.SetCLB("pic")
KeyDown "Ctrl", 1
KeyPress "V", 1
KeyUp "Ctrl", 1
KeyPress "Enter", 1

doingWork = Lib.hps.load("doingWork", "D:\DATA\资料\update\data\info")

If Lib.hps.load("whitePic", "D:\DATA\资料\update\data\" & doingWork) = 0 Then 
	KeyPress "Enter", 1
Else
	Call Lib.hps.save("whitePic", 0, "D:\DATA\资料\update\data\" & doingWork)
End If
