
--创建外键
--创建表
CREATE TABLE my_foreign(
id INT PRIMARY KEY auto_increment,
name VARCHAR(10) NOT null,
class_id int,
FOREIGN KEY(class_id) REFERENCES my_class(class_id)
)charset utf8;


INSERT INTO my_class VALUES ('15班'),('16班');

--修改my_student表，将class_id设为外键字段，class_id的类型要一直，但是字节数可以不一样
ALTER TABLE my_student ADD CONSTRAINT `student_class_ibfk1` FOREIGN KEY(class_id) REFERENCES my_class(class_id);

--删除外键
ALTER TABLE my_student DROP FOREIGN KEY `student_class_ibfk`;

--删除对应索引
ALTER TABLE my_student DROP INDEX `student_class_ibfk1`;


ALTER TABLE my_student DROP

INSERT INTO my_student VALUES ('stu0007','潇潇',166,33,default,1,'2班');
--
ALTER TABLE my_student ADD id INT auto_increment PRIMARY key;

ALTER TABLE my_student DROP id;
ALTER TABLE my_student modify id INT first;
ALTER TABLE my_student modify stu_class VARCHAR(4) after stu_name;
