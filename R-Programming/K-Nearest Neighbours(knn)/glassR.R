# Read the dataset
wbcd <- read.csv(file.choose())
View(wbcd)
table(wbcd$Type)
round(prop.table(table(wbcd$Type))*100,1)

#Create a function to normalize the data
norm <- function(x){ 
  return((x-min(x))/(max(x)-min(x)))
}  
#test normalization
norm(c(1,2,3,4,5))
norm(c(10,20,30,40,50))
#Apply the normalization function to wbcd dataset
wbcd_n <- as.data.frame(lapply(wbcd[1:9], norm))
View(wbcd_n)

glass1<-wbcd_n
glass1$RI<-as.factor(glass1$RI)
glass1$Na<-as.factor(glass1$Na)
glass1$Mg<-as.factor(glass1$Mg)
glass1$Al<-as.factor(glass1$Al)
glass1$Si<-as.factor(glass1$Si)
glass1$K<-as.factor(glass1$K)
glass1$Ca<-as.factor(glass1$Ca)
glass1$Ba<-as.factor(glass1$Ba)
glass1$Fe<-as.factor(glass1$Fe)
glass1$Type<-as.factor(glass$Type)


wbcd2<-glass1
wbcd_n<-wbcd2

#$#$#$#$#$#$#$#$#$#$

wbcd_train <- wbcd_n[1:176,]
wbcd_test <- wbcd_n[177:214,]
#Get labels for training and test datasets
wbcd_train_labels <- wbcd_n[1:176,10]
wbcd_test_labels <- wbcd_n[177:214,10]

#=================================================================
library(caret)
library(pROC)
library(mlbench)

trcontrol <- trainControl(method = "repeatedcv", number = 10,repeats = 3
                          # classprobs are needed when u want to select ROC for optimal K Value
)
set.seed(222)
fit <- train(Type ~., data = wbcd, method = 'knn', tuneLength = 10,
             trControl = trcontrol, preProc = c("center","scale"))
fit	
plot(fit)

varImp(fit)
pred <- predict(fit, newdata = wbcd_test )
confusionMatrix(wbcd_test$Type,pred)


#----------------------------------------------------------------------

# Build a KNN model on taining dataset
library("class")
# Building the KNN model on training dataset and also need labels which we are including c1. Once we build the preduction model
# we have to test on test dataset
test_acc <- NULL
train_acc <- NULL
for (i in seq(3,200,5))
{
  train_wbcd_pred <- knn(train=wbcd_train,test=wbcd_train,cl=wbcd_train_labels,k=i)
  train_acc <- c(train_acc,mean(train_wbcd_pred==wbcd_train_labels))
  test_wbcd_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=i)
  test_acc <- c(test_acc,mean(test_wbcd_pred==wbcd_test_labels))
}


# Testing Accuracy 

# Plotting 2 different graphs on same window
par(mfrow=c(1,2)) # c(1,2) => indicates 1 row and 2 columns
plot(seq(3,200,2),train_acc,type="l",main="Train_accuracy",col="blue")
plot(seq(3,200,2),test_acc,type="l",main="Test_accuracy",col="red")

acc_neigh_df <- data.frame(list(train_acc=train_acc,test_acc=test_acc,neigh=seq(3,200,2)))
# Plotting 2 different graphs on same co-ordinate axis
install.packages("ggplot2")
library(ggplot2)
ggplot(acc_neigh_df,aes(x=neigh))+
  geom_line(aes(y=train_acc,colour="train_acc"),lwd=1.5)+
  geom_line(aes(y=test_acc,colour="test_acc"),lwd=1.5)+
  scale_fill_manual(" ",breaks=c("train_acc","test_acc"),values = c("train_acc"="green","test_acc"="red"))


wbcd_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=5)
#-------------------------------------------------------------------
#Evaluating model performance

install.packages("gmodels")
library(gmodels)

#create cross table for predicted vs Actual

CrossTable(x=wbcd_test_labels,y=wbcd_pred,prop.chisq = FALSE)
confusionMatrix(wbcd_test$Type,wbcd_pred)
