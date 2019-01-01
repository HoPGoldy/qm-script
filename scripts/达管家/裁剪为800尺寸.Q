[General]
SyntaxVersion=2
BeginHotkey=119
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=c15cac00-d0b4-4ba1-aa5f-2cc52d206698
Description=²Ã¼ôÎª800³ß´ç
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
MoveTo 1610, 85//²Ã¼ô°´Å¥
LeftClick 1

For 10  
	IfColor 455,172, "DA9F63", 1 Then
        Delay 100
    End If
Next

MoveTo 537, 238//²Ã¼ô¿í¶È
LeftClick 1
KeyDown "BackSpace", 1
KeyUp "BackSpace", 1
KeyDown "BackSpace", 1
KeyUp "BackSpace", 1
KeyDown "BackSpace", 1
KeyUp "BackSpace", 1
KeyDown "8", 1
KeyUp "8", 1
KeyDown "0", 1
KeyUp "0", 1
KeyDown "0", 1
KeyUp "0", 1

MoveTo 542, 259//²Ã¼ô¸ß¶È
LeftClick 1
KeyDown "BackSpace", 1
KeyUp "BackSpace", 1
KeyDown "BackSpace", 1
KeyUp "BackSpace", 1
KeyDown "BackSpace", 1
KeyUp "BackSpace", 1
KeyDown "8", 1
KeyUp "8", 1
KeyDown "0", 1
KeyUp "0", 1
KeyDown "0", 1
KeyUp "0", 1
