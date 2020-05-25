--查看所有系统变量
show variables;

--查看系统变量
SELECT @@autocommit;

--局部会话修改
SET autocommit = 0;

--全局修改系统变量 @@可以替代global
SET global autocommit = 0;
SET @@auto_increment_increment = 2;

--定义用户变量
SET @name := "hello world"

--通过查询数据为变量赋值,limit 1表示是赋值第一个，如果limit max 表示赋值了最后一个。
SELECT @name := stu_name, @age := stu_age FROM my_student limit 10;

--只是赋值，不查看结果,下面是取最高的身高的名字与年纪
SELECT stu_name, stu_age FROM my_student ORDER BY stu_height DESC limit 1 INTO @name, @age;

--查看用户自定义变量
SELECT @name,@age;