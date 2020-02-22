
doc<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
doc$Date<- as.Date(doc$Date,format="%d/%m/%Y")
doc<- doc[which(doc$Date==as.Date("2007-02-01") | doc$Date==as.Date("2007-02-02")),]
doc$Time<- strptime(doc$Time,format = "%H:%M:%S")

hist(as.numeric(as.character(doc$Global_active_power)),xlab = "Global Active Power(kilowatts)",main="Global Active Power",col="red")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()