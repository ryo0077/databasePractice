-- PostgreSQL practice SQL
-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
CREATE DATABASE practice;
-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL DEFAULT '',
  age INT NOT NULL DEFAULT '',
  gender VARCHAR(10) NOT NULL DEFAULT 'Other'
   CHECK (gender IN ('Man', 'Woman', 'Other'))
);
COMMENT ON TABLE users IS 'ユーザー情報を管理するテーブル';

COMMENT ON COLUMN users.id IS '主キー（自動採番）';
COMMENT ON COLUMN users.name IS 'ユーザー名。デフォルトは空文字';
COMMENT ON COLUMN users.age IS '年齢。デフォルトは空文字';
COMMENT ON COLUMN users.gender IS '性別。Man/Woman/Other のみ許可';
-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL DEFAULT '',
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id)
);
COMMENT ON TABLE jobs IS 'ユーザーの職業情報を管理するテーブル';

COMMENT ON COLUMN jobs.id IS '主キー（自動採番）';
COMMENT ON COLUMN jobs.user_id IS 'usersテーブルのidを参照する外部キー';
COMMENT ON COLUMN jobs.name IS '職業名。デフォルトは空文字';
COMMENT ON CONSTRAINT fk_user_id ON jobs IS 'users.id を参照する外部キー制約';
