[General]
SyntaxVersion=2
BeginHotkey=0
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=9a5aca0d-eb57-4938-b080-0de27739f499
Description=调整为品牌大小
Enable=0
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
//MsgBox GetPixelColor(814,689)
MoveTo 1654, 79//尺寸
LeftClick 1
LeftUp 1
//尺寸框弹出后修改大小
For 5
    IfColor 823, 358, "D99C4C", 0 Then
       MoveTo 757, 469
        LeftClick 1
        MoveTo 782, 439
        LeftClick 1
        MoveTo 802, 439
        KeyPress "BackSpace", 4
		KeyPress "3", 1
		KeyPress "6", 1
		KeyPress "0", 1
        MoveTo 915, 436
        LeftClick 1
        KeyPress "BackSpace", 4
		KeyPress "1", 1
		KeyPress "5", 1
		KeyPress "0", 1
        MoveTo 900, 683
        LeftClick 1
        Goto break
    Else 
        	Delay 200
    End If
Next
//打开保存
Rem break
MoveTo 1860, 39
LeftClick 1
LeftUp 1
For 6
    IfColor 814, 689, "8AE297", 0 Then
        MoveTo 772, 689
        LeftClick 1
        MoveTo 909, 581
        Delay 200
        LeftClick 1
        MoveTo 772, 505
        Delay 400
        Else 
        Delay 200
    End If
Next
