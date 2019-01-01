[General]
SyntaxVersion=2
BeginHotkey=192
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=1ff8fac6-17d8-473e-b11b-39f2252fd379
Description=新建好货_自动备份
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
KeyDown 17, 1
KeyPress 67, 1
KeyUp 17, 1

usedData = Plugin.Sys.GetCLB()
IsFile = Plugin.File.IsFileExist("D:\DATA\资料\temp.txt")
If IsFile Then 
	Call Plugin.File.DeleteFile("D:\DATA\资料\temp.txt")
End If
handle = Plugin.File.OpenFile("D:\DATA\资料\temp.txt")
Call Plugin.File.SeekFile(handle,0)
Call Plugin.File.WriteFile(handle,usedData)
Call Plugin.File.CloseFile(handle)

//文件初始化完成

url = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 1)
name = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 2)
HL1 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 3)
HL2 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 4)
HL3 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 5)
SHL1 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 6)
SHL2 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 7)
SHL3 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 8)
additionMode1 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 9)
additionContent1 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 10)
additionMode2 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 11)
additionContent2 = Lib.文件.读取指定行文本内容("D:\DATA\资料\temp.txt", 12)

MoveTo 845,189//创建按钮
LeftClick 1

Do//判断新有好货是否打开
    IfColor 374,262, "CCCCCC", 1 Then
        Delay 100
    Else 
        Exit Do
    End If
Loop

MoveTo 270, 270//领域按钮
LeftClick 1
MoveTo 270, 380//男装选项
LeftClick 1
Delay 300

IfColor 219,366, "666666", 0 Then
    MoveTo 258,366//关闭裁剪开关
	LeftClick 1
End If
IfColor 218,390, "666666", 0 Then
    MoveTo 257,390//关闭裁剪开关
	LeftClick 1
End If

Call pasteDataWithPos(230,422, "天猫男装")//渠道

Call pasteDataWithPos(246,726, name)//标题

//第一次向下卷屏-至目标人群
MouseWheel - 5 
Delay 200
//设置目标人群
MoveTo 234,277
LeftClick 1
Delay 200
MoveTo 256,472
LeftClick 1
Delay 200
MoveTo 500,280
LeftClick 1
Delay 200
MoveTo 514,335
LeftClick 1

//第二次向下卷屏-至行业补充
MouseWheel - 5
Delay 200

Call pasteDataWithPos(370,350, HL1)//长亮点1
Call pasteDataWithPos(407,407, HL2)//长亮点2
Call pasteDataWithPos(268,458, HL3)//长亮点3
Call pasteDataWithPos(240,510, SHL1)//短亮点1
Call pasteDataWithPos(232,555, SHL2)//短亮点2
Call pasteDataWithPos(233,610, SHL3)//短亮点3

Call pasteDataWithPos(236,670, additionMode1)//输入补充1
Call pasteDataWithPos(230,790, additionContent1)//介绍

//第三次向下卷屏-至补充2
MouseWheel - 3
Delay 300

Call pasteDataWithPos(300,790, additionMode2)//输入补充2
Call pasteDataWithPos(282,870, additionContent2)//介绍

//返回顶部
MouseWheel 22
Delay 200

Call pasteDataWithPos(232,452, url)//商品链接

MoveTo 481,605//空白处，若商品被追加过则在追加确认按钮上
LeftClick 1
MoveTo 670,522

Function pasteDataWithPos(x, y, str)//在指定坐标粘贴文本
	MoveTo x, y
	LeftClick 1
	Call Plugin.Sys.SetCLB(str)
	KeyDown 17, 1
	KeyPress 86, 1
	KeyUp 17, 1
	Delay 25
End Function
