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
    baltimore_pm_per_year$City <- 'Baltimore'
    
    # Los Angeles
    los_angeles_data <- raw_data[raw_data$fips == '06037', ]
    los_angeles_pm_per_year <- aggregate(los_angeles_data$Emissions ~ los_angeles_data$year, los_angeles_data, sum)
    colnames(los_angeles_pm_per_year)[1] <- 'Year'
    colnames(los_angeles_pm_per_year)[2] <- 'Emissions'
    los_angeles_pm_per_year$City <- 'LosAngeles'
    
    # Combined data
    combined_data <- rbind(baltimore_pm_per_year, los_angeles_pm_per_year)
    
    # Plot
    graphic <- ggplot(data=combined_data, aes(x=Year, y=Emissions, group=City, colour=City)) + 
        geom_line(size=.6) + 
        geom_point(size =3) + 
        scale_colour_hue(name="City", l=60) +
        ggtitle("Total PM2.5 Emissions per Year") + 
        ylab("PM2.5 Emissions (tons)")
    ggsave(filename=figure_6_path, plot=graphic, width=8, height=6, dpi=150)
}

plot_6()