loadPowerData <- function() {
      library(data.table)
      input <- if (file.exists("household_power_consumption.txt")) {
            "household_power_consumption.txt"
      } else {
            fileUrl =  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
            tmp_dir = tempdir()
            tmp = tempfile(tmpdir = tmp_dir)
            download.file(fileUrl, tmp)
            outf = unzip(tmp, list = TRUE)$Name
            unzip(tmp, outf, exdir = tmp_dir)
            fread(file.path(tmp_dir, outf))[1:10]
      }
      first_day <- "2007-02-01"
      last_day <- "2007-02-02"
      date_format <- "%d/%m/%Y"
      datetime_format <- "%Y-%m-%d %H:%M:%S"


      power <- fread(input)

      power$Date <- as.Date(power$Date, format = date_format)
      power <- power[power$Date >= first_day & power$Date <= last_day]

      power <- data.frame(power)
      power$DateTime <- paste(power$Date, power$Time)
      power$DateTime <- strptime(power$DateTime, format = datetime_format)

      first_col_num = 3
      last_col_num = 9

      for (col in first_col_num:last_col_num)
            power[,col] <- as.numeric(as.character(power[,col]))

      power
}

