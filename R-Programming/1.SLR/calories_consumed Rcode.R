abc<-read.csv(file.choose())
View(abc)
plot(abc$Weight.gained..grams.,abc$Calories.Consumed)

weight1 <- abc$Weight.gained..grams.
calories<-abc$Calories.Consumed

#correlation coeff r
cor(weight1,calories) # r is 1

#simple linear regression
reg<-lm(calories~weight1) # lm(Y ~ X)
summary(reg)

#prediction model

pred <- predict(reg,interval = "predict") 
pred
#PVALUE IS less than 0.05 so we can use B0 and B1

a<- confint(reg,level = 0.95)
a
