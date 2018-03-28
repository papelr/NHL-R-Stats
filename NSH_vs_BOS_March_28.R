### --------- NSH vs BOS Scatterplot ------ @Ashley's Dad #####

install.packages("ggplot2")

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

#### ------------------------------------------------------####

BOS_NSH <- read.csv("BOS_NSH_March_28.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)


#### ------------------------------------------------------####

LineFit <- lm(GF ~ GA, data = BOS_NSH)
qqPlot(LineFit, main = "QQ Plot")
leveragePlots(LineFit)
spreadLevelPlot(LineFit)
summary(LineFit)
LineFit



PlayerPlot <- ggplot(BOS_NSH, aes(x = Corsi, y = RelCF, color = Team)) + 
  geom_point(size = 2.75, 
             shape = 15, 
             show.legend = TRUE) +
  coord_cartesian(xlim = c(40, 60), ylim = c(-10, 10)) + 
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 0.3, 
              color = "black", 
              weight = 0.5)

PlayerPlot <- PlayerPlot +
  ggtitle(expression(atop("Corsi vs. Relative Corsi", atop(italic("Boston vs. Nashville (All Positions)"))))) +
  labs(x = "Corsi", y = "Relative Corsi") +
  theme(axis.title.y = element_text(size = 12, face = "bold", color = "black")) +
  theme(axis.title.x = element_text(size = 12, face = "bold", color = "black")) 

PlayerPlot <- PlayerPlot +
  geom_text_repel(aes(label = Player), 
                   show.legend = FALSE,
                   min.segment.length = 3,
                   force = 4,
                   color = "black", 
                   size = 3.55) +
  theme_bw()
                   
PlayerPlot








