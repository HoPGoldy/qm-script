[General]
SyntaxVersion=2
BeginHotkey=38
BeginHotkeyMod=8
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=1ce89bcf-8ad1-4a4a-ae2b-087b593e201c
Description=抓取所有打开网页链接
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
//---------------------数据设置区------------------------------

//文件保存路径
savePath = "D:\DATA\资料\getUrl.txt"
//安全等待时间
delayTime = 200

//--------------------------------------------------------------


//----------------------脚本开始--------------------------------
Call Plugin.Sys.SetCLB("")
Call Plugin.File.DeleteFile(savePath)

Do
	//Alt+D选取url
	KeyDown 18, 1
	KeyPress 68, 1
	KeyUp 18, 1
	Delay delayTime
	
	//Ctrl+C复制url
	KeyDown 17, 1
	KeyPress 67, 1
	KeyUp 17, 1
	Delay delayTime
	
	//保存url
	repeatNum = 0
	Do
		url = Plugin.Sys.GetCLB()
		If repeatDetection(url) Then 
			Call Plugin.File.WriteFileEx(savePath, url)
			Exit Do
		Else
			repeatNum = repeatNum + 1
		End If
		
		If repeatNum >= 3 Then 
			Call copyUrl(savePath)
			EndScript 
		End If
	Loop
	
	//切换下个网页
	KeyDown "Ctrl", 1
	KeyPress "Tab", 1
	KeyUp "Ctrl", 1
	Delay delayTime
Loop

EndScript//----------------------脚本结束--------------------------

Function repeatDetection(url)
	allUrl = Plugin.File.ReadFileEx(savePath)
	
	urls = Split(allUrl, "|")
	For i=0 To UBound(urls)-1
		If url = urls(i) Then 
			TracePrint "发现重复"
			repeatDetection = false//有重复
			Exit Function 
		End If
	Next
	
	repeatDetection = true//无重复
End Function

Function copyUrl(savePath)
	Call Plugin.Media.Beep(523, 200)
	allUrl = Plugin.File.ReadFileEx(savePath)
	urlContent = ""
	
	urls = Split(allUrl, "|")
	For i=0 To UBound(urls)-1
		urlContent = urlContent & urls(i) & vbcrlf
	Next
	
	Call Plugin.Sys.SetCLB(urlContent)
	
	MsgBox "共抓取" & UBound(urls) & "个链接，已复制到剪切板", 1, "抓取成功！"
End Function

