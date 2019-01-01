[General]
SyntaxVersion=2
BeginHotkey=49
BeginHotkeyMod=1
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=5755e04a-65d1-4ce0-ac62-11ad96ea92a6
Description=上传
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
//--------------------------------------------设置-------------------------------------------------

//缓存路径
cachePath = "D:\temp.txt"
//窗口名
windowTitle = "达管家 - Google Chrome"

//-------------------------------------------------------------------------------------------------
//Ctrl+C复制
usedData = Plugin.Sys.GetCLB()
Call Plugin.File.DeleteFile(cachePath)
Call Plugin.File.WriteFileEx(cachePath, usedData)

//文件初始化完成

url = Lib.文件.读取指定行文本内容(cachePath, 1)
name = Lib.文件.读取指定行文本内容(cachePath, 2)
HL1 = Lib.文件.读取指定行文本内容(cachePath, 3)
HL2 = Lib.文件.读取指定行文本内容(cachePath, 4)
HL3 = Lib.文件.读取指定行文本内容(cachePath, 5)
SHL1 = Lib.文件.读取指定行文本内容(cachePath, 6)
SHL2 = Lib.文件.读取指定行文本内容(cachePath, 7)
SHL3 = Lib.文件.读取指定行文本内容(cachePath, 8)
additionTitle = Lib.文件.读取指定行文本内容(cachePath, 9)
additionContent = Lib.文件.读取指定行文本内容(cachePath, 10)

hwnd = Plugin.Window.Find(0, windowTitle)
Call Plugin.Window.Active(hwnd)
Call Plugin.Window.Max(hwnd)
Delay 500

MoveTo 697, 235//所属领域按钮
LeftClick 1
Delay 300

MoveTo 694, 355//男装选项
LeftClick 1
Delay 200

KeyPress "Tab", 2
Delay 200
KeyPress "Enter", 1
Delay 300

KeyPress "Tab", 4
Call paste(url)

KeyPress "Tab", 3
Call paste(name)

KeyPress "Tab", 30
Call paste(HL1)
KeyPress "Tab", 1
Call paste(HL2)
KeyPress "Tab", 1
Call paste(HL3)

KeyPress "Tab", 1
Call paste(SHL1)
KeyPress "Tab", 1
Call paste(SHL2)
KeyPress "Tab", 1
Call paste(SHL3)

KeyPress "Tab", 1
Call paste(additionTitle)
KeyPress "Tab", 2
Call paste(additionContent)

Call Plugin.Sys.SetCLB("")
EndScript

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
