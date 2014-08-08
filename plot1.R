## This function plot the first graph in the project assignment

## Set the working directory
setwd(paste('f:\\Users\\GT\\Desktop',
             '\\Coursera\\Data Science\\',
             'Exploratory Data\\Proj#1',sep=''))

## Read the household energy usage data
a=read.table('household_power_consumption.txt',sep=';'
             ,stringsAsFactors = FALSE)

## Change the column names and delete the first column
colnames(a)=as.character(a[1,])
rownames(a)=NULL

## Extract the required data
b=a[(a$Date=='1/2/2007'|a$Date=='2/2/2007'),]

## Open a graphic device
png(filename='plot1.png',width=480,height=480)

## Set the background to be transparent
par(bg = 'transparent')

## Plot the graph
hist(as.numeric(b$Global_active_power),
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)',
     col='red')

## Close the graphic device
dev.off()
