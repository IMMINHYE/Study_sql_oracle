SELECT *
	FROM CARD c 
;

SELECT MAX(사용금액), AVG(연체횟수)
	FROM CARD c 
;

SELECT MAX(사용금액), AVG(연체횟수)
	FROM CARD c 
;

SELECT COUNT(사용금액)
	FROM CARD c 
;

SELECT SUM(사용금액) 
	FROM card 
	WHERE 고객등급 = 'vip' 
	;

SELECT AVG(연체횟수)
	FROM CARD c 
	;

SELECT DISTINCT 연체횟수
	FROM CARD c 
	ORDER BY 연체횟수
	;

--Q1
SELECT MAX(결제횟수) AS 최대결제횟수, MIN(연체횟수) AS 최소결제횟수
	FROM card c
	;
	
--Q2
SELECT AVG(결제횟수) AS VIP평균결제횟수, SUM(결제횟수) AS VIP총결제횟수
	FROM card c
	WHERE 고객등급 = 'vip'
	;
	
--Q3
SELECT COUNT (*)
	FROM card c
	WHERE 연체횟수 <= 1
	;
	
--사칙연산
select 사용금액 * 0.9 
	FROM card c
	;
select 사용금액 * 0.9 AS 부가세제외, 연체횟수 + 100 
	FROM card c
	;

--컬럼끼리의 연산
select 사용금액 / 결제횟수 
	FROM card c
	;

--문자합치기
SELECT CONCAT(고객명, 고객등급) 
	FROM CARD c 
	;	
SELECT 고객명 || 'is' || 고객등급
	FROM CARD c 
	;
	
--문자 공백 제거
SELECT TRIM(고객명)
	FROM CARD c 
	;
	
--단어 대체
SELECT 고객등급
	   ,REPLACE(고객등급, 'vip', 'vvip') AS 바뀐등급
	   FROM CARD c 
	   ;
	   
--원하는 문자만 뽑아내기
SELECT	SUBSTR(고객명, 1, 3)   
	FROM CARD c 
	;
	
--Q1. PRODUCT 테이블의 상품명 컬럼을 모든 공백을 제거
SELECT REPLACE (상품명, ' ', '') 
	FROM PRODUCT p 
	;
	

--Q2. EMPLOYEE 테이블에 번호 컬럼을 추가하고 핸드폰 번호를 무작위 입력 후 뒷 4자리만 출력
ALTER TABLE EMPLOYEE 
	ADD 번호 varchar(13)
	;

UPDATE EMPLOYEE 
	SET 번호 = '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(0,10000)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(0,10000)), 4, '0')
	;

SELECT SUBSTR(번호, -4) AS 뒷_4자리
	FROM EMPLOYEE
	;
	
--숫자 자료에 쓰는 함수
SELECT GREATEST(5, 3, 2, 1, 4) 
	FROM DUAL
	;
	
SELECT LEAST(5, 3, 2, 1, 4) 
	FROM DUAL
	;
	
--DUAL TABLE
 SELECT SYSDATE 
 	FROM DUAL
 	;
 	
-- FLOOR : 내림
SELECT FLOOR(10.1) FROM DUAL;
SELECT FLOOR(10.9) FROM DUAL;

--CEIL : 올림
SELECT CEIL(10.1) FROM DUAL;
SELECT CEIL(10.9) FROM DUAL;

--ROUND : 입력한 자릿수까지 반올림
SELECT ROUND(10.777, 2) FROM DUAL;

--TRUNC : 입력한 자릿수까지 내림
SELECT TRUNC(10.777, 2) FROM DUAL; 

--POWER : 거듭제곱
SELECT POWER(4, 2) FROM DUAL;

--ABS : 절댓값
SELECT ABS(-100) FROM DUAL;

--Sub Query
--Q. card테이블에서 사용금액의 평균보다 더 큰 사용금액을 가진 사람만 출력
SELECT *
	FROM CARD 
	WHERE 사용금액 > (SELECT AVG(사용금액) FROM CARD)
	;

--SELECT 안에 Sub Query
SELECT 사용금액 / (SELECT AVG(사용금액) FROM card) AS 평균사용금액
 	FROM card
 	;

-- IN( ) 안에 Sub Query
-- Q. card 테이블에서 블랙리스트 회원들의 사용금액을 출력
 SELECT 사용금액
 	FROM CARD
 	WHERE 고객명 IN (SELECT 이름 FROM BLACKLIST)
 	;
 	
-- Q1. "고객등급이 패밀리인 사람들의 평균 연체횟수"보다 연체횟수가 높은 사람의 수
 SELECT COUNT (*) AS 평균연체횟수_초과
 	FROM CARD
 	WHERE 연체횟수 > (SELECT AVG(연체횟수) FROM CARD WHERE 고객등급 = '패밀리')
 	;
 
-- Q2. 개인의 사용금액과 평균사용금액의 차이
 SELECT 사용금액 - (SELECT AVG(사용금액) FROM CARD) AS 사용금액_평균_차이
	FROM CARD 
	;
	
--DECODE 함수
SELECT DECODE(근무기간  , 5, '왕고' , 4, '중간다리' , '막내')
	FROM EMPLOYEE
	;