####### Scraping from Google Trends ######

#'### **Library** ####

library(here)
library(tidyverse)
library(lubridate)
library(maps)
library(ggmap)
library(gtrendsR)


#'### **Google Trends** ####

results <- gtrends(keyword = c("Predators", "Nashville", "Playoffs"),
                   geo = "US", 
                   time = "all")


#'### **Line Graphs** ####

keyword_levels <- c("Predators", "Nashville", "Playoffs")

results$interest_over_time %>% 
  as_tibble() %>% 
  mutate(
    interest = as.integer(hits),
    keyword = factor(keyword, levels = keyword_levels)
  ) %>% 
  ggplot(aes(x = date, y = interest, color = keyword)) +
  geom_line()