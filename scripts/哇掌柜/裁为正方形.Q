[General]
SyntaxVersion=2
BeginHotkey=50
BeginHotkeyMod=1
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f7643d28-4ce3-45fb-a844-ed4909c95319
Description=裁为正方形
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
MoveTo 1615, 81//裁剪按钮
LeftClick 1

Call Lib.hps.waitColorShow(455, 154, "DA9F63")
Delay 200
MoveTo 540, 455//正方形按钮
LeftClick 1

MoveTo 939, 527//裁剪区域中间
LeftDown 1
MoveTo 800, 456
LeftUp 1

Call Lib.hps.waitColorShow(455, 154, "DA9F63")
Delay 200