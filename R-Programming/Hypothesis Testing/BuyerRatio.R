abc<-read.csv("C:/DATA ANALYTICS/assgn3/BuyerRatio.csv")
View(abc)
var.test(abc$East,abc$West) #0.346pval
var.test(abc$North,abc$South)#0.64 pval

qqnorm(abc$East)
qqline(abc$East)
 shapiro.test(abc$East)

 
fulldata <-data.frame(cbind(data.frame(abc$East,abc$West,abc$North,abc$South)))
 stackdata<-stack(fulldata)
 table(stackdata$ind,stackdata$values)                    
 chisq.test(table(stackdata$ind,stackdata$values))
#p value is 0.2931 ...so  