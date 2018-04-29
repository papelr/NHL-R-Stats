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

secondRound <- read.csv("wpg_nsh_april.csv")
str(secondRound)
head(secondRound)

#'###### ---------------**Cleaning**-------------------- ######

secondRound$Player <- gsub("[[:punct:]]", " ", secondRound$Player, fixed = F)
secondRound$Player <- tolower(secondRound$Player)
secondRound$Player <- str_cap_words(secondRound$Player)
secondRound$Player <- gsub("([a-z])([A-Z])", "\\1 \\2", secondRound$Player)

#'###### ---------------**Modeling**-------------------- ######

secondRound %>% 
  select(Player, xGF, CorsiForPerc, Team) %>%
  ggplot() +
  geom_point(aes(xGF, CorsiForPerc, color = Team), 
             shape = 18, size = 2) +
  scale_color_manual(values = c("#FFB81C", "#53565A")) +
  theme_bw() +
  labs(
    title = "Expected Goals vs. Corsi Percentage",
    subtitle = "Nashville vs. Winnipeg, Second Round",
    x = "Expected Goals (xGF)",
    y = "Corsi",
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


/Users/robertpapel/Documents/Personal_R_Stuff/NHL-R-Stats


  
  

