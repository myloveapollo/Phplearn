--字符集操作
--有三个运行端字符集 client, server ,collection
--设置字符集cmd
SET names utf8;
--查看字符集变量
show variables LIKE "character_set%";
--设置字符集，在三个不同的环境
SET character_set_client = gbk;
SET character_set_results = gbk;
SET character_set_connection = gbk;
