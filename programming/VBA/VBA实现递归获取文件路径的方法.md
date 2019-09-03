由于我经常大批量从文件中读取数据并汇总，调用此方法可以快速将路径下文件的fullpath返回到数组中，再对数组进行遍历。有些情况下，路径下可能有不需要的文件，这时可以通过指定关键字或后缀名进行忽略。

此方法是网络上常规方法的改进版。
* 根据输入参数可以实现：
    * 递归查找；
    * 忽略文件名中指定关键字；
    * 忽略指定的文件后缀名。
    * 注意：如果文件没有后缀名，则会报错。此bug很容易通过修改代码进行规避，但考虑到通常需要提取的都是xlsx,csv,txt等文件，没有后缀名反而是一种异常，因此保留了此bug。
* 代码如下：
```vb
Public Sub get_file_list( _
        folder_path$, _
        output_list(), _
        Optional recursive As Boolean = False, _
        Optional ignore_keyword = "$", _
        Optional ignore_filetype = "tmp")
'---------------
'Author: Li Alex
'Version: v0.3
'Date: 2019/9/3
'purpose: 获得指定文件夹下所有满足条件的文件的完整路径，并传给外部的list()。注意：如果文件没有后缀名，则会报错。

'param folder_path$ : 查找的主路径。
'param output_list() : 返回结果要输出到的外部数组list()。
'param recursive->boolean : True-递归子文件夹; False-仅当前文件夹。默认False。
'param ignore_keyword->str : 若文件名（不含后缀名）中包含指定的关键字，则跳过。关键字以","分隔。
'param ignore_filetype->str : 若文件后缀存在于指定的字符串中，则跳过。后缀类型以","分隔。
'---------------
Dim fso, keywords, filetypes, f_valid
If ignore_keyword = "" Then keywords = False Else keywords = Split(ignore_keyword, ",")
If ignore_filetype = "" Then filetypes = False Else filetypes = True
If Right(folder_path, 1) <> "\" Then folder_path = folder_path & "\"
If Len(Join(output_list, "")) = 0 Then
    ReDim output_list(1 To 1)
    list_index = 1
Else
    list_index = UBound(output_list) + 1
End If
Set fso = CreateObject("scripting.filesystemobject")
'# 搜索文件对象
Set fd = fso.getfolder(folder_path)
If fd.Files.Count > 0 Then
    For Each f In fd.Files
        f_Name = Left(f.Name, InStrRev(f.Name, ".") - 1)
        f_ext = Right(f.Name, Len(f.Name) - Len(f_Name) - 1)
        f_valid = True
        '# 检查ignore_keyword
        If IsArray(keywords) Then
            For i = 0 To UBound(keywords)
                If InStr(1, f_Name, keywords(i)) > 0 Then f_valid = False: Exit For
            Next i
        End If
        '# 检查ignore_filetype
        If filetypes Then
            If InStr(1, f_ext, ignore_filetype) > 0 Then f_valid = False
        End If
        If f_valid Then
            If list_index = 1 Then
                output_list(1) = f.path
            Else
                ReDim Preserve output_list(1 To list_index)
                output_list(list_index) = f.path
            End If
            list_index = list_index + 1
        End If
    Next f
End If
'# 非递归模式则结束过程
If Not recursive Then Exit Sub
'# 搜索子文件夹对象
If fd.subfolders.Count > 0 Then
    For Each subfd In fd.subfolders
        get_file_list subfd.path, output_list, True, ignore_keyword, ignore_filetype
    Next subfd
End If
End Sub
```