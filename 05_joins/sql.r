paste("Starting at ", Sys.time())

# https://db.rstudio.com/databases/sqlite/
library(DBI)
database <- dbConnect(RSQLite::SQLite(), "/Users/shawn/Desktop/ssp_midterm/data/word_database.db")
res <- dbSendQuery(database, paste(
	"SELECT max(word_count), word_id, word",
	"FROM words",
	"INNER JOIN counts USING (word_id)"
))
max_word <- dbFetch(res)
paste(
	"The max word was `", max_word$word, "`",
	"with word_id", max_word$word_id,
	"and a count of", max_word$max
)

paste("Ending at ", Sys.time())
