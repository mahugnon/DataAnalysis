
args <- commandArgs(TRUE)
aVector = args[1]
mylags = as.integer(args[2])
resultFile = args[3]

  sink(file =resultFile , append = FALSE, type = c("output", "message"),
       split = FALSE)
  library(lmtest)
  grangertest(aVector$evolution, aVector$corretion, order = mylags)