## This code assumes that: 1) the data has already been downloaded and extracxted; 2) the data "household_power_consumption.txt" is in the current working directory.
my_data1<-read.table("household_power_consumption.txt",sep=';',header = T, stringsAsFactors = F,na.strings = '?') ## reads the data
my_data2<-my_data1[my_data1$Date %in% c("1/2/2007","2/2/2007"),] ## this substes the data for 01Feb2007 and 02Feb2007
my_data2<-cbind(strptime(paste(my_data2$Date,my_data2$Time),format="%d/%m/%Y %H:%M:%S"),my_data2) ## This adds a new column of date/time in the date/time class
names(my_data2)[1]<-"Date_Time" ## rename new column to "Date_Time"
rm(my_data1) ## remove the original data because it takes out a lot of memory
png(file="plot1.png") ##opens device
hist(my_data2$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red") ## Creates histogram with required title and labels
dev.off() ## closes device
