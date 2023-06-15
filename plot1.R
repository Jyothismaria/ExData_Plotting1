plot1<- function(){
  df <- read.csv2(file = "household_power_consumption.txt", header = T, sep = ";")
  df$Date =  as.factor(df$Date)
  df$Date =  strptime(df$Date, format = "%d/%m/%Y")
  df$Date <- as.Date(df$Date)
  subDF<-df[df$Date >=as.Date(" 2007-02-01") & df$Date <=as.Date(" 2007-02-02") , ]
  subDF$Datetime <- paste(as.character(subDF$Date), subDF$Time)
  dev.cur()
  dev.copy(png, "plot1.png")
  hist(as.numeric(subDF$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
  dev.off()
}