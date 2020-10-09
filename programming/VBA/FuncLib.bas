Attribute VB_Name = "FuncLib"
'FUNCLIB>>FILE OPERATION/ FileOp

Public Function FDOGetPath(Optional isFolder As Boolean = 0, Optional fTitle$ = "") As String
    '---------------
    'Name: FDOGetPath
    'Author: Li Alex
    'Version: v0.1c
    'Date: 2019/3/2
    'Update: fdo.filters参数可能发生错误，暂时移除
    'Description: 通过FDO方式获得指定文件/文件夹路径,文件返回全路径，文件夹返回文件夹路径（带斜杠）
    '---------------
    Dim fdo, fdoType%, DefaultPath$
    '//下方设置fdo窗口提示参数↓↓↓
    If fTitle = "" Then fTitle = "Select file or folder in dialog: "
    DefaultPath = ThisWorkbook.Path 'FDO初始路径
    '-------------------------------------------
    '//设置文件/文件夹对应的fdo模式
    If isFolder = True Then
        fdoType = 4 'msoFileDialogFolderPicker
    Else
        fdoType = 3 'msoFileDialogFilePicker
    End If
    '//调出fdo界面
    Set fdo = Application.FileDialog(fdoType)
    With fdo
        .Title = fTitle
        .InitialFileName = DefaultPath
        '//返回路径参数
        If .Show = -1 Then '-1=OK, 0=Cancel
            FDOGetPath = .SelectedItems.Item(1) '文件路径
            If isFolder Then FDOGetPath = .SelectedItems.Item(1) & "\" '文件夹路径
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
'purpose: 获得指定文件夹下所有满足条件的文件的完整路径，并传给外部的list()。注意：如果文件没有后缀名，则会报错。
'update: 增加白名单模式中，多个accept_keyword可选择为OR或AND判定模式
'        增加输出单独文件名数组的功能
'
'param folder_path$ : 查找的主路径。
'param output_list() : 返回结果要输出到的外部数组list()。
'param output_fname->arr : 额外输出仅包含文件名的数组。
'param recursive->boolean : True-递归子文件夹; False-仅当前文件夹。默认False。
'param ignore_keyword->str : 若文件名（不含后缀名）中包含指定的关键字，则跳过。关键字以","分隔。
'param ignore_filetype->str : 若文件后缀存在于指定的字符串中，则跳过。后缀类型以","分隔。
'param accept_keyword->str : 若文件名（不含后缀名）中包含指定的关键字，则保留。关键字以","分隔。
'param accept_method->str : 指定白名单关键字的匹配模式。"OR"-->只要任一关键字存在即可；"AND"-->所有关键字必须都存在才接受。
'param accept_filetype->str : 若文件后缀存在于指定的字符串中，则保留。后缀类型以","分隔。

'notes: accept参数的优先级高于ignore，如果两种参数同时存在，则按照accept指定的白名单过滤文件。
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
'# 判断搜索模式
If VarType(acc_keywords) >= vbArray Or VarType(acc_filetypes) >= vbArray Then
    white_list_mode = True
Else
    white_list_mode = False
