[General]
SyntaxVersion=2
BeginHotkey=49
BeginHotkeyMod=1
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=594f5bcc-c4bc-48e7-b8bc-294c414352a3
Description=保存图片
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
MoveTo 1860, 39//打开保存
LeftClick 1

Call Lib.hps.waitColorShow(814, 689, "8AE297")

MoveTo 914,576//自定义保存路径 846,573 //覆盖源文件
LeftClick 1

//修改为jpg
MoveTo 932, 650
Delay 100
LeftClick 1
MoveTo 906, 666
LeftClick 1

MoveTo 798, 700
LeftClick 1

MoveTo 750,491//打开图片位置
EndScript