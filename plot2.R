if (!file.exists("exdata_plotting1.zip")) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = "exdata_plotting1.zip")
  unz("exdata_plotting1.zip","household_power_consumption.txt")
}

tbl <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]
tbl$Timestamp = strptime(paste(tbl$Date, tbl$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(tbl$Timestamp, tbl$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()