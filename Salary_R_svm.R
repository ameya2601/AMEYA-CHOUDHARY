#category<-read.csv("C:\\DATA ANALYTICS\\ASSIGNMENTS\\SVM\\forestfires.csv")
salary_train<-read.csv(file.choose())
salary_test<-read.csv(file.choose())

library(kernlab)
library(caret)
model1<-ksvm(salary_train$Salary ~.,data = salary_train,kernel = "vanilladot")
model1
sal_pred<-predict(model1,salary_test)
head(sal_pred)
table(sal_pred,salary_test$Salary)

agreement<-sal_pred==salary_test$Salary
table(agreement)
prop.table(table(agreement))#84% accurate



##############################
model1<-ksvm(salary_train$Salary ~.,data = salary_train,kernel = "rbfdot")
model1
sal_pred<-predict(model1,salary_test)
head(sal_pred)
table(sal_pred,salary_test$Salary)

agreement<-sal_pred==salary_test$Salary
table(agreement)
prop.table(table(agreement))



