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

PlayerPlot <- ggplot(BOS_NSH, aes(x = GF, y = GA, color = Team)) + 
  geom_point(size = 2.75, 
             shape = 15, 
             show.legend = TRUE) +
  coord_cartesian(xlim = c(0, 70), ylim = c(0, 70)) + 
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 0.3, 
              color = "black", 
              weight = 0.5)

PlayerPlot <- PlayerPlot +
  ggtitle(expression(atop("Goals For vs. Goals Against", atop(italic("Boston vs. Nashville (All Positions)"))))) +
  labs(x = "Goals For (GF)", y = "Goals Against (GA)") +
  theme(axis.title.y = element_text(size = 12, face = "bold", color = "black")) +
  theme(axis.title.x = element_text(size = 12, face = "bold", color = "black")) 

PlayerPlot <- PlayerPlot +
  geom_text_repel(aes(label = Player), 
                   show.legend = FALSE,
                   min.segment.length = 3,
                   force = 4,
                   color = "black", 
                   size = 3.55) +
  theme_bw() +
  theme(legend.background = element_rect(fill = "gray95")) +
  theme(legend.box.margin = margin())
                   
PlayerPlot

PlayerPlot <- ggsave(NHLSkaterPlots, 
                     plot = PlayerPlot(), 
                     device = "png", 
                     path = Users/robertpapel/Documents/NHL R Stuff/NHLSkaterPlots, 
                     scale = 1, 
                     width = NA, 
                     height = NA, 
                     units = "in", 
                     limitsize = TRUE)







