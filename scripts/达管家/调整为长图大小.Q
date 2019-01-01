[General]
SyntaxVersion=2
BeginHotkey=113
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=0b38e03c-cd4f-4853-857e-e2b69a7d2248
Description=调整为长图大小
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
//MsgBox GetPixelColor(814,689)
MoveTo 1654, 79//尺寸
LeftClick 1
LeftUp 1
//尺寸框弹出后修改大小
For 5
    IfColor 823, 358, "D99C4C", 0 Then
        MoveTo 782, 439
        LeftClick 1
        MoveTo 802, 439
        KeyPress "BackSpace", 4
		KeyPress "7", 1
		KeyPress "2", 1
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

Delay 200
MoveTo 1860, 39//打开保存
LeftClick 1
Do
    IfColor 814, 689, "8AE297", 0 Then
        Exit Do
    Else 
        Delay 100
    End If
Loop

MoveTo 914,576//自定义保存路径
LeftClick 1
randX = getRand(1, 150)
MoveTo (676 + randX), 650//选择文件名随机位置
LeftClick 1
Delay 100
KeyPress "1", 1
MoveTo 798, 700
LeftClick 1
MoveTo 750,491//打开图片位置
EndScript

Function getRand(min, max)//获取随机数
        Randomize
        getRand = CInt(Rnd*(max-min) + min)
End Function
