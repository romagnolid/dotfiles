options(max.print=100)
if (interactive()) {
    library(colorout)
    suppressMessages(try(source("https://bioconductor.org/biocLite.R")))
    suppressMessages(require(devtools))
}
.wideScreen <- function(howWide=Sys.getenv("COLUMNS")) {
    options(width=as.integer(howWide))
}

options(scipen = 10)
options(repos = c(CRAN = "https://cran.rstudio.com"))
# tab-complete package names
utils::rc.settings(ipck=TRUE)

.First <- function(){
  # cat("\nWelcome! It's", date(), "and it's a great time to start working!\n\n")
}

.Last <- function(){
  # cat("\nGoodbye! I hope it was a great and productive session!\n\n")
}
