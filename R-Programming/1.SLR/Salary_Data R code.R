a1<-read.csv("C:/DATA ANALYTICS/ASSIGNMENTS/Assg4(SLR)/Salary_Data.csv")
View(a1)

plot(a1$Salary,a1$YearsExperience)
cor(a1$Salary,a1$YearsExperience) #r=1

reg <- lm(a1$Salary ~ a1$YearsExperience)
summary(reg)

#y=b0 +b1X  25792.2 +  9450.0 v
#Salary= 25792.2 + 9450 *Years Experience
pred <- predict(reg,interval = "predict") 
pred

