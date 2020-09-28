# VBA实现递归获取文件路径的方法

由于我经常大批量从文件中读取数据并汇总，调用此方法可以快速将路径下文件的fullpath返回到数组中，再对数组进行遍历。有些情况下，路径下可能有不需要的文件，这时可以通过指定关键字或后缀名进行忽略。

此方法是网络上常规方法的改进版。

* 根据输入参数可以实现：
  * 递归查找子文件夹；
  * 黑名单模式：忽略文件名中指定关键字或指定的后缀名；
  * 白名单模式：忽略文件名中指定关键字或指定的后缀名。
  * 注意：如果文件没有后缀名，则会报错。此bug很容易通过修改代码进行规避，但考虑到通常需要提取的都是xlsx,csv,txt等文件，没有后缀名反而是一种异常，因此保留了此bug。
* 代码如下：

```vb

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
         f_Name = Left(f.Name, InStrRev(f.Name, ".") - 1)
        f_ext = Right(f.Name, Len(f.Name) - Len(f_Name) - 1)
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
```
