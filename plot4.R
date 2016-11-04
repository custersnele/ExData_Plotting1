plot4 <- function() {
  ## Read data for 1/2/2007 and 2/2/2007 data
  library(sqldf)
  data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep=';', header=T)
  ## open png device
  png("plot4.png", width=480, height=480)
  ## setting rows and cols
  par(mfcol=c(2,2))
  ## create DateTime column
  data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y%X")
  ## plot1
  plot(data$DateTime,data$Global_active_power, type="l", xlab=NA, ylab="Global active power (kilowatts)")
  ## plot2
  plot(data$DateTime,data$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
  lines(data$DateTime,data$Sub_metering_2, col="red")
  lines(data$DateTime,data$Sub_metering_3, col="blue")
  legend("topright",col=c("black","red","blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, bty="n")
  ## plot3
  plot(data$DateTime,data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  ## plot4
  plot(data$DateTime,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  ## close png device
  dev.off()
}