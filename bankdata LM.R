
bankdata <- read.csv("C:\\DATA ANALYTICS\\ASSIGNMENTS\\LOGISTIC REGRESSION\\bank-full (1).csv",sep=';')
sum(is.na(bankdata))
attach(bankdata)
str(bankdata)
b<-glm(y~.,family = "binomial",data = bankdata)

summary(b)

b1<-glm(y~.-default-pdays-previous,family = "binomial",data = bankdata)
summary(b1)

b1$fitted.values
prob2=predict(b1,type = c("response"),bankdata)
prob2
confusion<-table(prob2>0.5,bankdata$y)
confusion

accuracy<-sum(diag(confusion))/sum(confusion)

accuracy

error<-1-accuracy
error
install.packages('ROCR')
library("ROCR")

rocrpred<-prediction(prob2,bankdata$y)
rocrperf<-performance(rocrpred,'tpr','fpr')
str(rocrperf)



plot(rocrperf,print.cutoffs.at=seq(0.05,by=0.05))

rocrcutoff<-data.frame(rocrperf@alpha.values,rocrperf@x.values,rocrperf@y.values)
colnames(rocrcutoff)<-c("cutoff","fpr","tpr")

rocrcutoff1<-round(rocrcutoff,2)

confusion1
accuracy1<-sum(diag(confusion1))/sum(confusion1)
accuracy1

error1<-1-accuracy1
error1



