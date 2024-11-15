--other applications of much more advanced commands:  
-- using PARTITION BY
-- SELECT (...) LAST_VALUE (...) OVER (... AND ... OR ...) 
-- SELECT ((...) ORDER BY (...) AS RANKING ) AS TAB

--ZESTAW 9
SELECT ENAME, JOB, DEPTNO, SAL, RANK() OVER(ORDER BY SAL),
								DENSE_RANK() OVER (ORDER BY SAL)
FROM EMP
GO

SELECT ENAME, JOB, DEPTNO, SAL, RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL)
FROM EMP

SELECT ENAME, JOB, DEPTNO, SAL, PERCENT_RANK() OVER (ORDER BY SAL)
FROM EMP

SELECT ENAME, JOB, DEPTNO, SAL, NTILE(4) OVER (PARTITION BY DEPTNO ORDER BY SAL)
FROM EMP

SELECT ENAME, JOB, DEPTNO, SAL, LAG(SAL) OVER(ORDER BY SAL)
FROM EMP

SELECT ENAME, JOB, DEPTNO, SAL, SUM(SAL) OVER( ORDER BY SAL ROWS BETWEEN UNBOUNDED PRECEDING AND 1 FOLLOWING)
FROM EMP

SELECT ENAME, JOB, DEPTNO, SAL, MIN(SAL) OVER (PARTITION BY DEPTNO ORDER BY SAL) MINIMUM,
							    MAX(SAL) OVER( PARTITION BY DEPTNO ORDER BY SAL 
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) MAXIMUM
FROM EMP

SELECT ENAME, JOB, DEPTNO, SAL, LAST_VALUE(ENAME) OVER (PARTITION BY DEPTNO ORDER BY SAL ROWS BETWEEN UNBOUNDED PRECEDING
													AND UNBOUNDED FOLLOWING)

FROM EMP
--ZAD 11.1
SELECT SAL, JOB, DEPTNO, ENAME, DENSE_RANK() OVER(ORDER BY SAL DESC),
								DENSE_RANK() OVER (ORDER BY SAL)
FROM EMP
GO

--ZAD 11.2

SELECT *
FROM (
SELECT JOB, ENAME, HIREDATE, RANK() OVER (ORDER BY SAL) AS RANKING
FROM EMP)
AS TAB
WHERE RANKING <4

--ZAD 11.3

SELECT ENAME, JOB, DEPTNO, SAL,

MIN(SAL)  OVER (PARTITION BY DEPTNO ORDER BY SAL),
MAX(SAL)  OVER (PARTITION BY DEPTNO ORDER BY SAL),
AVG(SAL)  OVER (PARTITION BY DEPTNO ORDER BY SAL)
FROM EMP 