End If
Set fso = CreateObject("scripting.filesystemobject")
'# 搜索文件对象
Set fd = fso.getfolder(folder_path)
If fd.Files.Count > 0 Then
    For Each f In fd.Files
         f_Name = left(f.name, InStrRev(f.name, ".") - 1)
        f_ext = Right(f.name, Len(f.name) - Len(f_Name) - 1)
        '# 白名单模式
        If white_list_mode Then
            f_valid = False
            '# 检查acc_filetype
            If acc_filetypes Then
                If InStr(1, accept_filetype, f_ext) > 0 Then f_valid = True
            End If
            '# 检查accept_keyword
            If IsArray(acc_keywords) Then
                '# 决定关键字匹配模式为OR 或 AND
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
            '# 检查ignore_filetype
            If ign_filetypes Then
                If InStr(1, ignore_filetype, f_ext) > 0 Then f_valid = False
            End If
            '# 检查ignore_keyword
            If IsArray(ign_keywords) Then
                For i = 0 To UBound(ign_keywords)
                    If InStr(1, f_Name, ign_keywords(i)) > 0 Then f_valid = False: Exit For
                Next i
            End If
        End If
        '# 若满足条件则写入output_list
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
'# 处理文件名输出模式
If VarType(output_fname) >= vbArray Then 'vbArray=8192, vbVariant=12
    output_fname = output_list
    For i = 1 To UBound(output_fname)
        s = output_fname(i)
        output_fname(i) = Mid(s, InStrRev(s, "\") + 1, Len(s))
    Next i
End If

'# 非递归模式则结束过程
If Not recursive Then Exit Sub
'# 搜索子文件夹对象
If fd.subfolders.Count > 0 Then
    For Each subfd In fd.subfolders
        getFileList subfd.Path, output_list, output_fname, True, ignore_keyword, ignore_filetype, accept_keyword, accept_method, accept_filetype
    Next subfd
End If

End Sub



Public Sub SaveAsCSV(Path, Optional targetName$ = "", Optional targetPath$ = "")
    '---------------
    'Name: 另存为CSV格式
    'Author: Li Alex
    'Version: v0.1a
    'Date: 2019/2/22
    'Description: 输入文件路径，在当前文件目录下生成同名csv文件
    '---------------
    Dim app
    Dim wb As Workbook
    Dim name$
    '//建立缓存app
    Set app = CreateObject("excel.application")
    app.Visible = False
    '//Workbook.SaveAs方法转存csv格式
    Set wb = app.Workbooks.Open(Path, 0)
    If targetPath = "" Then
        targetPath = wb.Path & "\"
    ElseIf Right(targetPath, 1) <> "\" Then
        targetPath = targetPath & "\"
    End If
    If targetName = "" Then targetName = Mid(wb.name, 1, InStr(1, wb.name, "xls") - 2) & ".csv"
    wb.SaveAs targetPath & targetName, xlCSV
    wb.Close 0
    '//释放app
    app.Quit
End Sub

Public Sub SaveAsPDF(save_path, sh_name, Optional full_save_name$)
    '---------------
    'Name: 另存为PDF格式
    'Author: Li Alex
    'Version: v0.1a
    'Date: 2019/12/3
    'Description: 输入文件路径，在指定目录下生成命名pdf文件
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
    'Name: 加快运行速度
    'Author: Li Alex
    'Version: v0.1a
    'Date: 2019/2/12
    'Description: 管理窗口更新，自动重算，显示警告
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
    '//检查serial有效性
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
'Name: 列数转列标
'Author: Li Alex
'Version: v0.2
'Date: 2019/9/5
'Description: 输入列号，输出对应的字母列标，配合INDIRECT()使用
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
    'Name: 返回目标在指定范围内的排序数
    'Author: Li Alex
    'Version: v0.1a
    'Date: 2019/2/25
    'Description:   EXCEL自带的Rank()函数会将并列排名后的次序隔断，myRank()返回并列排名不隔断的排序。
    '               注意：如目标区域为INDIRECT()函数填充，则需增加辅助列等于INDIRECT区域，并用辅助列进行myRank()。
    '---------------
    Dim arr() As Double, i%, cnt%, iInner%, iOuter%, iMax%, temp As Double
    Application.Volatile
    cnt = ref.Count
    ReDim arr(1 To cnt)
    For i = 1 To cnt
        arr(i) = ref.Value2(i, 1)
    Next i
    '//选择排序
    For iOuter = cnt To 1 + 1 Step -1
        iMax = 1
        For iInner = 1 To iOuter
            If arr(iInner) > arr(iMax) Then iMax = iInner
        Next iInner
        temp = arr(iMax)
        arr(iMax) = arr(iOuter)
        arr(iOuter) = temp
    Next iOuter
    '//去重复值
    For i = 1 To cnt - 1
        If arr(i) = -1 Then Exit For
        If arr(i) = arr(i + 1) Then
            For j = i To cnt - 1
                arr(j) = arr(j + 1)
            Next j
            arr(cnt) = -1 '若查找到重复项，则将数组减少一个元素，并返回上一级i重新判断
            i = i - 1
            cnt = cnt - 1
        End If
    Next i
    ReDim Preserve arr(1 To cnt) '对最终不重复的数组进行整形
    '//按升/降序查找指定排序
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
If base = 0 Then offset = 1 '如果数组从0开始，补偿数组下标到1开始
If TypeName(arr) = "Range" Then arr = arr.Value
Select Case UBound(arr) + offset
    Case 1  '横向数组
        myTranspose = WorksheetFunction.Transpose(WorksheetFunction.Transpose(arr))
    Case Is > 1 '竖向数组
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
'purpose: 通用数组/RangeObj提取和过滤函数。
'         对SheetRange对象[rngArr]，根据指定的条件列[accept_KeywordColumnIndex]，过滤单元格关键字[accept_KeywordArr]，_
'         并提取前[keep_columns]列，最后输出可写回Range的二维数组[output_arr]。
'update:
'
'param rngArr ->RangeObject/Array(N,M): 需要提取的原始RangeObject，或二维数组。
'param output_arr-> Array(N,M): 用于存储过滤结果的二位数组。
'param accept_KeywordArr->str/Array(N): 可选，关键字过滤选项。默认值为空，不进行过滤；若指定，则仅当目标值等于关键字时才进行提取，用","进行分割，也可以直接传入一维数组。
'param accept_KeywordColumnIndex->Long : 可选，指定关键字过滤的目标列号。参数值=0时不进行过滤。
'param keep_columns->Int : 可选，截取前N列数值。参数值=0时，保留所有列的数据。
'---------------

Dim raw, resArr()
Dim acckwArr
'dim isRange as boolean,bSort as boolean

'判断RngArr类型
If VarType(rngArr) = vbArray + vbVariant Then   '=8192+12=8204
    isrange = True
ElseIf VarType(rngArr) = vbArray Then
    isrange = False
Else: Stop 'debug
End If

'判断关键字过滤选项并整理关键字
If accept_KeywordColumnIndex > 0 Then   '过滤列号不为零
    bSort = True
    If VarType(accept_KeywordArr) = vbString Then  '字符串模式
        If InStr(accept_KeywordArr, ",") > 0 Then       '是否多关键字
            acckwArr = Split(accept_KeywordArr, ",")        '多关键字存储数组
        Else
            acckwArr = Array(accept_KeywordArr)         '单关键字存储arr(0)
        End If
    ElseIf VarType(accept_KeywordArr) >= vbArray Then   '数组模式
        acckwArr = accept_KeywordArr                        '关键字存储为数组
    Else: Stop  'debug
    End If
    kw_count = UBound(acckwArr) '统计关键字个数
Else
    bSort = False
    acckwArr = Empty    '过滤列号=0，不执行过滤
End If

'执行截取选项
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

'过滤关键字
If bSort Then
    resArr_cursor = 1  '标记resArr行号
    For r = 1 To UBound(raw)
        For c = 1 To UBound(raw, 2)
            bFound = False  '标记是否找到匹配项
            For k = 0 To kw_count
                If raw(r, accept_KeywordColumnIndex) = acckwArr(k) Then '目标值等于关键字则写入resArr
                    resArr(resArr_cursor, c) = raw(r, c)
                    bFound = True
                    Exit For
                End If
            Next k
        Next c
        If bFound Then resArr_cursor = resArr_cursor + 1
    Next r
    '去除resArr多余部分(调用WorksheetFunction.Transpose()实现 #TODO)
    'pass
Else
    resArr = raw
End If
   
'输出结果
output_arr = resArr

End Sub
