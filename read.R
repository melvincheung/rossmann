readData <- function(){
  setwd("D:/kaggle/Rossmann")#comment it if this is not your directory
  #source("read.R")
  train = read.csv("train.csv")
  train = train[train$Open==1,]#remove all closed days
  store = read.csv("store.csv")
  train = merge(train, store, by="Store")#join train and store
  
  test = read.csv("test.csv")
}