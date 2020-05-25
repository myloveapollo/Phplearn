--列的六大属性 null 、default、 comment、 primary key、auto_increment、unique key。

--主键不允许为空，值具有唯一性
--创建主键 1、创建表的时候创建
CREATE TABLE my_pri(
username VARCHAR(10) PRIMARY KEY
)charset utf8;

--增加主键
ALTER TABLE my_pri ADD PRIMARY KEY(username);
--删除主键
ALTER TABLE my_pri DROP PRIMARY key;
--创建表的时候，创建复合主键
CREATE TABLE my_auto(
student_no VARCHAR(10),
course_no VARCHAR(10),
score TINYINT NOT null,
PRIMARY KEY(student_no,course_no)
)charset utf8;


--自动增长 创建表的时候自动增长
CREATE TABLE my_auto(
id INT PRIMARY KEY auto_increment,
name VARCHAR(10),
score TINYINT NOT NULL comment "用户名",
pass VARCHAR(10) NOT NULL comment "密码"
)charset utf8;

--已有表设置自动增长，必须设置称为主键