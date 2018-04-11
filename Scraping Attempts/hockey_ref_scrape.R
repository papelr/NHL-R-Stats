#' ####### **A More Thorough Scraping -- Oh Boy** ##############

library(tidyverse)
library(rvest)
library(dplyr)

#' ####### **Websites** ##########

url_CBJ <- "https://www.hockey-reference.com/teams/CBJ/2018.html"
url_NSH <- "https://www.hockey-reference.com/teams/NSH/2018.html"
  
webpage_CBJ <- read_html(url_CBJ)
webpage_NSH <- read_html(url_NSH)


#' ####### **CBJ Stats** ##########  
 
CBJ_stats_html <- html_nodes(webpage_CBJ, "#skaters tbody .left , 
                             #skaters .center:nth-child(19) , 
                             #skaters tbody .right:nth-child(19) , 
                             #skaters .sort_default_asc.left") 
CBJ_stats <- html_text(CBJ_stats_html)
head(CBJ_stats)
str(CBJ_stats) 

# Has active player names and their shooting %s

#' ####### **NSH Stats** ##########  

NSH_stats_html <- html_nodes(webpage_NSH, "#skaters tbody .left , 
                               #skaters tbody .right:nth-child(19) , 
                               #skaters .center:nth-child(19) , 
                               #skaters .sort_default_asc.left")
NSH_stats <- html_text(NSH_stats_html)
head(NSH_stats)
str(NSH_stats)

# CBJ_PP_goals <- CBJ_PP_goals[-(30:31)] --- the ability to remove rows from
# a vector


#' ####### **Data Frame** ##########  

CBJ_df <- data_frame(CBJ = CBJ_stats)
NSH_df <- data_frame(NSH = NSH_stats)

colnames(CBJ_df) <- as.character(unlist(CBJ_df[2,]))
colnames(NSH_df) <- as.character(unlist(NSH_df[2,]))

CBJ_NSH <- right_join(x = CBJ_df, y = NSH_df)
CBJ_NSH

