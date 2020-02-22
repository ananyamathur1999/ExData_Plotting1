

doc<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
subset <- doc[doc$Date %in% c("1/2/2007","2/2/2007") ,]
subset$Global_active_power<-as.numeric(as.character(subset$Global_active_power))
time<- strptime(paste(as.character(subset$Date),as.character(subset$Time)),"%d/%m/%Y %H:%M:%S")
plot(time,subset$Global_active_power,type="l",ylab="Global Active Power(in kilowatts)" ,xlab='')

dev.copy(png,file="plot2.png" ,width=480,height="480")
dev.off()