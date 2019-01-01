[General]
SyntaxVersion=2
BeginHotkey=52
BeginHotkeyMod=1
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=9952bd70-0876-4740-81c5-64f9151a71c9
Description=抠图
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
MoveTo 81, 46//美化按钮
LeftClick 1
Delay 200
MoveTo 41, 433//抠图按钮
LeftClick 1
Delay 200
MoveTo 953, 417//自动抠图按钮
LeftClick 1

//等待抠图界面打开
Call Lib.hps.waitColorShow(519, 166, "DA9F63")

//监听是否抠图完成
Call Lib.hps.waitColorShow(1251, 170, "536FA7")

Delay 800
Call setPicSize
//抓住图片拖动至中央
MoveTo 746, 329
LeftDown 1
MoveTo 930, 513
LeftUp 1

EndScript

Function setPicSize
	MoveTo 1214, 204//背景设置按钮
	LeftClick 1
	Delay 200
	
	MoveTo 1090, 244//颜色按钮
	LeftClick 1
	Delay 100
	
	MoveTo 1132, 268//宽度输入框
	LeftClick 1
	KeyPress "BackSpace", 4
	KeyPress "8", 1
	KeyPress "0", 2

	MoveTo 1206, 271//高度输入框
	LeftClick 1
	KeyPress "BackSpace", 4
	KeyPress "8", 1
	KeyPress "0", 2
	
	MoveTo 1156, 317//收起按钮
	LeftClick 1
	Delay 100
End Function