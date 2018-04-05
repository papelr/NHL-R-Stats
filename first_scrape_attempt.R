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

teamColor <- c("#FC4C02", # Anaheim
               "#8C2633", # Arizona
               "#FFB81C", # Boston
               "#041E42", # Buffalo
               "#C8102E", # Calgary
               "#CC0000", # Carolina
               "#C8102E", # Chicago
               "#6F263D", # Colorado
               "#041E42", # Columbus
               "#006341", # Dallas
               "#C8102E", # Detroit
               "#041E42", # Edmonton
               "#B9975B", # Florida
               "#000000", # Los Angeles
               "#154734", # Minnesota
               "#A6192E", # Montreal
               "#FFB81C", # Nashville
               "#C8102E", # New Jersey
               "#00468B", # New York Islanders
               "#0038A8", # New York Rangers
               "#C8102E", # Ottowa 
               "#FA4616", # Philadelhpia
               "#CFC493", # Pittsburgh
               "#003087", # St. Louis
               "#006272", # San Jose
               "#00205B", # Tampa Bay 
               "#00205B", # Toronto
               "#00843D", # Vancouver
               "#B9975B", # Vegas
               "#041E42", # Washington
               "#53565A") # Winnipeg

# Team colors, in order by alphabetical order, from:
# https://teamcolorcodes.com/winnipeg-jets-color-codes/

ggplot(team_points_df, 
       aes(x = reorder(Team, Points), y = Points, fill = Team)) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(values = teamColor) +
  coord_flip() +
  labs(
    title = "Blank", 
    subtitle = "Blank",
    x = "Team",
    y = "Points"
    ) +
  theme(
    axis.title.y = element_text(size = 12, face = "bold", color = "black"),
    axis.title.x = element_text(size = 12, face = "bold", color = "black")
  )


# scale_x_continuous(breaks = 2008:2017) +
  # labs(x = "Year", 
       # y = "Market Share",
       # color = "Brand",
       # title = "Monster's Epic Rise over Other Energy Drinks")



