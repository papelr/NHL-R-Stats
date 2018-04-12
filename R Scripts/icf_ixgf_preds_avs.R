#' ------------------------
#' Title: **NSH vs COL**
#' Subtitle: Histogrammmmmmmmmmmmmm of G, xGF, iCF
#' Date: April 12, 2018
#' By: Robert Papel
#' ----------------------

library(tidyverse)
library(rmarkdown)
library(ggrepel)
library(gridExtra)
library(cowplot)

firstRound <- read_csv("preds_avs.csv")


#' **Visualizations - ixGF**
 
teamColor <- c("#FFB81C", # Nashville
               "#6F263D") # Colorado

NSH1 <- firstRound %>% 
  filter(Team == "NSH") %>% 
  mutate(Player = factor(Player)) %>%  
  ggplot() + 
  geom_col(aes(x = fct_reorder(Player, ixGF), 
               y = ixGF, fill = Team),
               show.legend = F) + 
  scale_fill_manual(values = teamColor) +
  labs(
    title = "Individual Expected Goals",
    subtitle = "Colorado & Nashville",
    x = "Players", 
    y = NULL
    # caption = "Stats from Corsia, plot by R. Papel, April 12, 2018"
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
    axis.title.x = element_text(size = 11, face = "bold", color = "black")
  ) +
  ylim(0, 4) +
  scale_y_continuous(limits = c(0, 28),
                     breaks = c(0:28)) +
  coord_flip() 

COL1 <- firstRound %>% 
  filter(Team == "COL") %>% 
  mutate(Player = factor(Player)) %>%  
  ggplot() + 
  geom_col(aes(x = fct_reorder(Player, ixGF), 
               y = ixGF, fill = Team),
           show.legend = F) + 
  scale_fill_manual(values = "#6F263D") +
  labs(
     # title = "Individual Expected Goals",
     # subtitle = "Nashville & Colorado",
     x = "Players", 
     y = "Expected Goals",
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
  ylim(0, 4) +
  scale_y_continuous(limits = c(0, 28),
                     breaks = c(0:28)) +
  coord_flip() 


#' **Putting two plots into one graph (or 4? Not 4, lmao)**

grid.arrange(NSH1, COL1, nrow = 2)



#' **Visualizations - iCF**

NSH2 <- firstRound %>% 
  filter(Team == "NSH") %>% 
  mutate(Player = factor(Player)) %>%  
  ggplot() + 
  geom_col(aes(x = fct_reorder(Player, iCF), 
               y = iCF, fill = Team),
           show.legend = F) + 
  scale_fill_manual(values = teamColor) +
  labs(
    title = "Individual Corsi For",
    subtitle = "Colorado & Nashville",
    x = "Players", 
    y = NULL
    # caption = "Stats from Corsia, plot by R. Papel, April 12, 2018"
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
    axis.title.x = element_text(size = 11, face = "bold", color = "black")
  ) +
  ylim(0, 4) +
  scale_y_continuous(limits = c(0, 500),
                     breaks = c(0, 50, 100, 150, 200, 
                                250, 300, 350, 400, 450, 500)) +
  coord_flip() 

COL2 <- firstRound %>% 
  filter(Team == "COL") %>% 
  mutate(Player = factor(Player)) %>%  
  ggplot() + 
  geom_col(aes(x = fct_reorder(Player, iCF), 
               y = iCF, fill = Team),
           show.legend = F) + 
  scale_fill_manual(values = "#6F263D") +
  labs(
    # title = "Individual Expected Goals",
    # subtitle = "Nashville & Colorado",
    x = "Players", 
    y = "Corsi For",
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
  scale_y_continuous(limits = c(0, 500),
                     breaks = c(0, 50, 100, 150, 200, 
                                250, 300, 350, 400, 450, 500)) +
  coord_flip() 

grid.arrange(NSH1, COL1, NSH2, COL2, nrow = 2)





