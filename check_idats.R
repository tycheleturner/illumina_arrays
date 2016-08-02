#!/bin/Rscript
# Tychele N. Turner, Ph.D.
# 08/01/2016
# Script for checking idats to make sure they are complete

# This requires the illuminaio library in R
# If you don't have it uncomment the following two lines and run them
# source("http://bioconductor.org/biocLite.R")
# biocLite("illuminaio")
 
#Usage: Rscript check_idats.R &> <outputFile>
#example command: Rscript check_idats.R -d path/ &> file_checks.txt

library("optparse")
suppressWarnings(library("illuminaio"))
 
option_list <- list(
	make_option(c('-d', '--directory'), action='store', type='character', default='test/', help='paths to the directory where you have your idat files')
)
opt <- parse_args(OptionParser(option_list = option_list))
 
directory = opt$directory #path to directory

 
PATHfiles <- directory
files <- list.files(PATHfiles, pattern="idat")
 
readIDATfiles <- function(files) {
    out <- tryCatch(
        {
            readIDAT(files)
        },
        error=function(cond) {
            message(paste("File caused an error:", files))
            message("Here's the original error message:")
            message(cond)
            return(NA)
        },
        warning=function(cond) {
            message(paste("File caused a warning:", files))
            message("Here's the original warning message:")
            message(cond)
            return(NULL)
        },
        finally={
            message(paste("Processed file:", files))
        }
    )
    return(out)
}
 
 
tmp <- list()
 for(i in 1:length(files)){
        tmp[[i]] <- readIDATfiles(paste(PATHfiles, files[i], sep=""))
	cat(paste("Number of SNPs = ", tmp[[i]]$nSNPsRead, "\n", sep=""))
        tmp[[i]] <- 0
}


