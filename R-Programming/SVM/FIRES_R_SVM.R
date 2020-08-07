category<-read.csv("C:\\DATA ANALYTICS\\ASSIGNMENTS\\SVM\\forestfires.csv")
View(category)
#colnames(category)<-c("month","day","FFMC","DMC","DC","ISI","temp","RH","wind","rain","area","dayfri","daymon","daysat",          )
fires_train<-category[1:450,]
fires_test<-category[451:517,]
View(category)
# Building model 

library(kernlab)
library(caret)
model1<-ksvm(size_category ~.,data = fires_train,kernel = "vanilladot")
model1
fire_pred<-predict(model1,fires_test)
head(fire_pred)
table(fire_pred,fires_test$size_category)
agreement<-fire_pred==fires_test$size_category
table(agreement)
prop.table(table(agreement))



################################################################