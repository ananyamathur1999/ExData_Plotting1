
doc<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
subset <- doc[doc$Date %in% c("1/2/2007","2/2/2007") ,]
subset$Sub_metering_1<-as.numeric(as.character(subset$Sub_metering_1))
subset$Sub_metering_2<-as.numeric(as.character(subset$Sub_metering_2))
subset$Sub_metering_3<-as.numeric(as.character(subset$Sub_metering_3))
subset$Voltage<- as.numeric(as.character(subset$Voltage))
subset$Global_reactive_power<- as.numeric(as.character(subset$Global_reactive_power))
subset$Global_active_power<-as.numeric(as.character(subset$Global_active_power))
time<- strptime(paste(as.character(subset$Date),as.character(subset$Time)),"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(time,subset$Global_active_power,type="l",ylab="Global Active Power(in kilowatts)" ,xlab='')

plot(time,subset$Voltage,type="l",ylab="Voltage" ,xlab="datatime")

plot(time,subset$Sub_metering_1,type="h",ylab="Energy sub metering",xlab="")
  lines(time,subset$Sub_metering_2,col="red")
  lines(time,subset$Sub_metering_3,col="blue")

plot(time,subset$Global_reactive_power,type="h",xlab="datatime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png", width=480 , height=480)
dev.off()