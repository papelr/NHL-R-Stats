####### Scraping from Google Trends ######

#'### **Library** ####

library(here)
library(tidyverse)
library(lubridate)
library(maps)
library(ggmap)
library(gtrendsR)


#'### **Google Trends** ####

results <- gtrends(keyword = c("PK Subban", "Sidney Crosby"),
                   geo = "US", 
                   time = "2017-01-01 2018-04-05")


#'### **Line Graphs** ####

keyword_levels <- c("PK Subban", "Sidney Crosby")

results$interest_over_time %>% 
  as_tibble() %>% 
  mutate(
    interest = as.integer(hits),
    keyword = factor(keyword, levels = keyword_levels)
  ) %>% 
  ggplot(aes(x = date, y = interest, color = keyword)) +
  geom_line() 

