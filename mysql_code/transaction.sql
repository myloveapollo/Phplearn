--����

--�鿴�������
show variables LIKE "autocommit%";

--�ر��Զ�����
SET autocommit = 0;

--���������൱����ʱ����autocommit = 0��commit��ָ�
--start transation �������񣬴������俪ʼ�������䶼����д�����ݿ⣬�ᱣ����������־��
start transation;

--���ûع���
savepoint sp1;

--�ص��ع���
ROLLBACK TO sp1;