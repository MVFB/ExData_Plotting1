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
    

## Build plot 3
png("plot3.png")
x <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
y1 <- as.numeric(data$Sub_metering_1)
y2 <- as.numeric(data$Sub_metering_2)
y3 <- as.numeric(data$Sub_metering_3)
plot(x, y1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x, y2, xlab = "", ylab = "", col = "red")
lines(x, y3, xlab = ", ylab = ", col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue")
       )
dev.off()
