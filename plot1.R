## Clear variables and load packages
rm(list = ls())
library(dplyr)
library(lubridate)


## Read data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE,
                   sep = ";",
                   as.is = c(1:9),
                   )
data <- data %>% 
    filter(year(dmy(Date)) == 2007) %>%
    filter(month(dmy(Date)) == 2) %>%
    filter(day(dmy(Date)) <= 2)
    


## Build plot 1
png("plot1.png")
x <- as.numeric(data$Global_active_power)
hist(x,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()


