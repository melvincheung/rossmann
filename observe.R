#To visualize the data to get a first impression
# To do
# plan wt to do next
#produce a linear predictor for each store
#submit a base line submission by this
# 
# plot months vs sales

# read and preprocess data
setwd("D:/kaggle/Rossmann")#comment it if this is not your directory
train <- read.csv("train.csv")
train <- train[train$Open==1,]#remove all closed days
store <- read.csv("store.csv")
train <- merge(train, store, by="Store")#join train and store
test <- read.csv("test.csv")

#learn how to use predict()
numOfStore = max(train$Store)
for (n in 1:numOfStore)
{
  tempTrain = train[train$Store==n,]
  png( paste("plots/",toString(n),".png",sep="") )
  plot(tempTrain$Customers, tempTrain$Sales, main=paste("Store",toString(n),".png", sep="") )
  dev.off()
}

###plots for understanding the data
# plot months vs sales per customers
storeNo <- 500
tempTrain <- train[train$Store==storeNo,]
months <- format(as.Date(tempTrain$Date), format="%m")
salesPerCustomer <- tempTrain$Sales/tempTrain$Customers
plot(months, tempTrain$Sales)
plot(months, salesPerCustomer)

# plot(train$DayOfWeek, train$Sales)#day of week vs sales
# plot(train$Customers, train$Sales)#day of week vs sales