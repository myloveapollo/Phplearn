--数据库的相关操作
--登录
mysql -uroot -proot
--创建数据库
CREATE databases mydata charset utf8;
--查看数据库
show databases mydata;
show databases LIKE "mydata%";
--修改数据库
ALTER DATABASE mydata charset gbk;
--修改数据库名字,mysql不支持直接修改数据库名称，只能先备份，再删除原库，在导入备份数据
--删除数据库
DROP DATABASE mydata;


--数据库备份与还原操作
--备份需要用到mysqldump.exe	需要单独开cmd
--备份数据库，语句最后不要有;
mysqldump.exe -hlocalhost -P3306 -uroot -proot mydata1 > f:xuhaofeng/mysqldump_data/mydata1.sql
--备份数据表
mysqldump.exe -hlocalhost -P3306 -uroot -proot mydata my_class my_student > f:xuhaofeng/mysqldump_data/my_tables.sql

--还原数据库 也需要单独开cmd，还需要提前在要在登录的mysql -uroot -proot 的cmd上面创建mydata，才能将备份的数据库导入。达到修改名称的目的
mysql -uroot -proot mydata < f:xuhaofeng/mysqldump_data/mydata1.sql

--还原表，要在登录的mysql -uroot -proot 登录的cmd上运行
source f:xuhaofeng/mysqldump_data/my_gbk_int.sql

--用户管理权限 mysql.user
--查看有哪些用户, host与user是符合主键
SELECT * FROM mysql.USER \G;
--创建用户
CREATE USER 'user1'@'%'identified BY '12345';
--删除用户
DROP USER user1;
--修改用户密码
SET password FOR 'user1'@'%' = password('654321');
