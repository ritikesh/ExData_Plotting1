if (!file.exists("exdata_plotting1.zip")) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = "exdata_plotting1.zip")
  unz("exdata_plotting1.zip","household_power_consumption.txt")
}

tbl <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]
tbl$Timestamp = strptime(paste(tbl$Date, tbl$Time), format = "%d/%m/%Y %H:%M:%S")

## Creating the plot
png(filename="plot4.png", width=480, height=480, units="px")

# Setting the canvas for 4 plots
par(mfcol=c(2,2))

# First plot
plot(tbl$Timestamp, tbl$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")
# Second plot
plot(tbl$Timestamp, tbl$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(tbl$Timestamp, tbl$Sub_metering_2, col="red")
lines(tbl$Timestamp, tbl$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# Third Plot
plot(tbl$Timestamp, tbl$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Fourth plot
plot(tbl$Timestamp, tbl$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()