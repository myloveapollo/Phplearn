--最简单的过程
CREATE PROCEDURE my_pro()
SELECT * FROM my_student;

--过程创建，求1到100的和
delimiter $$
CREATE PROCEDURE my_pro1()
BEGIN
	DECLARE i INT DEFAULT 1;
	SET @sum = 0;
	WHILE i <= 100 do
		SET @sum = @sum  + i;
		SET i = i + 1;
	END while;
	SELECT @sum;
END
$$
delimiter ;

--查看所有过程
show PROCEDURE stauts [LIKE "parttern"];

--查看过程的创建语句
show CREATE PROCEDURE my_pro1 \G;

--调用过程,过程没有返回值，所以不能用select
call my_pro1();

--删除过程
DROP PROCEDURE my_pro1;