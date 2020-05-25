--视图操作

--创建视图
CREATE VIEW student_class_v as
SELECT s.stu_name,c.incre_id FROM my_student AS s LEFT JOIN
my_class AS c
ON
s.class_id = c.class_id;

--修改视图
ALTER VIEW student_class_v as
SELECT s.stu_name,c.incre_id FROM my_student AS s LEFT JOIN
my_class AS c
ON
s.class_id = c.class_id;

--使用视图
SELECT * FROM student_class_v1;

--删除视图
DROP VIEW student_class_v1;