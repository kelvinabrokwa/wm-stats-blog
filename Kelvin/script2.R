setwd('/users/kelvinabrokwa/documents/repositories/wm-stats-blog/kelvin')
library(googleVis)

data.wide <- read.csv('agg_data_2.csv', header=TRUE)
View(data.wide)
data.long <- read.csv('agg_data_long.csv', header=TRUE)
View(data.long)

motion = gvisMotionChart(data.long, idvar="variable", timevar="Year")
plot(motion)