load("data/rawdata/HP6.Rda")

png('graph/p6.png', width = 550, height = 550)

colorPalette="Dark2"
p6 <- Book6 %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100, scale=c(10,0.8),random.order = TRUE, random.color = FALSE, colors= c("indianred1","indianred2","indianred4","indianred")))
print(p6)
dev.off()

