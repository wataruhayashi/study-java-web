-- データベースを作成
CREATE DATABASE jsp10;

-- SHOW DATABASES命令で確認
SHOW DATABASES;

-- 使用するデータベースを選択
USE jsp10;

-- 新規のテーブルを作成
CREATE TABLE members (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30), depart VARCHAR(20) DEFAULT '無所属', age INT, updated DATE);

-- SHOW TABLES命令で確認
SHOW TABLES;

-- SHOW FIELDS命令で確認
SHOW FIELDS FROM members;
