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

BOS_NSH <- read.csv("BOS_NSH_March_28.csv", header = TRUE , sep = "," , stringsAsFactors = FALSE)