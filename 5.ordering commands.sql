-- using order at comands ( FROM and JOINs > WHERE > GROUP BY > HAVING > SELECT > DISTINCT > ORDER BY > LIMIT / OFFSET)

--ZAD 5.1
 SELECT JOB, ENAME, SAL
 FROM EMP E
 WHERE SAL = (SELECT MAX(SAL)
			FROM EMP
			WHERE JOB= E.JOB )
ORDER BY SAL
 
 --ZAD 5.2
 SELECT JOB, ENAME, SAL
 FROM EMP E
 WHERE SAL = (SELECT MIN(SAL)
			FROM EMP
			WHERE JOB= E.JOB )
ORDER BY SAL

--ZAD 5.3
SELECT DEPTNO, ENAME, HIREDATE
FROM EMP E
WHERE HIREDATE = (SELECT MAX(HIREDATE)
				FROM EMP
				WHERE JOB= E.JOB
				)
ORDER BY HIREDATE

--ZAD 5.4
SELECT ENAME, SAL, DEPTNO
FROM EMP E
WHERE SAL > (SELECT AVG(SAL)
			FROM EMP
			WHERE DEPTNO= E.DEPTNO
			)
ORDER BY DEPTNO

--ZAD 5.5

SELECT DEPTNO, DNAME
FROM DEPT D
WHERE NOT EXISTS (SELECT ENAME 
				FROM EMP E
				WHERE E.DEPTNO=D.DEPTNO)
				ORDER BY DEPTNO;
--ZAD 5.6

SELECT ENAME, (SELECT  GRADE 
					FROM SALGRADE
					WHERE  SAL BETWEEN LOSAL AND HISAL)
FROM EMP

--ZAD 5.7
SELECT DNAME, JOB, COUNT(JOB)
FROM (SELECT *  FROM EMP E WHERE SAL >(SELECT AVG(SAL)
						FROM EMP
						WHERE DEPTNO= E.DEPTNO)
) TAB RIGHT JOIN DEPT  ON TAB.DEPTNO=DEPT.DEPTNO
GROUP BY DNAME, JOB

--zad5.7
SELECT ENAME, JOB, DEPTNO, SAL, EMPNO
FROM  EMP 
WHERE JOB= (SELECT JOB FROM EMP WHERE EMPNO = 7369) AND SAL >= (SELECT SAL FROM EMP WHERE EMPNO = 7876)
			

-- ZAD 5.8
SELECT DNAME, JOB
FROM DEPT JOIN EMP ON DEPT.DEPTNO= EMP.DEPTNO
WHERE JOB= 'CLERK'

-- ZAD 5.9
SELECT ENAME, SAL, AVG(SAL)
FROM EMP
GROUP BY SAL, ENAME
 --ZAD 5.10
 SELECT 

 CASE
 WHEN 1> 2 THEN T
 WHEN 2>1 THEN F
 END

 --ZAD 5.12
 SELECT DNAME
 FORMAT (COUNT(*)*1.0/LICZBA_PRAC, 'P'),
FORMAT (SUM(SAL) *1.0/SUMA_ZAR, 'P')
FROM EMP JOIN DEPT ON DEPT.DEPTNO=EMP.EMPNO,
(SELECT COUNT(*) LICZBA_PRAC, SUM(SAL) SUMA_ZAR FROM EMP) TAB 
GROUP BY DNAME, LICZBA_PRAC, SUMA_ZAR
