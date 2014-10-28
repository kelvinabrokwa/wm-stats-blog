# Written by: Kelvin Abrokwa-Johnson
# Admissions statistics motion chart

setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/admissions/kelvin/final post')   # Make sure to change this working directory to fit your computer

library(googleVis)

data.long <- read.csv("agg_data_long.csv", header=TRUE)

motion = gvisMotionChart(data.long, idvar="variable", timevar="year")
plot(motion)