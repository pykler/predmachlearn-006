#!/usr/bin/env Rscript --vanilla

library(data.table)

pdir <- '~/projects/predmachlearn/project'
load(paste0(pdir, '/data/pml_training_noagg.Rdata'))
project_dir <- pdir

pml_data_noagg_test <- pml.read.noagg('data/pml-testing.csv')
modFit <- pml.load_model('C5.0_noagg')
res <- predict(modFit, newdata=pml_data_noagg_test)
pml_data_noagg_test$classe <- predict(modFit, newdata=pml_data_noagg_test)
print(pml_data_noagg_test)

# write the output files
pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0(project_dir, "/output/problem_id_",i,".txt")
    write.table(x[i], file=filename, quote=FALSE, row.names=FALSE, col.names=FALSE)
  }
}

pml_write_files(pml_data_noagg_test$classe)
