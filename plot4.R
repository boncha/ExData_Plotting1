## This code assumes that: 1) the data has already been downloaded and extracxted; 2) the data "household_power_consumption.txt" is in the current working directory.
my_data1<-read.table("household_power_consumption.txt",sep=';',header = T, stringsAsFactors = F,na.strings = '?') ## reads the data
my_data2<-my_data1[my_data1$Date %in% c("1/2/2007","2/2/2007"),] ## this substes the data for 01Feb2007 and 02Feb2007
my_data2<-cbind(strptime(paste(my_data2$Date,my_data2$Time),format="%d/%m/%Y %H:%M:%S"),my_data2) ## This adds a new column of date/time in the date/time class
names(my_data2)[1]<-"Date_Time" ## rename new column to "Date_Time"
rm(my_data1) ## remove the original data because it takes out a lot of memory

png(file="plot4.png")
par(mfcol=c(2,2)) ## sets the frame to be a 2x2
with(my_data2,plot(Date_Time,Global_active_power,type="l",xlab="",ylab="Global Active Power")) ## Draws the line plot with required labels
with(my_data2,plot(Date_Time,Sub_metering_1, type="l",col="black",xlab="",ylab="Energy sub metering")) ## Creates line plot for column Sub_metering_1 with required lables
with(my_data2,lines(Date_Time,Sub_metering_2, col="red")) ## adds data Sub_metering_2 to existing plot
with(my_data2,lines(Date_Time,Sub_metering_3, col="blue")) ## adds data Sub_metering_3 to existing plot
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,box.lty=0) ## adds legend to existing plot
with(my_data2,plot(Date_Time,Voltage,type="l", xlab="datetime",ylab="Voltage")) ## creates a new plot of Voltage vs. Date_Time
with(my_data2,plot(Date_Time,Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power")) ## creates a new plot of Global_reactive_power vs. Date_Time
dev.off()## closes device
