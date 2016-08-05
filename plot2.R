## read and prepare the data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
head(data)
data1<- data [data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
head(data1)
tail(data1)
data1$Global_active_power <-as.numeric(as.character(data1$Global_active_power))
data1$Date<- as.Date(data1$Date, format="%d/%m/%Y")
data1$DateTime = paste(data1$Date, data1$Time, sep=" ")
data1$DateTime2<- as.POSIXct(data1$DateTime,format="%Y-%m-%d %H:%M:%S")
str(data1)

## create the plot
png(file="plot2.png")
plot(Global_active_power ~ DateTime2, data=data1, type="l", ann=FALSE)
title(ylab="Global Active Power (kilowatts)")
dev.off()
