[General]
SyntaxVersion=2
MacroID=e37b0ee9-3526-417c-9d40-0fe1b8772cc8
[Comment]

[Script]
//��һ���ļ��е����ݸ��Ƶ����а壨�滻|��
//������savePath-�ļ�����·��
Function copyContent(savePath)
	allUrl = Plugin.File.ReadFileEx(savePath)
	urlContent = ""
	
	urls = Split(allUrl, "|")

	For i=0 To UBound(urls)-1
		urlContent = urlContent & urls(i) & vbcrlf
	Next
	
	Call Plugin.Sys.SetCLB(urlContent)
	
	TracePrint "��ץȡ" & UBound(urls) & "�����ӣ��Ѹ��Ƶ����а�"
	copyContent = UBound(urls)
End Function

//������1�Ƿ��ڲ���2�ļ������ظ�
//������str-�������ַ��� path-�ļ�����·��
//����ֵ�� ���ظ�-false ���ظ�-true
Function repeatDetection(str, path)
	content = Plugin.File.ReadFileEx(path)
	
	contents = Split(content, "|")
	For i=0 To UBound(contents)-1
		If str = contents(i) Then 
			TracePrint "�����ظ�"
			repeatDetection = false//���ظ�
			Exit Function
		End If
	Next
	
	repeatDetection = true//���ظ�
End Function

//�ȴ�һ����ɫ����
//������x-x���� y-y���� colorCode-�жϵ���ɫ
Sub waitColorShow(x, y, colorCode)
	Do
		IfColor x, y , colorCode, 0 Then
			Delay 300
			Exit Do
		Else 
			Delay 100
		End If
	Loop
End Sub

//�ȴ�һ����ɫ��ʧ
//������x-x���� y-y���� colorCode-�жϵ���ɫ
Sub waitColorHide(x, y, colorCode)
	Do
		IfColor x, y , colorCode, 1 Then
			Delay 300
			Exit Do
		Else 
			Delay 100
		End If
	Loop
End Sub

//��ȡ�������
//������min-��������ޣ������� max-��������ޣ�������
//����ֵ��������������������
Function getRand(min, max)
   	Randomize
    getRand = CInt(Rnd*(max-min) + min)
End Function

