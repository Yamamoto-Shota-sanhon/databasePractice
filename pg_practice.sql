-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
docker compose exec postgresql bash
psql -U postgres
postgres
CREATE DATABASE practice;
\c practice
-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
CREATE TABLE users(
id SERIAL NOT NULL,
name char(255) NOT NULL DEFAULT '',
age int NOT NULL DEFAULT 0,
gender char(20) NOT NULL DEFAULT 'Other' CHECK (gender IN ('Man', 'Woman', 'Other')),
PRIMARY KEY (id)
);
COMMENT ON COLUMN users.name IS '氏名';
COMMENT ON COLUMN users.age IS '年齢';
COMMENT ON COLUMN users.gender IS '性別';
-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
CREATE TABLE jobs(
id SERIAL NOT NULL,
user_id int NOT NULL,
name char(255) NOT NULL DEFAULT '会社員',
PRIMARY KEY (id),
CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id)
);
COMMENT ON COLUMN users.gender IS '仕事名';