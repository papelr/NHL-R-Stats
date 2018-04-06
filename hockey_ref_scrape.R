#' ####### **A More Thorough Scraping -- Oh Boy** ##############

library(tidyverse)
library(rvest)
library(dplyr)

#' ####### **Websites** ##########

url_WSH <- "https://www.hockey-reference.com/teams/WSH/2018.html"
url_NSH <- "https://www.hockey-reference.com/teams/NSH/2018.html"
  
webpage_WSH <- read_html(url_WSH)
webpage_NSH <- read_html(url_NSH)


#' ####### **WSH Players** ##########  
 
WSH_players_html <- html_nodes(webpage_WSH, "#roster a") 
WSH_players <- html_text(WSH_players_html)
head(WSH_players)
 

#' ####### **NSH Players** ##########  

NSH_players_html <- html_nodes(webpage_NSH, "#roster a")
NSH_players <- html_text(NSH_players_html)
head(NSH_players)


#' ####### **Power Play Goals** ##########  

WSH_PP_goals_html <- html_nodes(webpage_WSH, "#skaters tbody .right:nth-child(12)")
WSH_PP_goals <- html_text(WSH_PP_goals_html)
WSH_PP_goals <- as.numeric(WSH_PP_goals)
head(WSH_PP_goals)

NSH_PP_goals_html <- html_nodes(webpage_NSH, "#skaters tbody .right:nth-child(12)")
NSH_PP_goals <- html_text(NSH_PP_goals_html)
NSH_PP_goals <- as.numeric(NSH_PP_goals)
head(NSH_PP_goals)

#' ####### **Data Frame** ##########  
