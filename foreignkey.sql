
--创建外键
--创建表
CREATE TABLE my_foreign(
id INT PRIMARY KEY auto_increment,
name VARCHAR(10) NOT null,
class_id int,
FOREIGN KEY(class_id) REFERENCES my_class(class_id)
)charset utf8;

--修改my_student表，将class_id设为外键字段
ALTER TABLE my_student ADD CONSTRAINT `student_class_ibfk` FOREIGN KEY(class_id) REFERENCES my_class(class_id);