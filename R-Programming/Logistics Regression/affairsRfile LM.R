
bankdata <- read.csv("C:\\DATA ANALYTICS\\ASSIGNMENTS\\LOGISTIC REGRESSION\\creditcard (1).csv")
str(affair)
#************converting int to factors*******************
  
affair$age = factor(affair$age)
str (affair$age)
affair$religiousness = factor(affair$religiousness)
affair$education = factor(affair$education)
affair$occupation = factor(affair$occupation)
affair$rating = factor(affair$rating)
str (affair)

person <- affair

i=1

for(val in person$affairs)
{
  if (person$affairs[i]>1)
  {
    person$affairs[i]<-1
  }
  i<-i+1
}
person<- person[-10]

person$affairs<- factor(person$affairs)
str(person)

m=glm(affair$affairs~.,data=person)
summary(m)

glm(formula = affair$affairs ~ ., data = person)

m$fitted.values
m1<-glm(person$affairs~.-education-occupation-children-gender,family = "binomial",data=person)
summary(m1)

m1$fitted.values
prob<-predict(m1,type = c("response"),person)
prob
confusion<-table(prob>0.5,person$affairs)
confusion

table(person$affairs)
accuracy=sum(diag(confusion))/sum(confusion)
accuracy

error<-1-accuracy
error

install.packages('ROCR')
library("ROCR")
rocrpred<-prediction(prob,person$affairs)
rocrperf<-performance(rocrpred,'tpr','fpr')
str(rocrperf)
plot(rocrperf,print.cutoffs.at=seq(0.1 ,by=0.1))

rocrcutoff<-data.frame(cutoff=rocrperf@alpha.values,fpr=rocrperf@x.values,tpr=rocrperf@y.values)
colnames(rocrcutoff)<-c("cutoff","fpr","tpr")
rocrcutoff<-round(rocrcutoff,2)

confusion<-table(prob>0.34,person$affairs)
confusion