//ɾ��ָ���ļ����µ������ļ����ɼ��ӳ٣�
//���� path-ָ���ļ���·��
Sub deleteFileInFolder(path)
	files = Lib.�ļ�.����ָ��Ŀ¼�������ļ���(path)
	For deleteFileInFolderCount = 0 To UBound(files)-1
		Call Plugin.File.DeleteFile(path&"\"&files(deleteFileInFolderCount))
	Next
End Sub

//��ָ��λ��ճ���ı�
//������x-x���� y-y���� str-Ҫճ�����ı�
Sub pasteTo(x, y, str)
	MoveTo x, y
	LeftClick 1
	Call paste(str)
End Sub

//ֱ��ճ���ı�
//������str-Ҫճ�����ı�
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

//�½��ļ���
//������ path-��Ҫ�½����ļ���·��
//����ֵ true-�½��ɹ� false-�½�ʧ��
Function createNewFolder(path)
	folders = split(path, "\")
	For i = 0 To UBound(folders)
		folderPath = folders(0)
		For j = 1 To i
			folderPath = folderPath & "\" & folders(j)
		Next 
		Call Plugin.File.CreateFolder(folderPath)
	Next
	
	If Plugin.File.ExistFile(path) = 2 Then 
		createNewFolder = true
	Else 
		createNewFolder = false
	End If
End Function

//�½��ļ�
//������ path-��Ҫ�½����ļ�·��
//����ֵ true-�½��ɹ� false-�½�ʧ��
Function createNewFile(path)
	folders = split(path, "\")
	folderPath = folders(0)
	For i = 1 To UBound(folders)-1
		folderPath = folderPath & "\" & folders(i)
	Next
	Call Lib.hps.createNewFolder(folderPath)
	Call Plugin.File.WriteFileEx(path, "")
	
	If Plugin.File.ExistFile(path) = 1 Then 
		createNewFile = true
	Else 
		createNewFile = false
	End If
End Function

//��������
//������ key-���� value-�����ֵ filePath-Ҫ������ļ���·��
//����ֵ true-����ɹ� false-����ʧ��
Function save(key, value, filePath)
	If Plugin.File.ExistFile(filePath) = 0 Then
		Call Lib.hps.createNewFolder(filePath)
	End If
	
	If Plugin.File.ExistFile(filePath & "\" & key & ".txt") = 1 Then 
		Call Plugin.File.DeleteFile(filePath & "\" & key & ".txt")
	End If
	Call Plugin.File.WriteFileEx(filePath & "\" & key & ".txt", value)
	
	If Lib.hps.load(key, filePath) = value Then 
		save = true
	Else 
		save = false
	End If
End Function

//��ȡ����
//������ key-���� filePath-������ļ���·��
//����ֵ ��ȡ��������
Function load(key, filePath)
	loadContent = ""
	loadStr = Plugin.File.ReadFileEx(filePath & "\" & key & ".txt")
	strs = split(loadStr, "|")
	For i=0 To UBound(strs)
		loadContent = loadContent & strs(i)
	Next
    load = loadContent
End Function

//���ڻ�ȡ����
//������ windowName -������
//����ֵ�� ��
Sub setFocus(windowName)
	windowHwnd = Plugin.Window.Find(0, windowName)
	Call Plugin.Window.Active(windowHwnd)
	Call Plugin.Window.Max(windowHwnd)
End Sub

//�ж�ָ�����Ƿ���ָ����Ķ����ɫ
//������x-ָ����x���� y-ָ����y���� colors-��������ɫ����
//����ֵ�� true-��ɫ���� false-��ɫû����
Function colorShow(x, y, colors)
	posColor = GetPixelColor(x, y)
	TracePrint posColor
	For Each aColor In colors
		TracePrint "aColor: " & aColor
		If posColor = aColor Then 
			colorShow = true
			Exit Function
		End If
	Next
	colorShow = false
End Function

//��ѡ��ͼƬ�Ի���ѡ��ͼƬ
//���� x-�ܴ�ѡ��ͼƬ�Ի����x���� y-�ܴ�ѡ��ͼƬ�Ի����y���� path-ͼƬ��ַ
//����ֵ����
Sub selectPic(x, y, path)
	MoveTo x, y
	LeftClick 1
	Delay 200
	
	Do//�ȴ���ͼƬ���ڳ���
		openFileHwnd = Plugin.Window.Find(0, "��")
		If Plugin.Window.IsWindow(openFileHwnd) = 0 Then
        	Delay 200
    	Else
    		Exit Do
    	End If
	Loop
	Delay 200
	
	//��λ�������
	editHwnd = Plugin.Window.findex(openFileHwnd, 0, "ComboBoxEx32", 0)
	editHwnd = Plugin.Window.findex(editHwnd, 0, "ComboBox", 0)
	editHwnd = Plugin.Window.findex(editHwnd, 0, "Edit", 0)
	
	Delay 1000
	
	//������ȡ���㲢�������
	Call Plugin.Window.Active(editHwnd)
	KeyDown 17, 1
	KeyPress 65, 1
	KeyUp 17, 1
	KeyPress "BackSpace", 1
	
	//�����ַ���س�
	Call Plugin.Bkgnd.SendString(editHwnd, path)
	Delay 200
	KeyPress "Enter", 1
	
	//�ȴ���ͼƬ���ڹر�
	Do
		If Plugin.Window.IsWindow(openFileHwnd) = 0 Then 
			Exit Do
    	Else
    		Delay 200
    	End If
	Loop
	Delay 200
End Sub