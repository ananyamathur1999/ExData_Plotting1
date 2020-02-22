
doc<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
subset <- doc[doc$Date %in% c("1/2/2007","2/2/2007") ,]
subset$Sub_metering_1<-as.numeric(as.character(subset$Sub_metering_1))
subset$Sub_metering_2<-as.numeric(as.character(subset$Sub_metering_2))
subset$Sub_metering_3<-as.numeric(as.character(subset$Sub_metering_3))
time<- strptime(paste(as.character(subset$Date),as.character(subset$Time)),"%d/%m/%Y %H:%M:%S")

plot(time,subset$Sub_metering_1,type="h",ylab="Energy sub metering",xlab="")
lines(time,subset$Sub_metering_2,col="red")
lines(time,subset$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black", "red","blue"), lty=1, cex=0.8)

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()