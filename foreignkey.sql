
--�������
--������
CREATE TABLE my_foreign(
id INT PRIMARY KEY auto_increment,
name VARCHAR(10) NOT null,
class_id int,
FOREIGN KEY(class_id) REFERENCES my_class(class_id)
)charset utf8;


INSERT INTO my_class VALUES ('15��'),('16��');

--�޸�my_student����class_id��Ϊ����ֶΣ�class_id������Ҫһֱ�������ֽ������Բ�һ��
ALTER TABLE my_student ADD CONSTRAINT `student_class_ibfk1` FOREIGN KEY(class_id) REFERENCES my_class(class_id);

--ɾ�����
ALTER TABLE my_student DROP FOREIGN KEY `student_class_ibfk`;

--ɾ����Ӧ����
ALTER TABLE my_student DROP INDEX `student_class_ibfk1`;


ALTER TABLE my_student DROP

INSERT INTO my_student VALUES ('stu0007','����',166,33,default,1,'2��');
--
ALTER TABLE my_student ADD id INT auto_increment PRIMARY key;

ALTER TABLE my_student DROP id;
ALTER TABLE my_student modify id INT first;
ALTER TABLE my_student modify stu_class VARCHAR(4) after stu_name;
