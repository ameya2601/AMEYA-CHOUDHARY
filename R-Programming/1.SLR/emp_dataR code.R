emp1<-read.csv("C:/DATA ANALYTICS/ASSIGNMENTS/Assg4(SLR)/emp_data.csv")
View(emp1)
plot(emp1$Churn_out_rate,emp1$Salary_hike)

#correlation
cor(emp1$Churn_out_rate,emp1$Salary_hike)

#regression
reg<-lm(emp1$Churn_out_rate ~ emp1$Salary_hike) #lm(y~x)
summary(reg)

a<- confint(reg,level = 0.95)
a

pred <- predict(reg,interval = "predict") 
pred
