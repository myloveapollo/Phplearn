
--�������
--������
CREATE TABLE my_foreign(
id INT PRIMARY KEY auto_increment,
name VARCHAR(10) NOT null,
class_id int,
FOREIGN KEY(class_id) REFERENCES my_class(class_id)
)charset utf8;

--�޸�my_student����class_id��Ϊ����ֶ�
ALTER TABLE my_student ADD CONSTRAINT `student_class_ibfk` FOREIGN KEY(class_id) REFERENCES my_class(class_id);