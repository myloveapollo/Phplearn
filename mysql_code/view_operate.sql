--��ͼ����

--������ͼ
CREATE VIEW student_class_v as
SELECT s.stu_name,c.incre_id FROM my_student AS s LEFT JOIN
my_class AS c
ON
s.class_id = c.class_id;

--�޸���ͼ
ALTER VIEW student_class_v as
SELECT s.stu_name,c.incre_id FROM my_student AS s LEFT JOIN
my_class AS c
ON
s.class_id = c.class_id;

--ʹ����ͼ
SELECT * FROM student_class_v1;

--ɾ����ͼ
DROP VIEW student_class_v1;