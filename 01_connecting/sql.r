paste("Starting at ", Sys.time())

# https://db.rstudio.com/databases/sqlite/
library(DBI)
database <- dbConnect(RSQLite::SQLite(), "/Users/shawn/Desktop/ssp_midterm/data/word_database.db")
res <- dbSendQuery(database, "SELECT * FROM words ORDER BY word_id asc LIMIT 6")
dbFetch(res)

paste("Ending at ", Sys.time())
