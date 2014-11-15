## script 3, NERRS training workshop 2014

# reload the SWMPr package if you started a new session
library(SWMPr)

## analysis 1

# import data, qaqc, and subset
# change this path for the flash drive
path <- 'C:/data/dataset3'
dat <- import_local(path, 'cbmmcwq2012')

# qaqc and subset do_mgl
dat <- qaqc(dat)
dat <- subset(dat, select = 'do_mgl')

# how many missing values?
sum(is.na(dat$do_mgl))

# subset the do time series for plotting
dat <- subset(dat, subset = c('2012-10-01 0:0', '2012-10-31 0:0'))
plot(do_mgl ~ datetimestamp, dat, type = 'l')

## analysis 1 - on your own

## analysis 2 - on your own
# subset orginal data
dat <- subset(dat, subset = c('2012-10-01 0:0', '2012-10-31 0:0'))

## analysis 3

# import all wq data for cbmip
# change path as needed
path <- 'C:/data/dataset3/'
dat <- import_local(path, 'cbmipwq')

# qaqc checks
dat <- qaqc(dat)

# plot DO for the time series
plot(do_mgl ~ datetimestamp, data = dat, type = 'l')

# smoother using a large window (5000 steps ~ 52 days)
do_smooth <- smoother(dat, params = 'do_mgl', window = 5000)
plot(do_mgl ~ datetimestamp, data = dat, type = 'l')
lines(do_smooth$datetimestamp, do_smooth$do_mgl, col = 'red', lwd = 2)

# use na.approx, then smooth
new_dat <- na.approx(dat, param = 'do_mgl', maxgap = 3000)
do_smooth <- smoother(new_dat, params = 'do_mgl', window = 5000)
plot(do_mgl ~ datetimestamp, data = new_dat, type = 'l')
lines(do_smooth$datetimestamp, do_smooth$do_mgl, col = 'red', lwd = 2)

# get reformatted data from aggregate for plotting
agg_dat <- aggregate(dat, by = 'months', params = 'do_mgl', aggs_out = T)
head(agg_dat)

# note same row number in aggregated data
dim(agg_dat)
dim(dat)

# use boxplots 
boxplot(do_mgl ~ datetimestamp, data = agg_dat, ylab = 'do_mgl')

# by season
agg_dat <- aggregate(dat, by = 'quarters', params = 'do_mgl', aggs_out = T)
boxplot(do_mgl ~ datetimestamp, data = agg_dat, ylab = 'do_mgl')

# by year
agg_dat <- aggregate(dat, by = 'years', params = 'do_mgl', aggs_out = T)
boxplot(do_mgl ~ datetimestamp, data = agg_dat, ylab = 'do_mgl')


