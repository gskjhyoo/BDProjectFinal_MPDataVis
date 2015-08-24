# install.packages("DBI")
# install.packages("RMySQL")

library(RMySQL)
conn <- dbConnect(MySQL(),
                 dbname = 'r_mysql_test',
                 user = 'root',
                 password="cse12!@MS")

dbListTables(conn)
dim(dfPerson_ID)

dbWriteTable(conn, "person_id2", dfPerson_ID, overwrite = T, append = F, row.names=0, ) ## table from a data.frame
dbRollback(conn)

dfTestSpeci <- data.frame(dfData_p_specification$PERSON_ID, dfData_p_specification$KEY_SEQ)
names(dfTestSpeci) <- c('PERSON_ID','KEY_CODE')
dbWriteTable(conn, "specification", dfTestSpeci, overwrite = T, append = F, row.names=0) ## table from a data.frame
