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
Description=ʹ���ƶ˵�ͼƬ�ϴ�-��ʱ
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
//�հ״�
nothingX = 174
nothingY = 385
//������ͼ�ϴ�
introducePicX =555
introducePicY = 868
//������ͼ2�ϴ�
introduce2PicX = 569
introduce2PicY = 847  
Dim enterKey
enterKey = 13

MoveTo 472, 518
LeftClick 1
MouseWheel 26

Call Plugin.Msg.Tips("��ѡ��׵�ͼ���»س�")
Do Until WaitKey() = enterKey
Loop
Call Plugin.Msg.Tips("")
Call Plugin.Msg.Tips("")
MouseWheel - 3 
Delay 200
MoveTo 580,594//����ͼ2
LeftClick 1
MoveTo 737, 833//�׵�ͼ
LeftClick 1
MouseWheel 3
MoveTo 472, 518

Call Plugin.Msg.Tips("��ѡ�񱦱�ͼ3���»س�")
Do Until WaitKey() = enterKey
Loop
Call Plugin.Msg.Tips("")
Call Plugin.Msg.Tips("")
MouseWheel - 1 
Delay 200
MoveTo 580, 830//����ͼ3
LeftClick 1
MouseWheel 1
MoveTo 472, 518

Call Plugin.Msg.Tips("��ѡ�񱦱�ͼ1���»س�")
Do Until WaitKey() = enterKey
Loop
MoveTo 580,862//����ͼ1
LeftClick 1
Delay 200

MouseWheel - 10
Delay 200
MoveTo introducePicX, introducePicY//������ͼ�ϴ�
LeftClick 1
Do
	IfColor 386,398 , "5CB85C", 1 Then
       	Delay 100
     	Else 
    		Exit Do
    	End If
Loop
Call Plugin.Msg.Tips("��ѡ�񲹳�1��ͼ")
MoveTo 386,398
LeftClick 1

Call waitUpdateCompelete

MoveTo nothingX,nothingY
LeftClick 1
MouseWheel - 6
Delay 300
MoveTo introduce2PicX, introduce2PicY//������ͼ2�ϴ�
LeftClick 1
Do
	IfColor 386,398 , "5CB85C", 1 Then
       	Delay 100
     	Else 
    		Exit Do
    	End If
Loop
Call Plugin.Msg.Tips("��ѡ�񲹳�2��ͼ")
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

Function waitUpdateCompelete()//�ȴ��ϴ����-�����������
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
