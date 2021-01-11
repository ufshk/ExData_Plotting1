# load in data using loading script
source("loadPowerData.R")
power <- loadPowerData()

# open PNG device
png("plot2.png", width = 480, height = 480, units = "px")

# plot Global Active Power against DateTime
plot(power$DateTime,
     power$Global_active_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# turn off PNG device
dev.off()
