--�鿴����ϵͳ����
show variables;

--�鿴ϵͳ����
SELECT @@autocommit;

--�ֲ��Ự�޸�
SET autocommit = 0;

--ȫ���޸�ϵͳ���� @@�������global
SET global autocommit = 0;
SET @@auto_increment_increment = 2;

--�����û�����
SET @name := "hello world"

--ͨ����ѯ����Ϊ������ֵ,limit 1��ʾ�Ǹ�ֵ��һ�������limit max ��ʾ��ֵ�����һ����
SELECT @name := stu_name, @age := stu_age FROM my_student limit 10;

--ֻ�Ǹ�ֵ�����鿴���,������ȡ��ߵ����ߵ����������
SELECT stu_name, stu_age FROM my_student ORDER BY stu_height DESC limit 1 INTO @name, @age;

--�鿴�û��Զ������
SELECT @name,@age;