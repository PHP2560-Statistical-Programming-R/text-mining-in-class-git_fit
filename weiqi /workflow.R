## clean all output from previous runs of scripts
## there is one final we create in the main directory (the processed dataset),
## but the rest of the output is all in the 'results' directory
unlink("data", recursive = TRUE) # where data is stored after clean
unlink("graph", recursive = TRUE) # where graphs are stores
unlink("data/rawdata", recursive = TRUE)
unlink("data/modifieddata", recursive = TRUE)

# now re-create the results directory
dir.create(file.path("graph"), showWarnings = FALSE)
dir.create(file.path("data"), showWarnings = FALSE)
dir.create(file.path("data/rawdata"), showWarnings = FALSE)
dir.create(file.path("data/modifieddata"), showWarnings = FALSE)

## run all scripts
source("cleandata/01_get data.R")   # Scrape dat
source("cleandata/02_clean data.R")   # Scrape data
source("cleandata/03_clean data.R")   # Scrape data

source("question/01.R")     ## clean data
source("question/02.R")  ## create graph
source("question/03.R")  ## create graph
source("question/04.R")  ## create graph
source("question/05.R")  ## create graph
source("question/06.R")  ## create graph
source("question/07.R")  ## create graph
rmarkdown::render("edit_paper.Rmd", output_format = "html_document")

