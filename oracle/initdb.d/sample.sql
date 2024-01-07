-- サンプルテーブル作成
CREATE TABLE EMPLOYEES (id NUMBER PRIMARY KEY, name VARCHAR2(100),department VARCHAR2(100));

-- データ挿入
INSERT INTO EMPLOYEES (id, name, department) VALUES (1, 'Baskhuu1', 'State-Development');
INSERT INTO EMPLOYEES (id, name, department) VALUES (2, 'Baskhuu2', 'State-Business');
INSERT INTO EMPLOYEES (id, name, department) VALUES (3, 'Baskhuu3', 'State-Business');
INSERT INTO EMPLOYEES (id, name, department) VALUES (4, 'Baskhuu4', 'State-Infra');
INSERT INTO EMPLOYEES (id, name, department) VALUES (5, 'Baskhuu4', 'State-Infra');
INSERT INTO EMPLOYEES (id, name, department) VALUES (6, 'Baskhuu5', 'State-Infra');
COMMIT;

-- データ取得
SELECT id, name, department FROM EMPLOYEES;