# group activity

# map the reserve
map_reserve('jac')

# what data do we have?
path <- 'M:/docs/swmp_workshop_2014/training_modules/data/dataset4'
dir(path)

# try jacb6
wq_dat <- import_local(path, 'jacnewq')
nut_dat <- import_local(path, 'jacnenut')
met_dat <- import_local(path, 'jacncmet')

# qaqc process, remove empty columns
wq_dat <- subset(qaqc(wq_dat), rem_cols = T)
nut_dat <- subset(qaqc(nut_dat), rem_cols = T)
met_dat <- subset(qaqc(met_dat), rem_cols = T)

# what parameters are in each?
attr(wq_dat, 'parameters')
attr(nut_dat, 'parameters')
attr(met_dat, 'parameters')

# combine and subset by two months before and after hurrican landfall
dat <- comb(wq_dat, nut_dat, met_dat)
dat <- subset(dat, subset = c('2012-09-01 0:0', '2012-12-31 23:45'), rem_col = T)

# create some wx plots to see when the storm passed
par(mfrow = c(5, 1), mar = c(4, 4, 0.5, 0.5))
plot(atemp ~ datetimestamp, data = dat, type = 'l')
plot(bp ~ datetimestamp, data = dat, type = 'l')
plot(wspd ~ datetimestamp, data = dat, type = 'l')
plot(totprcp~ datetimestamp, data = dat,  type = 'l')
plot(cumprcp ~ datetimestamp, data = dat,  type = 'l')

# create some wq plots to see when the storm passed
par(mfrow = c(5, 1), mar = c(4, 4, 0.5, 0.5))
plot(temp ~ datetimestamp, data = dat, type = 'l')
plot(sal ~ datetimestamp, data = dat, type = 'l')
plot(do_mgl ~ datetimestamp, data = dat,  type = 'l')
plot(depth ~ datetimestamp, data = dat,  type = 'l')
plot(turb ~ datetimestamp, data = dat, type = 'l')

# what about the nutrients?
par(mfrow = c(4, 1), mar = c(4, 4, 0.5, 0.5))
plot(po4f ~ datetimestamp, data = nut_dat, type = 'l')
plot(nh4f ~ datetimestamp, data = nut_dat, type = 'l')
plot(no23f ~ datetimestamp, data = nut_dat, type = 'l')
plot(chla_n ~ datetimestamp, data = nut_dat, type = 'l')

# use setstep with the nutrient data
nut_dat <- subset(setstep(nut_dat), rem_rows = T)
par(mfrow = c(4, 1), mar = c(4, 4, 0.5, 0.5))
plot(po4f ~ datetimestamp, data = nut_dat, type = 'l')
plot(nh4f ~ datetimestamp, data = nut_dat, type = 'l')
plot(no23f ~ datetimestamp, data = nut_dat, type = 'l')
plot(chla_n ~ datetimestamp, data = nut_dat, type = 'l')

# summary of data, before/after passage
aggregate(dat, by = 'months')

agg_out <- aggregate(dat, by = 'weeks', aggs_out = T)
par(mfrow = c(4, 1), mar =c(4, 4, 0.5, 0.5))
boxplot(do_mgl ~ datetimestamp, agg_out, ylab = 'do_mgl')
boxplot(depth ~ datetimestamp, agg_out, ylab = 'Water depth')
boxplot(bp ~ datetimestamp, agg_out, ylab = 'Barometric pressure')
boxplot(wspd ~ datetimestamp, agg_out, ylab = 'Wind speed')

# create some smoothed plots
sal_smooth <- smoother(dat, params = 'sal', window = 200)
plot(sal ~ datetimestamp, data = dat, type = 'l')
lines(sal_smooth$datetimestamp, sal_smooth$sal, col = 'red')

