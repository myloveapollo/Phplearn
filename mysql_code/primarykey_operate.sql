--�е��������� null ��default�� comment�� primary key��auto_increment��unique key��

--����������Ϊ�գ�ֵ����Ψһ��
--�������� 1���������ʱ�򴴽�
CREATE TABLE my_pri(
username VARCHAR(10) PRIMARY KEY
)charset utf8;

--��������
ALTER TABLE my_pri ADD PRIMARY KEY(username);
--ɾ������
ALTER TABLE my_pri DROP PRIMARY key;
--�������ʱ�򣬴�����������
CREATE TABLE my_auto(
student_no VARCHAR(10),
course_no VARCHAR(10),
score TINYINT NOT null,
PRIMARY KEY(student_no,course_no)
)charset utf8;


--�Զ����� �������ʱ���Զ�����
CREATE TABLE my_auto(
id INT PRIMARY KEY auto_increment,
name VARCHAR(10),
score TINYINT NOT NULL comment "�û���",
pass VARCHAR(10) NOT NULL comment "����"
)charset utf8;

--���б������Զ��������������ó�Ϊ����