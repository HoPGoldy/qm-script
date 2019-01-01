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
MacroID=03ad0a7e-bb36-410d-ac6e-8edccefc7a3b
Description=刷六国远征
Enable=1
AutoRun=0
[Repeat]
Type=1
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
//关卡//
levelCode = selectLevel()
If levelCode = 6 Then 
	Call Plugin.Msg.Tips("远征完成")
	Call deleteUsedHero
	KeyPress "F12", 1
End If

LeftClick 1
Delay 200
//挑战//
MoveTo 1234, 835
LeftClick 1
Do
	IfColor 1388, 393,"FFFFD4",1 Then//英雄2左侧（判定点）
		Delay 100
	Else 
		Exit Do
	End If
Loop
Call addHero
//确定//
Delay 1000
MoveTo 1527, 853
LeftClick 3
Do
	IfColor 1471, 183, "67AB19", 1 Then//电量
		Delay 100
	Else 
		Exit Do
	End If
Loop
Delay 200
//自动//
MoveTo 1514, 203
LeftClick 1
Do
	IfColor 1389,250, "150B02",1 Then//判断是否打完
		Delay 100
	Else 
		Exit Do
	End If
Loop
//继续//
MoveTo 1055,785
LeftClick 1
Do
	IfColor 1019,800,"C88E3B",1 Then//继续按钮
		Delay 100
	Else 
		Exit Do
	End If
Loop
MoveTo 961, 827//继续按钮
LeftClick 1

Do
	IfColor 812,833, "FFFFFF", 0 Then
		Exit Do
	Else Delay 100
	End If
Loop
testLevelCode = selectLevel()
If testLevelCode <> levelCode Then 
	Delay 500
	getReward(levelCode)
End If
Delay 1000

EndScript
Function addHero()
	//打开英雄选择按钮的位置
	openHeroSeleteX = 622
	openHeroSeleteY = 534
	//第一个英雄的位置（打开英雄选单之后）
	firstHeroX = 393
	firstHeroY = 326
	//第一个取消英雄叉号的位置（用于判断英雄是否存活）
	firstDeleteX = 1528
	firstDeleteY = 237
	//下一个取消英雄叉号相对于上一个的偏移量
	nextDeleteY = 117
	//下一个英雄的偏移量
	nextHeroX = 132
	nextHeroY = 140
	//正在判断的叉号
	nowDeleteX = firstDeleteX
	nowDeleteY = firstDeleteY
	//上场三个英雄还活着的数量
	liveHero = 0
	//判断有多少英雄存活
	For 3
		IfColor nowDeleteX, nowDeleteY,"FFFFFE",0 Then
			liveHero = liveHero + 1
			nowDeleteY = nowDeleteY + nextDeleteY
		Else 
			Exit For
		End If
	Next
	//根据判断结果做出选择
	Select Case liveHero
		Case 3
			
		Case 2
			selectHero(1)
		Case 1
			selectHero(2)
		Case Else
			selectHero(3)
	End Select
End Function 
//选择英雄
Function selectHero(needHeroNum)
	//从本地读取usedHero
	isFile = Plugin.File.IsFileExist("D:\temp.txt")
	If isFile Then 
		usedHero = Lib.文件.读取指定行文本内容("D:\temp.txt", 1)
	Else 
		saveUsedHero(0)
		usedHero = 0
	End If
	
	
	MoveTo openHeroSeleteX, openHeroSeleteY
	LeftClick 1
	selectHeroNum = needHeroNum
	For selectHeroNum
		selectNextHero (usedHero)
		Delay 1000
		LeftClick 1
		usedHero = usedHero + 1
		//判断选择的英雄是否已经被选择
		liveHero = 0
		nowDeleteX = firstDeleteX
		nowDeleteY = firstDeleteY
		For 3
			IfColor nowDeleteX, nowDeleteY,"FFFFFE",0 Then
				liveHero = liveHero + 1
				nowDeleteY = nowDeleteY + nextDeleteY
			Else 
				Exit For
			End If
		Next
		//根据判断结果做出选择
		If liveHero + needHeroNum = 3 Then 
			selectHeroNum = selectHeroNum + 1 
		End If
	Next
	
	saveUsedHero(usedHero)
End Function
//保存临时数据
Function saveUsedHero(heroNum)
	Call Plugin.File.DeleteFile("D:\temp.txt")
	handle = Plugin.File.OpenFile("D:\temp.txt")
	Call Plugin.File.SeekFile(handle,0)
	Call Plugin.File.WriteFile(handle, heroNum)
	Call Plugin.File.CloseFile(handle)
End Function
//删除临时数据
Function deleteUsedHero()
	Call Plugin.File.DeleteFile("D:\temp.txt")
End Function
//选择下一个可以使用的英雄
Function selectNextHero(usedHero)
	uesdHeroX = firstHeroX
	uesdHeroY = firstHeroY
	
	i = 1
	For 4
		j = 1
		For 8
			If (((i - 1) * 8) + j) = (usedHero + 1) Then 
				MoveTo uesdHeroX, uesdHeroY
				Exit Function 
			End If
			uesdHeroX = uesdHeroX + nextHeroX
			j = j + 1
		Next
		uesdHeroX = firstHeroX
		uesdHeroY = uesdHeroY + nextHeroY
		i = i + 1
	Next
End Function

Function selectLevel()
	IfColor 566,408,"FFFF73",0 Then
   	 	MoveTo 565, 411
   	 	selectLevel = 0
   	 	Exit Function 
	End If
	IfColor 887,388,"FFFF73",0 Then
   	 	MoveTo 890,388
   	 	selectLevel = 1
   	 	Exit Function 
	End If
	IfColor 792,624,"FFFF73",0 Then
   	 	MoveTo 788, 628
   	 	selectLevel = 2
   	 	Exit Function 
	End If
	IfColor 1064,552,"FFFF73",0 Then
   	 	MoveTo 1067,554
   	 	selectLevel = 3
   	 	Exit Function 
	End If
	IfColor 1312,645,"FFFF73",0 Then
   	 	MoveTo 1310,649
   	 	selectLevel = 4
   	 	Exit Function 
	End If
	IfColor 1337,381,"FFFF73",0 Then
   	 	MoveTo 1335,384
   	 	selectLevel = 5
   	 	Exit Function 
	End If
	selectLevel = 6
End Function

Function getReward(levelCode)
	rewardX = Array (705, 713, 921, 1142, 1392, 1195)
	rewardY = Array(292, 411, 654, 623, 490, 434)
	MoveTo rewardX(levelCode), rewardY(levelCode)
	LeftClick 1
	
	Do
		IfColor 951, 664, "FFFFFF", 0 Then
			Exit Do	
		Else Delay 100
		End If
	Loop
	MoveTo 951, 664
	LeftClick 1
End Function
