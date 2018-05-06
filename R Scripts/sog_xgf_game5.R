#' ---------------
#' Title: Winnipeg vs. Nashville
#' Subtitle: Second Round
#' Author: Robert Papel
#' Date: May 5, 2018
#' ---------------

#'###### ---------------**Libraries**-------------------- ######


library(tidyverse)
library(rvest)
library(gridExtra)

#'###### ---------------**Data-frame**-------------------- ######

Team <- c("WPG", "NSH")
xGF <- c(21.46, 21.72)
SF <- c(273, 281)

sog <- data_frame(Team, xGF, SF)

#'###### ---------------**xGF Plot**-------------------- ######

plot <- sog %>% 
  ggplot() +
  geom_col(aes(Team, xGF, fill = Team), width = 0.5,
           show.legend = F) +
  scale_fill_manual(values = c("#FFB81C", "#53565A")) +
  theme_bw() +
  labs(
    title = "Expected Goals, Playoffs",
    subtitle = "Nashville vs. Winnipeg, Second Round",
    x = "",
    y = "Expected Goals (xGF)",
    caption = "Statistics from Corsica, Plot by R. Papel") +
  theme(
    plot.title = element_text(face = "bold", size = 12),
    plot.caption = element_text(face = "italic"),
    plot.subtitle = element_text(face = "italic"),
    axis.ticks = element_line(colour = "grey70", size = 0.2),
    legend.text = element_text(face = "bold"),
    legend.title = element_text(face = "bold"),
    legend.background = element_rect(color = "grey70"), 
    axis.title.y = element_text(size = 11, face = "bold", color = "black"),
    axis.title.x = element_text(size = 11, face = "bold", color = "black")
  ) 
plot

#'###### ---------------**SOG Plot**-------------------- ######

plot2 <- sog %>% 
  ggplot() +
  geom_col(aes(Team, SF, fill = Team), width = 0.5,
           show.legend = F) +
  scale_fill_manual(values = c("#FFB81C", "#53565A")) +
  theme_bw() +
  labs(
    title = "Shots For, Playoffs",
    subtitle = "Nashville vs. Winnipeg, Second Round",
    x = "",
    y = "Shots For (SF)",
    caption = "Statistics from Corsica, Plot by R. Papel") +
  theme(
    plot.title = element_text(face = "bold", size = 12),
    plot.caption = element_text(face = "italic"),
    plot.subtitle = element_text(face = "italic"),
    axis.ticks = element_line(colour = "grey70", size = 0.2),
    legend.text = element_text(face = "bold"),
    legend.title = element_text(face = "bold"),
    legend.background = element_rect(color = "grey70"), 
    axis.title.y = element_text(size = 11, face = "bold", color = "black"),
    axis.title.x = element_text(size = 11, face = "bold", color = "black")
  ) 
plot2

#'###### ---------------**Grid Arrange**-------------------- ######

plots <- grid.arrange(plot, plot2, ncol = 2)

#'###### ---------------**ggsave**-------------------- ######

ggsave(
  plots, file = "/Users/robertpapel/Documents/Personal_R_Stuff/NHL-R-Stats/Plots (ggsave)/sog_xgf_wpg_nsh.png", 
  device = "png",
  width = 10,
  height = 7
)

