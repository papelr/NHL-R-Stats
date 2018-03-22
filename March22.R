### Hello its the NHL!

library(foreign)
library(car)
library(effects)
library(doBy)
library(ggfortify)
library(cluster)
library(multcomp)
library(fpc)
library(gridExtra)
library(tibble)


###----------------------------------------------------------------###

TopFour <- read.csv("Skaters_March22_v2.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)

###----------------------------------------------------------------###

TopFour.Selected <- TopFour[, c("G", "CorsiFor", "xGF")] 
set.seed(500)

TopFourClusters <- clusGap(TopFour.Selected, FUN = kmeans, K.max = 10, B = 3)
findClusters
plot(findClusters)

dat.chicocustomer.cluster <- kmeans(dat.chicocustomer.selected, centers = 3)
dat.chicocustomer.cluster
names(dat.chicocustomer.cluster)
dat.chicocustomer.cluster$centers

# fit series of one-way ANOVAs
lapply(names(dat.chicocustomer.selected), function(x) Anova(lm(paste(x, " ~ cluster"), dat.chicocustomer.selected.clust)))

autoplot(dat.chicocustomer.cluster, data = dat.chicocustomer, frame = TRUE)


