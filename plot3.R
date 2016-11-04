plot3 <- function() {
  ## Read data for 1/2/2007 and 2/2/2007 data
  library(sqldf)
  data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep=';', header=T)
  ## settings margins
  par(mar=c(2,4,2,4))
  ## open png device
  png("plot3.png", width=480, height=480)
  ## create DateTime column
  data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y%X")
  ## write plot
  plot(data$DateTime,data$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
  lines(data$DateTime,data$Sub_metering_2, col="red")
  lines(data$DateTime,data$Sub_metering_3, col="blue")
  ## write legend
  legend("topright",col=c("black","red","blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
  ## close png device
  dev.off()
}