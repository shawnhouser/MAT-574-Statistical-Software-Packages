paste("Starting at ", Sys.time())

counts <- read.csv("/Users/shawn/Desktop/ssp_midterm/data/counts.csv")
words <- read.csv("/Users/shawn/Desktop/ssp_midterm/data/words.csv")

# https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/merge
# https://stackoverflow.com/questions/1299871/how-to-join-merge-data-frames-inner-outer-left-right
words_and_counts <- merge(counts, words, by = "word_id")
max_word <- words_and_counts[which.max(words_and_counts$word_count), ]
paste(
	"The max word was `", max_word$word, "`",
	"with word_id", max_word$word_id,
	"and a count of", max_word$word_count
)

paste("Ending at ", Sys.time())
