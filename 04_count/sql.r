library(DBI)

database <- dbConnect(RSQLite::SQLite(), ":memory:")
dbWriteTable(database, "mtcars", mtcars)
res <- dbSendQuery(database, paste(
	"SELECT count(*)",
	"FROM mtcars",
	"WHERE cyl = 6"
))
dbFetch(res)