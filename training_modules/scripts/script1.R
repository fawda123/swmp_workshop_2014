## script 1, NERRS training workshop 2014

## install SWMPr using the devtools package
install.packages('devtools')
library(devtools)
install_github('fawda123/SWMPr')
library(SWMPr)

## view a help file
?all_params

## get data for apacpwq, all years

## location of data, you will have to change the drive
mypath <- 'C:/data/dataset1'

## import and assign to 'dat'
dat <- import_local(mypath, 'apacpwq', trace = T)

## view first six rows
head(dat)
