# load in data using loading script
source("loadPowerData.R")
power <- loadPowerData()

# open PNG device
png("plot4.png",
    width = 480,
    height = 480,
    units = "px")

# make file with 4 plots
par(mfcol=c(2,2))

# top left plot
# of Global Active Power v DateTime
plot(power$DateTime,
     power$Global_active_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power")


# bottom left plot
# of Sub_meterings v DateTime
plot(power$DateTime,
     power$Sub_metering_1,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Energy sub metering")
lines(power$DateTime,
      power$Sub_metering_2,
      type = "l",
      col = "red"
)
lines(power$DateTime,
      power$Sub_metering_3,
      type = "l",
      col = "blue"
)
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1",
         "Sub_metering_2",
         "Sub_metering_3"),
       lty = 1,
       bty = "n")

# top right plot
# Voltage v DateTime
plot(power$DateTime,
     power$Voltage,
     type = "l",
     main = "",
     xlab = "datetime",
     ylab = "Voltage")

# bottom right plot
# Global Reactive Power v DateTime
plot(power$DateTime,
     power$Global_reactive_power,
     type = "l",
     main = "",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# turning PNG device off
dev.off()
