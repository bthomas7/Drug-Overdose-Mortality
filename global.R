library(shinydashboard)
library(tidyverse)
library(ggplot2)
library(plotly)

# load datset of prescription counts by state
overdose_data <- readRDS('data/overdose_data2.RDS') %>% 
  arrange(desc(Year2016))

# create states in alphabetical order for dropdown
states <- as.data.frame(overdose_data) %>% 
  select(State) %>% 
  unique()

states <- sort(states$State)
states <- c("--Click to Select--",states)

year <- unique(colnames(overdose_data))
year <- year[2:18]

