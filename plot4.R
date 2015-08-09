library(MASS)
library(base)
#Read in the data
data = read.csv("C:/Users/Lizzie/Desktop/coursera/household_power_consumption.txt", 
                header =TRUE, sep = ";",dec=".",stringsAsFactors=FALSE);

#Convert the date is in the correct date format
data[,1]<-as.Date(data[,1],"%d/%m/%Y");

# Choose the days that are of interest for this project
days.of.interest<-as.Date(c("1/02/2007","2/02/2007"),"%d/%m/%Y");

#Choose only those days for this report
data.doi<-data[as.Date(data[,1],"%d/%m/%Y")%in% days.of.interest,];

#Join the time and data columns together and ensure they are in the correct time and data format
time.data<-paste(data.doi[,1],data.doi[,2])
time.data<-strptime(time.data, "%Y-%m-%d %H:%M:%S")

#Convert the global active power to numeric format
data.doi.global.active.power<-as.numeric(data.doi[,3])

par(mfrow = c(2, 2))

#First line plot of time against global active power
plot(x=time.data,y=data.doi.global.active.power,type="l",lwd=0.1,ylab="Global Active Power")

#Second line plot of voltage against time
plot(x=time.data,y=data.doi$Voltage,type="l", ylab= "Voltage", xlab = "datetime")

#Third plot of the different substations
plot(x=time.data,y=data.doi$Sub_metering_1,type="l", col="black"
     ,ylab="Energy sub metering",xlab="")
points(x=time.data,y=data.doi$Sub_metering_2,type="l", col="red")
points(x=time.data,y=data.doi$Sub_metering_3,type="l", col="blue")
legend("topright", pch = 1, col = c("black","blue", "red"),
       legend = c("Sub_metering_1           "
                  ,"Sub_metering_2           "
                  , "Sub_metering_3         "),pt.cex=1,cex=0.5)

#Fourth plot of global reactive power against time
plot(x=time.data,y=data.doi$Global_reactive_power,ylab="Global reactive power", type="l",xlab = "datetime")

#Create a png file of the plot 
dev.copy(png, file="plot4.png")
dev.off()
