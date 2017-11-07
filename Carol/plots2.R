
library(ggplot2)



#plot positives versus negatives
ggplot(q1, aes(x = chapter, y = percent, fill=sentiment)) +geom_bar(stat='identity', color='black')+
  guides(fill=guide_legend(reverse=T)) +
  scale_fill_brewer(palette='Blues')+
  ggtitle("Sentiments Per Chapter")+
  ylab("Percentage") + 
  xlab("Chapter")+
  theme(plot.title = element_text(hjust = 0.5))

ggsave('Carol/graph/plot1.png')