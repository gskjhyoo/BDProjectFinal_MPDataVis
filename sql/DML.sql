select * from person;

-- �ڰ� DB ������ ���� ���� ��� 
show tables;
desc certification_db_layout
 select * from certification_db_layout
 -- ���� ī��Ʈ
 select c.sex, count(*) sex_count from  certification_db_layout c group by c.sex;
 SELECT COUNT(*) from  certification_db_layout C GROUP BY C.SEX;
 --���� ���ɴ� ī��Ʈ
 select c.AGE_GROUP, count(*) age_count from  certification_db_layout c group by c.AGE_GROUP order by AGE_GROUP;
 
 
 -- �ҵ���� ī��Ʈ
 select c.IPSN_TYPE_CD, count(*) sd_count from  certification_db_layout c group by c.IPSN_TYPE_CD;
 
 -- �Ƿ� ���� ���
 select count(*) from m_specification
 SELECT COUNT(*) FROM m_specification
 select * from  m_specification order by RECU_FR_DT
 
 -- ġ�� �ѹ� ���
 select count(*) from  dh_specification
 SELECT COUNT(*) FROM dh_specification
 select * from  dh_specification order by RECU_FR_DT -- ��¥ �� ����
 
 -- �౹
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

--# ������� ������ ���� 
-- �ǰ� ����
SELECT HC.HC_NAME, S.S_COUNT
FROM hc_code HC,
(SELECT DSBJT_CD, COUNT(*) AS S_COUNT FROM m_specification GROUP BY DSBJT_CD) S
WHERE HC.DSBJT_CD = S.DSBJT_CD
ORDER BY HC_NAME
-- ġ�� �ѹ�
SELECT HC.HC_NAME, S.S_COUNT
FROM hc_code HC,
(SELECT DSBJT_CD, COUNT(*) AS S_COUNT FROM dh_specification GROUP BY DSBJT_CD) S
WHERE HC.DSBJT_CD = S.DSBJT_CD
ORDER BY HC_NAME
---- �౹
--SELECT HC.HC_NAME, S.MS_COUNT
--FROM hc_code HC,
--(SELECT DSBJT_CD, COUNT(*) AS MS_COUNT FROM p_specification GROUP BY DSBJT_CD) S
--WHERE HC.DSBJT_CD = S.DSBJT_CD
--ORDER BY HC_NAME


--# ������ �ǰ�����|ġ���ѹ�|�౹ �Ǽ� ����
--�ǰ����� �õ� ����
SELECT (SELECT SC.SIDO_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) GU_NAME, COUNT(*) COUNT_TOTAL
FROM M_SPECIFICATION S, -- ���� �κ�
(SELECT PERSON_ID, SGG
FROM  certification_db_layout) CDBL
 WHERE S.PERSON_ID = CDBL.PERSON_ID
 GROUP BY GU_NAME
 ORDER BY SGG
 
 
-- SELECT CDBL.SGG,  (SELECT SC.SIDO_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) GU_NAME, COUNT(*) COUNT_TOTAL
--FROM M_SPECIFICATION S, -- ���� �κ�
--(SELECT PERSON_ID, SGG
--FROM  certification_db_layout) CDBL
-- WHERE S.PERSON_ID = CDBL.PERSON_ID
-- GROUP BY GU_NAME
-- ORDER BY SGG
 
 DESC certification_db_layout;
 
 SELECT * FROM SIDO_CODE;

-- �ǰ����� ����
SELECT SGG, (SELECT SC.GU_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) SGG_NAME, COUNT(CDBL.SGG)
FROM M_SPECIFICATION S,  -- ���� �κ�
(SELECT PERSON_ID, SGG
FROM  certification_db_layout) CDBL
 WHERE S.PERSON_ID = CDBL.PERSON_ID
 GROUP BY SGG
 ORDER BY SGG
 -- ġ���ѹ� ����
SELECT SGG, (SELECT SC.GU_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) SGG_NAME, COUNT(CDBL.SGG)
FROM DH_SPECIFICATION S, -- ���� �κ�
(SELECT PERSON_ID, SGG
FROM  certification_db_layout) CDBL
 WHERE S.PERSON_ID = CDBL.PERSON_ID
 GROUP BY SGG
 ORDER BY SGG
 -- �౹
SELECT SGG, (SELECT SC.GU_NAME FROM SIDO_CODE SC WHERE SC.SGG = CDBL.SGG) SGG_NAME, COUNT(CDBL.SGG)
FROM P_SPECIFICATION S, -- ���� �κ�
(SELECT PERSON_ID, SGG
FROM  certification_db_layout) CDBL
 WHERE S.PERSON_ID = CDBL.PERSON_ID
 GROUP BY SGG
 ORDER BY SGG

--# ���� ���ý� ���� ���� ��� (+A �ð���)
--�õ�
SELECT S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM M_SPECIFICATION S -- ���� ����
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE SIDO_NAME = '��⵵')) 
GROUP BY S.DSBJT_CD
ORDER BY HC_NAME
-- ġ�� ����
SELECT S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM DH_SPECIFICATION S -- ���� ����
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE SIDO_NAME = '����Ư����'))  
AND S.DSBJT_CD LIKE ('5%') -- ġ�� ���� ���� 
GROUP BY S.DSBJT_CD
ORDER BY HC_NAME
-- �ѹ� 
SELECT S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM DH_SPECIFICATION S -- ���� ����
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE SIDO_NAME = '����Ư����'))  
AND S.DSBJT_CD LIKE ('8%') -- �ѹ� ���� ���� 
GROUP BY S.DSBJT_CD
ORDER BY HC_NAME


-- �� ��
SELECT S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM M_SPECIFICATION S -- ���� ����
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE GU_NAME = '������')) 
GROUP BY S.DSBJT_CD
ORDER BY HC_NAME


--# �ð��� (+A �ð���)
-- ��ü
SELECT RECU_FR_DT, S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM M_SPECIFICATION S -- ���� ����
GROUP BY S.RECU_FR_DT, S.DSBJT_CD
ORDER BY S.RECU_FR_DT, S.DSBJT_CD
LIMIT 100

SELECT RECU_FR_DT, S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM DH_SPECIFICATION S -- ���� ����
GROUP BY S.RECU_FR_DT, S.DSBJT_CD
ORDER BY S.RECU_FR_DT, S.DSBJT_CD


-- �õ� ����
SELECT RECU_FR_DT, S.DSBJT_CD, (SELECT HC.HC_NAME FROM HC_CODE HC WHERE HC.DSBJT_CD = S.DSBJT_CD) HC_NAME, COUNT(*) TOTAL
FROM M_SPECIFICATION S -- ���� ����
WHERE S.PERSON_ID IN (SELECT PERSON_ID
FROM  certification_db_layout C WHERE C.SGG IN (SELECT SGG FROM SIDO_CODE WHERE SIDO_NAME = '����Ư����')) 
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