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


PlayerPlot <- ggplot(BosNsh, aes(x = Corsi, y = RelCF, color = Position)) + 
  geom_point(size = 2, shape = 9, show.legend = TRUE) +
  coord_cartesian(xlim = c(40, 60), ylim = c(-10, 10)) + 
  geom_smooth(method = "lm", se = FALSE, size = 0.5, color = "black")

PlayerPlot <- PlayerPlot +
  ggtitle(expression(atop("Corsi vs. Relative Corsi", atop(italic("Boston vs. Nashville (All Positions)"))))) +
  labs(x = "Corsi", y = "Relative Corsi") +
  theme(axis.title.y = element_text(size = 12, face = "bold", color = "black")) +
  theme(axis.title.x = element_text(size = 12, face = "bold", color = "black")) 

PlayerPlot <- PlayerPlot +
  geom_text_repel(aes(label = Player), 
                   show.legend = FALSE,
                   min.segment.length = 3,
                   force = 4)
                   
PlayerPlot







