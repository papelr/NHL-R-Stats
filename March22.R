<<<<<<< HEAD
### Hello its the NHL!

install.packages("factoextra")

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
library(ggrepel)
library(dplyr)
library(tidytext)
library(factoextra)



###----------------------------------------------------------------###

TopFour <- read.csv("Skaters_March22_v2.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)

###----------------------------------------------------------------###

LineFit <- lm(G ~ CorsiFor, data = TopFour)
qqPlot(LineFit, main = "QQ Plot")
leveragePlots(LineFit)
spreadLevelPlot(LineFit)
LineFit


TopFour.Selected <- TopFour[, c( "G", "xGF", "CorsiFor")] 
set.seed(500)


TopFourCluster <- clusGap(TopFour.Selected, FUN = kmeans, K.max = 10, B = 3)
findClusters
plot(findClusters)

TopFourCluster <- kmeans(TopFour.Selected, centers = 3)
TopFourCluster
names(TopFourCluster)
TopFourCluster$centers


TopFour.Selected %>%
  as_tibble() %>%
  mutate(cluster = TopFourCluster$cluster,
         Team = row.names(TopFour)) %>%
  ggplot(aes(G, xGF, color = factor(cluster), label = Team)) +
  geom_text() +
  geom_label_repel(aes(G, xGF, fill = Team))

ClusterPlot4 <- fviz_cluster(TopFourCluster, geom = "point",  data = TopFour.Selected) + ggtitle("3 Cluster Solution")
ClusterPlot4

=======
>>>>>>> f5ecbb9c72ecf4d4b9253c6e2a5ccd5b3c8ead80
