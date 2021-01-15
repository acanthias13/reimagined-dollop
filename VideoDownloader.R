w <- read.csv(file.choose()) # in this line, choose the WorkingVids.csv file
setwd(choose.dir()) # choose where the videos will be downloaded to
w$Download <- NA
for(i in 1:nrow(w)){
  fn <- paste0(w$ID[i],".mp4")
  tryCatch({
    download.file(
      url = w$URL[i],
      destfile = fn
    )
  }, error <- function(e){w$Download[i]=FALSE})
}
