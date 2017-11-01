# remove stop words
books_no_stop <- anti_join(books, stop_words)


# sentiment over time
bing <- inner_join(books_no_stop, get_sentiments("bing")) %>%
  filter(title == book_title)

percents <- count(bing, title, chapter, sentiment) %>%
  group_by(chapter) %>%
  mutate(total_words = sum(n),
         percent = n / total_words)

ggplot(percents, aes(x = chapter, y = percent, col = as.factor(sentiment))) +
  geom_line() +
  geom_smooth(method = "loess", se = FALSE)