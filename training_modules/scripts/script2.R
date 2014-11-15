## script 2, NERRS training workshop 2014

# reload the SWMPr package if you started a new session
library(SWMPr)

# import data
# change this path for the flash drive
path <- 'C:/data/dataset2'
wq_dat <- import_local(path, 'apacpwq')
nut_dat <- import_local(path, 'apacpnut')
met_dat <- import_local(path, 'apaebmet')

# what are the dimensions of the water quality data?
dim(wq_dat)
# what are the dimensions of the nutrient data?
dim(nut_dat)
# what are the dimensions of the weather data?
dim(met_dat)

# View the first six rows of the met data
head(met_dat)

# View the last six rows of the met data
tail(met_dat)

# class of the data
class(met_dat)

# what functions/methods work with swmpr objects?
methods(class = 'swmpr')

# what attributes are available for a swmpr object
names(attributes(met_dat))

# view the parameters attribute
attr(met_dat, 'parameters')

# View the first six rows of the met data
head(met_dat)

# use qaqcchk to view distribution of qaqc flags
myqaqc <- qaqcchk(met_dat)

# a subset of results from the qaqcchk function
head(myqaqc)

# or view all in a separate window
View(myqaqc)

##
# plot data, points in red did not pass QAQC

# select values that did not pass qaqc
nopass <- grep('0', met_dat$f_totpar, invert = T)
nopass <- met_dat[nopass, ]

# plot totpar from met_dat
plot(totpar ~ datetimestamp, met_dat, type = 'l')

# add  points that did not pass qaqc
points(nopass$datetimestamp, nopass$totpar, col = 'red')

# filter observations by qaqc flags, remove qaqc columns
met_qaqc <- qaqc(met_dat)

# view help file
?qaqc

# data after qaqc processing
head(met_qaqc)

# keep all values
met_qaqc <- qaqc(met_dat, qaqc_keep = NULL)

head(met_qaqc) # note the totpar column compared to the last example

# keep all values
to_keep <- c(-5, -4, -3, -2, -1, 1, 2, 3, 4, 5)
met_qaqc <- qaqc(met_dat, qaqc_keep = to_keep)

# does this result make sense??
head(met_qaqc)

# continue with qaqc processed data

# water quality
wq_dat <- qaqc(wq_dat)

# nutrients
nut_dat <- qaqc(nut_dat)

# weather
met_dat <- qaqc(met_dat)

# view help file
?subset.swmpr

# view the arguments for subset.swmpr
formals(subset.swmpr)

# rows, columns in wq_dat
dim(wq_dat)

# remove empty rows, columns
tmp <- subset(wq_dat, rem_rows = T, rem_cols = T)

# dimensions after removing empty rows, columns
dim(tmp)

# select the DO column
tmp <- subset(wq_dat, select = 'do_mgl')
head(tmp)

# select DO and salinity
tmp <- subset(wq_dat, select = c('do_mgl', 'sal'))
head(tmp)

# select a date range, July 2012
dates <- c('2012-07-01 12:00', '2012-07-31 6:30')
tmp <- subset(wq_dat, subset = dates)
head(tmp) # view first six rows

# get observations for 2013
dates <- '2013-01-01 00:00'
tmp <- subset(wq_dat, subset = dates, operator = '>=')
head(tmp)

# dates and parameters  to select
dates <- '2014-10-01 00:00'
params <- c('do_mgl', 'temp')

# subset
tmp <- subset(wq_dat, select = params, subset = dates, operator = '>=')
head(tmp)

# plot DO and water temp
plot(do_mgl ~ datetimestamp, data = tmp, type = 'l')
plot(temp ~ datetimestamp, data = tmp, type = 'l')

# help files
?comb.swmpr
?setstep.swmpr

# combine water quality and weather data in the same object
tmp <- comb(wq_dat, met_dat)
head(tmp, 3) # first three rows

# plot some combined data

# subset date ranges first
dates <- c('2012-06-01 0:0', '2012-07-31 0:0')
to_plot <- subset(tmp, subset = dates)

# plot
plot(atemp ~ datetimestamp, to_plot, type = 'l', col = 'red', ylab = 'Temp C')
lines(to_plot$datetimestamp, to_plot$temp, col = 'blue')
title('Air (red) and water (blue) temperature')

# arguments for the function, or ?comb.swmpr
formals(comb.swmpr)

# dimension of earlier combined object
dim(tmp)

# create new object at two hour time step
tmp <- comb(wq_dat, met_dat, timestep = 120)
dim(tmp)

# note the time step in datetimestamp
head(tmp, 4)

# note the pre-existing time steps
head(wq_dat$datetimestamp)

# note irregular time stamps on nutrient data
head(nut_dat)

dim(nut_dat) # initial dimensions

# standardize nutrient time series
tmp <- setstep(nut_dat, timestep = 60, differ = 5)
dim(tmp)

# remove empty rows, columns
tmp <- subset(tmp, rem_row = T, rem_col = T)
tmp #only four rows!

# first we subset for the example
sub1 <- subset(wq_dat, subset = c('2012-07-01 0:0', '2012-07-31 0:0'))
sub2 <- subset(met_dat, subset = c('2012-07-15 0:0', '2012-08-12 0:0'))

# what are the date ranges?
attr(sub1, 'date_rng')
attr(sub2, 'date_rng')

# combine using union, this is the default
tmp <- comb(sub1, sub2, method = 'union')

# what is the date range of the combined object?
attr(tmp, 'date_rng')

# combine using intersect
tmp <- comb(sub1, sub2, method = 'intersect')

# what is the date range of the combined object?
attr(tmp, 'date_rng')

# combine using the time range in sub1
station <- attr(sub1, 'station')
tmp <- comb(sub1, sub2, method = station)

# what is the date range of the combined object?
attr(tmp, 'date_rng')


