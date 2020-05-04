<?php

error_reporting(E_ALL);

//连接mysql
try {
    $db = new PDO('mysql:host=172.19.0.4;dbname=test', 'root', '12345678');
    var_dump('数据库连接成功');
    foreach ($db->query('select * from test') as $row) {
        print_r($row);
    }
    $db = null; //关闭数据库
} catch (PDOException $e) {
    echo $e->getMessage();
}


//连接redis
$redis = new Redis();
$redis->connect('172.19.0.4', 6379);
$redis->auth('123456');
$key = 'name';
$redis->set($key, 'hello world');
echo $redis->get($key);
