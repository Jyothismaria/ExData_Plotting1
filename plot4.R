plot4<- function(){
  df <- read.csv2("household_power_consumption.txt", header=TRUE, sep=";")
  subDF <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
  subDF$datetime <- strptime(paste(subDF$Date, subDF$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  subDF$weekday = weekdays(subDF$datetime)
  dev.cur()
  dev.copy(png,"plot4.png", width = 480, height = 480, units = "px")
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  with(subDF,{ 
    plot(datetime, as.numeric(Global_active_power) ,xlab = "",xaxt = "n",type = "l", ylab = "Global Active Power (kilowatts)")
    axis(side= 1, at = c(as.numeric(datetime[1]),as.numeric(datetime[1441]), as.numeric(datetime[2880])), labels = c("Thu", "Fri", "Sat"))
    plot(datetime, as.numeric(Voltage) ,xlab = "datetime",xaxt = "n",type = "l", ylab = "Voltage")
    axis(side= 1, at = c(as.numeric(datetime[1]),as.numeric(datetime[1441]), as.numeric(datetime[2880])), labels = c("Thu", "Fri", "Sat"))
    plot(datetime, as.numeric(Sub_metering_1) ,xlab = "",xaxt = "n",type = "n", ylab = "Energy sub meeting")
    axis(side= 1, at = c(as.numeric(datetime[1]),as.numeric(datetime[1441]), as.numeric(datetime[2880])), labels = c("Thu", "Fri", "Sat"))
    points(datetime, as.numeric(Sub_metering_1), type ="l", col = "black")
    points(datetime, as.numeric(Sub_metering_2), type ="l", col = "red")
    points(datetime, as.numeric(Sub_metering_3), type ="l", col = "blue")
    legend("topright",lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=.50)
    plot(datetime, as.numeric(Global_reactive_power) ,xlab = "datetime",xaxt = "n",type = "l", ylab ="Global_reactive_power")
    axis(side= 1, at = c(as.numeric(datetime[1]),as.numeric(datetime[1441]), as.numeric(datetime[2880])), labels = c("Thu", "Fri", "Sat"))
  })
  dev.off()
}