--having 语法
SELECT class_id, COUNT(*) AS number FROM my_student GROUP BY class_id HAVING number >=4;
SELECT class_id, COUNT(*) AS number FROM my_student GROUP BY class_id HAVING COUNT(*) >=4;

INSERT INTO my_student VALUES ('stu0006','小江',16,2,166,2);

SELECT 字段名1 AS 命名1，字段名2 AS 命名2 FROM 表名 GROUP BY 字段名 HAVING 条件; 

--group by 与 order by
SELECT * FROM my_student GROUP BY stu_height asc;
SELECT * FROM my_student GROUP BY stu_age asc;
SELECT * FROM my_student ORDER BY stu_age ASC,
SELECT * FROM my_student ORDER BY stu_height asc,stu_age ASC; --order by 优先满足字段1规则



