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

firstRound %>% 
  filter(ShootPerc > 0) %>% 
  ggplot(aes(x = reorder(Player, ShootPerc), 
                      y = ShootPerc, 
                      fill = Team)) +
  geom_col() +
  scale_fill_manual(values = teamColor) +
  labs(x = "Player", 
       y = "Shooting Percentage",
       title = "Shooting Percentage",
       subtitle = "Number to right of bar = individual shots",
       caption = "Stats from Corsia, plot by R. Papel, April 9, 2018") +
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


