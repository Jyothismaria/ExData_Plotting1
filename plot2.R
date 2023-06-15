plot2<- function(){
  df <- read.csv2("household_power_consumption.txt", header=TRUE, sep=";")
  subDF <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
  subDF$datetime <- strptime(paste(subDF$Date, subDF$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  subDF$weekday = weekdays(subDF$datetime)
  dev.cur()
  dev.copy(png,"plot2.png", width = 480, height = 480, units = "px")
  with(subDF, plot(datetime, as.numeric(Global_active_power) ,xlab = "",xaxt = "n",type = "l", ylab = "Global Active Power (kilowatts)"))
  axis(side= 1, at = c(as.numeric(subDF$datetime[1]),as.numeric(subDF$datetime[1441]), as.numeric(subDF$datetime[2880])), labels = c("Thu", "Fri", "Sat"))
  dev.off()
}

