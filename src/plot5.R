# -----------------------------------------------------------------------------------------------
#
#   File: plot5.R
#   Author: Fredrick Stakem
#   Created: 8.13.14
#
#   Purpose: The purpose of this code is to plot an answer question #5 of project #2 in the
#            online Coursera class 'Exploratory Data Analysis' from John Hopkins.
#
# -----------------------------------------------------------------------------------------------


# Question 5
#   How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Source
source('./parameters.R')

plot_5 <- function()
{
    raw_data <- readRDS(raw_data_path)
    classification_data <- readRDS(classification_data_path)
    baltimore_data <- raw_data[raw_data$fips == '24510', ]
    motor_vehicle_class_data <- classification_data[grep('vehicle', classification_data$SCC.Level.Two, ignore.case=TRUE), ]
    motor_vehicle_data = baltimore_data[baltimore_data$SCC %in% motor_vehicle_class_data$SCC, ]
    total_pm_per_year <- aggregate(motor_vehicle_data$Emissions ~ motor_vehicle_data$year, motor_vehicle_data, sum)
    colnames(total_pm_per_year)[1] <- 'Year'
    colnames(total_pm_per_year)[2] <- 'Emissions'
    
    png(filename=figure_5_path, width=480, height=480)
    plot(x=total_pm_per_year$Year, y=total_pm_per_year$Emissions, xlab="Year", ylab=PM[2.5] ~ ' Emissions (tons)', main='Baltimore City Motor Vehicle' ~ PM[2.5] ~ 'Emissions per Year', pch=19)
    lines(total_pm_per_year$Year, total_pm_per_year$Emissions) 
    dev.off()
}

plot_5()