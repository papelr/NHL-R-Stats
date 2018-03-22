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
library(ggplot2)


###----------------------------------------------------------------###

TopFour <- read.csv("Skaters_March22_v2.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)

###----------------------------------------------------------------###

TopFour.Selected <- TopFour[, c("G", "CorsiFor", "xGF")] 
set.seed(500)

TopFourClusters <- clusGap(TopFour.Selected, FUN = kmeans, K.max = 10, B = 3)
TopFourClusters
plot(TopFourClusters)

TopFourClusters.Selected <- kmeans(TopFour.Selected, centers = 3)
TopFourClusters.Selected
names(TopFourClusters.Selected)
TopFourClusters.Selected$centers

# fit series of one-way ANOVAs
lapply(names(TopFour.Selected), function(x) Anova(lm(paste(x, " ~ cluster"), TopFourClusters.Selected)))

autoplot(dat.chicocustomer.cluster, data = dat.chicocustomer, frame = TRUE)


