options(max.print = 200,
        scipen = 10,
        repos = c(CRAN = "https://cran.rstudio.com"))

if (interactive()) {
    try(require(devtools))
}

.wideScreen <- function(howWide=Sys.getenv("COLUMNS")) {
    options(width=as.integer(howWide))
}
.corner <- function(x, n=6){
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

if (dir.exists("/scratch/tmp_dromagnoli/")) {
    Sys.setenv("TMPDIR"="/scratch/tmp_dromagnoli/")
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
