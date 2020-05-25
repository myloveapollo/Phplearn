--引擎操作
--查看你的mysql已经提供什么存储引擎
show engines;

--看mysql当前默人的引擎
show variables LIKE "%storage_engine%";

--修改表引擎的方法
ALTER TABLE my_student engine=innodb;
