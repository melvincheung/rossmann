#To visualize the data to get a first impression
# To do
# plan wt to do next
#produce a linear predictor for each store
# learn how to use predict()
#submit a base line submission by this
# any better visualization method other than simple plot
# how to plot the data against
# brainstorm how to clearly organize plotted data


# read and preprocess data
setwd("D:/kaggle/Rossmann")#comment it if this is not your directory
train <- read.csv("train.csv")
train <- train[train$Open==1,]#remove all closed days
store <- read.csv("store.csv")
train <- merge(train, store, by="Store")#join train and store
test <- read.csv("test.csv")

numOfStore = max(train$Store)
for (n in 1:numOfStore)
{
  tempTrain = train[train$Store==n,]
  png( paste("plots/",toString(n),".png",sep="") )
  plot(tempTrain$Customers, tempTrain$Sales, main=paste("Store",toString(n),".png", sep="") )
  dev.off()
}

# find No. of data for each store
dataOfStores <- as.data.frame(table(train$Store))
dataOfStores <- dataOfStores[order(dataOfStores$Freq),]
plot(dataOfStores$Freq)

###plots for understanding the data
# plot months vs sales per customers
storeNo <- 1
# storeNo <- 200
tempTrain <- train[train$Store==storeNo,]
months <- format(as.Date(tempTrain$Date), format="%m")
salesPerCustomer <- tempTrain$Sales/tempTrain$Customers
plot(tempTrain$Date, tempTrain$Sales)
plot(months, tempTrain$Sales)
plot(months, tempTrain$Customers)
plot(months, salesPerCustomer)

# 9 Plot sales against all other columns :o)
for (name in names(tempTrain))
{
  png( paste("plots/",name,".png",sep="") )
  plot(tempTrain[[name]], tempTrain$Sales)
  dev.off()
}


# Is there a function like this?
# df (data frame)
# n1 n2
# 1231	1
# 351	2
# 31	1
# 245	2
# 
# sdf1, sdf2 <- some_fun(df, name=="n2")
# 
# sdf1
# 1231  1
# 31  1
# 
# sdf1
# 351	2
# 245	2

# plot(train$DayOfWeek, train$Sales)#day of week vs sales
# plot(train$Customers, train$Sales)#day of week vs sales