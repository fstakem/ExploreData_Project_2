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
    point_total_pm_per_year$emission_type <- 'point'
    
    # Nonpoint
    nonpoint_scc = classification_data[classification_data$Data.Category == 'Nonpoint', ]
    nonpoint_data = baltimore_data[baltimore_data$SCC %in% nonpoint_scc$SCC, ]
    nonpoint_total_pm_per_year <- aggregate(nonpoint_data$Emissions ~ nonpoint_data$year, nonpoint_data, sum)
    colnames(nonpoint_total_pm_per_year)[1] <- 'Year'
    colnames(nonpoint_total_pm_per_year)[2] <- 'Emissions'
    nonpoint_total_pm_per_year$emission_type <- 'nonpoint'
    
    # Onroad
    onroad_scc = classification_data[classification_data$Data.Category == 'Onroad', ]
    onroad_data = baltimore_data[baltimore_data$SCC %in% onroad_scc$SCC, ]
    onroad_total_pm_per_year <- aggregate(onroad_data$Emissions ~ onroad_data$year, onroad_data, sum)
    colnames(onroad_total_pm_per_year)[1] <- 'Year'
    colnames(onroad_total_pm_per_year)[2] <- 'Emissions'
    onroad_total_pm_per_year$emission_type <- 'onroad'
    
    # Nonroad
    nonroad_scc = classification_data[classification_data$Data.Category == 'Nonroad', ]
    nonroad_data = baltimore_data[baltimore_data$SCC %in% nonroad_scc$SCC, ]
    nonroad_total_pm_per_year <- aggregate(nonroad_data$Emissions ~ nonroad_data$year, nonroad_data, sum)
    colnames(nonroad_total_pm_per_year)[1] <- 'Year'
    colnames(nonroad_total_pm_per_year)[2] <- 'Emissions'
    nonroad_total_pm_per_year$emission_type <- 'nonroad'
    
    # Combined data
    combined_data <- rbind(point_total_pm_per_year, nonpoint_total_pm_per_year, onroad_total_pm_per_year, nonroad_total_pm_per_year)
    
    # Plot
    graphic <- ggplot(data=combined_data, aes(x=Year, y=Emissions, group=emission_type, colour=emission_type)) + 
                geom_line(size=.6) + 
                geom_point(size =3) + 
                scale_colour_hue(name="Emission Type", l=60) +
                ggtitle("Baltimore City Motor Vehicle PM2.5 Emissions per Year") + 
                ylab("PM2.5 Emissions (tons)")
    ggsave(filename=figure_3_path, plot=graphic, width=8, height=6, dpi=150)
}

plot_3()