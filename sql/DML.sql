select * from person;

-- 자격 DB 가지고 남자 여자 통계 
show tables;
desc certification_db_layout
 select * from certification_db_layout
 -- 성비 카운트
 select c.sex, count(*) sex_count from  certification_db_layout c group by c.sex;
 SELECT COUNT(*) from  certification_db_layout C GROUP BY C.SEX;
 --남여 연령대 카운트
 select c.AGE_GROUP, count(*) age_count from  certification_db_layout c group by c.AGE_GROUP order by AGE_GROUP;
 
 
 -- 소득분위 카운트
 select c.IPSN_TYPE_CD, count(*) sd_count from  certification_db_layout c group by c.IPSN_TYPE_CD;
 
 -- 의료 보건 통계
 select count(*) from m_specification
 SELECT COUNT(*) FROM m_specification
 select * from  m_specification order by RECU_FR_DT
 
 -- 치과 한방 통계
 select count(*) from  dh_specification
 SELECT COUNT(*) FROM dh_specification
 select * from  dh_specification order by RECU_FR_DT -- 날짜 순 정렬
 
 -- 약국
 desc p_specification
select count(*) from p_specification
SELECT COUNT(*) FROM p_specification
select * from  p_specification order by RECU_FR_DT
SELECT SUM( DMD_TRAMT) FROM p_specification
DMD_SBRDN_AMT
SELECT SUM( DMD_SBRDN_AMT) FROM p_specification


SELECT SUM( DMD_TRAMT) FROM m_specification
SELECT SUM( DMD_SBRDN_AMT) FROM m_specification


SELECT SUM( DMD_TRAMT) FROM dh_specification
SELECT SUM( DMD_SBRDN_AMT) FROM dh_specification


SHOW TABLES  

--# 진료과목별 데이터 갯수 
-- 의과 보건
SELECT HC.HC_NAME, S.S_COUNT
FROM hc_code HC,
(SELECT DSBJT_CD, COUNT(*) AS S_COUNT FROM m_specification GROUP BY DSBJT_CD) S
WHERE HC.DSBJT_CD = S.DSBJT_CD
ORDER BY HC_NAME
-- 치과 한방
SELECT HC.HC_NAME, S.S_COUNT
FROM hc_code HC,
(SELECT DSBJT_CD, COUNT(*) AS S_COUNT FROM dh_specification GROUP BY DSBJT_CD) S
WHERE HC.DSBJT_CD = S.DSBJT_CD
ORDER BY HC_NAME
---- 약국
--SELECT HC.HC_NAME, S.MS_COUNT
--FROM hc_code HC,
--(SELECT DSBJT_CD, COUNT(*) AS MS_COUNT FROM p_specification GROUP BY DSBJT_CD) S
--WHERE HC.DSBJT_CD = S.DSBJT_CD
--ORDER BY HC_NAME


--# 지역별 의과보건|치과한방|약국 건수 집계
--의과보건 시도 집계
SELECT (SELECT SC.SIDO_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) GU_NAME, COUNT(*) COUNT_TOTAL
FROM M_SPECIFICATION S, -- 명세서 부분
(SELECT PERSON_ID, SGG
FROM  certification_db_layout) CDBL
 WHERE S.PERSON_ID = CDBL.PERSON_ID
 GROUP BY GU_NAME
 ORDER BY SGG
 
 
-- SELECT CDBL.SGG,  (SELECT SC.SIDO_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) GU_NAME, COUNT(*) COUNT_TOTAL
--FROM M_SPECIFICATION S, -- 명세서 부분
--(SELECT PERSON_ID, SGG
--FROM  certification_db_layout) CDBL
-- WHERE S.PERSON_ID = CDBL.PERSON_ID
-- GROUP BY GU_NAME
-- ORDER BY SGG
 
 DESC certification_db_layout;
 
 SELECT * FROM SIDO_CODE;

-- 의과보건 집계
SELECT SGG, (SELECT SC.GU_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) SGG_NAME, COUNT(CDBL.SGG)
FROM M_SPECIFICATION S,  -- 명세서 부분
(SELECT PERSON_ID, SGG
FROM  certification_db_layout) CDBL
 WHERE S.PERSON_ID = CDBL.PERSON_ID
 GROUP BY SGG
 ORDER BY SGG
 -- 치과한방 집계
SELECT SGG, (SELECT SC.GU_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) SGG_NAME, COUNT(CDBL.SGG)
FROM DH_SPECIFICATION S, -- 명세서 부분
(SELECT PERSON_ID, SGG
FROM  certification_db_layout) CDBL
 WHERE S.PERSON_ID = CDBL.PERSON_ID
 GROUP BY SGG
 ORDER BY SGG
 -- 약국
SELECT SGG, (SELECT SC.GU_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) SGG_NAME, COUNT(CDBL.SGG)
FROM P_SPECIFICATION S, -- 명세서 부분
(SELECT PERSON_ID, SGG
FROM  certification_db_layout) CDBL
 WHERE S.PERSON_ID = CDBL.PERSON_ID
 GROUP BY SGG
 ORDER BY SGG

--# 지역 선택시 진료 과목 통계 (+A 시간별)
--시도
SELECT S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM M_SPECIFICATION S -- 명세서 종류
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE SIDO_NAME = '경기도')) 
GROUP BY S.DSBJT_CD
ORDER BY HC_NAME
-- 치과 제약
SELECT S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM DH_SPECIFICATION S -- 명세서 종류
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE SIDO_NAME = '서울특별시'))  
AND S.DSBJT_CD LIKE ('5%') -- 치과 제약 조건 
GROUP BY S.DSBJT_CD
ORDER BY HC_NAME
-- 한방 
SELECT S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM DH_SPECIFICATION S -- 명세서 종류
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE SIDO_NAME = '서울특별시'))  
AND S.DSBJT_CD LIKE ('8%') -- 한방 제약 조건 
GROUP BY S.DSBJT_CD
ORDER BY HC_NAME


-- 구 별
SELECT S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM M_SPECIFICATION S -- 명세서 종류
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE GU_NAME = '강동구')) 
GROUP BY S.DSBJT_CD
ORDER BY HC_NAME


--# 시간별 (+A 시간별)
-- 전체
SELECT RECU_FR_DT, S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM M_SPECIFICATION S -- 명세서 종류
GROUP BY S.RECU_FR_DT, S.DSBJT_CD
ORDER BY S.RECU_FR_DT, S.DSBJT_CD
LIMIT 100

SELECT RECU_FR_DT, S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM DH_SPECIFICATION S -- 명세서 종류
GROUP BY S.RECU_FR_DT, S.DSBJT_CD
ORDER BY S.RECU_FR_DT, S.DSBJT_CD


-- 시도 군별
SELECT RECU_FR_DT, S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM M_SPECIFICATION S -- 명세서 종류
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE SIDO_NAME = '서울특별시')) 
GROUP BY S.RECU_FR_DT, S.DSBJT_CD
44130
select * from sido_code where SGG like '4413%';

SELECT (SELECT SC.SIDO_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) GU_NAME, COUNT(*) COUNT_TOTAL
		FROM M_SPECIFICATION S, 
		(SELECT PERSON_ID, SGG
		FROM  certification_db_layout) CDBL
		 WHERE S.PERSON_ID = CDBL.PERSON_ID
		 GROUP BY GU_NAME
		 ORDER BY SGG