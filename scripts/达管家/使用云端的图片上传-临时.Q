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
MacroID=8e3b7149-f49d-4400-b499-fc65122419a8
Description=使用云端的图片上传-临时
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
//空白处
nothingX = 174
nothingY = 385
//介绍配图上传
introducePicX =555
introducePicY = 868
//介绍配图2上传
introduce2PicX = 569
introduce2PicY = 847  
Dim enterKey
enterKey = 13

MoveTo 472, 518
LeftClick 1
MouseWheel 26

Call Plugin.Msg.Tips("请选择白底图后按下回车")
Do Until WaitKey() = enterKey
Loop
Call Plugin.Msg.Tips("")
Call Plugin.Msg.Tips("")
MouseWheel - 3 
Delay 200
MoveTo 580,594//宝贝图2
LeftClick 1
MoveTo 737, 833//白底图
LeftClick 1
MouseWheel 3
MoveTo 472, 518

Call Plugin.Msg.Tips("请选择宝贝图3后按下回车")
Do Until WaitKey() = enterKey
Loop
Call Plugin.Msg.Tips("")
Call Plugin.Msg.Tips("")
MouseWheel - 1 
Delay 200
MoveTo 580, 830//宝贝图3
LeftClick 1
MouseWheel 1
MoveTo 472, 518

Call Plugin.Msg.Tips("请选择宝贝图1后按下回车")
Do Until WaitKey() = enterKey
Loop
MoveTo 580,862//宝贝图1
LeftClick 1
Delay 200

MouseWheel - 10
Delay 200
MoveTo introducePicX, introducePicY//介绍配图上传
LeftClick 1
Do
	IfColor 386,398 , "5CB85C", 1 Then
       	Delay 100
     	Else 
    		Exit Do
    	End If
Loop
Call Plugin.Msg.Tips("请选择补充1配图")
MoveTo 386,398
LeftClick 1

Call waitUpdateCompelete

MoveTo nothingX,nothingY
LeftClick 1
MouseWheel - 6
Delay 300
MoveTo introduce2PicX, introduce2PicY//介绍配图2上传
LeftClick 1
Do
	IfColor 386,398 , "5CB85C", 1 Then
       	Delay 100
     	Else 
    		Exit Do
    	End If
Loop
Call Plugin.Msg.Tips("请选择补充2配图")
MoveTo 386,398
LeftClick 1

Call waitUpdateCompelete

MoveTo nothingX,nothingY
LeftClick 1
MouseWheel - 13

Delay 700

MoveTo 650, 378
LeftClick 1

MoveTo 692, 900
EndScript

Function waitUpdateCompelete()//等待上传完成-返回最初界面
	WaitClick 
	WaitClick 
	Do
		IfColor 491,568 , "F0F0F0", 0 Then
       		Delay 100
     		Else 
    			Exit Do
    		End If
	Loop
	Do
		IfColor 386,398 , "449D44", 0 Then
       		Delay 100
     		Else 
    			Exit Do
    		End If
	Loop
	Call Plugin.Msg.Tips("")
	Call Plugin.Msg.Tips("")
End Function
