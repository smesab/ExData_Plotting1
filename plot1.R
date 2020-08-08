## Read the data
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
##Format data and subset according to the limits
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data2<-subset(data,Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))

#define variables
globalActivePower<-as.numeric(data2$Global_active_power)

##Histogram
hist(globalActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

##Create png
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
