#' ---------------
#' Title: Winnipeg vs. Nashville
#' Subtitle: Second Round
#' Author: Robert Papel
#' Date: April 29, 2018
#' ---------------

#'###### ---------------**Libraries**-------------------- ######

library(tidyverse)
library(tm)
library(stringr)
library(lettercase)

secondRound <- read.csv("wpg_nsh_april.csv")
str(secondRound)
head(secondRound)

#'###### ---------------**Cleaning**-------------------- ######


secondRound$Player <- gsub("[[:punct:]]", " ", secondRound, fixed = F)
secondRound <- tolower(secondRound)

secondRound %>% 
  select("Player") 

secondRound$Player <- as.String(secondRound$Player)
secondRound
  
  

