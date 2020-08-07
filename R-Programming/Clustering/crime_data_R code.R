Uni <- read.csv(file.choose())

# Normalizing continuous columns to bring them under same scale
normalized_data<-scale(Uni[,2:5])#which coloums to be z transformed or normalised

d <- dist(normalized_data, method = "euclidean") # distance matrix
?hclust
fit <- hclust(d, method="complete")
plot(fit)#display dendrogram
plot(fit,hang = -1) #labels below 

?cutree
rect.hclust(fit, k=4, border="red")
?rect.hclust #draw rectangles around braches of a dendrogram
groups <- cutree(fit, k=4) # cut tree into 5 clusters

membership<-as.matrix(groups) #groups or cluster numbers
?data.frame()
final<-data.frame(Uni,membership)
View(final)
write.csv(final, file="final.csv",row.names = F)

aggregate(Uni[,-1],by=list(final$membership),mean)

