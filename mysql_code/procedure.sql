--��򵥵Ĺ���
CREATE PROCEDURE my_pro()
SELECT * FROM my_student;

--���̴�������1��100�ĺ�
delimiter $$
CREATE PROCEDURE my_pro1()
BEGIN
	DECLARE i INT DEFAULT 1;
	SET @sum = 0;
	WHILE i <= 100 do
		SET @sum = @sum  + i;
		SET i = i + 1;
	END while;
	SELECT @sum;
END
$$
delimiter ;

--�鿴���й���
show PROCEDURE stauts [LIKE "parttern"];

--�鿴���̵Ĵ������
show CREATE PROCEDURE my_pro1 \G;

--���ù���,����û�з���ֵ�����Բ�����select
call my_pro1();

--ɾ������
DROP PROCEDURE my_pro1;