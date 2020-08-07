library(arules)
books<-read.transactions(file.choose(),format="basket")
inspect(books[1:10])
class(books)


itemFrequencyPlot(books,topN=20)
books_rules<-apriori(books,parameter = list(support = 0.002,confidence = 0.05,minlen=2))

library(arulesViz)
plot(books_rules,method = "scatterplot")
plot(books_rules,method = "grouped")
plot(books_rules,method = "graph")
plot(books_rules,method = "mosaic")


