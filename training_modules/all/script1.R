## script 1, NERRS training workshop 2014

## load the SWMPr package, you must have it installed
library(SWMPr)

## get data for apacpwq, all years

## location of data, you will have to change the drive
mypath <- 'C:/data/dataset1'

## files are also stored in the package
## mypath <- system.file('zip_ex', package = 'SWMPr')

## import and assign to 'dat'
dat <- import_local(mypath, 'apacpwq', trace = T)

## view first six rows
head(dat)
