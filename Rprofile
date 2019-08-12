options(max.print = 200,
        scipen = 10,
        repos = c(CRAN = "https://cran.rstudio.com"))

if (interactive()) {
    try(require(devtools))
}

.wideScreen <- function(howWide=Sys.getenv("COLUMNS")) {
    options(width=as.integer(howWide))
}

if (dir.exists("/scratch/tmp_dromagnoli/")) {
    Sys.setenv("TMPDIR"="/scratch/tmp_dromagnoli/")
}

# tab-complete package names
utils::rc.settings(ipck=TRUE)

.First <- function(){
    message("Welcome! Let's have a productive session!")
    if (interactive()) {
        try(utils::loadhistory("~/.Rhistory"))
    }
}

.Last <- function(){
    message("Goodbye!")
    if (interactive()) {
        try(utils::savehistory("~/.Rhistory"))
    }
}
