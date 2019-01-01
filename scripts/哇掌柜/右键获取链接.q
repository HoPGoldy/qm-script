[General]
SyntaxVersion=2
BeginHotkey=38
BeginHotkeyMod=8
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=121
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=96484993-0c32-44be-9c2d-541762989f6f
Description=右键获取链接
Enable=1
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
//已录入个数
number = 0
//上一条目
Thelast = 0

//清空以前内容
Call Plugin.File.DeleteFile("D:\DATA\资料\printhttp.txt")

Do
	//录入失败则回来
	Rem agin
	
	//等待按键
	keyT = WaitKey()
	Delay 100
	
	//检测按键是不是T
	If keyT = 84 Then 
		TracePrint ""
		//复制链接
		RightClick 1
		Delay 200
		KeyPress "E", 1
		Delay 400
		
		//检测是否重复或者为空
		If Plugin.Sys.GetCLB() = Thelast or Plugin.Sys.GetCLB() = "" Then 
			Goto agin
		End If
		
		//提示音
		Call Plugin.Media.Beep(659, 50)
		
		//记录当前条目
		Thelast = Plugin.Sys.GetCLB()
		
		//保存
		Call Plugin.File.WriteFileEx("D:\DATA\资料\printhttp.txt", Plugin.Sys.GetCLB())
		
		//显示当前条目
		number = number + 1
		Call Plugin.Msg.ShowScrTXT(0, 0, 1024, 768, "当前条目：" & number, "0000FF")
		
	ElseIf keyT = 81 Then
		//录入结束
		Call Plugin.Media.Beep(784, 100)
		urlNum = Lib.hps.copyContent ("D:\DATA\资料\printhttp.txt")
		MsgBox "共抓取" & urlNum & "个链接，已复制到剪切板", 1, "抓取成功！"
		EndScript 
	End If
Loop