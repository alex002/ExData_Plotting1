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
png(filename='plot4.png',width=480,height=480)

## Set the background to be transparent
par(bg = 'transparent',mfrow=c(2,2))

## ---------------------------------
## Plot the 1st graph
## ---------------------------------
plot(1:nrow(b),b$'Global_active_power',
     type='l',xaxp=c(0,2880,2),xaxt='n',
     ylab='Global Active Power',xlab='')

## Adding tick marks to the graph
axis(side=1,at=c(0,1440,2880),
     labels=c('Thu','Fri','Sat'))

## ---------------------------------
## Plot the 2nd graph
## ---------------------------------
plot(1:nrow(b),b$Voltage,
     type='l',xaxp=c(0,2880,2),xaxt='n',
     ylab='Voltage',xlab='datetime')

## Adding tick marks to the graph
axis(side=1,at=c(0,1440,2880),
     labels=c('Thu','Fri','Sat'))


## ---------------------------------
## Plot the 3rd graph
## ---------------------------------
## Plot the Sub_metering_1
plot(1:nrow(b),b$'Sub_metering_1',
     type='l',col='black',xaxt='n',
     ylab='',xlab='',ylim=c(0,38))

## hold on
par(new=T)

## Sub_metering_2
plot(1:nrow(b),b$'Sub_metering_2',
     type='l',col='red',xaxt='n',
     ylab='',xlab='',ylim=c(0,38))

## hold on
par(new=T)

## Sub_metering_3
plot(1:nrow(b),b$'Sub_metering_3',
     type='l',col='blue',xaxt='n',
     ylab='Energy sub metring',
     xlab='',ylim=c(0,38))

## Adding tick marks to the graph
axis(side=1,at=c(0,1440,2880),
     labels=c('Thu','Fri','Sat'))

## Add legend
legend('topright',lty=1,lwd=2,bty='n',
       c('Sub_metering_1','Sub_metering_2',
         'Sub_metering_3'),
       col=c('black','red','blue'))

## ---------------------------------
## Plot the 4th graph
## ---------------------------------
plot(1:nrow(b),b$'Global_reactive_power',
     type='l',xaxp=c(0,2880,2),xaxt='n',
     ylab='Global_reactive_power',
     xlab='datetime')

## Adding tick marks to the graph
axis(side=1,at=c(0,1440,2880),
     labels=c('Thu','Fri','Sat'))

## Close the file
dev.off()
