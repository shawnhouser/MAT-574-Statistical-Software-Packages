library(DBI)
library(readr)

database <- dbConnect(RSQLite::SQLite(), "/Users/shawn/Desktop/ssp_midterm/data/senators.db")
res <- dbSendQuery(database, read_file("/Users/shawn/Desktop/ssp_midterm/06_scripts/problem2.sql"))
dbFetch(res)
