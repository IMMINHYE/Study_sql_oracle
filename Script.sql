SELECT *
	FROM PROGRAM p 
	LEFT JOIN TEACHER t 
		ON P.강사ID = T.ID 

SELECT *
	FROM PROGRAM p 
	RIGHT JOIN TEACHER t 
		ON P.강사ID = T.ID 

SELECT *
	FROM PROGRAM p 
	FULL JOIN TEACHER t 
		ON P.강사ID = T.ID 
		
SELECT *
	FROM PROGRAM p 
	inner JOIN TEACHER t 
		ON P.강사ID = T.ID 
	
------------------------------

SELECT *
	FROM SALES s 
	RIGHT JOIN ITEM i 
		ON S.상품ID = I.ID 
	WHERE S.ID IS NULL	

SELECT *
	FROM SALES s 
	RIGHT JOIN USER_TABLE ut 
		ON S.고객번호 = UT.ID 
	WHERE S.고객번호 IS NULL
	
-----------------------------
	
CREATE TABLE temp (
  id NUMBER(38,0) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  상품명 varchar(100),
  가격 NUMBER(38,0)
) 

INSERT INTO TEMP t (상품명, 가격)
VALUES (' ', 0);

SELECT * FROM TEMP t 

INSERT INTO TEMP t (상품명, 가격)
SELECT 상품명, 가격
	FROM ITEM 
	;
	
CREATE TABLE TEMP2 AS
SELECT *
	FROM TEMP t 
	;
	
UPDATE TEMP2 
	SET 가격 = 가격 + 2000
WHERE id = 10
;	

SELECT * FROM TEMP2; 

DELETE FROM TEMP2 t WHERE 상품명 = ' '

-------------------------------------------

CREATE VIEW VW_SALES_ITEM AS
SELECT S.ID
	FROM SALES S 
	INNER JOIN ITEM I 
		ON S.상품ID = I.ID
		;
	
SELECT * FROM VW_SALES_ITEM 

-------------------------------------------

INSERT INTO DATE_TABLE dt VALUES('2023-10-16 12:23:45')

SELECT *
	FROM BLOG b 
WHERE 발행일 > '2022-03-10 08:24:25'

SELECT * 
	FROM blog 
WHERE 발행일 = '2022-03-10 08:24:25' 

SELECT * 
	FROM blog 
WHERE 발행일 >= '2022-03-10 00:00:00' 
  AND 발행일 < '2022-03-11 00:00:00' 
  
 SELECT * FROM blog 
WHERE 발행일 > '2022-03-10 00:00:00'
  AND 발행일 < TO_CHAR(SYSDATE)
ORDER BY 발행일 DESC

SELECT SYSDATE
	  ,TO_CHAR(SYSDATE, 'MONTH' , 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR
	  ,TO_CHAR(SYSDATE, 'MONTH' , 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
	  ,TO_CHAR(SYSDATE, 'MONTH' , 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN
	  ,TO_CHAR(SYSDATE, 'MONTH' , 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR
	FROM DUAL;

-------------------------------------------

--Q1. 2022년 11월의 월간 액티브 유저 (MAU) 수를 구해보십시오. 

SELECT COUNT(*) AS MAU
	FROM LOGIN_RECORD lr 
WHERE TO_CHAR(LAST_LOGIN, 'YYYY-MM') = '2022-11'

--Q2. 날짜시간을 조작하고 싶습니다.

UPDATE LOGIN_RECORD 
	SET LAST_LOGIN = LAST_LOGIN + INTERVAL '1' HOUR;

SELECT *
	FROM LOGIN_RECORD 
	
--Q3. 9월의 짝수일에 해당하는 행만 출력해보고 싶은데 어떻게할까요? 

SELECT *
FROM LOGIN_RECORD 
WHERE TO_CHAR(LAST_LOGIN, 'MM') = '09'
AND MOD(TO_NUMBER(TO_CHAR(LAST_LOGIN , 'DD')),2) = 0;





























