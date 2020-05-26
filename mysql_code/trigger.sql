--创建触发器基本语法
CREATE TRIGGER 触发器名字 触发时机 触发事件 ON 表 FOR each row
BEGIN
END

--触发对象：on 表 for each row，触发器绑定实质是表中的所有行，因此当每一行发生指定
--的该变的时候，就会触发触发器
--触发时机 ：before 在表数据发生该变前的状态。after 在表中数据已经发生该变后的状态
--触发事件：insert 插入操作的时候;update更新数据;delete删除数据。
--注意：一张表对应的触发器类型只有一个。因此，一张表最多的触发器只能有6个：before insert
-- before update、before delete、after insert、after update、after delete


--实例触发器。1、创建表
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

INSERT INTO my_goods VALUES(null, "手机",1000),(NULL, "电脑", 500),(null,"游戏机",100);

--创建触发器,order表里面插入数据后，触发gods表里仓库数-
delimiter $$
CREATE TRIGGER after_insert_order_t after INSERT ON my_orders FOR each row
BEGIN
	UPDATE my_goods SET inv = inv - new.goods_num WHERE id = new.goods_id;
END
$$
delimiter ;

INSERT INTO my_orders VALUES (null,1,1);

--如果插入的order表中数量大于库存，说明客户下的单大于库存
--需要创建一个before的触发器
--取出库存中的数量存到变量中用于比较
--中断操作：只能暴力解决，主动写出错误语句
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