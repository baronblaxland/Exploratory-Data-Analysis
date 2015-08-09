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

#Creata a plot of time against global active power
plot(x=time.data,y=data.doi.global.active.power,type="l",lwd=0.1,ylab="Global Active Power",xlab="")

#Create a png file of the plot 
dev.copy(png, file="plot2.png")
dev.off()


