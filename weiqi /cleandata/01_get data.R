## This function takes the packages that our program needs. 
## It makes sure you have them on your computer before proceeding.
source("check_packages.r")
check_packages(c("plyr",
                 "dplyr",
                 "igraph",
                 "ggplot2",
                 "devtools",
                 "tidytext",
                 "reshape2",
                 "wordcloud"))

dir.create("data/", showWarnings = FALSE)
dir.create("graph/", showWarnings = FALSE)
dir.create("data/rawdata", showWarnings = FALSE)
dir.create("data/modifieddata", showWarnings = FALSE)

##Get the data
devtools::install_github("bradleyboehmke/harrypotter")
library(harrypotter)
library(wordcloud)

