--����

--�����﷨
SELECT ������(�����б�);
--ϵͳ����
SELECT char_length("����й�"),length("����й�");

SELECT CONCAT('���','�й�'),instr('����й�','��'),instr('����й�','��');

SELECT lcase("aBcD"),LEFT("����й�",2);

SELECT LTRIM("  a bcd"),mid('����й�',2);

--ʱ�亯��
SELECT now(),curdate(),curtime();

SELECT DATEDIFF('2010-10-10','1990-10-10');

SELECT date_add('2000-10-10',interval 10 day),date_add('2000-10-10',interval 10 year),date_add('2000-10-10',interval 10 second);

SELECT unix_timestamp();

SELECT from_unixtime(1234567890);

SELECT md5('a'),VERSION(),DATABASE(),uuid();

--�����Զ��庯����û�в����ĺ���
delimiter $$
CREATE FUNCTION my_func1() returns INT
BEGIN
	RETURN 10;
END
$$
delimiter ;

CREATE FUNCTION my_func2() returns INT
RETURN 100;

--�鿴���к��������еĿ�����ĺ��������Բ鵽
show FUNCTION status \G;
show FUNCTION status LIKE 'my%' \G;

--�鿴�����������
show CREATE FUNCTION my_func1 \G;

--���ú���
SELECT my_func1(),my_func3(100,1000);

--ɾ������
DROP FUNCTION my_func2;

--�������������ۺϰ���:�����1��ʼ���ֱ���û�����Ķ�ӦֵΪֹ���������5�ı�������Ҫ��
--���1������������2����Ҫһ���βΣ�ȷ��Ҫ�ۼӵ�ʲôΪֹ��3����Ҫ����һ�����������Ӧ�����
--4���ڲ���Ҫһ��ѭ����ʵ�ֵ����ۼӡ�5��ѭ���ڲ���Ҫ���������жϿ��ƣ�5�ı�����
--�����������޸ĺ���������
--mysql ��û��++����
delimiter $$    --�޸Ľ�����ʾ��
CREATE FUNCTION my_sum(end_value int) returns INT   --�������� ���β���Ҫ�����������ͣ���Ҫ��������ֵ����
BEGIN
	DECLARE res INT DEFAULT 0;			-- ����һ������ ָ������������Ĭ��ֵ
	DECLARE i INT DEFAULT 1;
	mywhile:WHILE i <= end_value do  -- while��䣬��Ϊ����Ҫiterate���൱��break������Ҫȡ���� mywhile
		IF i % 5 = 0 THEN			-- if �ж����
			SET i = i + 1;			--mysql û���ԼӼ�++
			iterate mywhile;		--�൱��break
		END if;						--ifһ����Ҫ��end if 
		SET res = res + i;			--��������ֵ��set ����������declare
		SET i = i + 1;
	END WHILE mywhile;				--whileҪ��end while mywhile ��֮����
	RETURN res;						--����һ��Ҫ�з���ֵ
END									--begin��Ӧ��end
$$									--�޸ĵĽ�������
delimiter ;							--���������޸�Ϊԭ����;


mysql -uroot -proot

delimiter $$
CREATE FUNCTION my_sum(end_value INT) returns INT
BEGIN
	DECLARE res INT DEFAULT 0;
	DECLARE i INT DEFAULT 1;
	mywhile:WHILE i <= end_value do
				IF i % 5 = 0 THEN
					SET i = i + 1;
					iterate mywhile;
				END IF;
				SET res = res + i;
				SET i = i + 1;
	END WHILE mywhile;
	RETURN res;
END
$$
delimiter ;