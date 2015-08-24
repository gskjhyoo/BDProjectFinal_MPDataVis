install.packages("DBI")
install.packages("RMySQL")

library(RMySQL)
con <- dbConnect(MySQL(),
                 dbname = 'mpdatabase',
                 user = 'root',
                 password="cse12!@MS")

# 
dbListTables(con)
dbListFields(con, "m_specification")

## 3. Import and export data.frames:
d <- dbReadTable(con, "specification")
# load dataframe
dfData <- read.csv("./약국명세.csv", head = T)
head(dfData)
tail(dfData)
# dbWriteTable 이용하여 삽입 수행
dbWriteTable(con, "specification", dfData, overwrite = T) ## table from a data.frame

##5. Run an SQL statement and extract its output in pieces (returns a result set)
## 데이터베이스로부터 데이터를 쿼리를 사용하여 가져옴 
## 데이터 형식은 DataFrame
#5.1 SendQurey 방식
rs <- dbSendQuery(con, "select count(*) from specification")
d1 <- fetch(rs, n = 10000)
d2 <- fetch(rs, n = -1) # 전체 fetch
class(d2) 
# > class(d2)
# [1] "data.frame"
#5.2 GetQuery 방식 - fetch 없이 사용가능
df.table <- dbGetQuery(con, "select * from specification")
head(df.table)
class(df.table)

# 7. Get meta-information on a connection (thread-id, etc.):
summary(MySQL(), verbose = TRUE)
summary(con, verbose = TRUE)
summary(rs, verbose = TRUE)
dbListConnections(MySQL())
dbListResultSets(con)
dbHasCompleted(rs)

# 8. Close connections:
# dbCommit() # 참고
# dbRollback() # 참고
# MySQL 확인 결과 dbWriteTable 결과는 AutoCommite 으로 사료
dbDisconnect(con) # disconnect


head(dfData_p_medical_detail$KEY_SEQ)
head(dfData_p_specification$KEY_SEQ)
