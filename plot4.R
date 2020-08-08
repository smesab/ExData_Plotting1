## Read the data
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
##Format data and subset according to the limits
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data2<-subset(data,Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))

#define variables
globalActivePower<-as.numeric(data2$Global_active_power)
globalRectivePower<-as.numeric(data2$Global_reactive_power)
voltage<-as.numeric(data2$Voltage)
globalIntensity<-as.numeric(data2$Global_intensity)
subM1<-as.numeric(data2$Sub_metering_1)
subM2<-as.numeric(data2$Sub_metering_2)
subM3<-as.numeric(data2$Sub_metering_3)