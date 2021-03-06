# Load packages

library(MASS)
library(base)
library(RDS)


#  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#  Using the base plotting system, make a plot showing the total PM2.5 emission 
#  from all sources for each of the years 1999, 2002, 2005, and 2008.

#Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Group the data into years

data.1999<- data.frame(1999,sum(NEI[,6]=="1999"))
  
data.2002<-data.frame(2002,sum(NEI[,6]=="2002"))
  
data.2005<-data.frame(2005,sum(NEI[,6]=="2005")) 

data.2008<-data.frame(2008,sum(NEI[,6]=="2008"))

all.sum<-barplot(data.1999,data.2002,data.2005,data.2008)

plot(data.2008, xlim=c(1999,2008), ylim=c(1000000,2000000), xlab="Year", ylab="Total PM2.5 emission")
points(data.2002)
points(data.2005)
points(data.1999)#


#Create a png file of the plot 
dev.copy(png, file="plot1.png")
dev.off()


