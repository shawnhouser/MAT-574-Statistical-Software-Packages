paste("Starting at ", Sys.time())

counts <- read.csv("/Users/shawn/Desktop/ssp_midterm/data/counts.csv")
max_word <- counts[which.max(counts$word_count), ]
paste("The max word_id was", max_word$word_id, "with a count of", max_word$word_count)

paste("Ending at ", Sys.time())
