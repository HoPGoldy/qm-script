[General]
SyntaxVersion=2
BeginHotkey=97
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=0
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=c2c90624-063c-4c37-829b-40b79f108f43
Description=起飞后自动飞行
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
KeyDown "W", 1
For 10
	Call Plugin.Media.Beep(523, 200)
	Delay 2000
	KeyPress "Num 8", 2

Next
Call Plugin.Media.Beep(578, 200)
KeyDown "Num 8", 1
