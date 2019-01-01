[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=c39f59dd-2ce0-4fe4-a730-d2e6fe80f90f
Description=获取信息
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[UIPackage]
UEsDBBQAAgAIAE6N8Ew4e6SL0wQAAAg0AAAJABEAVUlQYWNrYWdlVVQNAAfv2Exb79hMW+/YTFvtWktvU0cUPtcO5P0kcUIIYMIrPEMgoU8QGBVRKVBEDAskkAyYJMJxkGMQ/Rdd9A+EbTeNBFXVLuiiSKhCBCTaSlm17Ah00SIhNuB+c+9cPDGJMq8wCcqxTsZxPPPNnDlzzvnmJkqBPJxs/Gt8ov1vKpGDFKU3hUpaKXzmcfWlgSjCf39TKBTCjwvLsqTkNbSM7yHb6xXQcmgltAJaBa2FVkNroHXB1lM9tBG6CtoEbYbGoC3QVj5eG2+XZfHKKRrFK09x+oKyaHP0NalIDB4TjuXN891DT79NPO147EXx/pfa4LPT9CXtIX2pIM8L8VvnwQ1b8W9HKEn9BjOoQgQM8Vdo4Cdh76uUphOUohG0qtJEEX/9jTz2yvYr4y07nx+qLsv8cnQ0N2Jw/Ij17zHo75GZmPY3lZ//vTf+8O7kTd3+Ckd2Qfrrxp1i/IvMqPlk9yyMlSzrpOgCZTTnUIf4V83rFFn8iBD/ztAwjUF1Z9Cgsf6ogH8KqCm6RF/BDhnF3BvG/xo+pix+mYCfBP4N5H2D/fdU18/2voK/P4LqIwPNac6kWQN/pbD+In4C+3CRrqjj+/VyvYL9y0v2/6Kh/Wu5PWXxKyio4UU5h0PxkpaelDvGfzm7zf20dHwgPpDKjsUH0rnhywuEv/m780b9zyLy5BB/0vipIyz+tvAzJet/lYL/9+PsqZ+6mf7fwMeTxa+a9fwPYB5DsINaNmzD+Q85sCx+tYB/GNX/VT8H5KBZzEEtC8Ww/koKeLksfo2AfxRrz5rFH+X8x+LV52/Xn0H2HcQcmN2zOvFfGb9uxv6nYP885sDskPD3IcwERd+YW7pg/xgV771k8OsF/IQ/fnD+ZPBm8T+vWRG/QcA3jR+m9aepJK7l86NZ/f6D6fzJ0TH9/kudvyTh+Xm/9tXxPj/+KJ+/RsH/TgL/BtAzpLcJdRr4TSX4rP66hnXr3MK0aeCL9+XB/ZM+g64iz2N8Zge0fY7vvI/7J5X1s3wZPldwwT+bBXwb/DOOdj3J598Wcss/Y2SXf27wz4H8+lvJLf9soyL/ccE/V5Nd/tmBdpOC/dsFfHZ/9duLiek/fvz92Z+vJqZV7W+a/03rj9VctyCqTWn0d51/o47xbdw/dKJdq+B/a4TzZ4N/buFjyuJ3kF3+uZn7oCz+WrLLP7vQblfAX0d2+Scbb6MC/npyyz/jVOSfLurPDcL6T/h7PwLbZ3T5nzJ+p4D/vKTPNzwgRnGsH9y898+juz9N0QJK9w9DRv1775j1XzOeNOpvgX8mh/MZ7QLYNH8dg79d1759CM6/qv9tJJF/Md41hlcaWUB9Du0a/r+JrPI/byvabQrx713+t9cg/hX//2D3HN9ZbPyP5UuX/I/VC+HzJxv8rxftPoX930pu+V+XgL8Ynp8H/GPyv9u/3vr+ztTE9P0n8v1d848+L6j9EhE9/hFxbH8b/L8P7U4F/99Gbvk/q5Vj/L0L/r+D7PJ/9t9rHyvYfyfZff68H22PAv4ussv/PkXbrYC/m+zyv0/4mmTxu8ku/2Nc5qAC/h4B3/X9Qyn/6JyFf8T7hweH8guDv9T5h6nY4P+sev1Iwf96yC3/Z/N1yf/3kVv+3yvgu+B/feSW/+0nu/zvM7QHSI//2RDV9YvyP1BLAQIXCxQAAgAIAE6N8Ew4e6SL0wQAAAg0AAAJAAkAAAAAAAAAAAAAgAAAAABVSVBhY2thZ2VVVAUAB+/YTFtQSwUGAAAAAAEAAQBAAAAACwUAAAAA


[Script]
Do
	keyCode = WaitKey()

	Select Case keyCode
		Case 49
			GetCursorPos needX, needY
			MsgBox needX & " , " & needY, 0, "当前坐标：(点击复制)"
			Call Plugin.Sys.SetCLB(needX & "," & needY)
		Case 50
			Hwnd = Plugin.Window.MousePoint()
			windowTitle = Plugin.Window.GetTextEx(Hwnd,0)
			MsgBox windowTitle, 0, "窗口名称：(点击复制)"
			Call Plugin.Sys.SetCLB(windowTitle)
	End Select
Loop

Event Form1.getPos.Click
	Call WaitKey()
	GetCursorPos needX, needY
	MsgBox needX & " , " & needY, 0, "当前坐标：(点击复制)"
	Call Plugin.Sys.SetCLB(needX & "," & needY)
End Event

Event Form1.getTitle.Click
	Call WaitKey()
	Hwnd = Plugin.Window.MousePoint()
	windowTitle = Plugin.Window.GetTextEx(Hwnd,0)
	MsgBox windowTitle, 0, "窗口名称：(点击复制)"
	Call Plugin.Sys.SetCLB(windowTitle)
End Event
