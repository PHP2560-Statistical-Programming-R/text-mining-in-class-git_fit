load("data/rawdata/HP6.Rda")
Book6Anti <- Book6 %>% 
  inner_join(get_sentiments("nrc"))  %>%
  group_by(chapter) %>%
  count (sentiment) %>%
  filter(sentiment == "anticipation") 


png('graph/p4.png', width = 800, height = 500)

p4 <- ggplot(Book6Anti, aes(x=chapter, y=n)) +
  geom_col(show.legend = FALSE, 
           fill = "blue", 
           width  = 0.5)

print(p4 + theme(panel.grid.major = element_blank(), 
           panel.grid.minor = element_blank(),
           panel.background = element_blank(),
           axis.line = element_line(colour = "black"), 
           plot.title = element_text(hjust = 0.5) ) + 
  scale_x_continuous(breaks = c(1:30)) +
  scale_y_continuous(breaks = c(seq(0,180,by=20))) +
  ggtitle("Change of Emtion Anticipation in Half-Blood Prince") +
  labs(x="Chapter",y="Times of Anticipation"))


dev.off()


