[General]
SyntaxVersion=2
BeginHotkey=51
BeginHotkeyMod=1
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=fefdec2d-664b-47f2-bf4f-7edfc750608d
Description=��Ϳѻ��
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
MoveTo 85, 43
LeftClick 1
Delay 300
MoveTo 55, 362//Ϳѻ��λ��
LeftClick 1

Call Lib.hps.waitColorShow(478, 154, "DA9F63")

MoveTo 555, 498//���ʴ�Сλ��
LeftClick 1
MoveTo 561, 676//ȡɫ��λ��
LeftClick 1
MoveTo 665, 229//ͼƬ���Ͻ�
