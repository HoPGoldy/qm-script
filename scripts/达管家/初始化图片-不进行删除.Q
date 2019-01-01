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
Description=初始化图片-不进行删除
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
ShowMsg("选择白底图")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "whitePic.jpg")
Call ClearMsg

ShowMsg("选择宝贝图2")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "pic2.jpg")
Call ClearMsg

ShowMsg("选择宝贝图3")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "pic3.jpg")
Call ClearMsg

ShowMsg("选择亮点图1")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "shortPic1.jpg")
Call ClearMsg

IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\shortPic1.jpg")
If isFile Then 
	ShowMsg("选择亮点图2")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "shortPic2.jpg")
	Call ClearMsg
Else 
	ShowMsg("选择亮点图")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "additionPic1.jpg")
	Call ClearMsg
End If

ShowMsg("选择补充图2-1")
picPtah = Plugin.File.SelectFile()
Call Plugin.File.ReNameFile(picPtah, "longPic1.jpg")
Call ClearMsg

IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\longPic1.jpg")
If isFile Then 
	ShowMsg("选择补充图2-2")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "longPic2.jpg")
	Call ClearMsg
Else 
	ShowMsg("选择补充图2")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "additionPic2.jpg")
	Call ClearMsg
End If

Call Plugin.Msg.HideScrTXT()


//调用ctrl+alt+7指定的脚本
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
