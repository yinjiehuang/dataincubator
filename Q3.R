# This script is used to generate some results for Q3
# Author: Yinjie Huang
# Date: 10-31-2015

# First of all, read in the data of September 2015
# We wanna see the average price on each date on some places
data = read.csv("full-APPD-data.csv", colClasses = c("NULL", rep(NA, 3), rep("NULL", 12)), 
                col.names = c("Unknown","price","date","zipcode", rep("Unknown", 12)));
require(plyr);
# For each date, compute the price mean
he = aggregate(price ~ data, data = data, mean);

png(filename = "plot_1.png");
plot(he$date, log(he$price), main = "Average prices across the date", xlab = "date", ylab = "price");
dev.off();

# Let's take a look at another plot
data = read.csv("pp-2015.csv", colClasses = c("NULL", rep(NA, 3), rep("NULL", 12)), 
                col.names = c("Unknown","price","date","zipcode", rep("Unknown", 12)));
# For each date, compute the price mean
# Now let's see what is the price curve in the past 2 months
require(lubridate)
data$month = month(data$date);
data = data[data$month == 8 | data$month == 9, ];
he = aggregate(price ~ date, data = data, mean);
he$date = droplevels(he$date);

png(filename = "plot_2.png");
plot(he$date, log(he$price), main = "Average prices across the date", xlab = "date", ylab = "price");
dev.off();