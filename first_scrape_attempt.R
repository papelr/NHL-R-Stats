####### Can I Scrape? Probablyyyyyyyyyyyyy Not ######

# install.packages("tidyverse")
# install.packages("rvest")

library(tidyverse)
library(rvest)
library(dplyr)

url <- "http://www.espn.com/nhl/standings/_/group/league"
webpage <- read_html(url)

#'#### **Team Names** #####

team_names_data_html <-  html_nodes(webpage, ".hide-mobile a")
team_names <- html_text(team_names_data_html)
head(team_names)


#'#### **Points** #####

points_data_html <- html_nodes(webpage, ".Table2__td:nth-child(5) .stat-cell")
points_data <- html_text(points_data_html)
head(points_data)

points_data <- as.numeric(points_data)
head(points_data)


#'#### **Data Frame** #####

team_points_df <- data.frame(Team = team_names, Points = points_data)
str(team_points_df)


#'#### **Visualization** #####

teamColor <- c("#FC4C02", 
               "#8C2633", 
               "#FFB81C", 
               "#041E42",
               "#C8102E", 
               "#CC0000", 
               "#C8102E", 
               "#6F263D", 
               "#041E42", 
               "#006341", 
               "#C8102E", 
               "#041E42", 
               "#B9975B", 
               "#000000", 
               "#154734", 
               "#A6192E", 
               "#FFB81C", 
               "#C8102E", 
               "#00468B", 
               "#0038A8", 
               "#C8102E", 
               "#FA4616", 
               "#CFC493", 
               "#003087", 
               "#006272", 
               "#00205B", 
               "#00205B", 
               "#00843D", 
               "#B9975B", 
               "#041E42", 
               "#53565A")

# Team colors, in order by alphabetical order, from:
# https://teamcolorcodes.com/winnipeg-jets-color-codes/

ggplot(team_points_df, 
       aes(x = reorder(Team, Points), y = Points, fill = Team)) +
  geom_col(show.legend = FALSE) +
  coord_flip() + 
  scale_fill_manual(values = teamColor)



