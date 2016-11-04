plot1 <- function() {
  ## Read data for 1/2/2007 and 2/2/2007 data
  library(sqldf)
  data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', sep=';', header=T)
  ## open png device
  png("plot1.png", width=480, height=480)
  ## write histogram
  hist(data$Global_active_power,main="Global active power", xlab="Global active power (kilowatts)", col="red")
  ## close png device
  dev.off()
}