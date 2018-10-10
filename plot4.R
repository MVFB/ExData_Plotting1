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
    

## Build plot 4
png("plot4.png")

par(mfrow=c(2,2))

x <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
y11 <- as.numeric(data$Global_active_power)
plot(x, y11, type = "l", xlab = "", ylab = "Global Active Power")

y12 <- as.numeric(data$Voltage)
plot(x, y12, type = "l", xlab = "datetime", ylab = "Voltage")

y21a <- as.numeric(data$Sub_metering_1)
y21b <- as.numeric(data$Sub_metering_2)
y21c <- as.numeric(data$Sub_metering_3)
plot(x, y21a, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x, y21b, xlab = "", ylab = "", col = "red")
lines(x, y21c, xlab = ", ylab = ", col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",
       lty = 1,
       col = c("black", "red", "blue")
      )

y22 <- as.numeric(data$Global_reactive_power)
plot(x, y22, type = "l", xlab = "datetime", ylab = "Global_reactive_power", yaxt = "n")
axis(2,
     at = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5),
     labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5")
     )

dev.off()

