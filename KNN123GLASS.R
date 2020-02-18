library(caTools)
library(dplyr)
library(ggplot2)
library(caret)
library(class)
library(corrplot)
glass <- read.csv("C:\\DATA ANALYTICS\\ASSIGNMENTS\\KNN\\glass.csv",
                  col.names=c("RI","Na","Mg","Al","Si","K","Ca","Ba","Fe","Type"))

standard.features <- scale(glass[,1:9])

glass$RI<-as.factor(glass$RI)
glass$Na<-as.factor(glass$Na)
glass$Mg<-as.factor(glass$Mg)
glass$Al<-as.factor(glass$Al)
glass$Si<-as.factor(glass$Si)
glass$K<-as.factor(glass$K)
glass$Ca<-as.factor(glass$Ca)
glass$Ba<-as.factor(glass$Ba)
glass$Fe<-as.factor(glass$Fe)
glass$Type<-as.factor(glass$Type)



#Join the standardized data with the target column
data <- cbind(standard.features,glass[10])
#Check if there are any missing values to impute. 
anyNA(data)
head(data)
#data visualization
corrplot(cor(data))

#train and test data
#We use caTools() to split the datainto train and test datasets with a SplitRatio = 0.70.
set.seed(101)

sample <- sample.split(data$Type,SplitRatio = 0.70)

train <- subset(data,sample==TRUE)

test <- subset(data,sample==FALSE)
#use knn() to predict our target variable Type of the test dataset with k=1.
#k=1 gives 73%accuracy
predicted.type <- knn(train[1:9],test[1:9],train$Type,k=1)
#Error in prediction
error <- mean(predicted.type!=test$Type)
#Confusion Matrix
confusionMatrix(predicted.type,test$Type)



#choosing value of K by visualisation
predicted.type <- NULL
error.rate <- NULL

for (i in 1:10) {
  predicted.type <- knn(train[1:9],test[1:9],train$Type,k=i)
  error.rate[i] <- mean(predicted.type!=test$Type)
  
}


knn.error <- as.data.frame(cbind(k=1:10,error.type =error.rate))
ggplot(knn.error,aes(k,error.type))+ 
  geom_point()+ 
  geom_line() + 
  scale_x_continuous(breaks=1:10)+ 
  theme_bw() +
  xlab("Value of K") +
  ylab('Error')



