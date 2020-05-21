--插入多个值
INSERT INTO my_gbk(name) VALUES ("张三1"),("王五");

CREATE TABLE my_student(
stu_id VARCHAR(10) PRIMARY KEY comment "主键，学生ID",
stu_name VARCHAR(10) NOT NULL comment "学生姓名"
)charset utf8;

INSERT INTO my_student VALUES 
('stu0001','张三'),
('stu0002','张四'),
('stu0003','张五'),
('stu0004','张六');

INSERT INTO my_student VALUES('stu0004','晓婷');
INSERT INTO my_student VALUES('stu0004','晓婷') ON duplicate KEY UPDATE stu_name = "晓婷";

REPLACE INTO my_student VALUES('stu0001','夏洛');

CREATE TABLE my_simple(
name VARCHAR(1) NOT null
)charset utf8;

INSERT INTO my_simple VALUES ("a"), ('b'), ('c'), ('d');
--蠕虫复制
INSERT INTO my_simple(name) SELECT name FROM my_simple; 

UPDATE my_simple SET name = 'e' WHERE name = 'a' limit 4;


TRUNCATE my_auto;

SELECT ALL * FROM my_simple --等价于select * from my_simple
SELECT DISTINCT * FROM my_simple; --去重查询

SELECT DISTINCT name AS name1, name AS name2 FROM my_simple ; --去重查询

SELECT * FROM my_auto, my_gbk;

SELECT * FROM (SELECT stu_name,stu_age FROM my_student) AS name_age;

SELECT * FROM my_student GROUP BY class_id;

DELETE FROM my_student WHERE class_id IS null;

ALTER TABLE my_student ADD class_id INT auto_increment PRIMARY key;

ALTER TABLE my_student ADD stu_age int;
ALTER TABLE my_student ADD stu_height TINYINT unsigned;

UPDATE my_student SET stu_age = 20, stu_height = 165 WHERE stu_id = "stu0002";
UPDATE my_student SET stu_age = 22, stu_height = 187 WHERE stu_id = "stu0003";
UPDATE my_student SET stu_age = 25, stu_height = 189 WHERE stu_id = "stu0004";

SELECT class_id,COUNT(*), MAX(stu_age), MIN(stu_height), AVG(stu_age) FROM my_student GROUP BY class_id;

SELECT class_id,group_concat(stu_name),COUNT(*), MAX(stu_age), MIN(stu_height), AVG(stu_age) FROM my_student GROUP BY class_id;
ALTER TABLE my_student ADD COLUMN gender enum("男","女","保密");
UPDATE my_student SET gender = 1 WHERE stu_id IN('stu0001', "stu0003");
UPDATE my_student SET gender = 2 WHERE stu_id IN('stu0002', "stu0004");
INSERT INTO my_student VALUES("stu0005","小猪",1,"30",173,2);
UPDATE my_student SET stu_age = 30,class_id = 2 WHERE stu_name = "小猪";	

SELECT class_id,gender,group_concat(stu_name) FROM my_student GROUP BY class_id,gender;  --选择class_id，gender，拼接stu_name显示出来从my_student表中；并按class_id和性别归类。
SELECT class_id,gender,group_concat(stu_name) FROM my_student GROUP BY class_id;
SELECT class_id,COUNT(*),gender,group_concat(stu_name) FROM my_student GROUP BY class_id,gender;--多分组

--分组排序
SELECT class_id,gender, COUNT(*),group_concat(stu_name) FROM my_student GROUP BY class_id asc,gender desc;

