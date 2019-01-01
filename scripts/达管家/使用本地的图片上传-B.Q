[General]
SyntaxVersion=2
BeginHotkey=51
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=08911b34-5c96-4f51-a553-f3dcb3c96bb5
Description=使用本地的图片上传-B
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
//获取焦点 滚动至页首
Call getFocus
MouseWheel 26
Delay 500
//白底图上传
Call updatePic(695,461, "D:\DATA\资源猎手\whitePic.jpg")
//宝贝图2复制主图
MoveTo 539,843
LeftClick 1
//向下滚动至出现白底图
MouseWheel -3
Delay 200
//白底图复制
MoveTo 710,784 
LeftClick 1
//向上滚动至出现主图上传
MouseWheel 3
Delay 200
//宝贝图2在主图上传
Call updatePic(695, 491, "D:\DATA\资源猎手\pic2.jpg")
//宝贝图1复制主图
MoveTo 520,810
LeftClick 1
//向下滚动至出现白底图
MouseWheel -3
Delay 200
//宝贝图3上传
Call updatePic(436,611, "D:\DATA\资源猎手\pic3.jpg")
//获取焦点 滚动至介绍内容区域
Call getFocus
MouseWheel - 12
Delay 300
//介绍配图2、1上传
Call updatePic(510,754, "D:\DATA\资源猎手\additionPic2.jpg")
Call updatePic(510,347, "D:\DATA\资源猎手\additionPic1.jpg")
//确认上传按钮
MoveTo 720, 900

EndScript

//上传图片 xy为上传按钮位置 
Function updatePic(x, y, picPath)
	MoveTo x, y
	Do
		IfColor 386, 398, "5CB85C", 1 Then
			LeftClick 1
       		Delay 100
     		Else
    			Exit Do
    		End If
	Loop
	TracePrint "上传图片窗口出现"
	MoveTo 386,398//绿色上传按钮
	LeftClick 1
	Do//打开图片窗口出现
		IfColor 421, 559, "F0F0F0", 1 Then
        	Delay 100
    	Else 
    		Exit Do    
    	End If
	Loop
	TracePrint "打开图片窗口出现"
	Delay 500
	Hwnd = Plugin.Window.GetKeyFocusWnd()
	Call Plugin.Bkgnd.SendString(Hwnd, picPath)
	MoveTo 730,562//确认选择图片
	LeftClick 1
	//等待上传完成
	Do
		IfColor 721,569 , "E1E1E1", 0 Then//打开窗口打开按钮颜色
       		Delay 100
     	Else 
    		Exit Do
    	End If
	Loop
	TracePrint "图片打开完成"
	Do
		IfColor 308,386 , "449D44", 0 Then
       		Delay 100
     	Else
    		Exit Do
    	End If
	Loop
	Do
		IfColor 308,386 , "5CB85C", 0 Then
     		Delay 100
     	Else
    		Exit Do
    	End If
	Loop
	TracePrint "图片上传完成"
End Function
//点击空白处来获取焦点
Function getFocus()
	MoveTo 174, 385//空白处
	LeftClick 1
End Function
