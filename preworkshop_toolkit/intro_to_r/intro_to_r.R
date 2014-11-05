# here's some R code
rnorm(10)



# download from CRAN
install.packages('ggplot2')



# load ggplot2
library(ggplot2)



# download devtools from CRAN
install.packages('devtools')

# load devtools
library(devtools)

# install SWMPr from Github, load
install_github('fawda123/SWMPr')
library(SWMPr)



# view packages with demos
demo(package = .packages(all.available = TRUE))



# view a demo for the graphics package
demo(graphics)



# view help files for a package
help(package = 'ggplot2')



# get help file
help(mean, package = 'base')

# or do this
?mean



print('hello world!')
2 + 2
(2 + 2) / 4



seq(1, 30) # create a sequence of numbers from 1 to 30



# getting an error
2 + a



# note the difference
2 + 'a'



a <- 1
2 + a
a = 1
2 + a



a <- c(1, 2, 3 , 4)
a
a <- seq(1, 4)
a
a <- c('a', 'b', 'c')
a



c(1, 2) # concatenate function to combine value
mean(c(1, 2)) # mean function
seq(1, 4) # create a sequence of values



class(1)
class('1')



# this does not work
'1' + 1



a <- c(1,2) # numeric vector
a
b <- c('a', 'b') # character
b



# data frame with both
c <- data.frame(a,b)
c



## # the location where you want to work
## setwd('C:/my_directory')



# use read.csv if .csv
dat <- read.csv('my_data.csv', header = T)

# use read.table if .txt
dat <- read.table('my_data.txt', sep = ',', header = T)



dat



dat[1, ] # row 1
dat[, 2] # column 2
dat[4, 1] # row 4, column 1



dat$Value
dat[, 'Value']



attach(dat)
Value



# use View to see the data
View(dat)



# view the objects in your workspace
ls()



## # save only the dat object
## save(dat, file = 'my_data.RData')
## 
## # load .RData file of dat
## load(file = 'my_data.RData')



## # save as a csv file
## write.csv(dat, 'my_data.csv')
## 
## # the defaults for write.csv can be changed
## write.csv(dat, 'my_data.csv', quote = F, row.names = F)
## 
## # save as a txt file, comma separated
## write.table(dat, 'my_data.txt', sep = ',', quote = F,
##   row.names = F)


