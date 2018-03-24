## --------- Scatterplot Frame -------------------------------------------------------------------##

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
qqPlot(fit, main = "QQ Plot")
leveragePlots(fit)
spreadLevelPlot(fit)
fit

TeamColors <- c(NSH = "darkgoldenrod" , TB = "blue2" , VGK = "darkgreen" , BOS = "firebrick3") 

TopFourPlot <- ggplot(TopFour, aes(x = CorsiFor, y = G, color = Team)) +
                       geom_point(size= 2, shape = 7) +
                       geom_text_repel(aes(label = Player), 
                                       show.legend = FALSE, 
                                       angle = 30, size = 2.75, 
                                       force = 15, 
                                       segment.alpha = .25) 

TopFourPlot <- TopFourPlot + 
                coord_cartesian(xlim = c(40, 60), ylim = c(-5, 40)) + 
                geom_smooth(method = "lm", se = FALSE, size = 0.5, color = "black") +
                scale_color_manual(values = TeamColors)

TopFourPlot <- TopFourPlot + 
                ggtitle(expression(atop("Corsi % vs. Goals per Player", atop(italic("Top Four NHL Teams"))))) +
                labs(x = "Penalties Drawn (minutes)", y = "Team Points") +
                theme(plot.title = element_text(hjust = 0.5 , size = 15, face = "bold")) +
                theme(axis.title.y = element_text(size = 15, angle = 0, vjust = 0.5, face = "bold", color = "black")) +
                theme(axis.title.x = element_text(size = 15, angle = 0, face = "bold", color = "black")) +
                guides(fill = guide_legend(override.aes = list(size = 0))) 

  
#TopFourPlot <- TopFourPlot +
                #geom_label_repel(
                                 #aes(CorsiFor, G, label = Player),
                                 #box.padding = 0.2, point.padding = 0.5,
                                 #segment.color = 'grey50', size = 2, segment.alpha = 0.5, 
                                 #min.segment.length = 6, force = 20)
                                  
TopFourPlot
hh



