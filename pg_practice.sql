-- PostgreSQL practice SQL
-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
CREATE DATABASE practice;
-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL DEFAULT '名無し',
  age INT NOT NULL DEFAULT 0,
  gender VARCHAR(10) NOT NULL DEFAULT 'Other'
   CHECK (gender IN ('Man', 'Woman', 'Other'))
);

-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL DEFAULT '会社員',
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id)
);
