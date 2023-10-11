--Q1---------------------
--SELECT *
--	FROM PRODUCT p 
--	WHERE 재고 <= 20
--;
--Q2---------------------
--SELECT *
--	FROM PRODUCT p  
--	WHERE 가격 NOT BETWEEN 3000 AND 6000
--	;
----Q3-------------------
--SELECT *
--	FROM PRODUCT p  
--	WHERE NOT 카테고리 = '옷' AND 가격 = 5000
--;
--Q4---------------------
--SELECT *
--	FROM PRODUCT p  
--	WHERE NOT 상품명 IN ('셔츠', '반팔티', '운동화')
--;
-----------------------------
--Q1---------------------
--SELECT 상품명
--	FROM PRODUCT p 
--	WHERE 상품명 LIKE 'Green%chair'
--;
--Q2---------------------
--SELECT *
--	FROM PRODUCT p 
--	WHERE 상품명 lIKE '%소파%' OR 상품명 LIKE '%chair%'
--;
----Q3-------------------
SELECT *
	FROM PRODUCT p 
	WHERE 상품명 LIKE '%소파%' AND NOT 상품명 LIKE '%나무%'


