# -----------------------------------------------------------------------------------------------
#
#   File: plot1.R
#   Author: Fredrick Stakem
#   Created: 8.13.14
#
#   Purpose: The purpose of this code is to plot an answer question #1 of project #2 in the
#            online Coursera class 'Exploratory Data Analysis' from John Hopkins.
#
# -----------------------------------------------------------------------------------------------


# Question 1
#   Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#   Using the base plotting system, make a plot showing the total PM2.5 emission from 
#   all sources for each of the years 1999, 2002, 2005, and 2008.

# Source
source('./parameters.R')

plot_1 <- function()
{
    raw_data <- readRDS(raw_data_path)
    total_pm_per_year <- aggregate(raw_data$Emissions ~ raw_data$year, raw_data, sum)
    colnames(total_pm_per_year)[1] <- 'Year'
    colnames(total_pm_per_year)[2] <- 'Emissions'
    
    png(filename=figure_1_path, width=480, height=480)
    plot(x=total_pm_per_year$Year, y=total_pm_per_year$Emissions, xlab="Year", ylab=PM[2.5] ~ ' Emissions (tons)', main='Total' ~ PM[2.5] ~ 'Emissions per Year', pch=19)
    lines(total_pm_per_year$Year, total_pm_per_year$Emissions) 
    dev.off()
}

plot_1()