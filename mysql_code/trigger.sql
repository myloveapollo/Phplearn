--���������������﷨
CREATE TRIGGER ���������� ����ʱ�� �����¼� ON �� FOR each row
BEGIN
END

--��������on �� for each row����������ʵ���Ǳ��е������У���˵�ÿһ�з���ָ��
--�ĸñ��ʱ�򣬾ͻᴥ��������
--����ʱ�� ��before �ڱ����ݷ����ñ�ǰ��״̬��after �ڱ��������Ѿ������ñ���״̬
--�����¼���insert ���������ʱ��;update��������;deleteɾ�����ݡ�
--ע�⣺һ�ű��Ӧ�Ĵ���������ֻ��һ������ˣ�һ�ű����Ĵ�����ֻ����6����before insert
-- before update��before delete��after insert��after update��after delete


--ʵ����������1��������
CREATE TABLE my_goods(
id INT PRIMARY KEY auto_increment,
name VARCHAR(20) NOT null,
inv INT
)charset utf8;

CREATE TABLE my_orders(
id INT PRIMARY KEY auto_increment,
goods_id INT NOT null,
goods_num INT NOT NULL
)charset utf8;

INSERT INTO my_goods VALUES(null, "�ֻ�",1000),(NULL, "����", 500),(null,"��Ϸ��",100);

--����������,order������������ݺ󣬴���gods����ֿ���-
delimiter $$
CREATE TRIGGER after_insert_order_t after INSERT ON my_orders FOR each row
BEGIN
	UPDATE my_goods SET inv = inv - new.goods_num WHERE id = new.goods_id;
END
$$
delimiter ;

INSERT INTO my_orders VALUES (null,1,1);

--��������order�����������ڿ�棬˵���ͻ��µĵ����ڿ��
--��Ҫ����һ��before�Ĵ�����
--ȡ������е������浽���������ڱȽ�
--�жϲ�����ֻ�ܱ������������д���������
delimiter $$
CREATE TRIGGER b_i_o_t before INSERT ON my_orders FOR each row
BEGIN
	SELECT inv FROM my_goods WHERE id = new.goods_id INTO @inv;
	IF @inv <new.goods_num THEN
		INSERT INTO xxx VALUES("xxx");
	END if;
END
$$
delimiter ;

INSERT INTO my_orders VALUES (null, 1, 1000);