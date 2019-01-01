[General]
SyntaxVersion=2
BeginHotkey=49
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=0
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=40167caf-9545-49f1-a2f5-4261ebb25ce0
Description=召唤个人载具
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
delayTime = 100

//调出互动选单
KeyPress "M", 1
Delay delayTime

//打开载具子选单
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime

//呼叫载具
KeyPress "Enter", 1
Delay delayTime
KeyPress "Enter", 1
Delay delayTime
Delay delayTime

//退出选单
RightClick 1
Delay delayTime
RightClick 1
Delay delayTime

