#To visualize the data to get a first impression
source("read.R")

setwd(getwd())
train = read.csv("train.csv")
train = train[train$Open==1,]#remove all closed days
train = merge(train, store, by="Store")#join train and store

test = read.csv("test.csv")
store = read.csv("store.csv")

###plots for understanding the data
plot(train$DayOfWeek, train$Sales)#day of week vs sales
plot(train$Customers, train$Sales)#day of week vs sales