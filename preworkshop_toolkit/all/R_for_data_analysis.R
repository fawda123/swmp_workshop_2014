

# create variable as a numeric vector
a <- c(1, 2)

# verify that its in our workspace
ls()



# data not loaded, only 'a' from before
ls() 
# load data as comma separated, assign to dat
# make sure you are in the working directory for the toolkit
# e.g., setwd('C:/my_directory') 
dat <- read.table('dat_example.txt',sep = ',', header = T)
ls() 



head(dat)



tail(dat)



class(dat)



dim(dat)
nrow(dat)
ncol(dat)



summary(dat)



names(dat)



# these all do the same thing

# get using $
dat$do_mgl

# get using [row, column] with variable name
dat[, 'do_mgl']

# get using [row, column] with column index
dat[, 2]



summary(dat$do_mgl)



# note use of na.rm = T, you must specify how to handle missing values
mean(dat$do_mgl, na.rm = T)
range(dat$do_mgl, na.rm = T)
var(dat$do_mgl, na.rm = T)



hist(dat$do_mgl)



boxplot(dat$do_mgl)



# a nicer looking boxplot
boxplot(dat$do_mgl, 
  ylab = 'DO (mg/L)', 
  main = 'Boxplot of dissolved oxygen',
  col = 'lightblue'
  )
# see ?boxplot for all options



# find the outliers using boxplot
myplot <- boxplot(dat$do_mgl, plot = F)
myplot$out



# find the rows of the outliers
outlier <- myplot$out
out_row <- which(dat$do_mgl %in% outlier) 
out_row #these are the row number of the outliers



dat[out_row, ] # view the outliers



## dat[out_row, 'do_mgl'] <- NA



## dat[out_row, 'do_mgl'] <- mean(dat$do_mgl, na.rm = T)



#first we have to convert the datetimestamp column
dat$datetimestamp <- as.POSIXct(dat$datetimestamp)

# plot the time series, y vs x syntax
plot(do_mgl ~ datetimestamp, data = dat, type = 'l')



# plot the time series
plot(do_mgl ~ datetimestamp, data = dat, type = 'l')

# use the out_row object from earlier to subset
x <- dat[out_row, 'datetimestamp']
y <- dat[out_row, 'do_mgl']
points(x, y, col = 'red')



# the original dataset
dat_orig <- dat$do_mgl

# dataset with outliers removed
dat_remove <- dat$do_mgl
dat_remove[out_row] <- NA

# a boxplot comparison of the two datasets
boxplot(dat_orig, dat_remove)



# a t-test, evaluates the null that the difference in means is zero
t.test(dat_orig, dat_remove)


