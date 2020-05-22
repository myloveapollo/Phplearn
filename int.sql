--创建数据表
create table my_int(
int_1 TINYINT unsigned,
int_2 smallint,
int_3 MEDIUMINT,
int_4 int,
int_5 bigint
)charset utf8;
--插入数据
INSERT INTO my_int VALUES(10 ,10000,100000,1000000,100000000000);
INSERT INTO my_int VALUES(255,10000,100000,1000000,100000000000);
INSERT INTO my_int VALUES(1,1,1,1,1);

--新增一个无符号的
ALTER TABLE my_int ADD int_8 TINYINT unsigned zerofill first;
--zerofill 默人就是unsigned