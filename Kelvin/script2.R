install.packages('googleVis')
library(googleVis)

setwd('C:\Users\djruh_000\Documents\GitHub\wm-stats-blog\Kelvin\')

data.long <- read.csv('agg_data_long.csv', header=TRUE)



motion = gvisMotionChart(data.long, idvar="variable", timevar="Year")
plot(motion)