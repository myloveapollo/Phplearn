--���ݿ����ز���
--��¼
mysql -uroot -proot
--�������ݿ�
CREATE databases mydata charset utf8;
--�鿴���ݿ�
show databases mydata;
show databases LIKE "mydata%";
--�޸����ݿ�
ALTER DATABASE mydata charset gbk;
--�޸����ݿ�����,mysql��֧��ֱ���޸����ݿ����ƣ�ֻ���ȱ��ݣ���ɾ��ԭ�⣬�ڵ��뱸������
--ɾ�����ݿ�
DROP DATABASE mydata;


--���ݿⱸ���뻹ԭ����
--������Ҫ�õ�mysqldump.exe	��Ҫ������cmd
--�������ݿ⣬������Ҫ��;
mysqldump.exe -hlocalhost -P3306 -uroot -proot mydata1 > f:xuhaofeng/mysqldump_data/mydata1.sql
--�������ݱ�
mysqldump.exe -hlocalhost -P3306 -uroot -proot mydata my_class my_student > f:xuhaofeng/mysqldump_data/my_tables.sql

--��ԭ���ݿ� Ҳ��Ҫ������cmd������Ҫ��ǰ��Ҫ�ڵ�¼��mysql -uroot -proot ��cmd���洴��mydata�����ܽ����ݵ����ݿ⵼�롣�ﵽ�޸����Ƶ�Ŀ��
mysql -uroot -proot mydata < f:xuhaofeng/mysqldump_data/mydata1.sql

--��ԭ����Ҫ�ڵ�¼��mysql -uroot -proot ��¼��cmd������
source f:xuhaofeng/mysqldump_data/my_gbk_int.sql

--�û�����Ȩ�� mysql.user
--�鿴����Щ�û�, host��user�Ƿ�������
SELECT * FROM mysql.USER \G;
--�����û�
CREATE USER 'user1'@'%'identified BY '12345';
--ɾ���û�
DROP USER user1;
--�޸��û�����
SET password FOR 'user1'@'%' = password('654321');