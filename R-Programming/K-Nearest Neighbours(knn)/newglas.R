library(caret)
library(pROC)
library(mlbench)

glass <- read.csv(file.choose())
str(glass)
#glass1<-glass[,1:9]
#str(glass1)

#Function for data normalisation
norm <- function(x){ 
  return((x-min(x))/(max(x)-min(x)))
}  
#test normalization
norm(c(1,2,3,4,5))
norm(c(10,20,30,40,50))

wbcd_n <- as.data.frame(lapply(glass[1:9], norm))
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

#==============================================================
# Data partition
set.seed(123)
ind <- sample(2,nrow(glass1), replace = T, prob = c(0.7,0.3))

glass1_train<-glass1[1:160,]
glass1_test<-glass1[161:214,]

#train <- glass1[ind==1,]
#test <- glass1[ind==2,]

# KNN Model 

trcontrol <- trainControl(method = "repeatedcv", number = 20,repeats = 3
                          # classprobs are needed when u want to select ROC for optimal K Value
)


set.seed(222)
fit <- train(Type ~., data = glass1, method = 'knn', tuneLength = 5,
             trControl = trcontrol, preProc = c("center","scale"))
fit	
plot(fit)


varImp(fit)
pred <- predict(fit, newdata = glass1_test )
confusionMatrix(pred, glass1_test$Type)
