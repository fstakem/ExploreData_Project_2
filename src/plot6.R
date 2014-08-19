# -----------------------------------------------------------------------------------------------
#
#   File: plot6.R
#   Author: Fredrick Stakem
#   Created: 8.13.14
#
#   Purpose: The purpose of this code is to plot an answer question #6 of project #2 in the
#            online Coursera class 'Exploratory Data Analysis' from John Hopkins.
#
# -----------------------------------------------------------------------------------------------


# Question 6
#   Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#   motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#   Which city has seen greater changes over time in motor vehicle emissions?

# Source
source('./parameters.R')

plot_6 <- function()
{
    raw_data <- readRDS(raw_data_path)
    
    # Baltimore
    baltimore_data <- raw_data[raw_data$fips == '24510', ]
    baltimore_pm_per_year <- aggregate(baltimore_data$Emissions ~ baltimore_data$year, baltimore_data, sum)
    colnames(baltimore_pm_per_year)[1] <- 'Year'
    colnames(baltimore_pm_per_year)[2] <- 'Emissions'
    
    # Los Angeles
    los_angeles_data <- raw_data[raw_data$fips == '06037', ]
    los_angeles_pm_per_year <- aggregate(los_angeles_data$Emissions ~ los_angeles_data$year, los_angeles_data, sum)
    colnames(los_angeles_pm_per_year)[1] <- 'Year'
    colnames(los_angeles_pm_per_year)[2] <- 'Emissions'
    
    png(filename=figure_6_path, width=480, height=480)
    plot(x=total_pm_per_year$Year, y=total_pm_per_year$Emissions, xlab="Year", ylab='Emissions', main='Motor Vehicle' ~ PM[2.5] ~ 'Emissions per Year', pch=19)
    lines(total_pm_per_year$Year, total_pm_per_year$Emissions) 
    dev.off()
}

plot_6()