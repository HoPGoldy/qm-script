[General]
SyntaxVersion=2
BeginHotkey=192
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=f65b1d9b-f407-42fd-ac93-6510e8057015
Description=通天塔刷金
Enable=1
AutoRun=0
[Repeat]
Type=2
Number=10860
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
LeftClick 1
IfColor 1510,195, "FFFFF6", 0 Then//自动判断点	
	MoveTo 1510,195
Else 
	MoveTo 1331,800//继续挑战和闯关按钮的重叠处
End If