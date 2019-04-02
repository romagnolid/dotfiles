options(max.print=100)
if (interactive()) {
    try(require(devtools))
}

.wideScreen <- function(howWide=Sys.getenv("COLUMNS")) {
    options(width=as.integer(howWide))
}

if (dir.exists("/scratch/tmp_dromagnoli/")) Sys.setenv("TMPDIR"="/scratch/tmp_dromagnoli/")

options(scipen = 10)
options(repos = c(CRAN = "https://cran.rstudio.com"))
# tab-complete package names
utils::rc.settings(ipck=TRUE)

.First <- function(){
  # cat("\nWelcome! It's", date(), "and it's a great time to start working!\n\n")
    if (interactive()) {
        try(utils::loadhistory("~/.Rhistory"))
    }
}

.Last <- function(){
  # cat("\nGoodbye! I hope it was a great and productive session!\n\n")
    if (interactive()) {
        try(utils::savehistory("~/.Rhistory"))
    }
}
