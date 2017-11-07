## clean all output from previous runs of scripts

unlink("./Joyce Elias/clean data", recursive = TRUE) # where the clean data is stored
unlink("./Joyce Elias/graph", recursive = TRUE) # where all the graphs are stored

# now re-create the results directory
dir.create(file.path("clean data"), showWarnings = FALSE)
dir.create(file.path("graph"), showWarnings = FALSE)

## run all scripts

source("./01_clean_data_harrypotter.R")   # load and clean the data 
source("./02_sentiment_analysis.R")     # use sentiment analysis to look at different questions and graph the analysis

rmarkdown::render("Sentiment Analysis.Rmd", output_format = "html_document")