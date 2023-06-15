plot1<- function(){
  df <- read.csv2("household_power_consumption.txt", header=TRUE, sep=";")
  subDF <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
  dev.cur()
  dev.copy(png,"plot1.png", width = 480, height = 480, units = "px")
  hist(as.numeric(subDF$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
  dev.off()
}