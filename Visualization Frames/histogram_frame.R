#' ------------------------
#' Title: **NSH vs COL**
#' Subtitle: Pre-First Round Matchup
#' Date: April 9, 2018
#' By: Robert Papel
#' ------------------------

#' **Libraries** 

library(tidyverse)
library(rmarkdown)

firstRound <- read.csv("preds_avs.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)


#' **Visualizations**
 
teamColor <- c("#6F263D", # Colorado
               "#FFB81C") # Nashville



ggplot(firstRound) +
  geom_histogram(aes(x = G, fill = Team), 
                 bins = 10,
                 binwidth = 3,
                 show.legend = T,
                 color = "black") +
  scale_fill_manual(values = teamColor) +
  coord_flip() +
  labs(
    title = "Goal Count",
       subtitle = "Goal Count, Both Teams",
       x = "Goals", 
       y = "Number of Players",
       caption = "Stats from Corsia, plot by R. Papel, April 12, 2018"
       ) +
  theme(
    plot.title = element_text(face = "bold", size = 12),
    plot.subtitle = element_text(face = "italic"),
    axis.ticks = element_line(colour = "grey70", size = 0.2),
    panel.grid.major = element_line(colour = "grey70", size = 0.2),
    panel.grid.minor = element_blank(),
    legend.background = element_rect(fill = "grey90", 
                                     size = 3, colour = "white"),
    legend.text = element_text(face = "bold"),
    legend.title = element_text(face = "bold"),
    axis.title.y = element_text(size = 10, face = "bold", color = "black"),
    axis.title.x = element_text(size = 10, face = "bold", color = "black")
    ) +
  facet_wrap(~Position, nrow = 2)
    

  



scale_y_continuous(limits = c(0,24), 
                     breaks = c(1:24)) +
  coord_cartesian(ylim = c(0, 24)) +
  geom_text(nudge_y = 0.73, size = 2.80,
            aes(label = paste0(iSF, " Shots"))) +
  coord_flip() +
  theme(
    plot.title = element_text(face = "bold", size = 12),
    legend.background = element_rect(fill = "white", size = 4, colour = "white"),
    axis.ticks = element_line(colour = "grey70", size = 0.2),
    panel.grid.major = element_line(colour = "grey70", size = 0.2),
    panel.grid.minor = element_blank()
  )


