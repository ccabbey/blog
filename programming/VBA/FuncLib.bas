Attribute VB_Name = "FuncLib"
'FUNCLIB>>FILE OPERATION/ FileOp

Public Function FDOGetPath(Optional isFolder As Boolean = 0, Optional fTitle$ = "") As String
    '---------------
    'Name: FDOGetPath
    'Author: Li Alex
    'Version: v0.1c
    'Date: 2019/3/2
    'Update: fdo.filters�������ܷ���������ʱ�Ƴ�
    'Description: ͨ��FDO��ʽ���ָ���ļ�/�ļ���·��,�ļ�����ȫ·�����ļ��з����ļ���·������б�ܣ�
    '---------------
    Dim fdo, fdoType%, DefaultPath$
    '//�·�����fdo������ʾ����������
    If fTitle = "" Then fTitle = "Select file or folder in dialog: "
    DefaultPath = ThisWorkbook.Path 'FDO��ʼ·��
    '-------------------------------------------
    '//�����ļ�/�ļ��ж�Ӧ��fdoģʽ
    If isFolder = True Then
        fdoType = 4 'msoFileDialogFolderPicker
    Else
        fdoType = 3 'msoFileDialogFilePicker
    End If
    '//����fdo����
    Set fdo = Application.FileDialog(fdoType)
    With fdo
        .Title = fTitle
        .InitialFileName = DefaultPath
        '//����·������
        If .Show = -1 Then '-1=OK, 0=Cancel
            FDOGetPath = .SelectedItems.Item(1) '�ļ�·��
            If isFolder Then FDOGetPath = .SelectedItems.Item(1) & "\" '�ļ���·��
        Else: End
        End If
    End With
End Function

Public Sub getFileList( _
        folder_path$, _
        output_list(), _
        Optional output_fname As Variant = "", _
        Optional recursive As Boolean = False, _
        Optional ignore_keyword = "$", _
        Optional ignore_filetype = "tmp", _
        Optional accept_keyword = "", _
        Optional accept_method = "OR", _
        Optional accept_filetype = "")
'---------------
'Author: Li Alex
'Version: v0.5
'Date: 2020/9/28
'purpose: ���ָ���ļ��������������������ļ�������·�����������ⲿ��list()��ע�⣺����ļ�û�к�׺������ᱨ��
'update: ���Ӱ�����ģʽ�У����accept_keyword��ѡ��ΪOR��AND�ж�ģʽ
'        ������������ļ�������Ĺ���
'
'param folder_path$ : ���ҵ���·����
'param output_list() : ���ؽ��Ҫ��������ⲿ����list()��
'param output_fname->arr : ��������������ļ��������顣
'param recursive->boolean : True-�ݹ����ļ���; False-����ǰ�ļ��С�Ĭ��False��
'param ignore_keyword->str : ���ļ�����������׺�����а���ָ���Ĺؼ��֣����������ؼ�����","�ָ���
'param ignore_filetype->str : ���ļ���׺������ָ�����ַ����У�����������׺������","�ָ���
'param accept_keyword->str : ���ļ�����������׺�����а���ָ���Ĺؼ��֣��������ؼ�����","�ָ���
'param accept_method->str : ָ���������ؼ��ֵ�ƥ��ģʽ��"OR"-->ֻҪ��һ�ؼ��ִ��ڼ��ɣ�"AND"-->���йؼ��ֱ��붼���ڲŽ��ܡ�
'param accept_filetype->str : ���ļ���׺������ָ�����ַ����У���������׺������","�ָ���

'notes: accept���������ȼ�����ignore��������ֲ���ͬʱ���ڣ�����acceptָ���İ����������ļ���
'---------------
Dim fso, ign_keywords, ign_filetypes, acc_keywords, acc_filetypes, f_valid, white_list_mode As Boolean
Dim acc_method$

If ignore_keyword = "" Then ign_keywords = False Else ign_keywords = Split(ignore_keyword, ",")
If ignore_filetype = "" Then ign_filetypes = False Else ign_filetypes = True

If accept_keyword = "" Then acc_keywords = False Else acc_keywords = Split(accept_keyword, ",")
If accept_filetype = "" Then acc_filetypes = False Else acc_filetypes = True
If accept_method = "" Then acc_method = "OR" Else acc_method = accept_method

If Right(folder_path, 1) <> "\" Then folder_path = folder_path & "\"
If Len(Join(output_list, "")) = 0 Then
    ReDim output_list(1 To 1)
    list_index = 1
Else
    list_index = UBound(output_list) + 1
