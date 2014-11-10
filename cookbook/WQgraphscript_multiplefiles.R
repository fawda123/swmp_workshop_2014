#Oct 31, 2014
#kac
#Script to make graphs of returned QC data files

#Reset R's Brain
rm(list=ls())

#Find out where R is looking for files
getwd()

#Set where R ~should~ look for files
#note the forward slashes - you may have trouble if you just copy and paste from windows explorer, as it may use backslashes
setwd("C:/Users/kimberly.cressman/Desktop/to upload 2014-10-23")

#Make sure R is now looking in the right place
getwd()

#Turn on pdf printer and name the output file
#this file will be saved in the same directory you named above in the setwd command
pdf(file="WQfiles.pdf")

#--------------------------------------
#Copy the following chunk for multiple data files
#if you want to save all the graphs into one pdf file
#you will need to change the file names in the first two lines
#--------------------------------------

#read in the dataset
#make sure the name in quotes retains the .csv
ysi.data <- read.csv("GNDBHWQ091914_QC.csv")

#make a title for the set of graphs
Title <- "GNDBHWQ091914"

#-------------------------------------------
#you can stop modifying code at this point
#unless you want to play with the page layout
#or the graphs
#-------------------------------------------

#combine date and time into DateTime 
ysi.data$DateTime <- paste(ysi.data$Date, ysi.data$Time)

#format DateTime as POSIXct, which will turn it into a number that can be graphed
#we are retaining the format of mm/dd/yyyy hh:mm
ysi.data$DateTime <- as.POSIXct(ysi.data$DateTime, format = "%m/%d/%Y %H:%M")

#check data to make sure it looks the way you think it should
names(ysi.data)   #column names
str(ysi.data)    #names; format (number, date, factor, character, etc.); first few values
head(ysi.data)    #returns the first 6 rows of data, so you can make sure things were read in correctly


#make the layout 4 rows and 2 columns so all graphs will fit on a page
#type ?par in the console for more information on page layout and modifications you can make
par(mfcol=c(4,2), mar=c(1, 4, 1.5, 1))

#make line graphs; can change colors if you want
#to get a list of R's known colors, type colors() into the console
#for more information on making and modifying plots, type ?plot  into the console
plot(Temp~DateTime, data=ysi.data, type="l", xlab = "", main = Title, col="darkred")
plot(SpCond~DateTime, data=ysi.data, type="l", xlab = "", col="darkblue")
plot(Sal~DateTime, data=ysi.data, type="l", xlab = "", col="darkgreen")
plot(Depth~DateTime, data=ysi.data, type="l", xlab = "", col="darkslategray")
plot(DO_pct~DateTime, data=ysi.data, type="l", xlab = "", col="darkorange")
plot(DO_mgl~DateTime, data=ysi.data, type="l", xlab = "", col="darkmagenta")
plot(pH~DateTime, data=ysi.data, type="l", xlab = "", col="darkturquoise")
plot(Turb~DateTime, data=ysi.data, type="l", xlab = "", col="darkkhaki")

#-------------------------------------------------
#End copying this chunk for multiple files
#Paste the above chunk as many times as necessary
#-------------------------------------------------


#--------------------------------------
#Copied Chunk Starts
#Notice you only have to change 2 file names below
#--------------------------------------

#read in the dataset
#make sure the name in quotes retains the .csv
ysi.data <- read.csv("GNDBLWQ091914_QC.csv")

#make a title for the set of graphs
Title <- "GNDBLWQ091914"

#-------------------------------------------
#you can stop modifying code at this point
#unless you want to play with the page layout
#or the graphs
#-------------------------------------------

#combine date and time into DateTime 
ysi.data$DateTime <- paste(ysi.data$Date, ysi.data$Time)

#format DateTime as POSIXct, which will turn it into a number that can be graphed
#we are retaining the format of mm/dd/yyyy hh:mm
ysi.data$DateTime <- as.POSIXct(ysi.data$DateTime, format = "%m/%d/%Y %H:%M")

#check data to make sure it looks the way you think it should
names(ysi.data)   #column names
str(ysi.data)    #names; format (number, date, factor, character, etc.); first few values
head(ysi.data)    #returns the first 6 rows of data, so you can make sure things were read in correctly


#make the layout 4 rows and 2 columns so all graphs will fit on a page
#type ?par in the console for more information on page layout and modifications you can make
par(mfcol=c(4,2), mar=c(1, 4, 1.5, 1))

#make line graphs; can change colors if you want
#to get a list of R's known colors, type colors() into the console
#for more information on making and modifying plots, type ?plot  into the console
plot(Temp~DateTime, data=ysi.data, type="l", xlab = "", main = Title, col="darkred")
plot(SpCond~DateTime, data=ysi.data, type="l", xlab = "", col="darkblue")
plot(Sal~DateTime, data=ysi.data, type="l", xlab = "", col="darkgreen")
plot(Depth~DateTime, data=ysi.data, type="l", xlab = "", col="darkslategray")
plot(DO_pct~DateTime, data=ysi.data, type="l", xlab = "", col="darkorange")
plot(DO_mgl~DateTime, data=ysi.data, type="l", xlab = "", col="darkmagenta")
plot(pH~DateTime, data=ysi.data, type="l", xlab = "", col="darkturquoise")
plot(Turb~DateTime, data=ysi.data, type="l", xlab = "", col="darkkhaki")

#-------------------------------------------------
#Copied Chunk Ends
#-------------------------------------------------


#--------------------------------------
#The following 3 lines of code return R to normal and clear it out
#So you want them to be the last lines in the script
#--------------------------------------

#reset to one graph per page
par(mfrow=c(1,1))

#turn off pdf printer
dev.off()

#Reset R's Brain
rm(list=ls())

