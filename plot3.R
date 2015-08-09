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


#Create a scatter plot and then add the differnt plots of the dsubstations with different colours
plot(x=time.data,y=data.doi$Sub_metering_1,type="l", col="black"
     ,ylab="Energy sub metering",xlab="")
points(x=time.data,y=data.doi$Sub_metering_2,type="l", col="red")
points(x=time.data,y=data.doi$Sub_metering_3,type="l", col="blue")
legend("topright", pch = 1, col = c("black","blue", "red"),
       legend = c("Sub_metering_1           "
                  ,"Sub_metering_2           "
                  , "Sub_metering_3         "),pt.cex=1,cex=0.8)

#Create a png file of the plot 
dev.copy(png, file="plot3.png")
dev.off()