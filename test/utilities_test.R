# -----------------------------------------------------------------------------------------------
#
#   File: utilities_test.R
#   Author: Fredrick Stakem
#   Created: 8.13.14
#
#   Purpose: The purpose of this code is for testing the utlity functions needed for project 1
#            in the Coursera class 'Exploratory Data Analysis' from John Hopkins
#
# -----------------------------------------------------------------------------------------------

# Libraries
library('RUnit')

# Source
source('./parameters.R')
source('../src/utilities.R')

test_import_data_range <- function()
{
    imported_data <- import_data_range(raw_data_path, start_date, end_date)
    
    checkEquals(nrow(imported_data), 2880)
    checkEquals(ncol(imported_data), 10)
    
    actual_start_date <- imported_data$Date[1]
    actual_end_date <- imported_data$Date[length(imported_data$Date)]
    
    checkEquals(start_date, actual_start_date)
    checkEquals(end_date, actual_end_date)
}

# Run tests
test_import_data_range()

