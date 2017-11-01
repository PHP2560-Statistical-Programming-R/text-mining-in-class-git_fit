## This function takes the packages that our program needs. 
## It makes sure you have them on your computer before proceeding.
source("check_packages.R")
check_packages(c("plyr",
                 "dplyr",
                 "igraph",
                 "ggplot2",
                 "devtools",
                 "tidytext",
                 "stringer",
                 "reshape2",
                 "wordcloud",
                 "harrypotter"))

##Get the data
devtools::install_github("bradleyboehmke/harrypotter")
