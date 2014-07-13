if (!file.exists("exdata_plotting1.zip")) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = "exdata_plotting1.zip")
  unz("exdata_plotting1.zip","household_power_consumption.txt")
}

tbl <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]

png(filename = "plot.png", width = 480, height = 480, units = "px")
hist(tbl$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()