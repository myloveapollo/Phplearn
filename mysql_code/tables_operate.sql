--���ݱ�Ĳ���
--�������ݱ�
CREATE TABLE mydata.my_class(
name VARCHAR(10),
id INT
)charset utf8;

--�鿴������������
show tables;
show tables LIKE "m%";
--�鿴��Ľṹ
DESC my_class;
--�鿴�����Ľṹ
show CREATE TABLE my_class;
--ɾ����
DROP TABLE my_class,my_student;
--�޸ı��ѡ��
ALTER TABLE my_class charset gbk;
--���ӱ���ֶ�
ALTER TABLE my_class ADD COLUMN stu_id INT first;
--�޸��ֶε���
ALTER TABLE my_class change stu_id id int;
--�޸��ֶε�����
ALTER TABLE my_class modify stu_id VARCHAR(4);
--ɾ���ֶ�
ALTER TABLE my_class DROP id;
--�����������
INSERT INTO my_class (stu_name, stu_id) VALUES ('jack',1), ('yuanheng', 2);
--�����ֶβ���
INSERT INTO my_class VALUES("��");
--�鿴������
SELECT * FROM my_class;
SELECT stu_name FROM my_class;
SELECT stu_name FROM my_class WHERE stu_id > 0;
--ɾ��ָ��������
DELETE FROM my_class WHERE stu_name = "jack";
--ɾ�����е�ȫ������
DELETE FROM my_class;
--ɾ��Ϊnull������ ������stu_name = null��������䡣
DELETE FROM my_class WHERE stu_name IS null;
--��������
UPDATE my_class SET stu_age = 28 WHERE stu_name = "jack";
