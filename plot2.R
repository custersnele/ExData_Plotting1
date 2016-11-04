plot2 <- function() {
  ## Read data for 1/2/2007 and 2/2/2007 data
  library(sqldf)
  data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep=';', header=T)
  ## settings margins
  par(mar=c(0,0,0,0))
  ## open png device
  png("plot2.png", width=480, height=480)
  ## create DateTime column
  data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y%X")
  ## write plot
  plot(data$DateTime,data$Global_active_power, type="l", xlab=NA, ylab="Global active power (kilowatts)")
  ## close png device
  dev.off()
}