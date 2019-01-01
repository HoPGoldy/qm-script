[General]
SyntaxVersion=2
BeginHotkey=52
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=0
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=2177d208-b2ca-49b6-b6a7-b483997633ad
Description=偷车任务
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
KeyPress "Enter", 1

MoveTo 1000, 610//登陆
Delay 4000
LeftClick 1

MoveTo 1000, 610//交易载具
Delay 500
LeftClick 1

MoveTo 1200, 430//获取载具
Delay 500
LeftClick 1

MoveTo 1200, 560//确认获取
Delay 500
LeftClick 1
