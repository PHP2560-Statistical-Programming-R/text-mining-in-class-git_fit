source("./maggie/check_packages.R")
check_packages(c("devtools","dplyr","plyr","stringr", "tidytext", "rebus", "ggplot2"))

# get data
devtools::install_github("bradleyboehmke/harrypotter")
library(harrypotter)

# load packages
library(dplyr)
library(tidytext)
library(stringr)
library(ggplot2)
library(rebus)

# create vector of book names
book_names <- list(philosophers_stone, chamber_of_secrets, prisoner_of_azkaban, goblet_of_fire, order_of_the_phoenix, half_blood_prince, deathly_hallows)
names(book_names) <- c("philosophers_stone", "chamber_of_secrets", "prisoner_of_azkaban", "goblet_of_fire", "order_of_the_phoenix", "half_blood_prince", "deathly_hallows")

# clean data
books = vector(mode = "list", length = 7)
for(i in 1:length(books)){
  # convert text to dataframe
  data <- data_frame(text = book_names[[i]])
  # add column for chapter numbers and title of book
  data <- mutate(data, chapter = c(1:nrow(data)), title = names(book_names)[i])
  # split by word and remove punctuation
  data <- data %>%
    unnest_tokens(word, text, to_lower = TRUE)
  # store clean data to list
  books[[i]] <- data
}

# make one data frame from list of data frames
books <- plyr::ldply(books, data.frame)


dir.create("./maggie/data/", showWarnings = FALSE)
save(books, file = "./maggie/data/books.Rda")
