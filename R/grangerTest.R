calculateGranger<-function(aNormalizedVector,myOrder,myFile){
  sink(file =myFile , append = FALSE, type = c("output", "message"),
       split = FALSE)
  library(lmtest)
  grangertest(liq$evolution ~ liq$corretion, order = myOrder, data = liq)
}