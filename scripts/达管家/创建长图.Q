[General]
SyntaxVersion=2
BeginHotkey=104
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=e6ed4e25-9cf4-4df7-beff-45f0c90f2943
Description=创建长图
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
MTXX = Plugin.Window.Find(0, "美图秀秀")
Call Plugin.Window.Active(MTXX)
Call Plugin.Window.Max(MTXX)
count = 0

For 2
	Select Case count
		Case 0
			IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\shortPic1.jpg")
			If isFile Then 
				Call createLongPic
			End If
		Case 1
			IsFile = Plugin.File.IsFileExist("D:\DATA\资源猎手\longPic1.jpg")
			If isFile Then 
				Call createLongPic
			End If
	End Select
	count = count + 1
Next

//调用ctrl+alt+8指定的脚本
//KeyDown "Ctrl", 1
//KeyPress  "3", 1
//KeyUp "Ctrl", 1

EndScript

Function initPic()
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
	
	ShowMsg("选择长图1")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "longPic1.jpg")
	
	ShowMsg("选择长图1")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "longPic2.jpg")
	
	ShowMsg("选择长图3")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "shortPic1.jpg")
	
	ShowMsg("选择长图4")
	picPtah = Plugin.File.SelectFile()
	Call Plugin.File.ReNameFile(picPtah, "shortPic2.jpg")
End Function
Function createLongPic
	Delay 1000
	IfColor 786,279, "DA9F63", 0 Then//保存和分享界面已经打开的话
		MoveTo 765,487//打开
	Else 
		MoveTo 1704, 53//打开
	End If
	LeftClick 1
	Do
		IfColor 737,713, "F0F0F0", 0 Then//选择图片窗口打开
			Exit Do
		Else 
			Delay 100
		End If
	Loop
//选择图片
	Hwnd = Plugin.Window.GetKeyFocusWnd()
	If count = 0 Then 
		picPath = "D:\DATA\资源猎手\shortPic1.jpg"
	Else 
		picPath = "D:\DATA\资源猎手\longPic2.jpg"
	End If
	Call Plugin.Bkgnd.SendString(Hwnd, picPath)
	MoveTo 1278, 730//确认选择图片
	LeftClick 1
	Do
		IfColor 737,713, "F0F0F0", 1 Then//选择图片窗口关闭
			Exit Do
		Else 
			Delay 100
		End If
	Loop
	Delay 1300

	MoveTo 442,45 //拼图按钮
	LeftClick 1
	Delay 500
	
	MoveTo 70,466//图片拼接按钮
	LeftClick 1
	Do
		IfColor 572,250, "FFB769", 0 Then//拼图窗口打开
			Exit Do
		Else 
			Delay 100
		End If
	Loop
	
	MoveTo 572,250//选择多张按钮
	LeftClick 1
	Do
		IfColor 737,713, "F0F0F0", 0 Then//选择图片窗口打开
			Exit Do
		Else 
			Delay 100
		End If
	Loop
//选择图片2
	Hwnd = Plugin.Window.GetKeyFocusWnd()
	If count = 0 Then 
		picPath = "D:\DATA\资源猎手\shortPic2.jpg"
	Else 
		picPath = "D:\DATA\资源猎手\longPic1.jpg"
	End If
	Call Plugin.Bkgnd.SendString(Hwnd, picPath)
	MoveTo 1278, 730//确认选择图片
	LeftClick 1
	Do
		IfColor 737,713, "F0F0F0", 1 Then//选择图片窗口关闭
			Exit Do
		Else 
			Delay 100
		End If
	Loop
	Delay 1300

	MoveTo 996,839
	LeftClick 1
	Do
		IfColor 547,321, "FF9F35", 1 Then//拼图窗口关闭
			Exit Do
		Else 
			Delay 100
		End If
	Loop
	Delay 500
	
	MoveTo 1654, 79//尺寸
	LeftClick 1
	LeftUp 1
//尺寸框弹出后修改大小

	Do
    	IfColor 823, 358, "D99C4C", 0 Then
			Exit Do       
    	Else 
        		Delay 100
    	End If
	Loop
	MoveTo 782, 439
	LeftClick 1
	MoveTo 802, 439
	KeyPress "BackSpace", 4
	KeyPress "7", 1
	KeyPress "0", 1
	KeyPress "2", 1
	MoveTo 900, 683
	LeftClick 1

//打开保存
	Delay 700

	MoveTo 1886, 52//保存与分享
	LeftClick 1
	Do
    	IfColor 814, 689, "8AE297", 0 Then
        	Exit Do
    	Else 
        	Delay 100
    	End If
	Loop
	
	MoveTo 812, 649//自定义保存路径
	LeftClick 1
	KeyDown "Ctrl", 1
	KeyDown "A", 1
	KeyUp "A", 1
	KeyUp "Ctrl", 1
	KeyPress "BackSpace", 1
	Hwnd = Plugin.Window.GetKeyFocusWnd()
	If count = 0 Then 
		picName = "additionPic1"
	Else 
		picName = "additionPic2"
	End If
	Call Plugin.Bkgnd.SendString(Hwnd, picName)
	MoveTo 775, 695//保存图片
	LeftClick 1
	Delay 500
	MoveTo 940, 580//覆盖图片
	LeftClick 1
End Function
