[General]
SyntaxVersion=2
BeginHotkey=112
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=896ad32b-f164-4a64-a33a-96627241570f
Description=初始化图片
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
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\whitePic.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\whitePic.jpg")
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\whitePic.jpg", "D:\DATA\资源猎手\backup\whitePic.jpg")
End If
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\pic2.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\pic2.jpg")
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\pic2.jpg", "D:\DATA\资源猎手\backup\pic2.jpg")
End If
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\pic3.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\pic3.jpg")
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\pic3.jpg", "D:\DATA\资源猎手\backup\pic3.jpg")
End If
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\longPic1.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\longPic1.jpg")
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\longPic1.jpg", "D:\DATA\资源猎手\backup\longPic1.jpg")
End If
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\longPic2.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\longPic2.jpg")	
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\longPic2.jpg", "D:\DATA\资源猎手\backup\longPic2.jpg")
End If
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\shortPic1.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\shortPic1.jpg")
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\shortPic1.jpg", "D:\DATA\资源猎手\backup\shortPic1.jpg")
End If
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\shortPic2.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\shortPic2.jpg")
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\shortPic2.jpg", "D:\DATA\资源猎手\backup\shortPic2.jpg")
End If
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\additionPic1.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\additionPic1.jpg")
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\additionPic1.jpg", "D:\DATA\资源猎手\backup\additionPic1.jpg")
End If
IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\additionPic2.jpg")
If isFile Then 
	Call Plugin.File.DeleteFolder("D:\DATA\资源猎手\additionPic2.jpg")
//	Call Plugin.File.MoveFile("D:\DATA\资源猎手\additionPic2.jpg", "D:\DATA\资源猎手\backup\additionPic2.jpg")
End If

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
