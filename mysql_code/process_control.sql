--流程控制if
SELECT * ,IF(stu_age > 20,'符合','不符合') AS judge FROM my_student WHERE stu_age > 20;

--复杂函数里面
IF 条件表达式 THEN
	满足条件的执行语句
END if;

--复合if语句
IF 条件表达式 THEN
	满足的条件要执行的语句
ELSE
	不满足条件要执行的语句
	IF 条件表达式 THEN
		满足条件要执行的语句
	END IF 
END IF 

--while 循环
--基本语法
WHILE 条件 do
	要循环执行的代码
END WHILE 



标识名字：while 条件 do
	IF 条件判断 THEN
		循环控制
		iterate/leave 标识名字
	END if
	循环体
END WHILE [标识名字]