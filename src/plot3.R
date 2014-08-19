# -----------------------------------------------------------------------------------------------
#
#   File: plot3.R
#   Author: Fredrick Stakem
#   Created: 8.13.14
#
#   Purpose: The purpose of this code is to plot an answer question #3 of project #2 in the
#            online Coursera class 'Exploratory Data Analysis' from John Hopkins.
#
# -----------------------------------------------------------------------------------------------


# Question 3
#   Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#   variable, which of these four sources have seen decreases in emissions from 1999–2008 
#   for Baltimore City? Which have seen increases in emissions from 1999–2008? 
#   Use the ggplot2 plotting system to make a plot answer this question.

# Source
source('./parameters.R')

# Libraries
library(ggplot2)

plot_3 <- function()
{
    raw_data <- readRDS(raw_data_path)
    classification_data <- readRDS(classification_data_path)
    baltimore_data <- raw_data[raw_data$fips == '24510', ]
    
    # Point
    point_scc = classification_data[classification_data$Data.Category == 'Point', ]
    point_data = baltimore_data[baltimore_data$SCC %in% point_scc$SCC, ]
    point_total_pm_per_year <- aggregate(point_data$Emissions ~ point_data$year, point_data, sum)
    colnames(point_total_pm_per_year)[1] <- 'Year'
    colnames(point_total_pm_per_year)[2] <- 'Emissions'
    
    # Nonpoint
    nonpoint_scc = classification_data[classification_data$Data.Category == 'Nonpoint', ]
    nonpoint_data = baltimore_data[baltimore_data$SCC %in% nonpoint_scc$SCC, ]
    nonpoint_total_pm_per_year <- aggregate(nonpoint_data$Emissions ~ nonpoint_data$year, nonpoint_data, sum)
    colnames(nonpoint_total_pm_per_year)[1] <- 'Year'
    colnames(nonpoint_total_pm_per_year)[2] <- 'Emissions'
    
    # Onroad
    onroad_scc = classification_data[classification_data$Data.Category == 'Onroad', ]
    onroad_data = baltimore_data[baltimore_data$SCC %in% onroad_scc$SCC, ]
    onroad_total_pm_per_year <- aggregate(onroad_data$Emissions ~ onroad_data$year, onroad_data, sum)
    colnames(onroad_total_pm_per_year)[1] <- 'Year'
    colnames(onroad_total_pm_per_year)[2] <- 'Emissions'
    
    # Nonroad
    nonroad_scc = classification_data[classification_data$Data.Category == 'Nonroad', ]
    nonroad_data = baltimore_data[baltimore_data$SCC %in% nonroad_scc$SCC, ]
    nonroad_total_pm_per_year <- aggregate(nonroad_data$Emissions ~ nonroad_data$year, nonroad_data, sum)
    colnames(nonroad_total_pm_per_year)[1] <- 'Year'
    colnames(nonroad_total_pm_per_year)[2] <- 'Emissions'
    
    p <- ggplot()
    p + geom_line(point_total_pm_per_year$Year, point_total_pm_per_year$Emissions)
    p + geom_line(nonpoint_total_pm_per_year$Year, nonpoint_total_pm_per_year$Emissions)
    
    #point_total_pm_per_year$Year, point_total_pm_per_year$Emissions, data=point_total_pm_per_year, geom="line", xlab='Year', ylab='Emissions'
}

plot_3()