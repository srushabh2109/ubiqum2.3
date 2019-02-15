#call relevant libraries
library(readxl)
library(caret)
library(randomForest)
library(party)
library(corrplot)
library(hexbin)
library(RColorBrewer)
library(plot3D)
library(rgl)
library(corrplot)

#import dataset
myData <- read.csv(file="C:/Users/James/Documents/Ubiqum/Part 3/3.1/existingproductattributes2017.2.csv", header=TRUE, sep=",")

#create new column metrics
myData$productVolume <- myData$ProductDepth*myData$ProductWidth*myData$ProductHeight
myData$SumServiceReview<-myData$PositiveServiceReview-myData$NegativeServiceReview

# dummify the data
myDataFrame <- dummyVars(" ~ .", data = myData)

dummyData <- data.frame(predict(myDataFrame, newdata = myData))

#view df types in columes
data.frame(sapply(myData, class))

summary(myData)

#create subset of product types
dummyData$ProductTypeSubSet<-dummyData$ProductType.Laptop+dummyData$ProductType.Netbook+dummyData$ProductType.PC+dummyData$ProductType.Smartphone
dummyData$ProductTypeSubet1<-dummyData$ProductType.Accessories+dummyData$ProductType.Display+dummyData$ProductType.GameConsole+dummyData$ProductType.Printer+dummyData$ProductType.PrinterSupplies+dummyData$ProductType.Software+dummyData$ProductType.Tablet


#null variables with missing attribute
dummyData$BestSellersRank <- NULL
dummyData$ProductType.ExtendedWarranty <-NULL
dummyData$x5StarReviews<-NULL
dummyData$ProductNum<-NULL
dummyData$ProductDepth<-NULL
dummyData$ProductWidth<-NULL
dummyData$ProductHeight<-NULL
dummyData$ProfitMargin<-NULL
dummyData$PositiveServiceReview<-NULL
dummyData$NegativeServiceReview<-NULL
dummyData$ProductType.Accessories<-NULL
dummyData$ProductType.Display<-NULL
dummyData$ProductType.GameConsole<-NULL
dummyData$ProductType.Printer<-NULL
dummyData$ProductType.PrinterSupplies<-NULL
dummyData$ProductType.Software<-NULL
dummyData$ProductType.Tablet<-NULL
dummyData$ProductType.Laptop<-NULL
dummyData$ProductType.PC<-NULL
dummyData$ProductType.Netbook<-NULL
dummyData$ProductType.Smartphone<-NULL



#create correlation matrix to view relationships between variables
corr_dummyData<-cor(dummyData)

corr_dummyData

corrplot(corr_dummyData, type = "upper", method = "color", 
         tl.col = "black", tl.srt = 45)
