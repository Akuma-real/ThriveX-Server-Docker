#!/bin/bash

# 等待MySQL服务启动
echo "Waiting for MySQL to start..."
while ! mysqladmin ping -h"mysql" -P"3306" -u"root" -p"123456" --silent; do
    sleep 1
done

echo "MySQL is ready"

# 下载SQL文件
echo "Downloading SQL file..."
curl -L -o /tmp/ThriveX.sql https://raw.githubusercontent.com/LiuYuYang01/ThriveX-Server/refs/heads/master/ThriveX.sql

# 导入数据库
echo "Importing database..."
mysql -h mysql -P 3306 -u root -p123456 thrivex < /tmp/ThriveX.sql

# 删除临时SQL文件
rm /tmp/ThriveX.sql

echo "Database import completed" 