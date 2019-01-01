[General]
SyntaxVersion=2
BeginHotkey=103
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=a7eca16b-4a11-4fb1-bc98-9153c7e8e8ce
Description=裁剪
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
	Call cutPic
	count = count + 1
Next
//调用ctrl+8指定的脚本
KeyDown "Ctrl", 1
KeyPress  "Num 8", 1
KeyUp "Ctrl", 1

EndScript

Function cutPic()
	Delay 1300
	IfColor 786,279, "DA9F63", 0 Then//保存和分享界面已经打开的话
		MoveTo 765,487//打开
		LeftClick 1
	Else 
		MoveTo 1704, 53//打开
		LeftClick 1
	End If
	//选择图片
	Do
		IfColor 737,713, "F0F0F0", 0 Then//选择图片窗口打开
			Exit Do
	
			Else 
			Delay 100
		End If
	Loop
	Hwnd = Plugin.Window.GetKeyFocusWnd()
	If count = 0 Then 
		picPath = "D:\DATA\资源猎手\longPic1.jpg"
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
	
	MoveTo 1612, 81//裁剪按钮
	LeftClick 1
	
	Call Plugin.Msg.Tips("请确认位置后点击回车")
	Do Until WaitKey() = 13//等待右键
	Loop
	Call Plugin.Msg.Tips("")
	Call Plugin.Msg.Tips("")
	MoveTo 830, 815//完成裁剪
	LeftClick 1
	Delay 700
	
	MoveTo 1860, 39//打开保存
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
		picName = "shortPic1"
	Else 
		picName = "shortPic2"
	End If
	Call Plugin.Bkgnd.SendString(Hwnd, picName)
	MoveTo 775, 695//保存图片
	LeftClick 1
	Delay 400
	MoveTo 940, 580//覆盖图片
	LeftClick 1
End Function
