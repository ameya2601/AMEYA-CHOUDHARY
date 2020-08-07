cof<-read.csv("C:/DATA ANALYTICS/assgn3/CostomerOrderForm.csv")

#Ho---> all proportions are equal
#Ha--->Not all prop are equal
#DATA DISCRETE IN MORE THAN 2 VARIABLES SO CHI SQ TEST

summary(cof)
fulldata <-data.frame(cbind(cof$Phillippines,cof$Indonesia,cof$Malta,cof$India))
stackdata <-stack(fulldata) 
table(stackdata$ind,stackdata$values)                    
chisq.test(table(stackdata$ind,stackdata$values))
