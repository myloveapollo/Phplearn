--�������ݱ�
create table my_int(
int_1 TINYINT unsigned, --�޷�������
int_2 smallint,
int_3 mediumint,
int_4 int,
int_5 bigint
)charset utf8;
--��������
INSERT INTO my_int VALUES(10 ,10000,100000,1000000,100000000000);
INSERT INTO my_int VALUES(255,10000,100000,1000000,100000000000);
INSERT INTO my_int VALUES(1,1,1,1,1,1,1,1);

--����һ���޷��ŵ�
ALTER TABLE my_int ADD int_8 TINYINT unsigned zerofill first;
--zerofill Ĭ�˾���unsigned