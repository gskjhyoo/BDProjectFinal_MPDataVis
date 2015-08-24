rm(list=ls())
library(RMySQL)
con <- dbConnect(MySQL(),
                 dbname = 'mpdatabase',
                 user = 'root',
                 password="cse12!@MS")

dbListTables(con)
dbListFields(con, "specification")
dbListFields(con, "person")

## 약국
#loading data
#WITHOUT PERSON
dfData_p_specification <- read.csv("./data/약국명세서.csv", head = T, sep = ',')
dfData_p_medical_detail <- read.csv('./data/약국진료내역.csv', head = T)

# dbWrite
dbWriteTable(con, "p_medical_detail", dfData_p_medical_detail, overwrite = T, row.names = F) ## table from a data.frame
dbWriteTable(con, "p_specification", dfData_p_specification, overwrite = T, row.names = F) ## table from a data.frame

## 의료보건
#loading data
dfData_m_sb_detail <- read.csv('./data/의료보건상병내역.csv')
dfData_m_pre_sub_detail <- read.csv('./data/의료보건처방전교부상세.csv')
dfData_m_medical_detail <- read.csv('./data/의료보건진료내역.csv')
dfData_m_specification <- read.csv('./data/의료보건명세서.csv')

# dbWrite
dbWriteTable(con, "m_sb_detail", dfData_m_sb_detail, overwrite = T, row.names = F) ## table from a data.frame
dbWriteTable(con, "m_medical_db_specifi_sub_detail", dfData_m_pre_sub_detail, overwrite = T, row.names = F) ## table from a data.frame
dbWriteTable(con, "m_medical_detail", dfData_m_medical_detail, overwrite = T, row.names = F) ## table from a data.frame
dbWriteTable(con, "m_specification", dfData_m_specification, overwrite = T, row.names = F) ## table from a data.frame

## 치과한방
dfData_dh_sb_detail <- read.csv('./data/치과한방상병내역.csv')
dfData_dh_pre_sub_detail <- read.csv('./data/치과한방처방전교부상세.csv')
dfData_dh_medical_detail <- read.csv('./data/치과한방진료내역.csv')
dfData_dh_specification <- read.csv('./data/치과한방명세서.csv')

# dbWrite
dbWriteTable(con, "dh_sb_detail", dfData_dh_sb_detail, overwrite = T, row.names = F) ## table from a data.frame
dbWriteTable(con, "dh_medical_db_specifi_sub_detail", dfData_dh_pre_sub_detail, overwrite = T, row.names = F) ## table from a data.frame
dbWriteTable(con, "dh_medical_detail", dfData_dh_medical_detail, overwrite = T, row.names = F) ## table from a data.frame
dbWriteTable(con, "dh_specification", dfData_dh_specification, overwrite = T, row.names = F) ## table from a data.frame

## 자격
#loading
dfData_certification <- read.csv('./data/자격.csv')
# dbWrite
dbWriteTable(con, "certification_db_layout", dfData_certification, overwrite = T, row.names = F) ## table from a data.frame


## 건강검진
#loading
dfData_health_screening <- read.csv('./data/건강검진.csv');
# dbWrite
dbWriteTable(con, "health_screenings", dfData_health_screening, overwrite = T, row.names = F);


### PERSON_ID 통합 이전 Commit 수행 
dbCommit(con)
## PERSON_ID 통합
PERSON_ID <- c(dfData_p_specification$PERSON_ID, # p
               dfData_m_specification$PERSON_ID, # m
               dfData_dh_specification$PERSON_ID,# dh
               dfData_health_screening$PERSON_ID,
               dfData_certification$PERSON_ID)# hs
length((PERSON_ID))
length()

dfPersonID <- data.frame(PERSON_ID)
dim(dfPersonID)
head(dfPersonID)
# 중복제거
PERSON_ID <- dfPersonID[!duplicated(dfPersonID$PERSON_ID),]
dfPersonID <- data.frame(PERSON_ID)
dim(dfPersonID)
head(dfPersonID)

# dbWrite
dbWriteTable(con, "person", dfPersonID, overwrite = T, row.names = F) ## table from a data.frame

### PERSON_ID 통합 이전 Commit 수행 
dbCommit(con)
