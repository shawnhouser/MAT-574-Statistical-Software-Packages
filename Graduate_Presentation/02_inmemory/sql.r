library(DBI)

# Connects to a database that isn't on the harddrive
# Useful for something that you do not want to deal
# with afterwards, or start with a clean slate each time
database <- dbConnect(RSQLite::SQLite(), ":memory:")

# mtcars is the cars dataset. It is already loaded
head(mtcars)
cat("\n")

# Stores the cars dataframe into a new table called mtcars
dbWriteTable(database, "mtcars", mtcars)

# Shows what the table looks like
dbListFields(database, "mtcars")
cat("\n")

res <- dbSendQuery(database, "SELECT * FROM mtcars WHERE cyl = 6")
dbFetch(res)