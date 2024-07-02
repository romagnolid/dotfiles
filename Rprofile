options(max.print = 100,
        # nvimcom.verbose=4,
        scipen = 10,
        repos = c(CRAN = "https://cran.rstudio.com"))

.datefile <- function(x, ext) paste0(x, "_", Sys.Date(), ".", ext)

.wideScreen <- function(howWide=Sys.getenv("COLUMNS")) {
    options(width=as.integer(howWide))
}
.corner <- function(x, n=6){
    if (any(n > dim(x)))
        n <- min(dim(x))
    x[seq_len(n), seq_len(n)]
}
.image_rotation <- function(x){
# rbind(c(0,0,0,2),  | rbind(c(2,0,1),
#       c(0,0,0,0),  |       c(0,0,0),
#       c(0,1,0,1))  |       c(0,0,1),
#                    |       c(0,0,0))

# rbind(c(0,0,0),    |  rbind(c(0,0,0,2),
#       c(1,0,0),    |        c(0,0,0,0),
#       c(0,0,0),    |        c(0,1,0,1))
#       c(1,0,2))    |
    stopifnot(is.matrix(x))
    return(t(x)[, nrow(x):1, drop=FALSE])
}

# tab-complete package names
utils::rc.settings(ipck=TRUE)

.First <- function(){
    if (interactive()) {
        try(utils::loadhistory("~/.Rhistory"))
    }
}

.Last <- function(){
    if (interactive()) {
        try(utils::savehistory("~/.Rhistory"))
    }
}
