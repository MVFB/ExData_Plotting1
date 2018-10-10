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
    

## Build plot 2
png("plot2.png")
x <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
y <- as.numeric(data$Global_active_power)
plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

