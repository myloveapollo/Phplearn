--变量的作用域
--局部作用域，一般都是declare定义的变量

--会话作用域，使用@符号定义的变量，使用set 关键字；对当前连接用户有效，任何地方都可以使用，也可以跨库
SET @name = "张三";+
CREATE FUNCTION my_func4() RETURNs CHAR(4)
RETURN @name; --这个函数能访问的到

--全局作用域，所有的客户端所有的连接都有效
SET global 变量名 = 值;
SET @@global.变量名 = 值;



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

--