--数据表的操作
--创建数据表
CREATE TABLE mydata.my_class(
name VARCHAR(10),
id INT
)charset utf8;

--查看表数量和名字
show tables;
show tables LIKE "m%";
--查看表的结构
DESC my_class;
--查看表创建的结构
show CREATE TABLE my_class;
--删除表
DROP TABLE my_class,my_student;
--修改表的选项
ALTER TABLE my_class charset gbk;
--增加表的字段
ALTER TABLE my_class ADD COLUMN stu_id INT first;
--修改字段的名
ALTER TABLE my_class change stu_id id int;
--修改字段的类型
ALTER TABLE my_class modify stu_id VARCHAR(4);
--删除字段
ALTER TABLE my_class DROP id;
--表里插入数据
INSERT INTO my_class (stu_name, stu_id) VALUES ('jack',1), ('yuanheng', 2);
--所有字段插入
INSERT INTO my_class VALUES("大");
--查看表数据
SELECT * FROM my_class;
SELECT stu_name FROM my_class;
SELECT stu_name FROM my_class WHERE stu_id > 0;
--删除指定的数据
DELETE FROM my_class WHERE stu_name = "jack";
--删除表中的全部数据
DELETE FROM my_class;
--删除为null的数据 不能用stu_name = null这样的语句。
DELETE FROM my_class WHERE stu_name IS null;
--更新数据
UPDATE my_class SET stu_age = 28 WHERE stu_name = "jack";
