[General]
SyntaxVersion=2
MacroID=e37b0ee9-3526-417c-9d40-0fe1b8772cc8
[Comment]

[Script]
//将一个文件中的内容复制到剪切板（替换|）
//参数：savePath-文件保存路径
Function copyContent(savePath)
	allUrl = Plugin.File.ReadFileEx(savePath)
	urlContent = ""
	
	urls = Split(allUrl, "|")

	For i=0 To UBound(urls)-1
		urlContent = urlContent & urls(i) & vbcrlf
	Next
	
	Call Plugin.Sys.SetCLB(urlContent)
	
	TracePrint "共抓取" & UBound(urls) & "个链接，已复制到剪切板"
	copyContent = UBound(urls)
End Function

//检测参数1是否在参数2文件中有重复
//参数：str-待检测的字符串 path-文件保存路径
//返回值： 有重复-false 无重复-true
Function repeatDetection(str, path)
	content = Plugin.File.ReadFileEx(path)
	
	contents = Split(content, "|")
	For i=0 To UBound(contents)-1
		If str = contents(i) Then 
			TracePrint "发现重复"
			repeatDetection = false//有重复
			Exit Function
		End If
	Next
	
	repeatDetection = true//无重复
End Function

//等待一个颜色出现
//参数：x-x坐标 y-y坐标 colorCode-判断的颜色
Sub waitColorShow(x, y, colorCode)
	Do
		IfColor x, y , colorCode, 0 Then
			Delay 300
			Exit Do
		Else 
			Delay 100
		End If
	Loop
End Sub

//等待一个颜色消失
//参数：x-x坐标 y-y坐标 colorCode-判断的颜色
Sub waitColorHide(x, y, colorCode)
	Do
		IfColor x, y , colorCode, 1 Then
			Delay 300
			Exit Do
		Else 
			Delay 100
		End If
	Loop
End Sub

//获取随机整数
//参数：min-随机数下限（包含） max-随机数上限（包含）
//返回值：给定区间内任意整数
Function getRand(min, max)
   	Randomize
    getRand = CInt(Rnd*(max-min) + min)
End Function

//删除指定文件夹下的所有文件（可见延迟）
//参数 path-指定文件夹路径
Sub deleteFileInFolder(path)
	files = Lib.文件.遍历指定目录下所有文件名(path)
	For deleteFileInFolderCount = 0 To UBound(files)-1
		Call Plugin.File.DeleteFile(path&"\"&files(deleteFileInFolderCount))
	Next
End Sub

//在指定位置粘贴文本
//参数：x-x坐标 y-y坐标 str-要粘贴的文本
Sub pasteTo(x, y, str)
	MoveTo x, y
	LeftClick 1
	Call paste(str)
End Sub

//直接粘贴文本
//参数：str-要粘贴的文本
Sub paste(str)
	KeyDown "Ctrl", 1
	KeyPress "A", 1
	KeyUp "Ctrl", 1
	Call Plugin.Sys.SetCLB(str)
	Delay 100
	KeyDown "Ctrl", 1
	KeyPress "V", 1
	KeyUp "Ctrl", 1
	Delay 200
End Sub

//新建文件夹
//参数： path-需要新建的文件夹路径
//返回值 true-新建成功 false-新建失败
Function createNewFolder(path)
	folders = split(path, "\")
	For i = 0 To UBound(folders)
		folderPath = folders(0)
		For j = 1 To i
			folderPath = folderPath & "\" & folders(j)
		Next 
		Call Plugin.File.CreateFolder(folderPath)
	Next
	
	If Plugin.File.ExistFile(path) = 2 Then 
		createNewFolder = true
	Else 
		createNewFolder = false
	End If
End Function

//新建文件
//参数： path-需要新建的文件路径
//返回值 true-新建成功 false-新建失败
Function createNewFile(path)
	folders = split(path, "\")
	folderPath = folders(0)
	For i = 1 To UBound(folders)-1
		folderPath = folderPath & "\" & folders(i)
	Next
	Call Lib.hps.createNewFolder(folderPath)
	Call Plugin.File.WriteFileEx(path, "")
	
	If Plugin.File.ExistFile(path) = 1 Then 
		createNewFile = true
	Else 
		createNewFile = false
	End If
End Function

//保存数据
//参数： key-键名 value-保存的值 filePath-要保存的文件夹路径
//返回值 true-保存成功 false-保存失败
Function save(key, value, filePath)
	If Plugin.File.ExistFile(filePath) = 0 Then
		Call Lib.hps.createNewFolder(filePath)
	End If
	
	If Plugin.File.ExistFile(filePath & "\" & key & ".txt") = 1 Then 
		Call Plugin.File.DeleteFile(filePath & "\" & key & ".txt")
	End If
	Call Plugin.File.WriteFileEx(filePath & "\" & key & ".txt", value)
	
	If Lib.hps.load(key, filePath) = value Then 
		save = true
	Else 
		save = false
	End If
End Function

//读取数据
//参数： key-键名 filePath-保存的文件夹路径
//返回值 读取到的数据
Function load(key, filePath)
	loadContent = ""
	loadStr = Plugin.File.ReadFileEx(filePath & "\" & key & ".txt")
	strs = split(loadStr, "|")
	For i=0 To UBound(strs)
		loadContent = loadContent & strs(i)
	Next
    load = loadContent
End Function

//窗口获取焦点
//参数： windowName -窗口名
//返回值： 无
Sub setFocus(windowName)
	windowHwnd = Plugin.Window.Find(0, windowName)
	Call Plugin.Window.Active(windowHwnd)
	Call Plugin.Window.Max(windowHwnd)
End Sub

//判断指定点是否出现给定的多个颜色
//参数：x-指定点x坐标 y-指定点y坐标 colors-给定的颜色数组
//返回值： true-颜色出现 false-颜色没出现
Function colorShow(x, y, colors)
	posColor = GetPixelColor(x, y)
	TracePrint posColor
	For Each aColor In colors
		TracePrint "aColor: " & aColor
		If posColor = aColor Then 
			colorShow = true
			Exit Function
		End If
	Next
	colorShow = false
End Function

//打开选择图片对话框并选择图片
//参数 x-能打开选择图片对话框的x坐标 y-能打开选择图片对话框的y坐标 path-图片地址
//返回值：无
Sub selectPic(x, y, path)
	MoveTo x, y
	LeftClick 1
	Delay 200
	
	Do//等待打开图片窗口出现
		openFileHwnd = Plugin.Window.Find(0, "打开")
		If Plugin.Window.IsWindow(openFileHwnd) = 0 Then
        	Delay 200
    	Else
    		Exit Do
    	End If
	Loop
	Delay 200
	
	//定位输入框句柄
	editHwnd = Plugin.Window.findex(openFileHwnd, 0, "ComboBoxEx32", 0)
	editHwnd = Plugin.Window.findex(editHwnd, 0, "ComboBox", 0)
	editHwnd = Plugin.Window.findex(editHwnd, 0, "Edit", 0)
	
	Delay 1000
	
	//输入框获取焦点并清空内容
	Call Plugin.Window.Active(editHwnd)
	KeyDown 17, 1
	KeyPress 65, 1
	KeyUp 17, 1
	KeyPress "BackSpace", 1
	
	//输入地址并回车
	Call Plugin.Bkgnd.SendString(editHwnd, path)
	Delay 200
	KeyPress "Enter", 1
	
	//等待打开图片窗口关闭
	Do
		If Plugin.Window.IsWindow(openFileHwnd) = 0 Then 
			Exit Do
    	Else
    		Delay 200
    	End If
	Loop
	Delay 200
End Sub