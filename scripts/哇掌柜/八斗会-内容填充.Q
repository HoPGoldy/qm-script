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
MacroID=c5f9a8eb-74e7-4f26-ba7a-4e9c514e537b
Description=八斗会-内容填充
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
//Call getPos

KeyDown 17, 1
KeyPress 67, 1
KeyUp 17, 1

addNewPage = Plugin.Window.Find(0, "八斗会-添加-新有好货 - UC浏览器")
Call Plugin.Window.Active(addNewPage)
Call Plugin.Window.Max(addNewPage)

usedData = Plugin.Sys.GetCLB()
Call Plugin.File.DeleteFile("D:\DATA\资料\temp.txt")
Call Plugin.File.WriteFileEx("D:\DATA\资料\temp.txt", usedData)
//文件初始化完成

//计算http个数
//http = UBound(Split(usedData, "http"))
//
//计算第一个链接位置
//For i = 1 To 10
//	lineing = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", i)
//	If UBound(Split(lineing, "http")) = 1 Then 
//		Exit For
//	Else 
//		MessageBox "在文档前十行没有找到任何链接！"
//		EndScript 
//	End If
//Next
//
//For http

		
	
	url = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 1)
	name = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 3)
	HL1 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 5)
	HL2 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 6)
	SHL1 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 8)
	SHL2 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 9)
	additionMode1 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 10)
	additionContent1 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 11)
	additionMode2 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 12)
	additionContent2 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 13)
	
	Delay 800
	//==================================================开始上传==============================================================
	
	MoveTo 742, 298
	LeftClick 1
	KeyPress "Down", 9
	KeyPress "Enter", 1
	
	Delay 100
	
	KeyPress "Tab", 4
	Call paste(name)
	
	KeyPress "Tab", 4
	Call paste(HL1)
	
	MoveTo 1199,714//添加新长亮点按钮
	LeftClick 1
	KeyPress "Tab", 1
	Call paste(HL2)
	
	KeyPress "Tab", 2
	Call paste(SHL1)
	KeyPress "Enter", 1
	
	Call paste(SHL2)
	KeyPress "Enter", 1
	
	KeyPress "Tab", 3
	KeyPress "Down", 9
	
	KeyPress "Tab", 1
	KeyPress "Down", getRand(1, 5)
	
	IfColor 931,862, "5CB85C", 1 Then//自定义段落
		Call alerts("自定义段落位置未知")
	End If
	
	MoveTo 931,862//自定义段落
	LeftClick 1
	
	Call pasteAddition(855, 932, additionMode2, additionContent2)//补充2位置
	
	Call pasteAddition(859, 434, additionMode1, additionContent1)//补充1位置
	
	KeyPress "Tab", 1
	
	MoveTo 810,480//添加商品按钮
	LeftClick 1
	Call waitColor(1229,579, "5CB85C")//获取商品详情绿
	
	LeftClick 1
	KeyPress "Tab", 1
	Call paste(url)
	KeyPress "Tab", 1
	KeyPress "Enter", 1
	
	Call waitColor(1326,262, "DEC05B")//上方商品库蓝
	KeyPress "Tab", 5
	Call paste(name)
	MouseWheel -10
	
	
	RunApp url
	
//	i = i + 17
//	
//	//MessageBox "点击确定开始条目" & (i - 1)/17 + 1
//		Do
//			//暂停等待按键
//			Key=WaitKey()
//			If Key = 219 Then
//    			Exit Do
//			End If
//		Loop
//Next
Call deleteFileInFolder("D:\DATA\资料\picDownload")

EndScript

Function deleteFileInFolder(path)
	files = Lib.文件.遍历指定目录下所有文件名(path)
	For deleteFileInFolderCount = 0 To UBound(files)-1
		Call Plugin.File.DeleteFile(path&"\"&files(deleteFileInFolderCount))
	Next
End Function

Function getRand(min, max)//获取随机数
   	Randomize
    getRand = CInt(Rnd*(max-min) + min)
End Function

Function waitColor(x, y, ColorCode)//等待一个颜色出现
	Do
		IfColor x, y , ColorCode, 0 Then
			Delay 300
			Exit Do
		Else 
			Delay 100
		End If
	Loop
End Function

Function pasteTo(x, y, str)//在指定坐标粘贴文本
	MoveTo x, y
	LeftClick 1
	Call paste(str)
End Function

Function paste(str)//直接粘贴文本
	KeyDown "Ctrl", 1
	KeyPress "A", 1
	KeyUp "Ctrl", 1
	Call Plugin.Sys.SetCLB(str)
	KeyDown "Ctrl", 1
	KeyPress "V", 1
	KeyUp "Ctrl", 1
	Delay 200
End Function

Function alerts(content)
	Call Plugin.Media.Beep(880, 1600)
	MsgBox "警报！ " & content
	EndScript 
End Function

Function pasteAddition(x, y, title, content)
	MoveTo x, y
	LeftClick 1
	Call waitColor(502,422, "F5F5F5")//段落描述后灰
	
	MoveTo 833,848//右侧空白
	LeftClick 1
	KeyPress "Tab", 1
	Call paste(title)
	KeyPress "Tab", 1
	Call paste(content)
	
	MoveTo 616,850//蓝色确认按钮
	LeftClick 1
	
	Call waitColor(170, 424, "F3EEEC")//网页左侧灰
End Function

Function getPos()
	GetCursorPos needX, needY
	needColor = GetPixelColor(needX, needY)

	MsgBox needX & " , " & needY & " , " & needColor
	Call Plugin.Sys.SetCLB(needX & ", " & needY & ", " & needColor)
	EndScript 
End Function
