#**** Perform clustering (Both hierarchical and K means clustering) for the airlines data to obtain optimum number of clusters. ******
  
#install.packages("C50")
#install.packages("xls")
library(C50)
library(readxl)
library(cluster)

airlines <- read_xlsx (choose.files(), sheet = "data")
View(airlines)


colnames(airlines)

sub_airlines <- airlines[,2:12]

norm_airline <- scale(sub_airlines)


# Hirerachical CLustering

distanct_airline <- dist(norm_airline,method="euclidean") #distance matrix

str(distanct_airline)

airline_clust <- hclust(distanct_airline, method = "complete")


plot(airline_clust)  #display dendogram
plot(airline_clust, hang = -15)

rect.hclust(airline_clust, k=5, border = "red")

group_airline <- cutree(airline_clust,k=5)

EastWestAirlines_New <- cbind(airlines, group_airline)

setnames(EastWestAirlines_New, 'group_airline', 'group_hclust')

aggregate(EastWestAirlines_New[,2:12],by= list(EastWestAirlines_New$group_hclust), FUN = mean)

#K-MEANS CLustering

airline_kmeans <- kmeans(norm_airline,5)
str(airline_kmeans)
airline_kmeans$centers

EastWestAirlines_New <- cbind(EastWestAirlines_New, airline_kmeans$cluster)

colnames(EastWestAirlines_New)

aggregate(EastWestAirlines_New[,2:12],
          by= list(EastWestAirlines_New$`airline_kmeans$cluster`), FUN = mean)

# Using Clara function(Clustering for Large Applications) to find cluster

xcl <- clara(norm_airline,5) #Using Centroid

clusplot(xcl)

#using Partition Around Medoids to find cluster

xpm <- pam(norm_airline,5) # Using Medoids

clusplot(xpm)


******  Perform Clustering for the crime data and identify the number of clusters formed and draw inferences. ******
  
  
  install.packages("C50")
install.packages("tree")
install.packages("gmodels")
install.packages("party")
install.packages("knitr")
install.packages("png")
install.packages("carat")

library("C50")
library("tree")
library("gmodels")
library("knitr")
library("png")
library("party")
library("carat")
library(data.table)

fraudcheck <- read.csv(file.choose())

crime_data <- fraudcheck[,2:5]

norm_crime_data <- scale(crime_data)

d <- dist(norm_crime_data, method = "euclidean")

str(d)

#Historical clustering

crime_hclust <- hclust(d, method = "complete")

plot(crime_hclust, hang=-1)

#K means clustering

rect.hclust(crime_hclust,plot(crime_hclust,hang=-1),k=4,border="red")

groups <- cutree(crime_hclust,k=4)

crime_data_final <- cbind(crime_data, groups)

aggregate(crime_data_final[,2:5], by=list(crime_data_final$groups), FUN = mean)

#As per the above analysis, we can say two groups have 
#higher crime rate i.e Group1 and 2 