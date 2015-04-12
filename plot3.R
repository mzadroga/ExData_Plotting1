create_plot3 <- function () {
        mydata <- read.csv('household.txt', 
                           sep = ';', dec='.', 
                           header=TRUE, 
                           na.strings='?')
        
        mydata$Date <- as.Date(mydata$Date, 
                               format="%d/%m/%Y")
        
        mydata2<-mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02",]
        
        png(file = "plot3.png", width = 480, height = 480, units = "px")
        
        plot(mydata2$Sub_metering_1, 
             type="l",
             col="black", 
             ylab="Energy sub metering", xlab="", xaxt="n")
        
        lines(mydata2$Sub_metering_2, col="red")
        lines(mydata2$Sub_metering_3, col="blue")
        
        legend("topright", 
               lty = c(1,1), 
               col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
        dev.off()
}