End If
'# �ж�����ģʽ
If VarType(acc_keywords) >= vbArray Or VarType(acc_filetypes) >= vbArray Then
    white_list_mode = True
Else
    white_list_mode = False
End If
Set fso = CreateObject("scripting.filesystemobject")
'# �����ļ�����
Set fd = fso.getfolder(folder_path)
If fd.Files.Count > 0 Then
    For Each f In fd.Files
         f_Name = left(f.name, InStrRev(f.name, ".") - 1)
        f_ext = Right(f.name, Len(f.name) - Len(f_Name) - 1)
        '# ������ģʽ
        If white_list_mode Then
            f_valid = False
            '# ���acc_filetype
            If acc_filetypes Then
                If InStr(1, accept_filetype, f_ext) > 0 Then f_valid = True
            End If
            '# ���accept_keyword
            If IsArray(acc_keywords) Then
                '# �����ؼ���ƥ��ģʽΪOR �� AND
                If acc_method = "OR" Then
                    For i = 0 To UBound(acc_keywords)
                        If InStr(1, f_Name, acc_keywords(i)) > 0 Then f_valid = True: Exit For
                    Next i
                ElseIf acc_method = "AND" Then
                    f_valid = True
                    For i = 0 To UBound(acc_keywords)
                        If InStr(1, f_Name, acc_keywords(i)) <= 0 Then f_valid = False: Exit For
                    Next i
                Else: Exit Sub
                End If
            End If
        Else
            f_valid = True
            '# ���ignore_filetype
            If ign_filetypes Then
                If InStr(1, ignore_filetype, f_ext) > 0 Then f_valid = False
            End If
            '# ���ignore_keyword
            If IsArray(ign_keywords) Then
                For i = 0 To UBound(ign_keywords)
                    If InStr(1, f_Name, ign_keywords(i)) > 0 Then f_valid = False: Exit For
                Next i
            End If
        End If
        '# ������������д��output_list
        If f_valid Then
            If list_index = 1 Then
                output_list(1) = f.Path
            Else
                ReDim Preserve output_list(1 To list_index)
                output_list(list_index) = f.Path
            End If
            list_index = list_index + 1
        End If
    Next f
