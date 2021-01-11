# load in data using loading script
source("loadPowerData.R")
power <- loadPowerData()

# open PNG device
png("plot3.png",
    width = 480,
    height = 480,
    units = "px")

# plot sub_metering_1
plot(power$DateTime,
     power$Sub_metering_1,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Energy sub metering")

# plot sub_metering_2
lines(power$DateTime,
      power$Sub_metering_2,
      type = "l",
      col = "red"
      )

# plot sub_metering_3
lines(power$DateTime,
      power$Sub_metering_3,
      type = "l",
      col = "blue"
)

# place legend in top right
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1",
         "Sub_metering_2",
         "Sub_metering_3"),
       lty = 1)
dev.off()
