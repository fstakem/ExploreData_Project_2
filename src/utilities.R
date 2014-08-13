# -----------------------------------------------------------------------------------------------
#
#   File: utilities.R
#   Author: Fredrick Stakem
#   Created: 8.13.14
#
#   Purpose: The purpose of this code is for all utlity functions needed for project 1
#            in the Coursera class 'Exploratory Data Analysis' from John Hopkins
#
# -----------------------------------------------------------------------------------------------


# Import data from range
import_data_range <- function(path, start_date, end_date)
{
    raw_data <- read.delim(path, sep=';', na.strings='?', colClasses=c('character', 'character', rep('numeric', 7)))
    raw_data$timestamp <- as.POSIXlt( paste(raw_data$Date, raw_data$Time), format = "%d/%m/%Y %H:%M:%S" )
    raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")
    
    if(end_date > start_date)
    {
        subset_data <- subset(raw_data, start_date <= raw_data$Date)
        subset_data <- subset(subset_data, subset_data$Date <= end_date)
        
        return(subset_data)
    }
    else
    {
        stop('Start date is greater than end date')
    }  
}
