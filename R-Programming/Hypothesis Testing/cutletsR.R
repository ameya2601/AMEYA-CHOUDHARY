abc<-read.csv("C:/DATA ANALYTICS/assgn3/Cutlets.csv")
qqnorm(abc$Unit.A)
qqline(abc$Unit.A)
qqnorm(abc$Unit.B)
qqline(abc$Unit.B) #a- p value 0.287

#variance test

var.test(abc$Unit.A,abc$Unit.B) #pvalue = 0.3136 

#############2 sample T Test ##################

t.test(abc$Unit.A,abc$Unit.B,alternative = "two.sided",conf.level = 0.95,correct = TRUE)#two sample T.Test

