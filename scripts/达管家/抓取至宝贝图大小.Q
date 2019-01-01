[General]
SyntaxVersion=2
BeginHotkey=115
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=245dca32-b4b4-4f04-a820-3dba06bccb9d
Description=抓取至宝贝图大小
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
MoveTo 46, 437//抠图笔位置
LeftClick 1
MoveTo 933, 437
LeftClick 1
Do
	IfColor 534, 172, "DA9F63", 1 Then
        Delay 100
        Else 
        Exit Do
    End If
Loop
MoveTo 750, 821//完成抠图位置
LeftClick 1
Do
	IfColor 475, 365, "FD9F37", 1 Then
        Delay 100
        Else 
        Exit Do
    End If
Loop
MoveTo 1226, 204//背景设置
LeftClick 1
MoveTo 1084, 245//选择颜色
LeftClick 1
MoveTo 1128, 274
LeftClick 1
KeyPress "BackSpace", 4
KeyPress "8", 1
KeyPress "0", 2
MoveTo 1210, 277
LeftClick 1
KeyPress "BackSpace", 4
KeyPress "8", 1
KeyPress "0", 2
MoveTo 1167, 315
LeftClick 1
