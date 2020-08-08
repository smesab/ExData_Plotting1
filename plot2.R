## Read the data
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
##Format data and subset according to the limits
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data2<-subset(data,Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))

#define variables
globalActivePower<-as.numeric(data2$Global_active_power)
data2<-data2[complete.cases(data2),]
dateTime<-paste(data2$Date,data2$Time)
dateTime<-as.POSIXct(dateTime)

##plot
plot(dateTime,globalActivePower,ylab="Global Active Power  (kilowatts)",type="l")

##Create png
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()