[General]
SyntaxVersion=2
BeginHotkey=50
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=c7323513-37d3-45e3-ab3c-0d62dced7356
Description=使用本地的图片上传-A
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
//Da = Plugin.Window.Find(0, "达管家 - UC浏览器")
//Call Plugin.Window.Active(Da)
//Call Plugin.Window.Max(Da)
//Delay 1000

//获取焦点 滚动至页首
Call getFocus
MouseWheel 26
Delay 500
//白底图上传
Call updatePic(695, 490, "D:\DATA\资源猎手\whitePic.jpg")
Call getFocus
//宝贝图1复制主图
MoveTo 521,840
LeftClick 1
//向下滚动至出现白底图
MouseWheel -3
Delay 200
//白底图复制
MoveTo 710,810 
LeftClick 1
//宝贝图2、3上传
Call updatePic(426,570, "D:\DATA\资源猎手\pic2.jpg")
Call updatePic(436,605, "D:\DATA\资源猎手\pic3.jpg")
//获取焦点 滚动至介绍内容区域
Call getFocus
MouseWheel - 12
Delay 300
//介绍配图2、1上传
Call updatePic(547,760, "D:\DATA\资源猎手\additionPic2.jpg")
Call updatePic(543, 345, "D:\DATA\资源猎手\additionPic1.jpg")
//确认上传按钮
MoveTo 720, 900

EndScript

//上传图片 xy为上传按钮位置 
Function updatePic(x, y, picPath)
	MoveTo x, y
	Do
		IfColor 202,381, "EFA328", 1 Then
			LeftClick 1
       		Delay 200
     	Else
    		Exit Do
    	End If
	Loop
	MoveTo 489,554//上传按钮
	LeftClick 1
	Do//打开图片窗口出现
		IfColor 421, 559, "F0F0F0", 1 Then
        	Delay 200
    	Else 
    		Exit Do    
    	End If
	Loop
	
	Delay 500
	Hwnd = Plugin.Window.GetKeyFocusWnd()
	Call Plugin.Bkgnd.SendString(Hwnd, picPath)
	MoveTo 730,562//确认选择图片
	LeftClick 1
	//等待上传完成
	Do
		IfColor 721,569 , "E1E1E1", 0 Then//打开窗口打开按钮颜色
       		Delay 200
     	Else 
    		Exit Do
    	End If
	Loop//图片打开完成
	Do
		IfColor 202,381, "EFA328", 0 Then
       		Delay 200
     	Else
    		Exit Do
    	End If
	Loop//图片上传完成
	Delay 300
End Function
//点击空白处来获取焦点
Function getFocus()
	MoveTo 174, 385//空白处
	LeftClick 1
	Delay 200
End Function
