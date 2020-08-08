## Read the data
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
##Format data and subset according to the limits
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data2<-subset(data,Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))
dateTime<-paste(data2$Date,data2$Time)
dateTime<-as.POSIXct(dateTime)

#define variables

subM1<-as.numeric(data2$Sub_metering_1)
subM2<-as.numeric(data2$Sub_metering_2)
subM3<-as.numeric(data2$Sub_metering_3)

##Histogram
plot(dateTime,subM1,ylab="Global Active Power  (kilowatts)",type="l")
lines(dateTime,subM2,col="red")
lines(dateTime,subM3,col="blue")
legend("topright",col=c("black","red","blue"),lwd=c(1,1,1),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=.5)

##Create png
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()