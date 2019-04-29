
args <- commandArgs()
aVector = args[1]
mylags = args[2]
resultFile = args[3]

  sink(file =resultFile , append = FALSE, type = c("output", "message"),
       split = FALSE)
  library(lmtest)
  grangertest(aVector$evolution, aVector$corretion, order = mylags)