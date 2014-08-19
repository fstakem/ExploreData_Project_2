# -----------------------------------------------------------------------------------------------
#
#   File: plot4.R
#   Author: Fredrick Stakem
#   Created: 8.13.14
#
#   Purpose: The purpose of this code is to plot an answer question #4 of project #2 in the
#            online Coursera class 'Exploratory Data Analysis' from John Hopkins.
#
# -----------------------------------------------------------------------------------------------


# Question 4
#   Across the United States, how have emissions from coal combustion-related sources 
#   changed from 1999–2008?

# Source
source('./parameters.R')

plot_4 <- function()
{
    raw_data <- readRDS(raw_data_path)
    classification_data <- readRDS(classification_data_path)
    
    coal_class_data <-classification_data[grep('coal', classification_data$SCC.Level.Three, ignore.case=TRUE), ]
    coal_combust_class_data <- coal_class_data[grep('combustion', coal_class_data$SCC.Level.One, ignore.case=TRUE), ]
    
    coal_data = raw_data[raw_data$SCC %in% coal_combust_class_data$SCC, ]
    total_pm_per_year <- aggregate(coal_data$Emissions ~ coal_data$year, coal_data, sum)
    colnames(total_pm_per_year)[1] <- 'Year'
    colnames(total_pm_per_year)[2] <- 'Emissions'
    
    png(filename=figure_4_path, width=480, height=480)
    plot(x=total_pm_per_year$Year, y=total_pm_per_year$Emissions, xlab="Year", ylab=PM[2.5] ~ ' Emissions (tons)', main='Coal Combustion' ~ PM[2.5] ~ 'Emissions per Year', pch=19)
    lines(total_pm_per_year$Year, total_pm_per_year$Emissions) 
    dev.off()
}

plot_4()