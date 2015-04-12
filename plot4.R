create_plot4 <- function () {
        mydata <- read.csv('household.txt', 
                           sep = ';', dec='.', 
                           header=TRUE, 
                           na.strings='?')
        
        mydata$Date <- as.Date(mydata$Date, 
                               format="%d/%m/%Y")
        
        mydata2<-mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02",]
        
        png(file = "plot4.png", width = 480, height = 480, units = "px")
        
        par(mfrow=c(2,2))
        
        #1
        plot(mydata2$Global_active_power, 
             type="l",
             col="black", 
             ylab="Global Active Power", xlab="", xaxt="n")
        axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
        
        #2
        plot(mydata2$Voltage,
             type="l",
             col="black", 
             ylab="Voltage", xlab="datetime", xaxt="n")
        axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
        
        #3
        plot(mydata2$Sub_metering_1, 
             type="l",
             col="black", 
             ylab="Energy sub metering", xlab="", xaxt="n")
        
        lines(mydata2$Sub_metering_2, col="red")
        lines(mydata2$Sub_metering_3, col="blue")
        
        legend("topright", 
               lty = c(1,1), 
               col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty="n")
        
        axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
        
        #4
        plot(mydata2$Global_reactive_power,
             type="l",
             col="black", 
             ylab="Global_reactive_power", xlab="datetime", xaxt="n")
        axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
        dev.off()
}