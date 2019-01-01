[General]
SyntaxVersion=2
BeginHotkey=53
BeginHotkeyMod=1
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=112fa5fe-2788-4cbc-88e2-115e3b4ce848
Description=调整为500尺寸
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
MoveTo 85, 43
LeftClick 1
Delay 300

MoveTo 1654, 79//尺寸
LeftClick 1
LeftUp 1

//尺寸框弹出后修改大小
Call Lib.hps.waitColorShow(823, 358, "D99C4C")

MoveTo 757, 469
LeftClick 1
MoveTo 782, 439
LeftClick 1
MoveTo 802, 439
KeyPress "BackSpace", 4
KeyPress "5", 1
KeyPress "0", 2
MoveTo 915, 436
LeftClick 1
KeyPress "BackSpace", 4
KeyPress "5", 1
KeyPress "0", 2
MoveTo 900, 683

LeftClick 1
//打开保存
MoveTo 1860, 39
LeftClick 1
LeftUp 1

Call Lib.hps.waitColorShow(814, 689, "8AE297")

MoveTo 772, 689
LeftClick 1
MoveTo 909, 581
Delay 200
LeftClick 1
MoveTo 772, 505