--���̿���if
SELECT * ,IF(stu_age > 20,'����','������') AS judge FROM my_student WHERE stu_age > 20;

--���Ӻ�������
IF �������ʽ THEN
	����������ִ�����
END if;

--����if���
IF �������ʽ THEN
	���������Ҫִ�е����
ELSE
	����������Ҫִ�е����
	IF �������ʽ THEN
		��������Ҫִ�е����
	END IF 
END IF 

--while ѭ��
--�����﷨
WHILE ���� do
	Ҫѭ��ִ�еĴ���
END WHILE 



��ʶ���֣�while ���� do
	IF �����ж� THEN
		ѭ������
		iterate/leave ��ʶ����
	END if
	ѭ����
END WHILE [��ʶ����]