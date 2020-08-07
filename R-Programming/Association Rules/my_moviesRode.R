
################################################################3
library(arules)
movies<-read.transactions(file.choose(),format="basket")
inspect(movies[1:10])
class(movies)
# itemFrequencyPlot can be applicable only for transaction data 
# count of each item from all the transactions 
itemFrequencyPlot(movies,topN=20)
movies_rules<-apriori(groceries,parameter = list(support = 0.01,confidence = 0.05,minlen=2))

library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(groceries_rules,method = "grouped")
plot(groceries_rules,method = "graph")
plot(groceries_rules,method = "mosaic")

