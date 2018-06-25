-- jsp10ユーザーを作成
GRANT all privileges ON jsp10.* TO jsp10@localhost IDENTIFIED BY 'jsp10';

-- データベースを確認
SHOW DATABASES; 

-- jsp10データベースに移動
USE jsp10;

-- データを挿入
INSERT INTO members (id, name, depart, age, updated) VALUES (1, '山田太郎', '営業部', 40, '2014-12-01');

INSERT INTO members (name, age) VALUES ('鈴木さくら', 25);

INSERT INTO members VALUES (3, '佐藤次郎', '人事部', 35, '2015-01-15');

-- データを検索
SELECT * FROM members ORDER BY id DESC;

-- データを更新
UPDATE members SET depart = '総務部', updated = '2015-02-02' WHERE id = 2;

-- データを削除
DELETE FROM members WHERE id = 3;


-- 【講義2】テーブルからデータを取り出す - SELECT命令

-- 一番簡単なSELECT命令
SELECT * FROM members;

-- 条件式でレコードを絞り込む
SELECT name FROM members WHERE id = 1;

-- 部分一致検索を実行
SELECT * FROM members WHERE name LIKE '%山%';

-- 範囲内のデータを取り出す
SELECT * FROM members WHERE updated BETWEEN '2014-01-01' AND '2014-12-31';

-- 値リストのいずれかに合致するレコードを取り出す
SELECT * FROM members WHERE depart IN ('人事部', '総務部');

-- 複数の条件式を組み合わせる
SELECT * FROM members WHERE depart = '無所属' AND updated IS NULL;
SELECT * FROM members WHERE depart = '無所属' OR updated IS NULL;

-- データを並べ替え
SELECT * FROM members ORDER BY age ASC;

-- データを集計
SELECT depart, AVG(age) FROM members GROUP BY depart;

-- 【練習問題 1】
-- （1）
INSERT INTO members (name, depart, age) VALUES ('鈴木うめ', '営業部', 22);

-- （2）
UPDATE members SET updated = '2015-04-01' WHERE name = '鈴木うめ';

-- （3）
DELETE FROM members WHERE name = '鈴木うめ';

-- 【練習問題 2】
-- （1）
SELECT name, depart FROM members WHERE depart IN ('無所属', '人事部');

-- （2）
SELECT depart, MAX(age) FROM members GROUP BY depart;

-- （3）
SELECT * FROM members WHERE depart <> '無所属' AND updated IS NOT NULL ORDER BY updated DESC, id ASC;