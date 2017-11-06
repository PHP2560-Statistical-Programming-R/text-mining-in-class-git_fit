# remove stop words
books_no_stop <- anti_join(books, stop_words)

# create directory for plots
dir.create("./maggie/plots/", showWarnings = FALSE)


# sentiment over time
afinn <- inner_join(my_book, get_sentiments("afinn"), by = "word")
scores <- afinn %>%
  group_by(chapter) %>%
  summarize(score = sum(score))


# create plot
png("./maggie/plots/sentiment_over_time.png", width = 650, height = 480)

ggplot(scores, aes(x = chapter, y = score)) +
  geom_hline(yintercept = 0, col = "red") +
  geom_line() +
  geom_smooth(method="loess", se = FALSE)

dev.off()


# most common words
most_common_words <- books_no_stop %>% 
  count(word, sort = TRUE) %>%
  head(10)

# anticipation tracking
nrc <- inner_join(books_no_stop, get_sentiments("nrc")) %>%
  filter(title == book_title, sentiment == "anticipation")
percents <- group_by(nrc, chapter) %>%
  summarize(n_anticipation = n())

total_words <- filter(books_no_stop, title == book_title) %>%
  group_by(chapter) %>%
  summarize(n_total = n())

percents <- mutate(percents, n_total = total_words$n_total, percent = n_anticipation/n_total)

# plot 
png("./maggie/plots/anticipation.png", width = 650, height = 480)
ggplot(percents, aes(x = chapter, y = percent)) +
  geom_line() +
  geom_smooth(method = "loess", se = FALSE)
def.off()

# word count per chapter
png("./maggie/plots/word_count.png", width = 650, height = 480)
filter(books_no_stop, title == book_title) %>%
  group_by(chapter) %>%
  summarize(word_count = n()) %>%
  ggplot(aes(chapter, word_count)) +
  geom_col()
dev.off()

# common characters
books_upper <- vector(mode = "list", length = 7)
for(i in 1:length(books_upper)){
  # convert text to dataframe
  data <- data_frame(text = book_names[[i]])
  # add column for chapter numbers and title of book
  data <- mutate(data, chapter = c(1:nrow(data)), title = names(book_names)[i])
  # split by word 
  data <- data %>%
    unnest_tokens(word, text, to_lower = FALSE, collapse = TRUE)
  # store clean data to list
  books_upper[[i]] <- data
}

# make one data frame from list of data frames
books_upper <- plyr::ldply(books_upper, data.frame)
books_upper <- anti_join(books_upper, stop_words)
my_book <- filter(books_upper, title == book_title)
upper_words <- str_subset(my_book$word, "^[A-Z]")
# separate words that are two words separated by a sentence
to_separate <- upper_words[grepl("[.]", upper_words)]
upper_words <- upper_words[!grepl("[.]", upper_words)]
upper_words <- c(upper_words, unlist(strsplit(to_separate, "[.]"))) 
upper_words <- tolower(upper_words)
upper_words <- gsub("'.*$", "", upper_words)
upper_words <- data.frame(title = rep(book_title, length(upper_words)), word = upper_words, stringsAsFactors = FALSE)
upper_words <- anti_join(upper_words, stop_words, by = "word")

characters <- upper_words %>%
  count(word, sort = TRUE) %>%
  head(10)
