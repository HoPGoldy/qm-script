[General]
SyntaxVersion=2
BeginHotkey=50
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=0
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=67ddb70f-e8b9-44a9-85f9-efc4b290053e
Description=召唤ceo小鸟
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

//调出互动选单，选择ceo子选单
KeyPress "M", 1
Delay delayTime
KeyPress "Enter", 1
Delay delayTime

//选择ceo载具
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime
MouseWheel -1
Delay delayTime

//点击ceo载具
KeyPress "Enter", 1
Delay delayTime

//选择小鸟
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime
MouseWheel - 1 
Delay delayTime

//点击小鸟
KeyPress "Enter", 1
