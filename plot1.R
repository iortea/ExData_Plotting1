## read and prepare the data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
head(data)
data1<- data [data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
head(data1)
tail(data1)
data1$Global_active_power <-as.numeric(as.character(data1$Global_active_power))

## create the plot
png(file="plot1.png")
hist(data1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()