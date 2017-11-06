load("data/rawdata/HP6.Rda")

Book6Char <- Book6  %>%
  group_by(word) %>%
  select(word) %>%
  filter(word == "harry" | 
           word == "ron" | 
           word == "hermione" | 
           word == "dumbledore" |
           word == "voldemort" | 
           word == "dobby") %>%
  count (word, sort = TRUE) %>%
  arrange (desc(n))

save(Book6, file = "data/modifieddata/HPChar.Rda")


png('graph/p2.png', width = 800, height = 500)

p2 <- ggplot(Book6Char, aes(x=word, y=n)) +
  geom_col(show.legend = FALSE, fill = "lightblue", width  = 0.5)

print (p2 +  theme(panel.grid.major = element_blank(), 
            panel.grid.minor = element_blank(),
            panel.background = element_blank(),
            axis.line = element_line(colour = "black"), 
            plot.title = element_text(hjust = 0.5) ))

dev.off()


