#####Cluster Analysis for Average Screen Time of University students in a week####
library(ggplot2)
library(factoextra)
library(NbClust)
#### mydata <- read.csv("/Users/kushimahar/Desktop/Stats/day.csv", header=T)###
####Data Visualisation####
mydata <- read.csv("/Users/kushimahar/Desktop/Stats/day.csv", header=T)
str(mydata)
head(mydata)
tail(mydata)
pairs(mydata[2:8])
####Scaling####
nor=scale(mydata[,-1])
####Distance Matrix####
d <- dist(nor)
####K Mean Clustering####
##Optimal number of K##
wss <- (nrow(nor)-1)*sum(apply(nor,2,var))
for (i in 1:8) wss[i] <- sum(kmeans(nor, centers=i)$withinss)
plot(1:8, wss, type="b",xlab = "Number of clusters")
#k=3
fitK1<- kmeans(nor,3)
fitK1
fitK1$cluster
aggregate(nor,by=list(fitK1$cluster),FUN=mean)
fviz_cluster(fitK1, data = nor)
str(fitK1)
####Hierarchy Clustering####
fitH1 <- hclust(d, method="ward.D2")
plot(fitH1)
plot(fitH1,hang=-1,xlab="Distance matrix")
rect.hclust(fitH1,k=3,border="red")
clusters= cutree(fitH1,3)
clusters

#########################################################################
###mydata <- read.csv("/Users/kushimahar/Downloads/data.csv", header=T)###
#####Cluster Analysis of average screen time on various platforms of University students in a week#####
####Data Visualisation####
mydata <- read.csv("/Users/kushimahar/Downloads/data.csv", header=T)
str(mydata)
head(mydata)
tail(mydata)
pairs(mydata[2:10])
####Scaling####
nor1=scale(mydata[,-1])
####Distance Matrix####
d2 <- dist(nor1)
####K Mean Clustering####
##Optimal number of K##
##k-Means analysis using the variable "nc" for the number of clusters###
nc <- NbClust(nor1, min.nc=2, max.nc = 9, method = "kmeans")
print(table(nc$Best.n[1,]))
barplot(table(nc$Best.n[1,]), xlab = "Number of Clusters", ylab = "Number of Criteria", main = "Number of Clusters Chosen by 26 Criteria") 
#k=7
fitK2= kmeans(nor1,8)
fitK2
fitK2$cluster
aggregate(nor1,by=list(fitK2$cluster),FUN=mean)
fviz_cluster(fitK2, data = nor1)
str(fitK2)
####Hierarchy Clustering####
fitH2 <- hclust(d2, method="ward.D2")
plot(fitH2)
plot(fitH2,hang=-1)
rect.hclust(fitH2,k=8,border="red")
clusters= cutree(fitH2,8)
clusters


