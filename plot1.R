# load in data using loading script
source("loadPowerData.R")
power <- loadPowerData()

# open PNG device
png("plot1.png", width = 480, height = 480, units = "px")

# make histogram of Global Active Power
hist(power$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# turn off PNG device
dev.off()
