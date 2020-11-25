setwd("~/Desktop")
read.csv("~/Desktop/Flowsheets_202010151627.csv")
flowsheet <- Flowsheets_202010151627
sheet <- gsub(pattern="cc/kg ","CC-Kg",flowsheet$DISP_NAME)