plot3<- function(){
  df <- read.csv2("household_power_consumption.txt", header=TRUE, sep=";")
  subDF <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
  subDF$datetime <- strptime(paste(subDF$Date, subDF$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  subDF$weekday = weekdays(subDF$datetime)
  dev.cur()
  dev.copy(png,"plot3.png", width = 480, height = 480, units = "px")
  with(subDF, plot(datetime, as.numeric(Sub_metering_1) ,xlab = "",xaxt = "n",type = "n", ylab = "Energy sub meeting"))
  axis(side= 1, at = c(as.numeric(subDF$datetime[1]),as.numeric(subDF$datetime[1441]), as.numeric(subDF$datetime[2880])), labels = c("Thu", "Fri", "Sat"))
  with(subDF, points(datetime, as.numeric(Sub_metering_1), type ="l", col = "black"))
  with(subDF, points(datetime, as.numeric(Sub_metering_2), type ="l", col = "red"))
  with(subDF, points(datetime, as.numeric(Sub_metering_3), type ="l", col = "blue"))
  legend("topright",lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  dev.off()
}
