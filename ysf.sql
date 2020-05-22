SELECT int_1 + int_2, int_1 - int_2, int_1 % int_2 FROM my_int;
ALTER TABLE my_int modify int_1 float;
ALTER TABLE my_int modify int_2 float;
ALTER TABLE my_int modify int_3 float;
ALTER TABLE my_int modify int_4 float;
ALTER TABLE my_int modify int_5 float;

SELECT * FROM my_student WHERE stu_age >=20;

SELECT '1' <=> 1, 0.02 <=> 2, 0.02<>0;

SELECT * FROM my_student WHERE stu_age BETWEEN 20 AND 30;


SELECT * FROM my_student WHERE stu_age >=20 AND stu_age <= 30;

SELECT * FROM my_student WHERE stu_id IN ('stu0001','stu0004');

SELECT * FROM my_student WHERE stu_name LIKE "小%";


--联合查询，1.必须有括号。2.必须有limit
(SELECT * FROM my_student WHERE gender = 1 ORDER BY stu_height ASC limit 10)
UNION
(SELECT * FROM my_student WHERE gender = 2 ORDER BY stu_height ASC limit 10);

--交叉连接 (笛卡尔积)
SELECT * FROM my_student CROSS JOIN my_int;
--创建一个班级的表
CREATE TABLE my_class(
class_id int
)charset utf8;


ALTER TABLE my_class modify class_id VARCHAR(4);

--
INSERT INTO my_class VALUES('5班'),('6班');

ALTER TABLE my_class change class_id id VARCHAR(4);

--内连接
SELECT * FROM my_student AS s INNER JOIN my_class AS c ON s.class_id = c.id;

--外连接
SELECT * FROM my_student AS s LEFT JOIN my_class AS c ON s.class_id = c.id;

--using
SELECT * FROM my_student LEFT JOIN my_class using(class_id);

--标量子查询
SELECT * FROM my_class WHERE class_id = (SELECT class_id FROM my_student WHERE stu_name = "小猪");

--列子查询
SELECT class_id FROM my_class WHERE class_id IN (SELECT class_id FROM my_student);

--行子查询 获取班级年龄最大，且身高最高。构造行元素 1.求年龄最大的值。2.求身高最大的值。
SELECT * FROM my_student WHERE (stu_age, stu_height) = (SELECT MAX(stu_age),MAX(stu_height) FROM my_student);

--如下是错误的，使用having表示已经使用了group by。
SELECT * FROM my_student HAVING stu_age = MAX(stu_age)  AND stu_height = MAX(stu_height);

--获取每个班身高最高的人。from后面必须跟表名，已经group by也需要根据表名来排，所以要用as
SELECT * FROM (SELECT * FROM my_student ORDER BY stu_height desc) AS temp GROUP BY class_id;

--求出有学生在的所以班级
SELECT * FROM my_class AS c WHERE EXISTS(SELECT stu_id FROM my_student AS s WHERE s.class_id = c.class_id);

--any举例 在my_student里选符合my_class班级id的数据

SELECT * FROM my_student WHERE class_id <> ANY(SELECT class_id FROM my_class);

--只有10班是不属于所有my_class 里的所有班型的
SELECT * FROM my_student WHERE class_id = ALL(SELECT class_id FROM my_class);


--利用Mysqldump进行sql备份
--整库备份
mysqldump.exe -hlocalhost -P3306 -uroot -proot mydata > f:/xuhaofeng/mysqldump_data/mydata.sql
--多表备份
mysqldump.exe -hlocalhost -P3306 -uroot -proot mydata my_class my_student  > f:/xuhaofeng/mysqldump_data/my_tables.sql
mysqldump.exe -hlocalhost -P3306 -uroot -proot mydata1 my_gbk my_int  > f:/xuhaofeng/mysqldump_data/my_gbk_int.sql


--还原整库数据 注意：用另一个cmd运行
mysql -uroot -proot mydata1 < f:/xuhaofeng/mysqldump_data/mydata.sql


--还原表,注意：要在mysql -uroot -proot 登录的cmd运行
source f:/xuhaofeng/mysqldump_data/my_gbk_int.sql;

--用户管理mysql.user
SELECT * FROM mysql.USER \G;

--创建用户 create user 用户名 identified by "明文密码"。在mysql用户：用户名@主机地址。主机地址可以用：" 空/% "
CREATE USER 'user1'@'%' identified BY "123456";

--通常不这样做，谁都可以访问，也不需要密码
CREATE USER user2;

--删除用户 drop user 用户名@host;
DROP USER user2;

--1、修改密码 set password for 用户 =  password('新的明文密码')
SET password FOR 'user1'@'%' = password('654321');

--2、使用更新语句update --> update mysql.user set password = password('新明文密码') where user ='' and host= '';

--授予权限-->给予了查看的权限 select可以用 all privileges 
GRANT SELECT ON mydata.my_student TO "user1"@'%';
GRANT ALL privileges ON mydata.my_student TO "user1"@'%';

--取消权限
REVOKE ALL privileges ON mydata.my_student FROM "user1"@"%";

--刷新权限
flush privileges;

--停止服务器
net stop mysql56

--重新启动服务器，并跳过权限
mysqld.exe --skip-grant-tables

--修改root密码
UPDATE mysql.USER SET password = password("root") WHERE user="root" AND host = 'localhost';

net start mysql56