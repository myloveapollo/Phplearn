--�������
--�鿴���mysql�Ѿ��ṩʲô�洢����
show engines;

--��mysql��ǰĬ�˵�����
show variables LIKE "%storage_engine%";

--�޸ı�����ķ���
ALTER TABLE my_student engine=innodb;
