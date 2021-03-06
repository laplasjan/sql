--other applications of much more advanced commands
-- ISNULL command
-- Select * FROM (...) AS (...) 
-- PIVOT (...) AS PVT
-- AVG

--ZAD 8.1
SELECT *, ISNULL([ANALYST], 0) + [CLERK]+ [MANAGER] + [PRESIDENT] + ISNULL([SALESMAN], 0)  AS TOTAL
FROM (SELECT DEPTNO, JOB, SAL FROM EMP) AS ZRODLO
PIVOT (
	SUM(SAL)
	FOR JOB IN ([ANALYST], [CLERK], [MANAGER], [PRESIDENT], [SALESMAN])
	)
AS PVT
WHERE ANALYST IS NULL

SELECT *
FROM (SELECT DEPTNO, JOB, SAL FROM EMP) AS ZRODLO
PIVOT (
	SUM(SAL) 
	FOR DEPTNO IN ( [10], [20], [30])
	) AS PVT 
GO
SELECT *
FROM (SELECT DNAME, JOB
		FROM DEPT JOIN EMP  ON DEPT.DEPTNO= EMP.DEPTNO) AS ZRODLO
PIVOT(
	COUNT(JOB)
	FOR JOB  IN ([ANALYST], [CLERK], [MANAGER], [PRESIDENT], [SALESMAN])
	)
AS PVT

--ZAD 8.3
SELECT * 
FROM (SELECT DNAME, JOB, SAL
		FROM DEPT JOIN EMP ON DEPT.DEPTNO= EMP.DEPTNO) AS ZRODLO
PIVOT(
	SUM(SAL)
	FOR JOB  IN ([ANALYST], [CLERK], [MANAGER], [PRESIDENT], [SALESMAN])
	)
AS PVT
--ZAD 8.2
SELECT * 
FROM (SELECT DNAME, JOB, SAL
		FROM DEPT JOIN EMP ON DEPT.DEPTNO= EMP.DEPTNO
		WHERE SAL> ( SELECT AVG(SAL)
					FROM EMP)
	 ) AS ZRODLO
PIVOT(
	AVG(SAL)
	FOR JOB  IN ([ANALYST], [CLERK], [MANAGER], [PRESIDENT], [SALESMAN])
	)
AS PVT

--ZAD 8.4 
SELECT DNAME, ISNULL(SUM([ANALYST]),0) ANALYST, ISNULL(SUM([CLERK]),0), ISNULL(SUM([MANAGER]),0), ISNULL(SUM([PRESIDENT]),0), ISNULL(SUM([SALESMAN]),0)
FROM (SELECT DNAME, JOB, SAL
		FROM DEPT JOIN EMP ON DEPT.DEPTNO= EMP.DEPTNO) AS ZRODLO
PIVOT(
	SUM(SAL)
	FOR JOB  IN ([ANALYST], [CLERK], [MANAGER], [PRESIDENT], [SALESMAN])
	)
AS PVT
GROUP BY GROUPING SETS( (DNAME, ANALYST, CLERK, MANAGER, PRESIDENT, SALESMAN))
