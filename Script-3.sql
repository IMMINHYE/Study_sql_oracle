SELECT SAL
	FROM EMP e 
	WHERE ENAME = 'JONES'
	;
	
SELECT *
	FROM EMP e 
	WHERE HIREDATE < (SELECT HIREDATE
							FROM EMP
							WHERE ENAME = 'JONES')
	;
	
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC 
	FROM EMP E, DEPT D
	WHERE E.DEPTNO = D.DEPTNO 
	AND E.DEPTNO = 20
	AND E.SAL > (SELECT AVG(SAL)
					FROM EMP)
	;
	
--GROUP BY
--Q1~2. CARD 테이블에서 각 연체횟수마다 사람 수, '몇명' 컬럼의 값이 1명인 행 제외
SELECT 연체횟수, COUNT(*) AS 몇명
	FROM CARD c 
	GROUP BY 연체횟수
	HAVING COUNT(*) <> 1 
	ORDER BY 연체횟수
	;
	
--Q3. card 테이블에서 회원등급별로 최대사용금액과 최소사용금액이 몇배나 차이나는지 구하기
SELECT 고객등급, MAX(사용금액), MIN(사용금액), (MAX(사용금액)/MIN(사용금액))AS 차이  
	FROM CARD
	GROUP BY 고객등급
	ORDER BY MAX(사용금액) DESC
	;
	
--CASE 문법 
SELECT 고객명, 사용금액,
	CASE
	  WHEN 사용금액 >= 200000 THEN '우수고객님'
	  WHEN 사용금액 >= 100000 THEN '걍고객'
	  ELSE '손놈' 
	END AS 고객평가
	FROM CARD; 
	
--Q1. 등급이 vip인 사람들은 3점, 로열이면 2점, 패밀리면 1점으로 계산해서 모든 고객의 점수를 다 더하면 몇점일까요? 
SELECT SUM(
			CASE
				WHEN 고객등급 = 'vip' THEN 3
				WHEN 고객등급 = '로열' THEN 2
				ELSE 1
			END) AS 점수
	FROM CARD 
	;

--Q2. 사용금액 30만원 이상은 50% 증액, 30만원 미만은 10% 증액해서 사용금액의 총 합계를 출력
SELECT SUM(CASE 
			WHEN 사용금액 >= 300000 THEN 사용금액 * 1.5
			ELSE 사용금액 * 1.1
			END) AS 증액된_사용금액
	FROM CARD
	;
	
--Q3. 고객등급 재설정
SELECT 고객명, 변동된_고객등급
	FROM(
		SELECT 고객명,
		CASE 		
			WHEN 사용금액 >= 300000 THEN 'vip'
			WHEN 사용금액 >= 200000 THEN '로열'
			ELSE '패밀리'
		END AS 변동된_고객등급
		FROM CARD)
	;
	
--Q1
SELECT JOB, EMPNO, ENAME, SAL, DEPTNO
	FROM EMP
	WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN')
	;
	
--Q2
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL
	FROM EMP
	WHERE SAL > (SELECT AVG(SAL) FROM EMP)
	ORDER BY SAL DESC 
			, EMPNO 
	;
	
--Q3
SELECT EMPNO, ENAME, DEPTNO
	FROM EMP
	WHERE DEPTNO = 10
	AND JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 30)
	;
	
--Q4
SELECT EMPNO, ENAME, SAL
	FROM EMP 
	WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN')
	;