## -------------- Scatterplot Frame -------------------------------------------##

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

## ---------------------------------------------------------------------------------------------- ##

TopFour <- read.csv("Skaters_March22_v2.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)

## ---------------------------------------------------------------------------------------------- ##

fit <- lm(G ~ CorsiFor, data = TopFour)
qqPlot(fit, main="QQ Plot")
leveragePlots(fit)
spreadLevelPlot(fit)
fit

TeamColors <- c(NSH = "darkgoldenrod" , TB = "blue2" , VGK = "darkgreen" , BOS = "firebrick3") 

TopFourPlot <- ggplot(TopFour, aes(x = CorsiFor, y = G, color = Team , label = Player)) +
                       geom_point(size= 1.5, shape = 7) +
                       scale_color_manual(values = TeamColors)
TopFourPlot
