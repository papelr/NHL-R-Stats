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



secondRound$Player <- gsub("[[:punct:]]", " ", secondRound, fixed = F)
secondRound <- tolower(secondRound)


  
  

