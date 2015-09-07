# Load packages

library(MASS)
library(base)
library(readRDS)


#Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Clean and Sort the data

baltimore<- (NEI$fips=="23510")


#Have total emissions from PM2.5 decreased in the Baltimore City,
#Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
#system to make a plot answering this question.


plot(baltimore)
