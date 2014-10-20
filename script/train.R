#!/usr/bin/env Rscript --vanilla

args <- commandArgs(TRUE)
method <- args[1]
if (is.na(method)) {
    stop('No training algorithm supplied')
}

library(caret)
pdir <- '~/projects/predmachlearn/project'
load(paste0(pdir, '/data/pml_training_noagg.Rdata'))
project_dir <- pdir

print('NoAgg approach')
print(paste('Training', args))
pml.train.any(pml_train, method = method, "_noagg")
