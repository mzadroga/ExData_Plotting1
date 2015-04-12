create_plot2 <- function () {
        mydata <- read.csv('household.txt', 
                           sep = ';', dec='.', 
                           header=TRUE, 
                           na.strings='?')
        
        mydata$Date <- as.Date(mydata$Date, 
                               format="%d/%m/%Y")
        
        mydata2<-mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02",]
        
        png(file = "plot2.png", width = 480, height = 480, units = "px")
        
        plot(mydata2$Global_active_power, 
             type="l",
             col="black", 
             ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
        axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
        dev.off()
}