#' ---
#' title: "Bar Chart for NHL Stats - from Corsica"
#' author: Robert Papel
#' date: March 30, 2018
#' output: github_document
#' ---

#' **Libraries**

library(ggfortify)
library(tibble)
library(ggplot2)
library(ggrepel)
library(dplyr)
library(tidytext)

#' **CSV file**

Teams <- read.csv("team_stats_2018-03-30.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)

#' **Bar Plot**

Plot <- ggplot(data = Teams, aes(x = Team, y = GP, fill = Team)) +
  geom_col(aes(fill = GP, color = Team), show.legend = FALSE) + 
  coord_flip()
 
Plot

