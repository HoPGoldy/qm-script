[General]
SyntaxVersion=2
BeginHotkey=51
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=0
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=58191a83-3285-4e87-971c-fde3edaa4d0c
Description=取货任务
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

MoveTo 430, 550//点击特种货物
Delay 500
LeftClick 1

MoveTo 430, 550//点击柱状图第一个仓库
Delay 500
LeftClick 1

MoveTo 380, 820//点击三箱货物
Delay 500
LeftClick 1

MoveTo 1200, 560//确认获取
Delay 500
LeftClick 1