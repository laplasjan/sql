CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY, -- Numer pracownika
    ENAME VARCHAR(50), -- Imię pracownika
    JOB VARCHAR(50), -- Stanowisko
    MGR INT, -- Numer menedżera
    HIREDATE DATE, -- Data zatrudnienia
    SAL DECIMAL(10, 2), -- Wynagrodzenie
    COMM DECIMAL(10, 2), -- Prowizja
    DEPTNO INT -- Numer działu

);CREATE TABLE DEPT (
    DEPTNO INT PRIMARY KEY, -- Numer działu
    DNAME VARCHAR(50), -- Nazwa działu
    LOC VARCHAR(50) -- Lokalizacja działu

);CREATE TABLE SALGRADE (
    GRADE INT PRIMARY KEY, -- Poziom wynagrodzenia
    LOSAL DECIMAL(10, 2), -- Dolna granica wynagrodzenia
    HISAL DECIMAL(10, 2) -- Górna granica wynagrodzenia

);INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) VALUES
(1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);