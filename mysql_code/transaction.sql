--事务

--查看事务变量
show variables LIKE "autocommit%";

--关闭自动事务
SET autocommit = 0;

--开启事务，相当于临时设置autocommit = 0等commit后恢复
--start transation 开启事务，从这个语句开始后面的语句都不会写入数据库，会保存在事务日志里
start transation;

--设置回滚点
savepoint sp1;

--回到回滚点
ROLLBACK TO sp1;