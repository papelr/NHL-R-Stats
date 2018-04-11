#' -------------------
#' Title: Does the Individual Corsi Shooting % explain Primary Assists?
#' Subtitle: Colorado and Nashville players
#' Date: April 10, 2018
#' By: Robert Papel
#' --------------------

#' #### **Libraries** ####

library(tidyverse)
library(car)
library(ggrepel)

primary <- read.csv("preds_avs.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)


#' #### **Line Fit** ####

LineFit <- primary %>% 
  # mutate( = scale()) %>% # IV
  lm(IndCorsi ~ A1, data = .) %>%  # DV
  summary() 
LineFit


#' #### **Scatterplot** ####

teamColor <- c("#6F263D", # Colorado
               "#FFB81C") # Nashville

ggplot(primary, 
       aes(x = IndCorsi, y = A1, color = Team), show.legend = FALSE) +
  geom_point(size = 3, 
             shape = 18) +
  scale_color_manual(values = teamColor) +
  coord_cartesian(xlim = c(0, 15), ylim = c(0, 40)) + 
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 0.3, 
              color = "black", 
              weight = 0.5) +
  geom_text_repel(aes(label = Player), show.legend = FALSE) +
  labs(title = "Individual Corsi % vs. Primary Assists",
       x = "Individual Corsi %", 
       y = "Primary Assists",
       subtitle = "Colorado, Nashville",
       caption = "Plot by R. Papel, April 10, 2018") +
  theme(axis.title.y = element_text(size = 10, 
                                    face = "bold", 
                                    color = "black")) +
  theme(axis.title.x = element_text(size = 10, 
                                    face = "bold", 
                                    color = "black")) +
  theme(title = element_text(face = "bold"))