End If
'# �����ļ������ģʽ
If VarType(output_fname) >= vbArray Then 'vbArray=8192, vbVariant=12
    output_fname = output_list
    For i = 1 To UBound(output_fname)
        s = output_fname(i)
        output_fname(i) = Mid(s, InStrRev(s, "\") + 1, Len(s))
    Next i
End If

'# �ǵݹ�ģʽ���������
If Not recursive Then Exit Sub
'# �������ļ��ж���
If fd.subfolders.Count > 0 Then
    For Each subfd In fd.subfolders
        getFileList subfd.Path, output_list, output_fname, True, ignore_keyword, ignore_filetype, accept_keyword, accept_method, accept_filetype
    Next subfd
End If

End Sub



Public Sub SaveAsCSV(Path, Optional targetName$ = "", Optional targetPath$ = "")
    '---------------
    'Name: ���ΪCSV��ʽ
    'Author: Li Alex
    'Version: v0.1a
    'Date: 2019/2/22
    'Description: �����ļ�·�����ڵ�ǰ�ļ�Ŀ¼������ͬ��csv�ļ�
    '---------------
    Dim app
    Dim wb As Workbook
    Dim name$
    '//��������app
    Set app = CreateObject("excel.application")
    app.Visible = False
    '//Workbook.SaveAs����ת��csv��ʽ
    Set wb = app.Workbooks.Open(Path, 0)
    If targetPath = "" Then
        targetPath = wb.Path & "\"
    ElseIf Right(targetPath, 1) <> "\" Then
        targetPath = targetPath & "\"
    End If
    If targetName = "" Then targetName = Mid(wb.name, 1, InStr(1, wb.name, "xls") - 2) & ".csv"
    wb.SaveAs targetPath & targetName, xlCSV
    wb.Close 0
    '//�ͷ�app
    app.Quit
End Sub

Public Sub SaveAsPDF(save_path, sh_name, Optional full_save_name$)
    '---------------
    'Name: ���ΪPDF��ʽ
    'Author: Li Alex
    'Version: v0.1a
    'Date: 2019/12/3
    'Description: �����ļ�·������ָ��Ŀ¼����������pdf�ļ�
    '---------------
If Right(save_path, 1) = "" Then save_path = save_path & "\"
Sheets(sh_name).ExportAsFixedFormat xlTypePDF, save_path & save_name, To:=1
End Sub

'FUNCLIB>>MISC

Public Sub SpeedUp( _
    Optional ScreenUpdating As Boolean = 0, _
    Optional Calculation As Boolean = 0, _
    Optional DisplayAlert As Boolean = 1)
    '---------------
    'Name: �ӿ������ٶ�
    'Author: Li Alex
    'Version: v0.1a
    'Date: 2019/2/12
    'Description: �����ڸ��£��Զ����㣬��ʾ����
    '---------------
    With Application
        If ScreenUpdating Then .ScreenUpdating = 1
        If Calculation Then .Calculation = xlCalculationManual
        If DisplayAlert Then .DisplayAlerts = 1
        If Not ScreenUpdating Then .ScreenUpdating = 0
        If Not Calculation Then .Calculation = xlCalculationManual
        If Not DisplayAlert Then .DisplayAlerts = 0
    End With
End Sub
Public Function BubbleSort(serial(), output(), Optional isDescending As Boolean = False) As Boolean
    Dim inner%, outter%, i%, temp%
    '//���serial��Ч��
    For i = LBound(serial) To UBound(serial)
        If Not IsNumeric(serial(i)) Then
            BubbleSort = False
            Exit Function
        End If
    Next i
    '//sort
    output = serial
    For outter = UBound(output) To LBound(output) Step -1
        If sorted = True Then BubbleSort = True: Exit Function
        If isDescending = False Then
            For inner = LBound(output) To outter - 1
                If output(inner) > output(inner + 1) Then
                    temp = output(inner)
                    output(inner) = output(inner + 1)
                    output(inner + 1) = temp
                End If
            Next
        Else
            For inner = LBound(output) To outter - 1
                If output(inner) < output(inner + 1) Then
                    temp = output(inner)
                    output(inner) = output(inner + 1)
                    output(inner + 1) = temp
                End If
            Next
        End If
    Next
    BubbleSort = True
End Function

'FUNCLIB>>STRING OPERATION/StrOp

Public Function ColToAlpha(ByVal num%) As String
'---------------
'Name: ����ת�б�
'Author: Li Alex
'Version: v0.2
'Date: 2019/9/5
'Description: �����кţ������Ӧ����ĸ�б꣬���INDIRECT()ʹ��
'---------------
Dim s$
s = ""
Do While num
    num = num - 1
    s = Chr(num Mod 26 + 65) & s
    num = num \ 26
Loop
ColToAlpha = s
End Function

'FUNCLIB>>EXCEL FUNCTION/ xlFUNC

Public Function myRank(number As range, ref As range, Optional isDescending As Boolean = True) As Integer
    '---------------
    'Name: ����Ŀ����ָ����Χ�ڵ�������
    'Author: Li Alex
    'Version: v0.1a
    'Date: 2019/2/25
    'Description:   EXCEL�Դ���Rank()�����Ὣ����������Ĵ�����ϣ�myRank()���ز������������ϵ�����
    '               ע�⣺��Ŀ������ΪINDIRECT()������䣬�������Ӹ����е���INDIRECT���򣬲��ø����н���myRank()��
    '---------------
    Dim arr() As Double, i%, cnt%, iInner%, iOuter%, iMax%, temp As Double
    Application.Volatile
    cnt = ref.Count
    ReDim arr(1 To cnt)
    For i = 1 To cnt
        arr(i) = ref.Value2(i, 1)
    Next i
    '//ѡ������
    For iOuter = cnt To 1 + 1 Step -1
        iMax = 1
        For iInner = 1 To iOuter
            If arr(iInner) > arr(iMax) Then iMax = iInner
        Next iInner
        temp = arr(iMax)
        arr(iMax) = arr(iOuter)
        arr(iOuter) = temp
    Next iOuter
    '//ȥ�ظ�ֵ
    For i = 1 To cnt - 1
        If arr(i) = -1 Then Exit For
        If arr(i) = arr(i + 1) Then
            For j = i To cnt - 1
                arr(j) = arr(j + 1)
            Next j
            arr(cnt) = -1 '�����ҵ��ظ�����������һ��Ԫ�أ���������һ��i�����ж�
            i = i - 1
            cnt = cnt - 1
        End If
    Next i
    ReDim Preserve arr(1 To cnt) '�����ղ��ظ��������������
    '//����/�������ָ������
    For i = 1 To cnt
        If arr(i) = number.Value2 Then
            If isDescending = True Then myRank = cnt - i + 1
            If isDescending = False Then myRank = i
            Exit For
        End If
    Next i
End Function

Function myTranspose(arr, Optional base% = 1)
Dim offset%
offset = 0
If base = 0 Then offset = 1 '��������0��ʼ�����������±굽1��ʼ
If TypeName(arr) = "Range" Then arr = arr.Value
Select Case UBound(arr) + offset
    Case 1  '��������
        myTranspose = WorksheetFunction.Transpose(WorksheetFunction.Transpose(arr))
    Case Is > 1 '��������
        myTranspose = WorksheetFunction.Transpose(arr)
    Case Else
        MsgBox "myTranspose Method Failed(ubound<1)"
        Stop
End Select
End Function

Sub uniExtract(rngArr, output_arr, Optional accept_KeywordArr = "", Optional accept_KeywordColumnIndex As Long = 0, Optional keep_columns = 0)
'---------------
'Author: Li Alex
'Version: v0.1
'Date: 2020/10/9
'purpose: ͨ������/RangeObj��ȡ�͹��˺�����
'         ��SheetRange����[rngArr]������ָ����������[accept_KeywordColumnIndex]�����˵�Ԫ��ؼ���[accept_KeywordArr]��_
'         ����ȡǰ[keep_columns]�У���������д��Range�Ķ�ά����[output_arr]��
'update:
'
'param rngArr ->RangeObject/Array(N,M): ��Ҫ��ȡ��ԭʼRangeObject�����ά���顣
'param output_arr-> Array(N,M): ���ڴ洢���˽���Ķ�λ���顣
'param accept_KeywordArr->str/Array(N): ��ѡ���ؼ��ֹ���ѡ�Ĭ��ֵΪ�գ������й��ˣ���ָ���������Ŀ��ֵ���ڹؼ���ʱ�Ž�����ȡ����","���зָҲ����ֱ�Ӵ���һά���顣
'param accept_KeywordColumnIndex->Long : ��ѡ��ָ���ؼ��ֹ��˵�Ŀ���кš�����ֵ=0ʱ�����й��ˡ�
'param keep_columns->Int : ��ѡ����ȡǰN����ֵ������ֵ=0ʱ�����������е����ݡ�
'---------------

Dim raw, resArr()
Dim acckwArr
'dim isRange as boolean,bSort as boolean

'�ж�RngArr����
If VarType(rngArr) = vbArray + vbVariant Then   '=8192+12=8204
    isrange = True
ElseIf VarType(rngArr) = vbArray Then
    isrange = False
Else: Stop 'debug
End If

'�жϹؼ��ֹ���ѡ�����ؼ���
If accept_KeywordColumnIndex > 0 Then   '�����кŲ�Ϊ��
    bSort = True
    If VarType(accept_KeywordArr) = vbString Then  '�ַ���ģʽ
        If InStr(accept_KeywordArr, ",") > 0 Then       '�Ƿ��ؼ���
            acckwArr = Split(accept_KeywordArr, ",")        '��ؼ��ִ洢����
        Else
            acckwArr = Array(accept_KeywordArr)         '���ؼ��ִ洢arr(0)
        End If
    ElseIf VarType(accept_KeywordArr) >= vbArray Then   '����ģʽ
        acckwArr = accept_KeywordArr                        '�ؼ��ִ洢Ϊ����
    Else: Stop  'debug
    End If
    kw_count = UBound(acckwArr) 'ͳ�ƹؼ��ָ���
Else
    bSort = False
    acckwArr = Empty    '�����к�=0����ִ�й���
End If

'ִ�н�ȡѡ��
If isrange Then
    raw = rngArr.Resize(rngArr.Rows.Count, keep_columns)
Else
    ReDim raw(1 To UBound(rngArr), 1 To keep_columns)
    For i = 1 To UBound(rngArr)
        For j = 1 To keep_columns
            raw(i, j) = rngArr(i, j)
        Next j
    Next i
End If

ReDim resArr(1 To UBound(raw), 1 To UBound(raw, 2))

'���˹ؼ���
If bSort Then
    resArr_cursor = 1  '���resArr�к�
    For r = 1 To UBound(raw)
        For c = 1 To UBound(raw, 2)
            bFound = False  '����Ƿ��ҵ�ƥ����
            For k = 0 To kw_count
                If raw(r, accept_KeywordColumnIndex) = acckwArr(k) Then 'Ŀ��ֵ���ڹؼ�����д��resArr
                    resArr(resArr_cursor, c) = raw(r, c)
                    bFound = True
                    Exit For
                End If
            Next k
        Next c
        If bFound Then resArr_cursor = resArr_cursor + 1
    Next r
    'ȥ��resArr���ಿ��(����WorksheetFunction.Transpose()ʵ�� #TODO)
    'pass
Else
    resArr = raw
End If
   
'������
output_arr = resArr

End Sub
