#' ------------------------
#' Title: **NSH vs CBJ**
#' Subtitle: Game 82
#' By: Robert Papel
#' Theme: Amateur AF!
#' ------------------------

#' **Libraries** 

library(tidyverse)

finalGame <- read.csv("April7.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)


#' **Visualizations**
 
teamColor <- c("#041E42", # Columbus
               "#FFB81C") # Nashville

ggplot(finalGame, aes(x = reorder(Player, ShootPerc), 
                      y = ShootPerc, 
                      fill = Team)) +
  geom_col() +
  scale_fill_manual(values = teamColor) +
  labs(x = "Player", 
       y = "Shooting Percentage",
       title = "Shooting Percentage",
       subtitle = "Number to right of bar = individual shots",
       caption = "Stats from Corsia, plot by R. Papel, April 7, 2018") +
  scale_y_continuous(limits = c(0,21), 
                     breaks = c(1:21)) +
  coord_cartesian(ylim = c(0, 21)) +
  geom_text(nudge_y = 0.3, size = 2.80,
            aes(label = paste0(iSF))) +
  coord_flip()

  
  
  
  

