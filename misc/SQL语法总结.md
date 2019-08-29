基本查询
```SQL
SELECT *
FROM TABLE_NAME
```
跨表查询
```SQL
SELECT T1.COLUMN_NAME1,T2.COLUMN2
FROM T1,T2
```

带条件查询
```SQL
SELECT COLUMN_NAME
FROM TABLE_NAME
WHERE CONDITION
```
对查询结果进行排序
```SQL
SELECT COLUMN_NAME
FROM TABLE_NAME
ORDER BY COLUMN_NAME [ASC]/DESC
```
联结表查询

关键字：`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`

>In SQL, "joining tables" means combining data from two or more tables. A table join creates a temporary table showing the data from the joined tables.

作为对比，普通查询形如:
```SQL
SELECT t1.column1,t2.column2
FROM table1 AS t1, table2 AS t2
WHERE condition
```

字段约束：
* `NOT NULL` = you must give me something to move on. 
* `UNIQUE` = no one else looks like me
* `PRIMARY KEY` = use me to turn a column to a pointing device
* `CHECK` = does it make sense
* `DEFAULT` = this is what I am until you change me.
