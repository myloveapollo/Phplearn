--函数

--基本语法
SELECT 函数名(参数列表);
--系统函数
SELECT char_length("你好中国"),length("你好中国");

SELECT CONCAT('你好','中国'),instr('你好中国','中'),instr('你好中国','湾');

SELECT lcase("aBcD"),LEFT("你好中国",2);

SELECT LTRIM("  a bcd"),mid('你好中国',2);

--时间函数
SELECT now(),curdate(),curtime();

SELECT DATEDIFF('2010-10-10','1990-10-10');

SELECT date_add('2000-10-10',interval 10 day),date_add('2000-10-10',interval 10 year),date_add('2000-10-10',interval 10 second);

SELECT unix_timestamp();

SELECT from_unixtime(1234567890);

SELECT md5('a'),VERSION(),DATABASE(),uuid();

--创建自定义函数，没有参数的函数
delimiter $$
CREATE FUNCTION my_func1() returns INT
BEGIN
	RETURN 10;
END
$$
delimiter ;

CREATE FUNCTION my_func2() returns INT
RETURN 100;

--查看所有函数，所有的库里面的函数都可以查到
show FUNCTION status \G;
show FUNCTION status LIKE 'my%' \G;

--查看创建函数语句
show CREATE FUNCTION my_func1 \G;

--调用函数
SELECT my_func1(),my_func3(100,1000);

--删除函数
DROP FUNCTION my_func2;

--案例函数流程综合案例:需求从1开始求和直到用户传入的对应值为止，和如果是5的倍数都不要。
--设计1、创建函数。2、需要一个形参，确定要累加到什么为止。3、需要定义一个变量保存对应结果。
--4、内部需要一个循环来实现迭代累加。5、循环内部需要进行条件判断控制：5的倍数。
--创建函数、修改函数结束符
--mysql 中没有++概念
delimiter $$    --修改结束表示符
CREATE FUNCTION my_sum(end_value int) returns INT   --创建函数 有形参需要给出数据类型，需要给定返回值类型
BEGIN
	DECLARE res INT DEFAULT 0;			-- 声明一个变量 指定数据类型与默人值
	DECLARE i INT DEFAULT 1;
	mywhile:WHILE i <= end_value do  -- while语句，因为后面要iterate（相当于break）所以要取名字 mywhile
		IF i % 5 = 0 THEN			-- if 判断语句
			SET i = i + 1;			--mysql 没有自加加++
			iterate mywhile;		--相当于break
		END if;						--if一定有要有end if 
		SET res = res + i;			--给变量赋值用set 声明变量用declare
		SET i = i + 1;
	END WHILE mywhile;				--while要有end while mywhile 与之配套
	RETURN res;						--函数一定要有返回值
END									--begin对应的end
$$									--修改的结束符号
delimiter ;							--结束符号修改为原来的;


mysql -uroot -proot
--自己默写的函数
delimiter $$
CREATE FUNCTION my_sum(end_value INT) returns INT
BEGIN
	DECLARE res INT DEFAULT 0;
	DECLARE i INT DEFAULT 1;
	mywhile:WHILE i <= end_value do
				IF i % 5 = 0 THEN
					SET i = i + 1;
					iterate mywhile;
				END IF;
				SET res = res + i;
				SET i = i + 1;
	END WHILE mywhile;
	RETURN res;
END
$$
delimiter ;

--再默写一遍
delimiter $$
CREATE FUNCTION my_sum(end_value int) returns INT
BEGIN
	DECLARE res INT DEFAULT 0;
	DECLARE i INT DEFAULT 1;
	mywhile:WHILE i <= end_value do
		IF i % 5 = 0 THEN
			SET i = i + 1;
			iterate mywhile;
		END IF; 
		SET res = res + i;
		SET i = i + 1;
	END WHILE mywhile;
	RETURN res;
END
$$
delimiter ;
