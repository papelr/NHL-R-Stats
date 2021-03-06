#' -------------------
#' Title: Scatter Plot Frame, for Linear Regression
#' Subtitle: By all NHL teams, end of season
#' Date: April 9, 2018
#' By: Robert Papel
#' --------------------

#' #### **Libraries** ####

library(tidyverse)
library(car)
library(ggrepel)

shortHanded <- read.csv("Pent_April7.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)

#' #### **Line Fit** ####

LineFit <- shortHanded %>% 
  mutate(PENT = scale(PENT)) %>% # IV
  lm(SHG ~ PENT, data = .) %>%  # DV
  summary() 

# qqPlot(LineFit, main = "QQ Plot")
# leveragePlots(LineFit)
# spreadLevelPlot(LineFit)


#' #### **Scatterplot** ####

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
               "#C8102E", # New Jersey
               "#FFB81C", # Nashville
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


pent_shg_lm <- ggplot(shortHanded, 
                      aes(x = PENT, y = SHG, color = Team), show.legend = FALSE) +
  geom_point(size = 3, 
             shape = 18) +
  scale_color_manual(values = teamColor) +
  coord_cartesian(xlim = c(180, 300), ylim = c(0, 14)) + 
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 0.3, 
              color = "black", 
              weight = 0.5) +
  geom_text_repel(aes(label = Team), show.legend = FALSE) +
  labs(x = "Number of Penalties Taken", 
       y = "Short Handed Goals",
       title = "Penalties Taken vs. Short Handed Goals",
       subtitle = "All Teams",
       caption = "Plot by R. Papel, April 7, 2018") +
  theme(axis.title.y = element_text(size = 10, 
                                    face = "bold", 
                                    color = "black")) +
  theme(axis.title.x = element_text(size = 10, 
                                    face = "bold", 
                                    color = "black")) +
  theme(title = element_text(face = "bold")) +
  theme(legend.position = "none")
pent_shg_lm

# ggsave(plot = pent_shg_lm, filename = "NHL_SHGs.pdf")

