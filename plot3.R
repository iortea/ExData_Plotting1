## read and prepare the data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
head(data)
data1<- data [data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
head(data1)
tail(data1)
data1$Sub_metering_1 <-as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <-as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <-as.numeric(as.character(data1$Sub_metering_3))
data1$Date<- as.Date(data1$Date, format="%d/%m/%Y")
data1$DateTime = paste(data1$Date, data1$Time, sep=" ")
data1$DateTime2<- as.POSIXct(data1$DateTime,format="%Y-%m-%d %H:%M:%S")
str(data1)

## create the plot
png(file="plot3.png")
plot(Sub_metering_1 ~ DateTime2, data=data1, type="l", ann=FALSE)
lines(Sub_metering_2 ~ DateTime2, data=data1, col="red")
lines(Sub_metering_3 ~ DateTime2, data=data1, col="blue")
title(ylab="Energy sub metering")
legend('topright', names(data1)[7:9], lty=1, col=c('black', 'red', 'blue'))
dev.off()
