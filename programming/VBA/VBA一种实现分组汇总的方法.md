# VBA一种实现分组汇总的方法

date: 2019-10-22

今天同事请教我一个EXCEL问题，简化了一下，大概的模型是一对多的映射，如下图所示：

![data source](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191023225409.png)

要求是：需要把A:B列的原始数据（已经按A列做过排序），按照A列的元素进行分组，然后合并，转化（或者说压缩）成横向排列，输出如F:I列的格式。数据框大小在几百行左右，A列不重复元素大约有几十个。`同事特别要求：时间紧迫，越快越好。`

时间不多，首先梳理一下逻辑：

1. 找出A列的不重复项
2. 统计每一个不重复项出现的次数
3. 计算每一个不重复项区间的下边界，即range_A=[B1:Bx],range_B=[Bx+1:By]，前提是A列已经进行排序
4. 对每一个区间进行字符串合并

思考使用EXCEL函数实现的可行性，由于之前没有实际处理过此类问题，简单尝试无果后放弃。另外，我使用的EXCEL2013环境，CONCATNATE函数无法直接合并range，只能合并单个cell，也是导致放弃的原因之一。

既然函数不行，只好使用VBA，考虑到够用就行，不用搞成全自动，因此可以部分借助EXCEL自带功能。用VBA语言“转化”一下上述的逻辑步骤：

1. 构造结构体'data'，包含两个属性：元素名称'cat'（即A列的不重复项名称A,B,C...），对应的值组成的数组'vals()'，为了方便，'vals()'预留100的大小。
2. 将A:B的有效区域读入内存数组，以便加快遍历速度。
3. 设置两个指针cursor_cat和cursor_val，分别指向data.cat和data.vals的索引，并对结构体和指针进行初始化（即先把d(1).cat和d(1).vals(1)赋值）。
4. 从第二行开始遍历，如果A列等于结构体内cat指针指向的值，说明当前元素还有未汇总的值，则val指针加1；如果A列不等于结构体cat内指针指向的值，说明上一个元素已经全部汇总，需要开始汇总下一个元素，则cat指针加1，val指针重置为1。
5. 把当前遍历的数据写入两个指针指向的位置。
6. 重复4,5步直到结束遍历。

    上面6步结束后，所有的数据已经全部按A列元素汇总完成。但这些结果还在内存里，如何输出呢？为了方便，这里需要借用EXCEL自带的分列功能。

7. 首先使用Join()方法把d.vals进行以逗号分隔的合并，并使用debug.print打印在immediate窗口，此时显示的结果大概如下图所示：

    ![immediate window](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191024015426.png)

8. 可以看出行尾多了很多逗号，这是因为没有使用动态数组，因而不能对多余的数组空间进行裁剪（redim preserve方法）。不过，多余的逗号并不影响结果，把immediate窗口的内容全部复制，粘贴到表格里。
9. 最后，使用分列功能，按逗号分隔符进行分割即可。到此，数据已经转化为我们想要的形式。

感想：虽然这个方法并不完美，但是对于临时的需求，使用VBA配合EXCEL自带功能，也可以起到事倍功半的效果，只用了10分钟就解决了这个问题。并非使用VBA就一定要把所有的任务全在VBA环境下完成，函数，功能也是一样的道理，要因地制宜！

附：完整的vba代码如下：

```vb
Type data
    cat As String
    vals(1 To 100) As String
End Type
'------
Sub join_group()
Dim d(1 To 100) As data
rmax = [a1].End(xlDown).Row
Dim raw
raw = Range("A1:B" & rmax)
d(1).cat = raw(1, 1)
d(1).vals(1) = raw(1, 2)
cursor_cat = 1
cursor_val = 1
For r = 2 To rmax
    If raw(r, 1) = d(cursor_cat).cat Then
        cursor_val = cursor_val + 1
        d(cursor_cat).vals(cursor_val) = raw(r, 2)
    Else
        cursor_cat = cursor_cat + 1
        cursor_val = 1
        d(cursor_cat).cat = raw(r, 1)
        d(cursor_cat).vals(cursor_val) = raw(r, 2)
    End If
Next r

For i = 1 To 100
    Debug.Print Join(d(i).vals, ",")
Next
End Sub
```
