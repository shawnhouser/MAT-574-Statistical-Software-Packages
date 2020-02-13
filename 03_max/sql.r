paste("Starting at ", Sys.time())

# https://db.rstudio.com/databases/sqlite/
library(DBI)
database <- dbConnect(RSQLite::SQLite(), "/Users/shawn/Desktop/ssp_midterm/data/word_database.db")
res <- dbSendQuery(database, paste(
	"SELECT word_id, max(word_count)",
	"FROM counts"
))
max_word <- dbFetch(res)

# Doesn't work because `max(word_count)` changes the name of
# the row, you must either change the name here or in the query
paste("The max word_id was", max_word$word_id, "with a count of", max_word$word_count)
cat("\n")
paste("The max word_id was", max_word$word_id, "with a count of", max_word$max)

paste("Ending at ", Sys.time())
