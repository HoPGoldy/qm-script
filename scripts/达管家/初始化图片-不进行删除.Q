[General]
SyntaxVersion=2
BeginHotkey=112
BeginHotkeyMod=3
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=d9718342-a588-4efc-af95-f1da9976d757
Description=��ʼ��ͼƬ-������ɾ��
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
ShowMsg("ѡ��׵�ͼ")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "whitePic.jpg")
Call ClearMsg

ShowMsg("ѡ�񱦱�ͼ2")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "pic2.jpg")
Call ClearMsg

ShowMsg("ѡ�񱦱�ͼ3")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "pic3.jpg")
Call ClearMsg

ShowMsg("ѡ������ͼ1")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "shortPic1.jpg")
Call ClearMsg

IsFile = Plugin.File.IsFileExist("D:\DATA\��Դ����\shortPic1.jpg")
If isFile Then 
	ShowMsg("ѡ������ͼ2")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "shortPic2.jpg")
	Call ClearMsg
Else 
	ShowMsg("ѡ������ͼ")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "additionPic1.jpg")
	Call ClearMsg
End If

ShowMsg("ѡ�񲹳�ͼ2-1")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "longPic1.jpg")
Call ClearMsg

IsFile = Plugin.File.IsFileExist("D:\DATA\��Դ����\longPic1.jpg")
If isFile Then 
	ShowMsg("ѡ�񲹳�ͼ2-2")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "longPic2.jpg")
	Call ClearMsg
Else 
	ShowMsg("ѡ�񲹳�ͼ2")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "additionPic2.jpg")
	Call ClearMsg
End If

Call Plugin.Msg.HideScrTXT()


//����ctrl+alt+7ָ���Ľű�
KeyDown "Ctrl", 1
KeyPress  "Num 8", 1
KeyUp "Ctrl", 1

Function ShowMsg(content)
	Call Plugin.Msg.Tips(content)
End Function

Function ClearMsg()
	Call Plugin.Msg.Tips("")
	Call Plugin.Msg.Tips("")
End Function
