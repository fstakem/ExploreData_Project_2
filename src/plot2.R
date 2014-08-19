# -----------------------------------------------------------------------------------------------
#
#   File: plot2.R
#   Author: Fredrick Stakem
#   Created: 8.13.14
#
#   Purpose: The purpose of this code is to plot an answer question #2 of project #2 in the
#            online Coursera class 'Exploratory Data Analysis' from John Hopkins.
#
# -----------------------------------------------------------------------------------------------


# Question 2
#   Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#   from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Source
source('./parameters.R')

plot_2 <- function()
{
    raw_data <- readRDS(raw_data_path)
    baltimore_data <- raw_data[raw_data$fips == '24510', ]
    total_pm_per_year <- aggregate(baltimore_data$Emissions ~ baltimore_data$year, baltimore_data, sum)
    colnames(total_pm_per_year)[1] <- 'Year'
    colnames(total_pm_per_year)[2] <- 'Emissions'
    
    png(filename=figure_2_path, width=480, height=480)
    plot(total_pm_per_year$Year, total_pm_per_year$Emissions,  xlab="Year", ylab=PM[2.5] ~ ' Emissions (tons)', main='Baltimore City ' ~ PM[2.5] ~ 'Emissions per Year', pch=19)
    lines(total_pm_per_year$Year, total_pm_per_year$Emissions)
    dev.off()
}

plot_2()