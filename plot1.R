library(MASS)
library(base)
#Read in the data
data = read.csv("C:/Users/Lizzie/Desktop/coursera/household_power_consumption.txt", 
                header =TRUE, sep = ";",dec=".",stringsAsFactors=FALSE)

#Convert the date is in the correct date format
data[,1]<-as.Date(data[,1],"%d/%m/%Y")

# Choose the days that are in interest for this project
days.of.interest<-as.Date(c("1/02/2007","2/02/2007"),"%d/%m/%Y")
  
#Choose only those days for this report
data.doi<-data[as.Date(data[,1],"%d/%m/%Y")%in% days.of.interest,]

#Convert the global active power to numeric format
data.doi.global.active.power<-as.numeric(data.doi[,3])

# Plot a red histogram
hist(data.doi.global.active.power,col="red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")

#Create a png file of the plot 
dev.copy(png, file="plot1.png")
dev.off()




