####### Can I Scrape? Probablyyyyyyyyyyyyy Not ######

# install.packages("tidyverse")
# install.packages("rvest")

library(tidyverse)
library(rvest)

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

ggplot(team_points_df, aes(x = Team, y = Points, color = Team)) +
  geom_col(show.legend = FALSE) +
  coord_flip() 



