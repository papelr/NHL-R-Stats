### --------- NSH vs BOS Scatterplot ------ @Ashley's Dad #####

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

BosNsh <- read.csv("March26_NSH_BOS.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)

#### ------------------------------------------------------####

LineFit <- lm(Corsi ~ RelCF, data = BosNsh)
qqPlot(LineFit, main = "QQ Plot")
leveragePlots(LineFit)
spreadLevelPlot(LineFit)
LineFit

PosColors <- c(D = "darkgoldenrod" , L = "blue2" , C = "darkgreen" , R = "firebrick3") 











