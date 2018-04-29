#' ---------------
#' Title: Winnipeg vs. Nashville
#' Subtitle: Second Round
#' Author: Robert Papel
#' Date: April 29, 2018
#' ---------------

#'###### ---------------**Libraries & Read-in**-------------------- ######

library(tidyverse)
library(tm)
library(stringr)
library(lettercase)
library(scales)
library(ggrepel)

secondRound <- read.csv("wpg_nsh_april.csv")
str(secondRound)
head(secondRound)
getwd()


#'###### ---------------**Cleaning**-------------------- ######

secondRound$Player <- gsub("[[:punct:]]", " ", secondRound$Player, fixed = F)
secondRound$Player <- tolower(secondRound$Player)
secondRound$Player <- str_cap_words(secondRound$Player)
secondRound$Player <- gsub("([a-z])([A-Z])", "\\1 \\2", secondRound$Player)
secondRound

#'###### ---------------**Modeling**-------------------- ######

#'###### ---------------**Visual**-------------------- ######

penalties_taken <- secondRound %>% 
  select(Player, PENT.60, Team) %>% 
  ggplot() +
  geom_col(aes(reorder(Player, PENT.60), PENT.60, fill = Team)) +
  scale_fill_manual(values = c("#FFB81C", "#53565A")) +
  coord_flip() +
  theme_bw() +
  labs(
    title = "Penalties Taken by Game",
    subtitle = "Nashville vs. Winnipeg, Second Round",
    x = "Player",
    y = "Number of Penalties per Game",
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
penalties_taken

#'###### ---------------**ggsave**-------------------- ######

ggsave(xGF_CorsiForPerc, file = "/Users/robertpapel/Documents/Personal_R_Stuff/NHL-R-Stats/Plots (ggsave)/xGF_CorsiForPerc_April29.png", 
       device = "png",
       width = 10,
       height = 7)


